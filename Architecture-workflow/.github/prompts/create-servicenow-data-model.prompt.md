---
name: create-servicenow-data-model
description: "Create a native-first ServiceNow data model with custom tables, native tables, fields, keys, ACLs, business rules, sys_properties, and flow examples."
agent: "ServiceNow Data Model Architect"
argument-hint: "[requirements, user stories, HLD, or data model draft]"
---

Create a ServiceNow data model artifact.

Input:

`${input:raw_input:Paste requirements, user stories, HLD/design notes, existing data model, or file path}`

Use:

- `templates/enterprise/servicenow-data-model.md`

Write:

- `architecture/working-draft/<solution-slug>.servicenow-data-model.md`

Prefer native ServiceNow tables before custom tables. Include table inventory, native tables, custom table schemas, field specs, unique keys, indexes, choice lists, ACLs, business rules, sys_properties, audit event model, parked/future additions, flow examples, and open questions.

Do not invent table names, field names, choices, keys, or ACL rules without marking them as assumptions or open questions. Never store secret values.
