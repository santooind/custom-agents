#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"

if [ ! -e "$TARGET" ]; then
  echo "Target not found: $TARGET"
  exit 2
fi

if ! command -v rg >/dev/null 2>&1; then
  echo "Implementation safety check requires ripgrep (rg)."
  exit 2
fi

SEARCH=(rg -n --hidden --glob '!**/.git/**' --glob '!**/node_modules/**' --glob '!**/vendor/**' --glob '!**/dist/**' --glob '!**/build/**' --glob '!**/examples/**' --glob '!**/docs/**' --glob '!**/schemas/**' --glob '!**/.github/agents/**' --glob '!**/.github/prompts/**' --glob '!**/.github/skills/**' --glob '!**/.github/hooks/**' --glob '!**/vault-implementation-safety-check.sh' --glob '!**/vault-implementation-safety-check.ps1')

patterns=(
  'VAULT_TOKEN[[:space:]]*[:=][[:space:]]*[^<\[$][^[:space:]]+'
  'VAULT_SECRET_ID[[:space:]]*[:=][[:space:]]*[^<\[$][^[:space:]]+'
  'secret_id[[:space:]]*[:=][[:space:]]*["'\'']?[A-Za-z0-9._/-]{8,}'
  'vault_(kv_secret|generic_secret)'
  'data[[:space:]]+"vault_'
  'terraform[[:space:]]+output[[:space:]]+-raw'
  'set[[:space:]]+-x'
  'printenv'
  'env[[:space:]]*\|'
)

found=0
for pattern in "${patterns[@]}"; do
  matches="$("${SEARCH[@]}" "$pattern" "$TARGET" 2>/dev/null || true)"
  if [ -n "$matches" ]; then
    echo "Potential Vault implementation safety concern: $pattern"
    printf '%s\n' "$matches" | sed -E 's/(=|:)[[:space:]]*[^[:space:]]+/\1 <redacted>/g'
    found=1
  fi
done

if [ "$found" -ne 0 ]; then
  echo "Implementation safety check failed. Review secret payloads, Terraform state boundaries, and log exposure risks."
  exit 1
fi

echo "Implementation safety check passed: $TARGET"
