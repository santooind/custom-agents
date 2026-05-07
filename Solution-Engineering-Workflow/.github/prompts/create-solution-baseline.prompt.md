---
name: create-solution-baseline
description: "Create the final solution baseline after review and explicit approval."
agent: "Final Solution Baseline Manager"
argument-hint: "[solution artifact folder]"
---

Assess final solution baseline readiness for:

`${input:artifact_folder:Path to solution artifact folder or workspace}`

Check requirements, architecture, AID, ServiceNow design, data model, ERDs, reviews, questions, decisions, risks, and approvals.

Ask for explicit approval before creating:

- `workspace/04-baseline/<solution-slug>.solution-baseline.md`
