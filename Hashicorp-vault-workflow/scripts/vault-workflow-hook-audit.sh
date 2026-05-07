#!/usr/bin/env bash
set -euo pipefail

EVENT="${1:-Unknown}"
LOG_DIR="docs/vault"
LOG_FILE="$LOG_DIR/workflow-audit.log"

mkdir -p "$LOG_DIR"
printf '%s\t%s\n' "$(date -u '+%Y-%m-%dT%H:%M:%SZ')" "$EVENT" >> "$LOG_FILE"

cat >/dev/null || true
printf '{"continue":true}\n'
