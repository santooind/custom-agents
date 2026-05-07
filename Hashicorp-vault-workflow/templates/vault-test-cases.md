# <App Name> Vault Test Cases

## Status

- Status: `Draft`
- Owner:
- Last Updated:
- Implementation Plan:

## Test Scope

## Test Environments

| Environment | Vault Mode | Notes |
|---|---|---|
| Local | Dev Vault / mock |  |
| CI | Mock or ephemeral Vault |  |
| Non-prod | Real Vault namespace |  |
| Prod | Smoke and audit evidence only |  |

## Test Cases

| ID | Type | Scenario | Preconditions | Steps | Expected Result | Automation |
|---|---|---|---|---|---|---|
| VT-001 | Startup | App starts with Vault-backed secrets |  |  |  |  |
| VT-002 | Security | Secret values are not printed in logs |  |  |  |  |
| VT-003 | Failure | Vault unavailable |  |  |  |  |
| VT-004 | Failure | Policy denied |  |  |  |  |
| VT-005 | Failure | Secret missing |  |  |  |  |
| VT-006 | Rotation | Secret rotates without code change |  |  |  |  |
| VT-007 | CI/CD | Pipeline authenticates without static token |  |  |  |  |
| VT-008 | Rollback | Previous config path can be restored safely |  |  |  |  |

## Automation Commands

```bash
./scripts/vault/<app-name>-vault-validation.sh .
```

```powershell
.\scripts\vault\<app-name>-vault-validation.ps1 .
```

## Manual Evidence

| Evidence | Source | Owner | Required For Release |
|---|---|---|---|
| Vault audit log entry for read | Vault audit device |  | Yes |
| Deployment event | CI/CD |  | Yes |
| No secret leakage in logs | Logging platform |  | Yes |

## Open Questions

| ID | Question | Why It Matters | Blocks Release |
|---|---|---|---|
| Q-001 |  |  | Yes |

## Exit Criteria

- [ ] All automated validation passes.
- [ ] Failure scenarios are covered.
- [ ] No test requires production secret values.
- [ ] Manual evidence owners are assigned.
- [ ] Release blockers are documented.
