#!/usr/bin/env python3
"""Regenerate Casks/*.rb from the live Stoatworks catalogue.

The catalogue at https://stoatworks-labs.com/catalog.json is the same source the
website and Burrow read, so a cask can never describe a build the fleet does not
publish. Checksums come from the GitHub release API's per-asset `digest` field,
so nothing is downloaded to hash it.

The one thing the catalogue cannot tell us is the name of the `.app` inside each
disk image. That lives in data/apps.json, learned by mounting the image, and is
re-learned whenever the selected asset changes (--verify, macOS only).
"""

from __future__ import annotations

import argparse
import json
import re
import subprocess
import sys
import urllib.request
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
CASKS = ROOT / "Casks"
APPS = ROOT / "data" / "apps.json"
CATALOG_URL = "https://stoatworks-labs.com/catalog.json"

# Catalogue arch token -> the cask variant it belongs to.
UNIVERSAL = {"universal", "both"}
ARM = {"arm64", "aarch64"}
INTEL = {"x64", "x86_64", "intel"}


def fetch_json(url: str):
    # The site sits behind Cloudflare, which refuses the stock urllib agent.
    req = urllib.request.Request(url, headers={"User-Agent": "stoatworks-homebrew-tap"})
    with urllib.request.urlopen(req, timeout=60) as r:
        return json.loads(r.read().decode())


def gh_json(path: str):
    r = subprocess.run(["gh", "api", path], capture_output=True, text=True)
    if r.returncode:
        return None
    try:
        return json.loads(r.stdout)
    except json.JSONDecodeError:
        return None


def family_of(filename: str, version: str) -> str:
    """Everything before the version string: the build family that produced it.

    A repo can publish two macOS families at once - an Electron app and the
    Tauri launcher that wraps a browser tool - and they carry different names
    for the same release. Grouping on the prefix keeps a cask inside one family
    instead of mixing an arm64 slice of one with the x64 slice of another.
    """
    return filename.split(version)[0]


def select_assets(entry: dict) -> tuple[dict, str] | tuple[None, str]:
    """Pick one build family and the arch slices to ship from it."""
    version = (entry.get("version") or "").lstrip("v")
    dmgs = [
        a
        for a in entry.get("assets") or []
        if a.get("platform") == "macos"
        and a.get("format") == "app"
        and str(a.get("url", "")).endswith(".dmg")
    ]
    if not dmgs or not version:
        return None, "no macOS .dmg in the catalogue"

    families: dict[str, list[dict]] = {}
    for a in dmgs:
        families.setdefault(family_of(a["url"].rsplit("/", 1)[-1], version), []).append(a)

    def rank(item):
        _, assets = item
        arches = {a["arch"] for a in assets}
        has_universal = bool(arches & UNIVERSAL)
        # A universal image is one download that runs everywhere, so it wins.
        # Failing that, the family covering both architectures wins.
        return (has_universal, len(arches & (ARM | INTEL)), -len(assets))

    _, chosen = max(families.items(), key=rank)

    picked: dict[str, dict] = {}
    for a in chosen:
        slot = (
            "universal"
            if a["arch"] in UNIVERSAL
            else "arm"
            if a["arch"] in ARM
            else "intel"
            if a["arch"] in INTEL
            else None
        )
        if slot is None:
            continue
        # Within one arch prefer the shortest name: the plain artefact rather
        # than a decorated alias of the same build.
        cur = picked.get(slot)
        if cur is None or len(a["url"]) < len(cur["url"]):
            picked[slot] = a

    if "universal" in picked:
        picked = {"universal": picked["universal"]}
    if not picked:
        return None, "no usable architecture in the chosen family"
    return picked, ""


def digests_for(repo: str, tag: str) -> dict[str, str]:
    rel = gh_json(f"repos/stoatworks-labs/{repo}/releases/tags/{tag}")
    if not rel:
        return {}
    out = {}
    for a in rel.get("assets") or []:
        d = a.get("digest") or ""
        if d.startswith("sha256:"):
            out[a["name"]] = d.split(":", 1)[1]
    return out


def templated(url: str, version: str) -> str:
    """Swap the release version for #{version} so the URL survives a bump."""
    return url.replace(version, '#{version}')


