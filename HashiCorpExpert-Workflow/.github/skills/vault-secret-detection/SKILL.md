---
name: vault-secret-detection
description: "Detect secret handling patterns safely without exposing secret values."
argument-hint: "[target repository path]"
---

# Vault Secret Detection

## Applicability

Always run.

## Scan Scope

Search metadata-only evidence for:

- hardcoded credential assignments
- environment variable usage
- config file secret keys
- Kubernetes Secret references
- CI/CD secret references
- cloud secret providers
- shared secret utilities
- legacy encryption/decryption utilities

## Patterns

Look for key names and access patterns such as:

- `password`, `passwd`, `pwd`
- `secret`, `client_secret`
- `token`, `access_token`, `refresh_token`
- `api_key`, `apikey`, `x-api-key`
- `access_key`, `secret_key`
- `connection_string`, `jdbc`, `datasource`
- `System.getenv`, `process.env`, `os.environ`, `Environment.GetEnvironmentVariable`
- `secretKeyRef`, `envFrom.secretRef`, `kind: Secret`
- `Jasypt`, `encryptor`, `decrypt`, `cipher`, `PBEWith`

## Evidence Rules

Evidence must include only:

- file path
- line number when available
- key or pattern class
- masked excerpt
- confidence

Mask values with `[REDACTED]`.

## Findings

Categorize findings as:

- `hardcoded-credential-risk`
- `env-var-secret-usage`
- `config-file-secret-key`
- `kubernetes-secret-reference`
- `cloud-secret-provider`
- `shared-secret-utility`
- `legacy-encryption-utility`

## Safety

Never include a discovered value. Never include private key blocks, certificates, passwords, tokens, or complete credential-bearing URLs.

