#!/usr/bin/env bash
set -euo pipefail

FILE="${1:-}"

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  echo "Usage: ./scripts/solution-lint.sh <artifact.md>"
  exit 2
fi

required=("## Open Questions")

if grep -Fq "## Final Baseline Verdict" "$FILE"; then
  required+=("## Source Artifacts" "## Traceability Summary" "## Approval Record")
fi

missing=0
for heading in "${required[@]}"; do
  if ! grep -Fq "$heading" "$FILE"; then
    echo "Missing required heading: $heading"
    missing=1
  fi
done

if grep -Eiq '(password|token|secret|api[_-]?key)[[:space:]]*[:=][[:space:]]*[^<[:space:]][^[:space:]]{5,}' "$FILE"; then
  echo "Potential unredacted secret-like assignment found: $FILE"
  missing=1
fi

if [ "$missing" -ne 0 ]; then
  exit 1
fi

echo "Solution artifact looks valid: $FILE"
