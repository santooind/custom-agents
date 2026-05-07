#!/usr/bin/env bash
set -euo pipefail

ROOT="${1:-.}"
REPORTS="$ROOT/reports"

if [ ! -d "$REPORTS" ]; then
  echo "Vault artifact check: reports directory not present; nothing to validate yet."
  exit 0
fi

missing=0

exists_any() {
  for path in "$@"; do
    if [ -f "$path" ]; then
      return 0
    fi
  done
  return 1
}

if [ -f "$REPORTS/vault-pattern-decision.md" ]; then
  if ! exists_any "$REPORTS/vault-discovery-report.md" "$REPORTS/vault-discovery-report.json"; then
    echo "Pattern decision exists but discovery report is missing."
    missing=1
  fi
fi

if [ -f "$REPORTS/vault-migration-plan.md" ] || [ -f "$REPORTS/vault-migration-plan.json" ]; then
  if ! exists_any "$REPORTS/vault-discovery-report.md" "$REPORTS/vault-discovery-report.json"; then
    echo "Migration plan exists but discovery report is missing."
    missing=1
  fi
  if [ ! -f "$REPORTS/vault-pattern-decision.md" ]; then
    echo "Migration plan exists but pattern decision is missing."
    missing=1
  fi
fi

if [ -f "$REPORTS/vault-implementation-summary.md" ] || [ -f "$REPORTS/vault-implementation-summary.json" ]; then
  if ! exists_any "$REPORTS/vault-discovery-report.md" "$REPORTS/vault-discovery-report.json"; then
    echo "Implementation summary exists but discovery report is missing."
    missing=1
  fi
  if [ ! -f "$REPORTS/vault-pattern-decision.md" ]; then
    echo "Implementation summary exists but pattern decision is missing."
    missing=1
  fi
  if ! exists_any "$REPORTS/vault-migration-plan.md" "$REPORTS/vault-migration-plan.json"; then
    echo "Implementation summary exists but migration plan is missing."
    missing=1
  fi
fi

if [ "$missing" -ne 0 ]; then
  echo "Vault agentic artifact check failed."
  exit 1
fi

echo "Vault agentic artifact check passed."

