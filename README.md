<p align="center"><a href="https://alexbeavs-ps1-ports.github.io/psxrecomp-ports/"><img src="https://raw.githubusercontent.com/alexbeavs-ps1-ports/psxrecomp-ports/main/docs/assets/alexbeav-ps1-recomps-banner.png" alt="Alexbeav's PS1 Recomps" width="100%"></a></p>

# Digimon World 2003 Recompiled
<!-- retcomm-readme-metrics -->
[![GitHub downloads (all assets, all releases)](https://img.shields.io/github/downloads/Alexbeav/digimon-world-2003-recomp/total)](https://github.com/Alexbeav/digimon-world-2003-recomp/releases)
[![GitHub downloads (latest release)](https://img.shields.io/github/downloads/Alexbeav/digimon-world-2003-recomp/latest/total)](https://github.com/Alexbeav/digimon-world-2003-recomp/releases/latest)
[![GitHub release](https://img.shields.io/github/v/release/Alexbeav/digimon-world-2003-recomp)](https://github.com/Alexbeav/digimon-world-2003-recomp/releases/latest)
<!-- /retcomm-readme-metrics -->

Static recompilation of **Digimon World 2003** built on
[psxrecomp](https://github.com/Alexbeav/psxrecomp) and
[recomp-ui](https://github.com/mstan/recomp-ui).

A native recompilation setup host for Digimon World 2003.

| | |
|---|---|
| Players | 1 |
| Region | Europe |
| Publisher | — |
| Year | — |

Scaffolded with the New Project Layout. See
`psxrecomp/docs/GAME_PROJECT_SETUP.md` for the full flow.

<!-- retcomm-readme-launcher -->
## RetComM Launcher

You can run this title **standalone** (release zip + the built-in recomp-ui
Generate & Build flow), or manage installs, updates, ROM/BIOS wiring, and queued
builds more intuitively with
**[RetComM Launcher](https://github.com/TechnicallyComputers/RetComM-Launcher)** —
the Retro Compilation Manager hub for self-compiling recomps.

[Downloads](https://github.com/TechnicallyComputers/RetComM-Launcher/releases) ·
[Full README & features](https://github.com/TechnicallyComputers/RetComM-Launcher#readme)

<p align="center">
  <img src="https://raw.githubusercontent.com/TechnicallyComputers/RetComM-Launcher/main/docs/screenshots/hub-and-game-launcher.png" alt="RetComM hub with a background build, next to a title’s recomp-ui launcher" width="720">
</p>

<p align="center">
  <img src="https://raw.githubusercontent.com/TechnicallyComputers/RetComM-Launcher/main/docs/screenshots/queue-and-background-build.png" alt="Background cmake build with titles queued" width="720">
</p>

RetComM checks for updates, rebuilds with existing build data when possible,
uses the same platform build tools as per-title launchers, and automates
BIOS/ROM/save plumbing so you are not stuck repeating each game’s wizard by hand.
<!-- /retcomm-readme-launcher -->

## Legal

You must own the original game and provide your own supported disc image.
Disc images under `disc/` are ignored by Git and must never be committed.
Retail BIOS files are not redistributed. The Windows setup host collects the
required local inputs and builds the game on the user's computer.

## Quick start (dev)

```bash
git submodule update --init --recursive
./psxrecomp/tools/ci/build_emitters.sh
python3 psxrecomp/psxrecomp_cli.py generate \
  --config game.toml --project-root . --disc disc/<your>.cue
cmake -S . -B build-release -G Ninja -DCMAKE_BUILD_TYPE=Release
cmake --build build-release --target psx-runtime
```

Zip prefix for CI artifacts: `Digimon-World-2003-Recomp`.

## Symbols

Progressive map: `symbols.toml` → `python3 tools/sync_symbols.py` →
`psx_symbols.h` (`PSX_FN_*`). See `psxrecomp/docs/SYMBOLS.md`.

## Framework pins

Submodule gitlinks (`psxrecomp`, optional `recomp-ui`, nested `recomp-net`)
are authoritative. `framework_pins.txt` is an optional scaffold snapshot;
release CI logs SHAs with `record_pins.sh` but builds whatever the gitlinks
resolve to. Bump submodules deliberately — do not float on `main`/`master`
in release CI.

<!-- retcomm-readme-raid -->
---

<p align="center">
  <sub><b>R.A.I.D. — Retro AI Development</b> · a Discord for AI-assisted retro reverse-engineering, decomp &amp; recomp</sub>
</p>

<p align="center">
  <a href="https://discord.gg/Ad9BwSzctP"><img src=".github/raid-discord.png" alt="Join the Retro AI Development (R.A.I.D.) Discord" width="200"></a>
</p>
<!-- /retcomm-readme-raid -->

## Platform support

Release 0.3.0 supports Windows x64. Linux and macOS remain in the workflow,
but their release jobs are deferred under the Wave 2 Windows-first exception.

## Corrected setup relaunch

Public `v0.3.0` can request the wrong executable after the first local build.
The `v0.3.3` source uses `Digimon_World_2003_Recompiled` in CMake, the setup relaunch, and the packager.
The source parity gate passes. Exact-ZIP automatic relaunch remains a release gate.
## License boundary

Portfolio-owned source, scripts, configuration, and documentation use
GPL-3.0-only. The `LICENSE` file contains the complete terms.

PSXRecomp keeps PolyForm Noncommercial 1.0.0. Recomp-UI keeps MIT. The GPL
does not cover retail content, generated retail code, artwork, trademarks, or
these separately licensed dependencies.

## About this project

These ports are developed by a hobbyist (a DevSecOps engineer, not a game
programmer) with substantial AI assistance. What keeps that honest: every
change is validated before it ships - boot gates, hardware-oracle A/B
comparisons (Beetle/DuckStation), deterministic replay probes, and a shared
findings registry that documents failures as carefully as successes. AI
writes most of the code; the evidence discipline decides what survives.
Bug reports welcome - expect them to be investigated the same way.

tl;dr AI writes the code, but I always test it myself before pushing

## v0.3.5 three-platform candidate

The next release targets Windows x64, Linux x64, macOS Apple Silicon ARM64,
and macOS Intel x64. These packages remain candidates until the exact archives
pass the required native setup, startup, responsiveness, and clean-exit gates.

## Development history

Older source and separate candidates are preserved as fixed tags. See [the archive and recovery instructions](docs/BRANCH_ARCHIVE.md).
