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

if [ -f "$REPORTS/vault-test-validation-report.md" ] || [ -f "$REPORTS/vault-test-validation-report.json" ]; then
  if ! exists_any "$REPORTS/vault-discovery-report.md" "$REPORTS/vault-discovery-report.json"; then
    echo "Test validation report exists but discovery report is missing."
    missing=1
  fi
  if [ ! -f "$REPORTS/vault-pattern-decision.md" ]; then
    echo "Test validation report exists but pattern decision is missing."
    missing=1
  fi
  if ! exists_any "$REPORTS/vault-migration-plan.md" "$REPORTS/vault-migration-plan.json"; then
    echo "Test validation report exists but migration plan is missing."
    missing=1
  fi
  if ! exists_any "$REPORTS/vault-implementation-summary.md" "$REPORTS/vault-implementation-summary.json"; then
    echo "Test validation report exists but implementation summary is missing."
    missing=1
  fi
fi

if [ -f "$REPORTS/vault-security-review.md" ] || [ -f "$REPORTS/vault-security-review.json" ]; then
  if ! exists_any "$REPORTS/vault-discovery-report.md" "$REPORTS/vault-discovery-report.json"; then
    echo "Security review exists but discovery report is missing."
    missing=1
  fi
  if [ ! -f "$REPORTS/vault-pattern-decision.md" ]; then
    echo "Security review exists but pattern decision is missing."
    missing=1
  fi
  if ! exists_any "$REPORTS/vault-migration-plan.md" "$REPORTS/vault-migration-plan.json"; then
    echo "Security review exists but migration plan is missing."
    missing=1
  fi
  if ! exists_any "$REPORTS/vault-implementation-summary.md" "$REPORTS/vault-implementation-summary.json"; then
    echo "Security review exists but implementation summary is missing."
    missing=1
  fi
  if ! exists_any "$REPORTS/vault-test-validation-report.md" "$REPORTS/vault-test-validation-report.json"; then
    echo "Security review exists but test validation report is missing."
    missing=1
  fi
fi

if [ "$missing" -ne 0 ]; then
  echo "Vault agentic artifact check failed."
  exit 1
fi

echo "Vault agentic artifact check passed."
