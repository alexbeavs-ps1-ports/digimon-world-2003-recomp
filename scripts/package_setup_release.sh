#!/usr/bin/env bash
# Thin wrapper around the shared psxrecomp setup-host packager.
# Autofilled by tools/new_project_layout/setup_project.{sh,ps1}.
#
# Usage:
#   scripts/package_setup_release.sh <build-dir> <artifact-tag> [recompiler-build-dir]
#
# Writes: dist/Digimon-World-2003-Recomp-<VERSION>-<artifact-tag>.zip
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BUILD_DIR="${1:-}"
ARTIFACT_TAG="${2:-}"
RECOMPILER_BUILD="${3:-build-recompiler}"

if [[ -z "${BUILD_DIR}" || -z "${ARTIFACT_TAG}" ]]; then
  echo "usage: $0 <build-dir> <artifact-tag> [recompiler-build-dir]" >&2
  exit 2
fi

PACKAGER="${ROOT}/psxrecomp/tools/package_setup_host.sh"
if [[ ! -f "${PACKAGER}" ]]; then
  echo "error: missing ${PACKAGER} (psxrecomp submodule)" >&2
  exit 1
fi
chmod +x "${PACKAGER}" 2>/dev/null || true

EXTRA_PROJECT=()
if [[ -f "${ROOT}/catalog_identity.json" ]]; then
  EXTRA_PROJECT+=(--project-file catalog_identity.json)
fi
if [[ -f "${ROOT}/framework_pins.txt" ]]; then
  EXTRA_PROJECT+=(--project-file framework_pins.txt)
fi

if [[ -f "${ROOT}/game_options.toml" ]]; then
  EXTRA_PROJECT+=(--project-file game_options.toml)
fi
if [[ -d "${ROOT}/src" ]]; then
  EXTRA_PROJECT+=(--project-dir src)
fi
if [[ -d "${ROOT}/mods" ]]; then
  EXTRA_PROJECT+=(--project-dir mods)
fi
if [[ -d "${ROOT}/assets" ]]; then
  EXTRA_PROJECT+=(--project-dir assets)
fi
if [[ -d "${ROOT}/launcher_assets" ]] &&
   find "${ROOT}/launcher_assets" -type f -print -quit | grep -q .; then
  EXTRA_PROJECT+=(--project-dir launcher_assets)
fi
for _sym in psx_symbols.h psx_symbols_overlays.h; do
  if [[ -f "${ROOT}/${_sym}" ]]; then
    EXTRA_PROJECT+=(--project-file "${_sym}")
  fi
done

cd "${ROOT}"
exec bash "${PACKAGER}" \
  --root "${ROOT}" \
  --build-dir "${BUILD_DIR}" \
  --artifact "${ARTIFACT_TAG}" \
  --zip-prefix Digimon-World-2003-Recomp \
  --exe-name Digimon_World_2003_Recompiled \
  --display-name "Digimon World 2003 Recompiled" \
  --recompiler-build "${RECOMPILER_BUILD}" \
  --version-env RELEASE_VERSION \
  --disc-hint "your legally owned Digimon World 2003 disc" \
  --bios-hint "your own SCPH-5552 (Europe) BIOS dump (524288 bytes; SHA-256 1faaa18fa820a0225e488d9f086296b8e6c46df739666093987ff7d8fd352c09)" \
  --project-file CMakeLists.txt \
  --project-file game.toml \
  --project-file VERSION \
  --project-file codegen_setup.c \
  --project-file codegen_setup.h \
  --project-file README.md \
  --project-file LICENSE \
  --project-file THIRD_PARTY_NOTICES.md \
  --project-file project-manifest.toml \
  --project-dir docs \
  --project-dir seeds \
  "${EXTRA_PROJECT[@]}"
