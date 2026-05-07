#!/usr/bin/env bash
set -euo pipefail

REPORT="${1:-}"
TYPE="${2:-generic}"

if [ -z "$REPORT" ]; then
  echo "Usage: vault-report-lint.sh <report.md> <discovery|pattern|migration|implementation>"
  exit 2
fi

if [ ! -f "$REPORT" ]; then
  echo "Report lint: $REPORT not present; skipping."
  exit 0
fi

required_sections() {
  case "$TYPE" in
    discovery)
      printf '%s\n' \
        "## Executive Summary" \
        "## Repository Details" \
        "## Technology Stack" \
        "## Deployment Model" \
        "## Secret Inventory" \
        "## Current Secret Handling" \
        "## Risk Findings" \
        "## Code Change Impact Matrix" \
        "## Recommended Vault Pattern" \
        "## Effort Estimation" \
        "## Suggested Migration Sequence" \
        "## Potential Breaking Areas" \
        "## Open Questions" \
        "## Migration Complexity Score" \
        "## Evidence Appendix"
      ;;
    pattern)
      printf '%s\n' \
        "## Executive Decision" \
        "## Input Reports Used" \
        "## Ranked Pattern Recommendation" \
        "## Rank 1 Target Pattern" \
        "## Rank 2 Fallback Pattern" \
        "## Pattern Scorecard" \
        "## Rejected Patterns" \
        "## Final Recommendation"
      ;;
    migration)
      printf '%s\n' \
        "## 1. Executive Summary" \
        "## 2. Inputs Reviewed" \
        "## 3. Selected Vault Pattern" \
        "## 5. Secret Mapping Plan" \
        "## 6. Code Change Plan" \
        "## 9. Implementation Sequence" \
        "## 10. Minimum Test Plan" \
        "## 11. Rollback Plan" \
        "## 13. Risk Register" \
        "## 15. Implementation Readiness"
      ;;
    implementation)
      printf '%s\n' \
        "## Executive Summary" \
        "## Inputs Reviewed" \
        "## Approval And Scope" \
        "## Selected Pattern" \
        "## Skills Applied" \
        "## Files Changed" \
        "## Secret Safety Controls" \
        "## Validation Performed" \
        "## Rollback Notes" \
        "## Next Steps"
      ;;
    validation)
      printf '%s\n' \
        "## 1. Executive Summary" \
        "## 2. Inputs Reviewed" \
        "## 3. Impacted Files Reviewed" \
        "## 4. Affected Flows" \
        "## 5. Minimal Test Plan" \
        "## 6. Tests Executed" \
        "## 7. Tests Not Executed" \
        "## 8. Tests Blocked" \
        "## 9. Build Validation" \
        "## 10. Vault-Specific Validation" \
        "## 12. Merge Readiness" \
        "## 13. Manual Validation Checklist" \
        "## 14. Required Manual Validation" \
        "## 15. Risk-Based Recommendation"
      ;;
    security)
      printf '%s\n' \
        "## 1. Executive Summary" \
        "## 2. Inputs Reviewed" \
        "## 3. Diff Security Scope" \
        "## 4. Security Control Checklist" \
        "## 5. Secret Exposure Review" \
        "## 6. Vault Auth Review" \
        "## 7. Vault Policy And Path Review" \
        "## 8. Runtime Safety Review" \
        "## 9. CI/CD And Terraform Safety Review" \
        "## 10. Rollback Security Review" \
        "## 11. Findings" \
        "## 12. Open Security Questions" \
        "## 13. Merge Security Decision" \
        "## 14. Human Approval Checklist" \
        "## 15. Final Recommendation"
      ;;
    *)
      printf '%s\n' "## Executive Summary"
      ;;
  esac
}

missing=0
while IFS= read -r section; do
  if ! grep -Fq "$section" "$REPORT"; then
    echo "Missing required section in $REPORT: $section"
    missing=1
  fi
done < <(required_sections)

if [ "$missing" -ne 0 ]; then
  echo "Report lint failed: $REPORT"
  exit 1
fi

echo "Report lint passed: $REPORT"
