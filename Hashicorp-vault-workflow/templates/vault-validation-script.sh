#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"

if [ ! -e "$TARGET" ]; then
  echo "Target not found: $TARGET"
  exit 2
fi

echo "Running Vault integration validation against: $TARGET"

if command -v rg >/dev/null 2>&1; then
  SEARCH=(rg -n --hidden --glob '!**/.git/**' --glob '!**/vault-boundary-lint.sh' --glob '!**/vault-boundary-lint.ps1' --glob '!**/vault-validation-script.sh' --glob '!**/vault-validation-script.ps1')
else
  SEARCH=(grep -RIn)
fi

status=0

check_pattern() {
  local label="$1"
  local pattern="$2"
  local matches
  matches="$("${SEARCH[@]}" "$pattern" "$TARGET" 2>/dev/null || true)"
  if [ -n "$matches" ]; then
    echo "Review required: $label"
    echo "$matches" | sed -E 's/(=|:)[[:space:]]*[^[:space:]]+/\1 <redacted>/g'
    status=1
  fi
}

check_pattern "Terraform may be managing Vault secret payloads" 'vault_(kv_secret|generic_secret)'
check_pattern "Terraform Vault data source may read secrets into state" 'data[[:space:]]+"vault_'
check_pattern "Potential hardcoded password assignment" '(password|passwd|pwd)[[:space:]]*='
check_pattern "Potential hardcoded token assignment" '(token|secret|api_key|private_key)[[:space:]]*='
check_pattern "Potential environment dump risk" 'printenv|env[[:space:]]*\||process\.env|System\.getenv'

if [ "$status" -ne 0 ]; then
  echo "Vault validation found review items. Confirm no secret payloads are exposed or persisted."
  exit 1
fi

echo "Vault validation completed with no obvious boundary concerns."
