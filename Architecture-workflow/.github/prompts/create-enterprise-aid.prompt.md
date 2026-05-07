---
name: create-enterprise-aid
description: "Create an advanced enterprise Architecture Interface Document with use-case contracts, payloads, security, operations, audit, and freeze readiness."
agent: "Enterprise AID Architect"
argument-hint: "[systems and raw requirements]"
---

Create an enterprise Architecture Interface Document.

Systems:

`${input:systems:Example: ServiceNow, Terraform Cloud/Enterprise, HashiCorp Vault}`

Input:

`${input:raw_input:Paste requirements, architecture notes, API notes, diagrams, current AID draft, or file path}`

If the systems include ServiceNow, Terraform, and Vault, use:

- `templates/enterprise/aid-servicenow-terraform-vault.md`

Otherwise use:

- `templates/enterprise/enterprise-aid-document.md`

Write the output to:

- `architecture/interface-docs/<solution-slug>.aid.md`

Include ground rules, responsibilities, non-responsibilities, use-case contracts, sequence diagrams, payload examples, success/failure responses, auth, authorization, secret handling, idempotency, correlation, retries, timeout, audit, observability, operations, risks, open questions, and freeze checklist.

Do not invent unconfirmed endpoints, payload fields, polling intervals, auth methods, workspace strategy, SLAs, naming conventions, or approval rules. Mark them as assumptions or open questions.
