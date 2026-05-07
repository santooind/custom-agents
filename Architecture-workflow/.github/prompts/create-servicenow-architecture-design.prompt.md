---
name: create-servicenow-architecture-design
description: "Create a focused ServiceNow architecture/design document from a larger solution doc, requirements, or notes."
agent: "ServiceNow Architect Agent"
argument-hint: "[requirements, raw notes, existing HLD path, or solution doc path]"
---

Create a focused ServiceNow architecture/design document.

Input:

`${input:raw_input:Paste requirements, architecture notes, process notes, catalog notes, integration notes, existing HLD path, or solution doc path}`

Use:

- `templates/enterprise/servicenow-architecture-design.md`

Write:

- `architecture/working-draft/<solution-slug>.servicenow-architecture-design.md`

Extract only architecture and design content:

- target ServiceNow architecture
- modules/capabilities
- custom scoped app design
- system/context diagram
- current/future process architecture
- catalog items and field model
- request lifecycle and state model
- data/reference architecture
- custom tables
- integrations and API contract summary
- security, RBAC, ACLs, credential aliases, secret handling
- roles/personas
- notifications
- reporting/dashboards
- error handling/resilience
- architecture decisions
- assumptions, constraints, dependencies, risks, open questions
- architecture review and freeze checklist

Ignore or compress generic business prose, success-factor prose, appendix filler, and non-design content unless it affects an architecture decision.

Do not invent iTAP IDs, table names, roles, catalog fields, approval rules, endpoints, auth methods, data sources, or SLAs. Mark unconfirmed items as assumptions or open questions.
