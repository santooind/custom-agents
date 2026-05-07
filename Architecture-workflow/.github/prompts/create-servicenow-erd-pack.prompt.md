---
name: create-servicenow-erd-pack
description: "Create a ServiceNow ERD/diagram pack from a ServiceNow data model."
agent: "ServiceNow ERD Architect"
argument-hint: "[ServiceNow data model path]"
---

Create a ServiceNow ERD pack from:

`${input:data_model:Path to ServiceNow data model or paste table list}`

Use:

- `templates/enterprise/servicenow-erd-pack.md`

Write:

- `architecture/diagrams/<solution-slug>.servicenow-erd.md`

Include custom table ERD, native/custom comprehensive ERD, optional legacy-to-final evolution diagram, integration flow diagram, model evolution summary, consistency notes, and open questions.

Do not add relationships or fields that are not in the data model unless clearly marked proposed.
