---
name: create-aid
description: "Create an Architecture Interface Document for two systems."
agent: "Architecture Orchestrator"
argument-hint: "[system A] [system B]"
---

Create an Architecture Interface Document for:

- System A: `${input:system_a:ServiceNow}`
- System B: `${input:system_b:Terraform or Vault}`

Use `templates/aid-document.md`.

Include integration purpose, ownership, source of truth, payloads, authentication, authorization, data classification, secret handling, retries, idempotency, audit, observability, failure handling, rollback, and open questions.
