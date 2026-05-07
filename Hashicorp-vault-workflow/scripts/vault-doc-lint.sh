#!/usr/bin/env bash
set -euo pipefail

FILE="${1:-}"

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  echo "Usage: ./scripts/vault-doc-lint.sh docs/vault/<file>.md"
  exit 2
fi

required=(
  "## Status"
  "## Open Questions"
)

if grep -Fq "## Pattern Decision Matrix" "$FILE" && grep -Fq "## Discovery Checklist" "$FILE"; then
  if grep -Fq "## Required Code And Config Changes" "$FILE"; then
    required+=(
      "## Codebase Evidence"
      "## Current Secret Handling"
      "## Secret Inventory Metadata"
      "## Risk Findings"
      "## Recommended Vault Pattern"
      "## Pattern Decision Matrix"
      "## Vault Design Inputs"
      "## Required Code And Config Changes"
      "## Discovery Checklist"
    )
  else
    required+=(
      "## Codebase Evidence"
      "## Current Secret Handling"
      "## Secret Inventory Metadata"
      "## Recommended Vault Pattern"
      "## Pattern Decision Matrix"
      "## Risk Findings"
      "## Discovery Checklist"
    )
  fi
fi

case "$FILE" in
  *.implementation-plan.md|*/vault-implementation-plan.md)
    required+=(
      "## Selected Pattern"
      "## Change Plan"
      "## Vault Platform Changes"
      "## Failure Behavior"
      "## Validation Results"
      "## Rollback Plan"
      "## Release Checklist"
    )
    ;;
  *.test-cases.md|*/vault-test-cases.md)
    required+=(
      "## Test Environments"
      "## Test Cases"
      "## Automation Commands"
      "## Manual Evidence"
      "## Exit Criteria"
    )
    ;;
esac

missing=0
for heading in "${required[@]}"; do
  if ! grep -Fq "$heading" "$FILE"; then
    echo "Missing required heading: $heading"
    missing=1
  fi
done

if grep -Eiq '(password|token|secret|api[_-]?key)[[:space:]]*[:=][[:space:]]*[^<[:space:]][^[:space:]]{5,}' "$FILE"; then
  echo "Potential unredacted secret-like assignment found in document: $FILE"
  missing=1
fi

if [ "$missing" -ne 0 ]; then
  exit 1
fi

echo "Vault document structure looks valid: $FILE"
