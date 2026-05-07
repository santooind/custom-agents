---
name: enterprise-architecture-workflow
description: "Run the mode-aware enterprise architecture workflow from raw input through the right level of review, ADRs, traceability, and freeze readiness."
agent: "Enterprise Architecture Orchestrator"
argument-hint: "[Auto | Light | Standard | Enterprise Freeze] [raw input text or source file path]"
---

Run the architecture workflow using the requested mode.

Mode:

`${input:mode:Auto}`

Input:

`${input:raw_input:Paste raw architecture input, requirements path, client notes, platform notes, API notes, security constraints, operational assumptions, diagram text, or draft path}`

Mode rules:

- `Auto`: choose the smallest safe mode and explain why.
- `Light`: use Solution Architect, Question Curator, Challenger, and ADR Agent.
- `Standard`: use Solution Architect, Challenger, Application Domain, Integration, Data, Platform/DevOps, Resilience/Ops, ADR, and Traceability agents.
- `Enterprise Freeze`: use the full enterprise agent set, including Security/Privacy, Cost/Governance, Executive Summary, and Final Freezer.

Create only the artifacts required by the selected mode under `architecture/`.

Do not freeze the architecture until I explicitly approve.
