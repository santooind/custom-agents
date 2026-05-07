# Vault Discovery Local Workflow

## Run In GitHub Copilot

Open the target repository with this workflow pack available, then run:

```text
/vault-discovery-agent
```

Provide:

- target repository path
- application name if known
- platform notes if known
- CI/CD notes if known
- migration constraints if known

## Expected Outputs

The agent creates:

- `reports/vault-discovery-report.md`
- `reports/vault-discovery-report.json`

After discovery, run:

```text
/vault-pattern-selection
```

The pattern selection agent consumes:

- `reports/vault-discovery-report.md`
- `reports/vault-discovery-report.json`

and creates:

- `reports/vault-pattern-decision.md`

Then run:

```text
/vault-migration-plan
```

The migration plan agent consumes:

- `reports/vault-discovery-report.md`
- `reports/vault-discovery-report.json`
- `reports/vault-pattern-decision.md`

and creates:

- `reports/vault-migration-plan.md`
- `reports/vault-migration-plan.json`

Finally, run an implementation dry-run:

```text
/vault-implementation
```

The implementation agent consumes all prior reports and creates:

- `reports/vault-implementation-summary.md`
- optional `reports/vault-implementation-summary.json`

It defaults to dry-run. It may edit application files only after explicit implementation approval.

## Safe Discovery Rules

- Discovery is read-only.
- Do not modify application files.
- Do not expose secret values.
- Mask evidence snippets.
- Treat unknowns as open questions.

## Suggested Review Flow

1. Application owner reviews repository and technology facts.
2. Platform owner confirms deployment model.
3. Security owner reviews risk findings.
4. Vault owner confirms recommended auth and secret pattern.
5. Migration lead assigns complexity and wave.
6. Pattern Selection Agent records rank 1 and rank 2 target patterns in `reports/vault-pattern-decision.md`.
7. Migration Plan Agent creates implementation sequence, secret mapping, tests, rollback, cutover, risks, and readiness in `reports/vault-migration-plan.*`.
8. Implementation Agent performs dry-run scope review or, after explicit approval, applies scoped changes using pattern-specific skills.

## Optional External API Submission

External submission is allowed only when:

- the payload is metadata-only
- secret values are redacted
- the user explicitly approves submission
- the destination is known and authorized

## Local Safety Checks

Run these before treating outputs as review-ready:

```bash
./scripts/vault-agentic-artifact-check.sh .
./scripts/vault-secret-redaction-lint.sh reports
./scripts/vault-report-lint.sh reports/vault-discovery-report.md discovery
./scripts/vault-json-schema-validate.sh reports/vault-discovery-report.json discovery
./scripts/vault-implementation-safety-check.sh .
```

Use the matching `.ps1` scripts on Windows or PowerShell.