def clean_desc(entry: dict, name: str) -> str:
    """Homebrew wants one short phrase, no article, no full stop.

    The catalogue's `hook` is already exactly that - it is the one-line the
    website puts under each title - so prefer it and only fall back to cutting
    down the longer summary.
    """
    d = (entry.get("hook") or "").strip()
    if not d:
        d = (entry.get("summary") or "").split(". ")[0].split(": ")[0].strip()
    d = re.sub(r"\s+", " ", d).rstrip(".")
    d = re.sub(r"^(A|An|The)\s+", "", d)
    if len(d) > 80:
        d = d[:80].rsplit(" ", 1)[0]
    return (d[:1].upper() + d[1:]) if d else name


def rb_str(s: str) -> str:
    return '"' + s.replace("\\", "\\\\").replace('"', '\\"') + '"'


def render(entry: dict, picked: dict, digests: dict, appname: str, minos: str | None) -> str | None:
    slug, repo = entry["slug"], entry["repo"]
    version = (entry.get("version") or "").lstrip("v")
    homepage = (entry.get("guide") or "").removesuffix("/guide")
    homepage = (homepage + "/") if homepage else f"https://stoatworks-labs.com/software/{slug}/"
    def pair(a, indent):
        """sha256 + url for one asset, or None if the release has no digest."""
        sha = digests.get(a["url"].rsplit("/", 1)[-1])
        if not sha:
            return None
        pad = " " * indent
        return (f'{pad}sha256 {rb_str(sha)}\n'
                f'{pad}url {rb_str(templated(a["url"], version))}')

    single = picked.get("universal") or (picked["arm"] if set(picked) == {"arm"} else None) \
        or (picked["intel"] if set(picked) == {"intel"} else None)

    out = [f'cask "{slug}" do', f'  version {rb_str(version)}']
    if single is not None:
        b = pair(single, 2)
        if b is None:
            return None
        out += [b, ""]
    else:
        for slot, guard in (("arm", "on_arm"), ("intel", "on_intel")):
            b = pair(picked[slot], 4)
            if b is None:
                return None
            out += ["", f"  {guard} do", b, "  end"]
        out.append("")

    out += [
        f'  name {rb_str(entry.get("name") or slug)}',
        f'  desc {rb_str(clean_desc(entry, entry.get("name") or slug))}',
        f"  homepage {rb_str(homepage)}",
        "",
        "  livecheck do",
        "    url :url",
        "    strategy :github_latest",
        "  end",
        "",
    ]

    deps = []
    if set(picked) == {"arm"}:
        deps.append("  depends_on arch: :arm64")
    elif set(picked) == {"intel"}:
        deps.append("  depends_on arch: :x86_64")
    if minos:
        deps.append(f"  depends_on macos: :{minos}")
    if deps:
        out += deps + [""]

    out.append(f"  app {rb_str(appname)}")

    stem = appname.removesuffix(".app")
    paths = [f"~/Library/Application Support/{stem}"]
    for i in entry.get("identifiers") or []:
        if "." not in i:
            continue
        paths += [
            f"~/Library/Application Support/{i}",
            f"~/Library/Preferences/{i}.plist",
            f"~/Library/Saved Application State/{i}.savedState",
        ]
    seen, uniq = set(), []
    for x in paths:
        if x not in seen:
            seen.add(x)
            uniq.append(x)
    if len(uniq) > 1:
        out += ["", "  zap trash: ["]
        out += [f"    {rb_str(x)}," for x in uniq]
        out.append("  ]")

    out.append("end")
    return "\n".join(out) + "\n"


ARCH_LABEL = {
    ("universal",): "Universal",
    ("arm", "intel"): "Apple Silicon, Intel",
    ("arm",): "Apple Silicon",
    ("intel",): "Intel",
}


def write_readme_table(rows: list[dict], statuses: dict) -> None:
    """Refresh the table between the casks markers in the README."""
    readme = ROOT / "README.md"
    if not readme.exists():
        return
    out = [
        "| Application | Cask | Version | Runs on | State |",
        "| --- | --- | --- | --- | --- |",
    ]
    for r in sorted(rows, key=lambda x: x["name"].lower()):
        label = statuses.get(r["status"], {}).get("label", r["status"] or "")
        arch = ARCH_LABEL.get(tuple(r["arches"]), ", ".join(r["arches"]))
        name = f'[{r["name"]}]({r["homepage"]})' if r["homepage"] else r["name"]
        out.append(f'| {name} | `{r["slug"]}` | {r["version"]} | {arch} | {label} |')
    out.append("")
    out.append(f"{len(rows)} applications.")

    text = readme.read_text()
    start, end = "<!-- casks:start -->", "<!-- casks:end -->"
    if start not in text or end not in text:
        return
    readme.write_text(text.split(start)[0] + start + "\n" + "\n".join(out) + "\n" + text.split(end, 1)[1].join(["", ""]).join([end, ""]) if False else
                      text.split(start)[0] + start + "\n" + "\n".join(out) + "\n" + end + text.split(end, 1)[1])


