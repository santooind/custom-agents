---
name: light-vault-workflow
description: "Run metadata-only Vault discovery for low-risk/internal assessment."
agent: "Enterprise Vault Orchestrator"
argument-hint: "[target codebase path or raw Vault input]"
---

Run `Light` mode.

Input:

`${input:raw_input:Paste target codebase path, raw notes, or Vault discovery goal}`

Use only:

- `Vault Discovery Architect`
- `Vault Question Curator`
- `Vault Architecture Challenger`

Create:

- `vault/discovery/<app-slug>.discovery.md`
- `vault/questions/<app-slug>.open-questions.md`
- `vault/reviews/<app-slug>.challenge-review.md`

No implementation changes.
No secret values in output.
