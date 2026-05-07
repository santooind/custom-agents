#!/usr/bin/env bash
set -euo pipefail

FILE="${1:-}"

if [ -z "$FILE" ] || [ ! -f "$FILE" ]; then
  echo "Usage: ./scripts/requirements-lint.sh docs/requirements/<file>.requirements.md"
  exit 2
fi

if grep -Fq "## 1. Executive Summary" "$FILE"; then
  required=(
    "## 1. Executive Summary"
    "## 2. Background / Problem Statement"
    "## 3. Business Goals"
    "## 6. In Scope"
    "## 7. Out Of Scope"
    "## 11. Functional Requirements"
    "## 12. Business Rules"
    "## 15. Integration Requirements"
    "## 16. Security And Privacy Requirements"
    "## 21. Assumptions"
    "## 22. Risks"
    "## 23. Open Questions"
    "## 24. Acceptance Criteria"
    "## 25. Traceability Matrix"
    "## 26. Final Readiness Checklist"
  )
else
  required=(
    "## Status"
    "## Source Raw Input"
    "## Problem Statement"
    "## Goals"
    "## Non-Goals"
    "## Functional Requirements"
    "## Non-Functional Requirements"
    "## Acceptance Criteria"
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

echo "Requirement document structure looks valid: $FILE"
