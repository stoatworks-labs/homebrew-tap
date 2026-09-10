# Stoatworks Homebrew tap

The [Stoatworks](https://stoatworks-labs.com) macOS applications, installable and
upgradable with `brew`.

```bash
brew tap stoatworks-labs/tap
brew install --cask pdf-presenter
```

Or in one line, without tapping first:

```bash
brew install --cask stoatworks-labs/tap/pdf-presenter
```

From then on `brew upgrade` picks up new releases along with everything else on
the machine — which is the whole point of this repo. Nothing here phones home,
and nothing is bundled or repackaged: every cask points straight at the disk
image on the project's own GitHub release.

## Why a tap, and not homebrew-cask

Homebrew's own cask repository asks that software be notable before it is
accepted — 75 stars, or 30 forks, or 30 watchers. These are working tools for a
small trade and none of them clear that bar, so they live here instead. A tap is
a first-class Homebrew citizen; the only difference you will notice is the one
`brew tap` above.

## Gatekeeper

Every disk image referenced here is signed with a Developer ID Application
certificate — *ALLAN SARGEANT (3G7USP8N73)* — and notarised by Apple with the
ticket stapled to the image. Homebrew quarantines what it installs, as it
should, and these open normally under that quarantine. There is no
`xattr` incantation to run and no right-click-Open dance.

You can check any of them yourself before trusting this claim:

```bash
brew fetch --cask stoatworks-labs/tap/pdf-presenter
spctl -a -vvv -t install "$(brew --cache --cask stoatworks-labs/tap/pdf-presenter)"
```

## What is here

<!-- casks:start -->
| Application | Cask | Version | Runs on | State |
| --- | --- | --- | --- | --- |
| [animATEM](https://stoatworks-labs.com/software/animatem/) | `animatem` | 0.2.1 | Apple Silicon, Intel | Released |
| [Aquilon VPU Map](https://stoatworks-labs.com/software/aquilon-vpu-map/) | `aquilon-vpu-map` | 1.2.1 | Apple Silicon, Intel | Released |
| [ATEM Fleet Admin](https://stoatworks-labs.com/software/atem-fleet-admin/) | `atem-fleet-admin` | 0.4.3 | Universal | Field testing |
| [ATEM Overseer](https://stoatworks-labs.com/software/atem-overseer/) | `atem-overseer` | 0.3.3 | Apple Silicon, Intel | Field testing |
| [atem-scopes](https://stoatworks-labs.com/software/atem-scopes/) | `atem-scopes` | 0.2.1 | Apple Silicon, Intel | Released |
| [av-launcher](https://stoatworks-labs.com/software/av-launcher/) | `av-launcher` | 0.2.1 | Apple Silicon, Intel | Released |
| [BlackMatrix](https://stoatworks-labs.com/software/blackmatrix/) | `blackmatrix` | 0.3.0 | Apple Silicon, Intel | Field proven |
| [Flock](https://stoatworks-labs.com/software/flock/) | `flock` | 0.2.3 | Universal | Field proven |
| [Frame Ferret](https://stoatworks-labs.com/software/frame-ferret/) | `frame-ferret` | 0.2.1 | Apple Silicon | Field testing |
| [LEQtion](https://stoatworks-labs.com/software/leqtion/) | `leqtion` | 0.1.1 | Apple Silicon, Intel | Field testing |
| [LivePremier Plus](https://stoatworks-labs.com/software/livepremier-plus/) | `livepremier-plus` | 0.4.1 | Apple Silicon, Intel | Released |
| [MicWizard](https://stoatworks-labs.com/software/micwizard/) | `micwizard` | 0.2.1 | Apple Silicon, Intel | Released |
| [PDF Presenter](https://stoatworks-labs.com/software/pdf-presenter/) | `pdf-presenter` | 1.7.0 | Universal | Field proven |
| [Presentation Commander — Client](https://stoatworks-labs.com/software/presentation-commander-client/) | `presentation-commander-client` | 1.2.2 | Apple Silicon, Intel | Field testing |
| [Presentation Commander — Server](https://stoatworks-labs.com/software/presentation-commander-server/) | `presentation-commander-server` | 1.1.2 | Apple Silicon, Intel | Field testing |
| [Resolve Configurator](https://stoatworks-labs.com/software/resolve-configurator/) | `resolve-configurator` | 0.1.5 | Apple Silicon | Field testing |
| [RFutils](https://stoatworks-labs.com/software/rfutils/) | `rfutils` | 0.4.3 | Apple Silicon, Intel | Released |
| [SimpleCue](https://stoatworks-labs.com/software/simplecue/) | `simplecue` | 0.4.1 | Universal | Field testing |
| [simpleVIS](https://stoatworks-labs.com/software/simplevis/) | `simplevis` | 0.4.1 | Apple Silicon, Intel | Field testing |
| [System Graft](https://stoatworks-labs.com/software/system-graft/) | `system-graft` | 0.2.2 | Apple Silicon | Field testing |
| [WebLinked](https://stoatworks-labs.com/software/weblinked/) | `weblinked` | 1.0.3 | Apple Silicon | Field proven |
| [WSM–WWB Bridge](https://stoatworks-labs.com/software/wsm-wwb-bridge/) | `wsm-wwb-bridge` | 1.1.1 | Apple Silicon, Intel | Field proven |

22 applications.
<!-- casks:end -->

Not everything Stoatworks publishes is a macOS application. The Resolume, Resolve
and After Effects plugins, the audio plugins, the Companion modules and the
self-hosted browser tools are not casks and are not here — [Burrow](https://github.com/stoatworks-labs/burrow)
covers those, and the [website](https://stoatworks-labs.com) has all of them.

## How this repo stays current

The casks are **generated, not hand-written**. Editing one by hand will be
overwritten on the next run.

`scripts/gen_casks.py` rebuilds every cask from
[the live catalogue](https://stoatworks-labs.com/catalog.json) — the same
source the website and Burrow read, so a cask can never advertise a build the
fleet does not actually publish. Checksums come from the GitHub release API's
per-asset `digest` field, so no image is downloaded merely to hash it.

The one fact the catalogue does not carry is the name of the `.app` inside each
disk image. That lives in `data/apps.json` and is learned by mounting the image
and reading the bundle — never inferred from the filename, because the fleet's
four build toolchains name their artefacts four different ways. The image is
re-mounted whenever the asset a cask points at changes.

A scheduled run does this daily; `repository_dispatch` of type
`catalogue-changed` brings it forward. Changed casks are put through
`brew audit --cask --strict` before anything is committed.

```bash
python3 scripts/gen_casks.py --verify   # regenerate locally (macOS)
```

## Licence

The casks in this repository are MIT-licensed. Each application carries its own
licence, stated in its own repository.
