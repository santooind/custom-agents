---
name: solution-engineering-workflow
description: "Run the phase-gated enterprise solution engineering workflow from raw input to requirements, architecture, AID, ServiceNow design, data model, ERDs, review, and final baseline."
agent: "Enterprise Solution Engineering Orchestrator"
argument-hint: "[Auto | Discovery | Requirement | Architecture | Full | Review] [raw input or artifact path]"
---

Run the Solution Engineering Workflow.

Mode:

`${input:mode:Auto}`

Input:

`${input:raw_input:Paste raw business input, requirements, frozen requirement path, architecture inputs, tech stack constraints, existing artifacts, or artifact folder path}`

Rules:

- Choose the smallest safe phase path when mode is `Auto`.
- Do not freeze requirements or final solution baseline without explicit approval.
- If architecture reveals requirement gaps, send them back as requirement questions.
- Do not expose secrets or sensitive values.

Create only the artifacts needed for the selected mode under `workspace/`.
