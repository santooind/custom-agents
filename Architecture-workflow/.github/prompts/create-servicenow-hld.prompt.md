---
name: create-servicenow-hld
description: "Extract and create the architecture/design portions of a ServiceNow HLD from requirements, notes, or an existing draft."
agent: "ServiceNow Architect Agent"
argument-hint: "[requirements, raw notes, or existing HLD path]"
---

Create a ServiceNow architecture/design document by extracting only the architecture and design aspects.

Input:

`${input:raw_input:Paste requirements, architecture notes, process notes, catalog notes, integration notes, or existing HLD path}`

Ignore or compress non-architecture material such as long business justification, generic success-factor prose, generic appendix text, and non-design filler. Keep only brief context where it affects architecture decisions.

Use:

- `templates/enterprise/servicenow-architecture-design.md`

Write:

- `architecture/working-draft/<solution-slug>.servicenow-architecture-design.md`

Include ServiceNow target architecture, modules/capabilities, scoped app design, system diagram, current/future process architecture, catalog item design, field/variable design, request lifecycle, data/reference architecture, custom tables, integrations/API contract summary, security/access/secret handling, roles/personas, notifications, reporting, error handling, architecture decisions, assumptions, constraints, dependencies, risks, open questions, and architecture review/freeze checklist.

Do not invent iTAP IDs, table names, roles, catalog fields, approval rules, endpoints, auth methods, data sources, or SLAs. Mark unconfirmed items as assumptions or open questions.