MACOS_NAMES = [
    (26, "tahoe"), (15, "sequoia"), (14, "sonoma"), (13, "ventura"),
    (12, "monterey"), (11, "big_sur"), (10.15, "catalina"), (10.14, "mojave"),
]


def macos_name(v: str | None) -> str | None:
    if not v:
        return None
    try:
        major = float(v) if v.startswith("10.") else float(v.split(".")[0])
    except ValueError:
        return None
    for threshold, name in MACOS_NAMES:
        if major >= threshold:
            return name
    return None


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("--catalog", default=CATALOG_URL)
    ap.add_argument("--verify", action="store_true",
                    help="mount each selected image to confirm the .app name (macOS only)")
    args = ap.parse_args()

    cat = fetch_json(args.catalog) if args.catalog.startswith("http") else json.loads(Path(args.catalog).read_text())
    apps = json.loads(APPS.read_text()) if APPS.exists() else {}

    CASKS.mkdir(exist_ok=True)
    written, skipped, rows = [], [], []

    for entry in cat["entries"]:
        picked, why = select_assets(entry)
        if not picked:
            continue
        slug, repo = entry["slug"], entry["repo"]
        tag = entry.get("version")
        digests = digests_for(repo, tag)
        if not digests:
            skipped.append((slug, f"no asset digests on release {tag}"))
            continue

        selected = sorted(a["url"] for a in picked.values())
        known = apps.get(slug) or {}
        if args.verify and known.get("selected") != selected:
            learned = learn_app(picked)
            if learned:
                learned["selected"] = selected
                apps[slug] = known = learned

        if not known.get("app"):
            skipped.append((slug, "the .app name inside the image is unknown - rerun with --verify on macOS"))
            continue

        rb = render(entry, picked, digests, known["app"], macos_name(known.get("minos")))
        if rb is None:
            skipped.append((slug, "a selected asset has no sha256 digest on the release"))
            continue
        (CASKS / f"{slug}.rb").write_text(rb)
        written.append(slug)
        rows.append({
            "slug": slug,
            "name": entry.get("name") or slug,
            "version": (entry.get("version") or "").lstrip("v"),
            "status": entry.get("status"),
            "arches": sorted(picked),
            "homepage": ((entry.get("guide") or "").removesuffix("/guide") or f"https://stoatworks-labs.com/software/{slug}") + "/",
        })

    APPS.write_text(json.dumps(apps, indent=2, sort_keys=True) + "\n")
    write_readme_table(rows, cat.get("statuses") or {})

    print(f"wrote {len(written)} casks")
    for s in written:
        print(f"  {s}")
    if skipped:
        print(f"\nskipped {len(skipped)}:")
        for s, why in skipped:
            print(f"  {s}: {why}")
    return 0


def learn_app(picked: dict) -> dict | None:
    """Mount the image we are about to ship and read the bundle out of it."""
    import tempfile
    a = picked.get("universal") or picked.get("arm") or picked.get("intel")
    url = a["url"]
    with tempfile.TemporaryDirectory() as td:
        dmg = Path(td) / "image.dmg"
        if subprocess.run(["curl", "-sSL", "--retry", "3", "-o", str(dmg), url]).returncode:
            return None
        mnt = Path(td) / "mnt"
        mnt.mkdir()
        if subprocess.run(
            ["hdiutil", "attach", str(dmg), "-nobrowse", "-readonly", "-noautoopen",
             "-mountpoint", str(mnt)], capture_output=True).returncode:
            return None
        try:
            names = [p.name for p in mnt.iterdir() if p.name.endswith(".app")]
            if not names:
                return None
            app = names[0]
            plist = mnt / app / "Contents" / "Info.plist"

            def key(k):
                r = subprocess.run(["defaults", "read", str(plist).removesuffix(".plist"), k],
                                   capture_output=True, text=True)
                return r.stdout.strip() if r.returncode == 0 else None

            return {"app": app, "bundleid": key("CFBundleIdentifier"),
                    "minos": key("LSMinimumSystemVersion")}
        finally:
            subprocess.run(["hdiutil", "detach", str(mnt), "-quiet"], capture_output=True)


if __name__ == "__main__":
    sys.exit(main())
