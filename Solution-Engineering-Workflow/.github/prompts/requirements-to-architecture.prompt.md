---
name: requirements-to-architecture
description: "Start architecture work from a frozen requirement baseline and additional architecture inputs."
agent: "Enterprise Solution Engineering Orchestrator"
argument-hint: "[frozen requirement path] [architecture input]"
---

Run `Architecture` mode.

Frozen requirement baseline:

`${input:requirements:Path to frozen or approved requirement document}`

Architecture inputs:

`${input:architecture_inputs:Paste tech stack, design principles, constraints, architecture notes, decisions, or file paths}`

Produce:

- architecture input pack
- enterprise architecture
- AID where interfaces are in scope
- ServiceNow architecture/design where ServiceNow is in scope
- ServiceNow data model and ERDs where ServiceNow implementation design is needed
- architecture review artifacts

Do not create final baseline until I explicitly approve.
