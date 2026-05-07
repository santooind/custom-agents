#!/usr/bin/env bash
set -euo pipefail

JSON_FILE="${1:-}"
TYPE="${2:-generic}"

if [ -z "$JSON_FILE" ]; then
  echo "Usage: vault-json-schema-validate.sh <report.json> <discovery|migration|implementation>"
  exit 2
fi

if [ ! -f "$JSON_FILE" ]; then
  echo "JSON validation: $JSON_FILE not present; skipping."
  exit 0
fi

python3 - "$JSON_FILE" "$TYPE" <<'PY'
import json
import sys
from pathlib import Path

path = Path(sys.argv[1])
report_type = sys.argv[2]

try:
    data = json.loads(path.read_text(encoding="utf-8"))
except Exception as exc:
    print(f"Invalid JSON: {path}: {exc}")
    sys.exit(1)

required = {
    "discovery": [
        "schema_version",
        "generated_at",
        "application",
        "repository",
        "technology_stack",
        "deployment_model",
        "secret_inventory",
        "risk_findings",
        "code_change_impact_matrix",
        "recommended_vault_pattern",
        "effort_estimation",
        "migration_complexity_score",
        "evidence",
    ],
    "migration": [
        "schema_version",
        "generated_at",
        "agent",
        "inputs_reviewed",
        "executive_summary",
        "selected_vault_pattern",
        "migration_scope",
        "secret_mapping_plan",
        "code_change_plan",
        "infrastructure_change_plan",
        "cicd_change_plan",
        "implementation_sequence",
        "minimum_test_plan",
        "rollback_plan",
        "cutover_plan",
        "risk_register",
        "open_questions",
        "implementation_readiness",
        "safety",
    ],
    "implementation": [
        "schema_version",
        "generated_at",
        "agent",
        "mode",
        "inputs_reviewed",
        "approval_and_scope",
        "selected_pattern",
        "skills_applied",
        "files_changed",
        "secret_safety_controls",
        "validation_performed",
        "next_steps",
    ],
    "validation": [
        "schema_version",
        "generated_at",
        "agent",
        "inputs_reviewed",
        "git_diff_reviewed",
        "executive_summary",
        "impacted_files_reviewed",
        "affected_flows",
        "minimal_test_plan",
        "tests_executed",
        "tests_not_executed",
        "tests_blocked",
        "build_validation",
        "vault_specific_validation",
        "missing_test_coverage",
        "manual_validation_checklist",
        "merge_readiness",
        "required_manual_validation",
        "risk_based_recommendation",
        "safety",
    ],
    "security": [
        "schema_version",
        "generated_at",
        "agent",
        "inputs_reviewed",
        "git_diff_reviewed",
        "executive_summary",
        "diff_security_scope",
        "security_control_checklist",
        "secret_exposure_review",
        "vault_auth_review",
        "vault_policy_and_path_review",
        "runtime_safety_review",
        "cicd_and_terraform_safety_review",
        "rollback_security_review",
        "findings",
        "open_security_questions",
        "merge_security_decision",
        "human_approval_checklist",
        "final_recommendation",
        "safety",
    ],
}.get(report_type, ["schema_version"])

missing = [key for key in required if key not in data]
if missing:
    print(f"JSON validation failed for {path}. Missing keys: {', '.join(missing)}")
    sys.exit(1)

print(f"JSON validation passed: {path}")
PY
