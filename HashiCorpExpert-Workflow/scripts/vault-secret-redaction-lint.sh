#!/usr/bin/env bash
set -euo pipefail

TARGET="${1:-reports}"

if [ ! -e "$TARGET" ]; then
  echo "Secret redaction lint: $TARGET not present; skipping."
  exit 0
fi

if ! command -v rg >/dev/null 2>&1; then
  echo "Secret redaction lint requires ripgrep (rg)."
  exit 2
fi

SEARCH=(rg -n --hidden --glob '!**/.git/**' --glob '!**/node_modules/**' --glob '!**/vendor/**' --glob '!**/dist/**' --glob '!**/build/**')

patterns=(
  '(password|passwd|pwd|token|secret|api[_-]?key|access[_-]?key|client[_-]?secret|private[_-]?key)[[:space:]]*[:=][[:space:]]*["'\'']?[^"'\''[:space:]<\[][^\r\n]*'
  'Authorization:[[:space:]]*(Bearer|Basic)[[:space:]]+[A-Za-z0-9+/._=-]{8,}'
  '-----BEGIN [A-Z ]*PRIVATE KEY-----'
)

allowed='(\[REDACTED\]|<redacted>|<[^>]+>|\$\{[^}]+\}|REDACTED|placeholder|example|sample|optional|not included)'

found=0
for pattern in "${patterns[@]}"; do
  matches="$("${SEARCH[@]}" "$pattern" "$TARGET" 2>/dev/null || true)"
  if [ -n "$matches" ]; then
    unsafe="$(printf '%s\n' "$matches" | rg -v "$allowed" || true)"
    if [ -n "$unsafe" ]; then
      echo "Potential unredacted secret-like content found:"
      printf '%s\n' "$unsafe" | sed -E 's/(:|=)[[:space:]]*[^[:space:]]+/\1 <redacted>/g'
      found=1
    fi
  fi
done

if [ "$found" -ne 0 ]; then
  echo "Secret redaction lint failed. Replace values with [REDACTED] or placeholders."
  exit 1
fi

echo "Secret redaction lint passed: $TARGET"

