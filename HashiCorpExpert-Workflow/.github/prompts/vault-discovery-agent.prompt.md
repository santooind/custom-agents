---
name: vault-discovery-agent
description: "Run read-only enterprise Vault discovery and generate standardized Markdown and JSON reports."
agent: "Vault Discovery Agent"
argument-hint: "[target repository path] [optional application/platform notes]"
---

Run the Vault Discovery Agent in safe read-only mode.

Target:

`${input:target:Paste the repository path or describe the target application/repository}`

Optional context:

`${input:context:Paste known platform, CI/CD, runtime, ownership, compliance, or migration constraints}`

Required outputs:

- `reports/vault-discovery-report.md`
- `reports/vault-discovery-report.json`

Rules:

- Do not modify application source code.
- Do not expose secret values.
- Redact all secret-like evidence.
- Use only metadata and masked excerpts.
- Do not assume Kubernetes, modern Spring Boot, or cloud-native architecture.

