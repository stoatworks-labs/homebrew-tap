# Stoatworks Homebrew tap

> **AI-assisted project.** This codebase was created with [Claude](https://claude.com/claude-code)
> (Anthropic), directed and reviewed by a human author.

My [Stoatworks](https://stoatworks-labs.com) macOS applications, ready to install and
upgrade with `brew`.

```bash
brew tap stoatworks-labs/tap
brew trust --tap stoatworks-labs/tap
brew install --cask pdf-presenter
```

From then on `brew upgrade` picks up new releases along with everything else on
the machine, which is what this repo is for. Nothing here phones home and nothing
gets bundled or repackaged: every cask points straight at the disk image on the
project's own GitHub release.

### That middle line

Homebrew 6 won't load a cask from a tap it hasn't been told to trust, and
refuses with `Refusing to load cask ... from untrusted tap` until you say so.
That's a sensible default (a tap is code that runs on your machine), so I've
spelled the command out here rather than tucking it away. If you'd rather trust
one cask than the whole tap:

```bash
brew trust --cask stoatworks-labs/tap/pdf-presenter
```

Homebrew 5 and earlier don't have `brew trust`, and the tap and install lines
work on their own.

## Why a tap, and not homebrew-cask

Homebrew's own cask repository wants software to be notable before it'll take
it: 75 stars, or 30 forks, or 30 watchers. These are working tools for a fairly
small trade and none of them clear that bar, so they live here instead. Once
you've run the two lines above, these casks behave like any other, `brew upgrade`
included.

## Gatekeeper

Every disk image these casks point at is signed with a Developer ID Application
certificate (*ALLAN SARGEANT (3G7USP8N73)*) and notarised by Apple, with the
ticket stapled to the image. Homebrew quarantines what it installs, as it
should, and these open normally under that quarantine. There's no `xattr`
incantation to run and no right-click-Open dance.

Don't take my word for it, though. You can check any of them yourself:

```bash
brew fetch --cask stoatworks-labs/tap/pdf-presenter
spctl -a -vvv -t install "$(brew --cache --cask stoatworks-labs/tap/pdf-presenter)"
```

## What is here

<!-- casks:start -->
| Application | Cask | Version | Runs on | State |
| --- | --- | --- | --- | --- |
| [animATEM](https://stoatworks-labs.com/software/animatem/) | `animatem` | 0.2.2 | Apple Silicon, Intel | Released |
| [Aquilon VPU Map](https://stoatworks-labs.com/software/aquilon-vpu-map/) | `aquilon-vpu-map` | 1.4.0 | Universal | Field testing |
| [ATEM Fleet Admin](https://stoatworks-labs.com/software/atem-fleet-admin/) | `atem-fleet-admin` | 0.4.7 | Universal | Field testing |
| [ATEM Overseer](https://stoatworks-labs.com/software/atem-overseer/) | `atem-overseer` | 0.3.9 | Universal | Field testing |
| [atem-scopes](https://stoatworks-labs.com/software/atem-scopes/) | `atem-scopes` | 0.2.3 | Apple Silicon, Intel | Released |
| [automitti](https://stoatworks-labs.com/software/automitti/) | `automitti` | 0.2.0 | Universal | Beta |
| [av-launcher](https://stoatworks-labs.com/software/av-launcher/) | `av-launcher` | 0.3.2 | Universal | Released |
| [BlackMatrix](https://stoatworks-labs.com/software/blackmatrix/) | `blackmatrix` | 0.4.0 | Universal | Field proven |
| [Flock](https://stoatworks-labs.com/software/flock/) | `flock-manager` | 0.2.6 | Universal | Field proven |
| [Frame Ferret](https://stoatworks-labs.com/software/frame-ferret/) | `frame-ferret` | 0.2.6 | Universal | Field testing |
| [LEQtion](https://stoatworks-labs.com/software/leqtion/) | `leqtion` | 0.1.3 | Apple Silicon, Intel | Field testing |
| [LivePremier Plus](https://stoatworks-labs.com/software/livepremier-plus/) | `livepremier-plus` | 0.17.7 | Universal | Field testing |
| [openRCS](https://stoatworks-labs.com/software/openrcs/) | `openrcs` | 0.10.0 | Universal | Released |
| [PDF Presenter](https://stoatworks-labs.com/software/pdf-presenter/) | `pdf-presenter` | 1.7.2 | Universal | Field proven |
| [Peephole](https://stoatworks-labs.com/software/peephole/) | `peephole` | 0.1.1 | Universal | In development |
| [Presentation Commander — Client](https://stoatworks-labs.com/software/presentation-commander-client/) | `presentation-commander-client` | 1.3.1 | Apple Silicon, Intel | Field testing |
| [Presentation Commander — Server](https://stoatworks-labs.com/software/presentation-commander-server/) | `presentation-commander-server` | 1.1.3 | Apple Silicon, Intel | Field testing |
| [Resolve Configurator](https://stoatworks-labs.com/software/resolve-configurator/) | `resolve-configurator` | 0.1.6 | Universal | Field testing |
| [RFutils](https://stoatworks-labs.com/software/rfutils/) | `rfutils` | 0.5.0 | Universal | Released |
| [Show Mode](https://stoatworks-labs.com/software/showmode/) | `showmode` | 0.5.0 | Universal | Field proven |
| [Showbook](https://stoatworks-labs.com/software/showbook/) | `showbook` | 0.2.0 | Universal | In development |
| [SimpleCue](https://stoatworks-labs.com/software/simplecue/) | `simplecue` | 0.4.1 | Universal | Field testing |
| [simpleVIS](https://stoatworks-labs.com/software/simplevis/) | `simplevis` | 0.4.4 | Universal | Field testing |
| [SRT Router](https://stoatworks-labs.com/software/srt-router/) | `srt-router` | 0.2.5 | Universal | Field testing |
| [System Graft](https://stoatworks-labs.com/software/system-graft/) | `system-graft` | 0.2.3 | Universal | Field testing |
| [WebLinked](https://stoatworks-labs.com/software/weblinked/) | `weblinked` | 1.3.1 | Apple Silicon | Field proven |

26 applications.
<!-- casks:end -->

Not everything I publish is a macOS application. The Resolume, Resolve and After
Effects plugins, the audio plugins, the Companion modules and the self-hosted
browser tools aren't casks, so they aren't here. [Burrow](https://github.com/stoatworks-labs/burrow)
covers those, and the [website](https://stoatworks-labs.com) has the lot.

## How this repo stays current

The casks are **generated**. If you edit one by hand, the next run will
overwrite it.

`scripts/gen_casks.py` rebuilds every cask from
[the live catalogue](https://stoatworks-labs.com/catalog.json), which is the
same source the website and Burrow read, so a cask can never advertise a build
the fleet doesn't actually publish. Checksums come from the GitHub release API's
per-asset `digest` field, so nothing gets downloaded just to hash it.

The one thing the catalogue doesn't know is the name of the `.app` inside each
disk image. That lives in `data/apps.json`, and it's learned by mounting the
image and reading the bundle. It's never guessed from the filename, because the
fleet's four build toolchains name their artefacts four different ways, each
quite sure its way is the sensible one. The image gets mounted again whenever
the asset a cask points at changes.

A scheduled run does all this daily, and a `repository_dispatch` of type
`catalogue-changed` brings it forward. Any cask that changed goes through
`brew audit --cask --strict` before anything's committed.

```bash
python3 scripts/gen_casks.py --verify   # regenerate locally (macOS)
```

## Licence

The casks in this repository are MIT-licensed. Each application carries its own
licence, stated in its own repository.
