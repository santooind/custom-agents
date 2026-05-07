#!/usr/bin/env bash
set -euo pipefail

FILE="${1:-}"

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  echo "Usage: ./scripts/architecture-lint.sh docs/architecture/<file>.md"
  exit 2
fi

if grep -Fq "## 1. Executive Summary" "$FILE"; then
  required=(
    "## 1. Executive Summary"
    "## 2. Background And Problem Statement"
    "## 3. Business And Architecture Goals"
    "## 6. Scope And Non-Goals"
    "## 8. Architecture Principles"
    "## 12. Component Architecture"
    "## 13. Integration Architecture"
    "## 14. Data Architecture"
    "## 15. Security, Privacy, And Trust Boundaries"
    "## 17. Platform, DevOps, And Deployment Architecture"
    "## 18. Resilience And Operational Architecture"
    "## 21. Architecture Decisions"
    "## 22. Risks And Mitigations"
    "## 24. Open Questions"
    "## 25. Architecture Traceability"
    "## 26. Architecture Freeze Checklist"
  )
else
  required=(
    "## Status"
    "## Open Questions"
    "## Freeze Checklist"
  )
fi

missing=0
for heading in "${required[@]}"; do
  if ! grep -Fq "$heading" "$FILE"; then
    echo "Missing required heading: $heading"
    missing=1
  fi
done

if [ "$missing" -ne 0 ]; then
  exit 1
fi

echo "Architecture document structure looks valid: $FILE"
