---
name: vault-discovery
description: "Analyze a codebase and create a Vault discovery document with recommended integration pattern."
agent: "Vault Discovery Architect"
argument-hint: "[target codebase path]"
---

Analyze this target codebase:

`${input:target_codebase:Path to application repository or folder}`

Create or update:

- `docs/vault/<app-name>.discovery.md`

Identify tech stack, deployment model, current secret handling, risks, recommended Vault integration pattern, required code/config changes, implementation phases, and open questions.
