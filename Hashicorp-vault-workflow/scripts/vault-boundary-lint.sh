#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-.}"

if [ ! -e "$TARGET" ]; then
  echo "Target not found: $TARGET"
  exit 2
fi

if command -v rg >/dev/null 2>&1; then
  SEARCH=(rg -n --hidden --glob '!**/.git/**' --glob '!**/node_modules/**' --glob '!**/vendor/**' --glob '!**/dist/**' --glob '!**/build/**' --glob '!**/vault-boundary-lint.sh' --glob '!**/vault-boundary-lint.ps1' --glob '!**/vault-validation-script.sh' --glob '!**/vault-validation-script.ps1')
else
  echo "This linter requires ripgrep (rg)."
  exit 2
fi

patterns=(
  'vault_(kv_secret|generic_secret)'
  'data[[:space:]]+"vault_'
  'terraform output -raw'
  'nonsensitive\('
  '(password|passwd|pwd)[[:space:]]*='
  '(token|secret|api_key|private_key)[[:space:]]*='
)

found=0
for pattern in "${patterns[@]}"; do
  matches="$("${SEARCH[@]}" "$pattern" "$TARGET" 2>/dev/null || true)"
  if [ -n "$matches" ]; then
    echo "Potential Vault boundary concern: $pattern"
    echo "$matches" | sed -E 's/(=|:)[[:space:]]*[^[:space:]]+/\1 <redacted>/g'
    found=1
  fi
done

if [ "$found" -ne 0 ]; then
  echo "Review required: confirm no static secret payloads are persisted in source, Terraform state, generated files, or logs."
  exit 1
fi

echo "No obvious Vault boundary concerns found in: $TARGET"
