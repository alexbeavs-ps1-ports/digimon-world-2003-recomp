# Digimon World 2003 knowledge report

- Date: 2026-08-31
- Retail identity: Europe PAL `SLES-03936`
- Architecture lane: source-only owned-input setup host
- Release target: Windows x64, Linux x64, macOS ARM64, and macOS x64; candidate version `0.3.5`
- License boundary: portfolio files use PolyForm Noncommercial 1.0.0; dependencies keep their licenses

## Current state

The operator confirmed gameplay in the private promoted package. This meets
the `bootstrap_verified` boundary. The source-only Windows package builds
locally. Exact-package setup, startup, and remote-byte gates remain open.

## Release controls

- Framework: f3786825411983a06257865db7bd7538fc68267a
- recomp-ui: 4eda65430a431e5685ae0c515ebcd912c7843bff
- RetComM Studio: 249422969c1c59ac2a1f8aa2299e876a7133998e
- Distribution: owned input only
- Platform claim: pending exact-package gates on all four targets
- Deferred work: exact-package native gates and R3/R4 publication

## Open gates

1. Complete exact-package setup and a 10-second startup.
2. Run the regional and title-risk canaries from exact ZIPs.
3. Audit every downloaded private draft.
4. Bind publication authorization to the exact release manifest.

## Corpus consulted

The release work uses PSX-PUB-004, PSX-PUB-006, PSX-WIN-004,
PSX-WIN-005, PSX-WIN-006, and PSX-PUB-011.

## v0.3.3 setup correction

The source now uses `Digimon_World_2003_Recompiled` as the only setup executable name. The batch source
gate passes. The exact-ZIP automatic-relaunch canary and remote release audit
remain open. Public `v0.3.0` remains unchanged.

## v0.3.5 three-platform refresh

The source now binds the package-only privacy correction and targets Windows
x64, Linux x64, macOS ARM64, and macOS x64. The replacement build-only CI,
complete archive audit, and native package gates remain required. This source
change does not publish a release or claim platform support.

## 2026-09-04 v0.3.6 POSIX setup-copy candidate

This candidate pins PSXRecomp 08ec704a974b1f3a16335b4afeb340b9eff19926 and recomp-ui be8ac1d03ee19d55394b5a5f2d9d1506edd56659.
Linux and macOS packages use native CMake, Ninja, Python, C, and C++ tools.
Windows keeps the portable toolchain route. This change does not change game
code or the graduation state. Build-only CI and every exact-package release
gate must pass before publication.
