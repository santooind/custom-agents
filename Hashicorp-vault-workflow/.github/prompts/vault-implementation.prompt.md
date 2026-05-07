---
name: vault-implementation
description: "Implement the approved Vault integration design from a discovery document."
agent: "Vault Implementation Agent"
argument-hint: "[discovery document path]"
---

Implement the Vault design from:

`${input:discovery_doc:Path to discovery document}`

Create or update:

- `docs/vault/<app-name>.implementation-plan.md`
- application code and configuration required by the approved pattern
- deployment and CI/CD configuration where needed

Keep changes scoped and do not introduce static secret payloads into source control, Terraform state, or logs.
