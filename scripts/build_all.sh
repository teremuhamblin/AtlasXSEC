#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

cd "$ROOT_DIR"

MODULES=(
  ":app"
  ":security-engine"
  ":security-services"
  ":forensic-core"
  ":reports"
  ":sandbox"
)

echo "[AtlasXSEC] Build complet des modules..."
./gradlew clean

for module in "${MODULES[@]}"; do
  echo "[AtlasXSEC] Build du module $module..."
  ./gradlew "${module}:assembleDebug"
done

echo "[AtlasXSEC] Build terminé avec succès."
