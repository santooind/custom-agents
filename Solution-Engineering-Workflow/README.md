# Solution Engineering Workflow

This is the single front door for AI-first enterprise solution design.

It combines requirement engineering and architecture/design work into one phase-gated workflow:

```text
Raw input
  -> requirement draft
  -> requirement review and freeze
  -> architecture input enrichment
  -> enterprise architecture
  -> AID
  -> ServiceNow architecture/design
  -> ServiceNow data model and ERDs
  -> executive architecture review
  -> final solution baseline
```

## Main Prompt

Use:

```text
/solution-engineering-workflow
```

or:

```text
Use the Enterprise Solution Engineering Orchestrator.
Input is in workspace/00-intake/raw-input.md.
Run the workflow in Auto mode.
Do not freeze requirements or solution baseline until I explicitly approve.
```

## Modes

| Mode | Use When |
|---|---|
| `Discovery` | Raw input is unclear and needs classification/questioning first. |
| `Requirement` | Need requirement document, review, open questions, and requirement freeze readiness. |
| `Architecture` | Requirement is already stable/frozen and architecture/design is needed. |
| `Full` | Need end-to-end requirement-to-architecture-to-baseline workflow. |
| `Review` | Need critique, cross-document consistency, executive review, or gap analysis. |
| `Auto` | Let the orchestrator choose the smallest safe path. |

## Key Rule

Architecture work should consume a frozen or explicitly approved requirement baseline. If architecture reveals requirement gaps, send questions back to the requirement phase instead of silently changing scope.

## Outputs

- `workspace/01-requirements/working-draft/*.requirements.md`
- `workspace/01-requirements/questions/*.open-questions.md`
- `workspace/01-requirements/frozen/*.requirements.v*.md`
- `workspace/02-architecture/working-draft/*.architecture.md`
- `workspace/02-architecture/interface-docs/*.aid*.md`
- `workspace/02-architecture/servicenow/*.servicenow-architecture-design.md`
- `workspace/02-architecture/data-model/*.servicenow-data-model.md`
- `workspace/02-architecture/diagrams/*.servicenow-erd.md`
- `workspace/03-review/*.executive-architecture-review.md`
- `workspace/04-baseline/*.solution-baseline.md`

## Why This Exists

Separate requirement and architecture folders are useful, but real projects move through both. This workflow gives you one operating system for the full lifecycle while keeping specialist agents modular.
