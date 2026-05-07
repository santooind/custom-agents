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

## Optional External API Submission

External submission is allowed only when:

- the payload is metadata-only
- secret values are redacted
- the user explicitly approves submission
- the destination is known and authorized

