# Vault Hooks And Safety Checks

This workflow pack includes deterministic hooks and scripts that harden the agentic workflow.

## Purpose

Agents and skills provide reasoning, planning, and implementation guidance. Hooks and scripts provide repeatable safety checks.

Use them to validate:

- required artifact handoffs
- Markdown report completeness
- JSON report structure
- secret redaction
- implementation safety boundaries

## Hook Files

```text
.github/hooks/
  vault-agentic-workflow-audit.json
  vault-discovery-report-lint.json
  vault-pattern-decision-lint.json
  vault-migration-plan-lint.json
  vault-implementation-safety.json
```

## Scripts

Bash:

```text
scripts/vault-agentic-artifact-check.sh
scripts/vault-report-lint.sh
scripts/vault-json-schema-validate.sh
scripts/vault-secret-redaction-lint.sh
scripts/vault-implementation-safety-check.sh
```

PowerShell:

```text
scripts/vault-agentic-artifact-check.ps1
scripts/vault-report-lint.ps1
scripts/vault-json-schema-validate.ps1
scripts/vault-secret-redaction-lint.ps1
scripts/vault-implementation-safety-check.ps1
```

## Local Usage

From the workflow root:

```bash
./scripts/vault-agentic-artifact-check.sh .
./scripts/vault-report-lint.sh reports/vault-discovery-report.md discovery
./scripts/vault-json-schema-validate.sh reports/vault-discovery-report.json discovery
./scripts/vault-secret-redaction-lint.sh reports
./scripts/vault-implementation-safety-check.sh .
```

PowerShell:

```powershell
./scripts/vault-agentic-artifact-check.ps1 .
./scripts/vault-report-lint.ps1 reports/vault-discovery-report.md discovery
./scripts/vault-json-schema-validate.ps1 reports/vault-discovery-report.json discovery
./scripts/vault-secret-redaction-lint.ps1 reports
./scripts/vault-implementation-safety-check.ps1 .
```

## What The Checks Enforce

| Check | Enforces |
|---|---|
| Agentic artifact check | Pattern, migration, and implementation artifacts have required upstream inputs. |
| Report lint | Required Markdown sections are present. |
| JSON validation | Required top-level JSON fields are present and JSON is parseable. |
| Secret redaction lint | Report outputs do not contain obvious unredacted secret-like values. |
| Implementation safety check | Implementation does not introduce common unsafe Vault or secret-handling patterns. |

## Notes

- The scripts are intentionally lightweight and dependency-minimal.
- Full JSON Schema validation can be added later if `jsonschema`, `ajv`, or a standard enterprise validator is available.
- The implementation safety check avoids scanning agent-pack metadata while still scanning application and CI/CD files.
- These checks do not replace security review. They catch common mistakes early.

