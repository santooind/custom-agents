---
name: enterprise-requirement-workflow
description: "Run the mode-aware requirement workflow from raw input through the right level of review."
agent: "Enterprise Requirement Orchestrator"
argument-hint: "[Auto | Light | Standard | Enterprise Freeze] [raw input text or source file path]"
---

Run the requirement workflow using the requested mode.

Mode:

`${input:mode:Auto}`

Input:

`${input:raw_input:Paste raw notes, client email, transcript summary, architecture notes, API notes, security constraints, or existing draft path}`

Mode rules:

- `Auto`: choose the smallest safe mode and explain why.
- `Light`: use Analyst, Question Curator, Challenger, and QA only.
- `Standard`: use Analyst, Challenger, Business Rules, Integration, Data/Reporting, QA, and Traceability.
- `Enterprise Freeze`: use the full enterprise agent set, including Security/Privacy, Operations, Executive Summary, and Final Freezer.

Create or update only the artifacts required by the selected mode:

- `requirements/working-draft/<feature-slug>.requirements.md`
- `requirements/questions/<feature-slug>.open-questions.md`
- `requirements/reviews/<feature-slug>.challenge-review.md`
- specialist review files when required
- `requirements/traceability/<feature-slug>.traceability.md` when required
- `requirements/change-log/<feature-slug>.change-log.md`

Do not freeze the requirement until I explicitly approve.
