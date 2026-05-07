---
name: standard-vault-workflow
description: "Run standard Vault adoption planning for an application."
agent: "Enterprise Vault Orchestrator"
argument-hint: "[target codebase path or Vault migration goal]"
---

Run `Standard` mode.

Input:

`${input:raw_input:Paste target codebase path, Vault migration goal, platform notes, CI/CD notes, deployment notes, or raw constraints}`

Use:

- `Vault Discovery Architect`
- `Vault Question Curator`
- `Vault Architecture Challenger`
- `Vault Identity Policy Architect`
- `Vault Secret Lifecycle Architect`
- `Vault Platform Integration Architect`
- `Vault Test Automation Agent`

Create:

- `vault/discovery/<app-slug>.discovery.md`
- `vault/questions/<app-slug>.open-questions.md`
- `vault/reviews/<app-slug>.challenge-review.md`
- `vault/policies/<app-slug>.identity-policy-design.md`
- `vault/design/<app-slug>.secret-lifecycle.md`
- `vault/design/<app-slug>.platform-integration.md`
- `vault/tests/<app-slug>.test-cases.md`

Do not implement until I explicitly approve.
Do not include secret values.
