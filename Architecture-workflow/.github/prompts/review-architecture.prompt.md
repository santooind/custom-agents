---
name: review-architecture
description: "Review existing architecture documents for gaps, risks, and freeze blockers."
agent: "Architecture Critic Agent"
argument-hint: "[architecture document path]"
---

Review this architecture package:

`${input:architecture_path:Path to architecture document or folder}`

Focus on ServiceNow, Terraform, Vault, SNOW-Terraform AID, SNOW-Vault AID, security controls, static secret handling, Terraform state risk, operational gaps, and freeze blockers.

Create or update:

- `docs/architecture/<solution-name>.security-review.md`
- `docs/architecture/<solution-name>.open-questions.md`
