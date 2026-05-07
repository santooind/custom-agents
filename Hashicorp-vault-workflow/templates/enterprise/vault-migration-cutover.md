# <App Name> Vault Migration And Cutover Plan

## Status

- Status: `Draft | Needs Answers | Ready For Cutover | Completed`
- Owner:
- Last Updated:

## Migration Phases

| Phase | Scope | Owner | Entry Criteria | Exit Criteria |
|---|---|---|---|---|
| 1 - Prepare |  |  |  |  |
| 2 - Integrate |  |  |  |  |
| 3 - Validate |  |  |  |  |
| 4 - Cutover |  |  |  |  |
| 5 - Cleanup |  |  |  |  |

## Cutover Steps

| Step | Action | Owner | Validation | Rollback |
|---|---|---|---|---|
| 1 |  |  |  |  |

## Rollback Plan

| Trigger | Rollback Action | Owner | Validation |
|---|---|---|---|
|  |  |  |  |

## Cleanup Rules

- [ ] Do not delete old secret sources until validation and rollback window are complete.
- [ ] Do not record secret values in cleanup tickets or logs.
- [ ] Confirm owners before removing legacy paths.

**Why?** Cutover is where safe design becomes safe production behavior.
