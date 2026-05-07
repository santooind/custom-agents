---
name: enterprise-vault-workflow
description: "Run the mode-aware enterprise HashiCorp Vault workflow from discovery through design, validation, operations, migration, and release readiness."
agent: "Enterprise Vault Orchestrator"
argument-hint: "[Auto | Light | Standard | Enterprise Release] [target codebase path or Vault goal]"
---

Run the Vault workflow using the requested mode.

Mode:

`${input:mode:Auto}`

Input:

`${input:raw_input:Paste target codebase path, Vault migration goal, platform notes, CI/CD notes, deployment notes, or raw constraints}`

Mode rules:

- `Auto`: choose the smallest safe mode and explain why.
- `Light`: discovery, questions, and challenge review only. No implementation.
- `Standard`: discovery, identity/policy, lifecycle, platform integration, implementation plan, and testing.
- `Enterprise Release`: full Vault package including security/compliance, operations/resilience, migration/cutover, release readiness, and freeze approval.

Do not print, copy, commit, or persist live secret values.

Do not implement or freeze release artifacts until I explicitly approve.
