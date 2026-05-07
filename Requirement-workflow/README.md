# Requirement Workflow

This folder is a GitHub Copilot/Codex customization pack for turning rough `raw_input` into reviewed, traceable, implementation-ready enterprise requirement documents.

It includes two levels:

- **Enterprise workflow**: production-grade requirement engineering with specialist agents, traceability, reviews, and freeze governance.
- **Simple workflow**: lighter draft/review/open-question flow kept for smaller requests.

The enterprise workflow is designed around these agents:

1. `Enterprise Requirement Orchestrator`
2. `Enterprise Requirement Analyst`
3. `Question Curator`
4. `Requirement Challenger`
5. `Business Rule Analyst`
6. `Integration Analyst`
7. `Security Privacy Reviewer`
8. `Data Reporting Analyst`
9. `Acceptance Criteria QA Analyst`
10. `Operational Readiness Reviewer`
11. `Traceability Matrix Agent`
12. `Executive Summary Writer`
13. `Final Requirement Freezer`

## Use In VS Code With GitHub Copilot

Open `Requirement-workflow` as the workspace root, or copy the `.github`, `.vscode`, `AGENTS.md`, `scripts`, and `templates` folders into the root of your target repository.

Then use the enterprise prompt in Copilot Chat:

```text
/enterprise-requirement-workflow
```

or in Codex:

```text
Use the Enterprise Requirement Orchestrator.

Raw input is in requirements/raw-input/client-notes.md.
Create a complete enterprise requirement package.
Run analyst, challenger, specialist reviews, question curation, traceability, and freeze readiness.
Do not freeze until I explicitly approve.
```

For the smaller workflow, use:

```text
/requirement-workflow
```

or:

```text
Use the Requirement Orchestrator agent. Raw input: <paste your requirement idea>
```

The enterprise workflow produces:

- `requirements/working-draft/<feature-slug>.requirements.md`
- `requirements/questions/<feature-slug>.open-questions.md`
- `requirements/reviews/<feature-slug>.*-review.md`
- `requirements/traceability/<feature-slug>.traceability.md`
- `requirements/change-log/<feature-slug>.change-log.md`
- `requirements/frozen/<feature-slug>.requirements.v1.0.md` only after explicit freeze approval.

## Workflow Modes

Use the smallest mode that is safe:

| Mode | Use When | Agents |
|---|---|---|
| `Light` | Small/internal feature, low risk, no formal freeze | Analyst, Question Curator, Challenger, QA |
| `Standard` | Normal product/client requirement | Analyst, Challenger, Business Rules, Integration, Data/Reporting, QA, Traceability |
| `Enterprise Freeze` | High-risk, contractual, regulated, security/privacy-sensitive, production-critical, or formal baseline | Full enterprise agent set |
| `Auto` | Unsure | Orchestrator chooses and explains why |

Shortcut prompts:

```text
/light-requirement-workflow
/standard-requirement-workflow
/enterprise-requirement-workflow
/freeze-requirement
```

**Why?** The full workflow remains available, but small work does not need to pay the full process cost.

## Recommended VS Code Settings

The included `.vscode/settings.json` enables discovery for instructions, prompt files, custom agents, agent skills, `AGENTS.md`, and custom agent hooks where supported.

Some features are preview or experimental in GitHub Copilot and VS Code. If a feature does not appear, open the Chat Customizations editor from the command palette and verify that agents, skills, prompt files, hooks, and parent repository discovery are enabled.

## Folder Map

- `.github/agents`: persistent Copilot custom agents for each role.
- `.github/prompts`: slash-command prompts for full workflow and review-only runs.
- `.github/instructions`: file-scoped instructions for requirement documents.
- `.github/skills`: reusable Agent Skills for analysis, critique, and Copilot setup.
- `.github/hooks`: workspace hooks for requirement workflow auditing.
- `templates`: standard document templates.
- `scripts`: deterministic helpers used by hooks and manual validation.
- `examples`: sample raw input you can use to test the workflow.
- `requirements`: enterprise requirement workspace lanes for raw input, drafts, questions, reviews, traceability, baselines, and frozen versions.

See [enterprise-workflow.md](docs/enterprise-workflow.md) for the full handoff model, file ownership, naming conventions, version history, and freeze rules.

## Requirement Freeze Rule

A requirement is not ready to freeze until:

- all `Decision Required` questions are answered,
- high-severity gaps are resolved,
- acceptance criteria are testable,
- out-of-scope items are explicit,
- assumptions are either confirmed or moved to open questions,
- the architect has checked dependencies, constraints, and rollout impact.

Enterprise freeze also requires specialist review for business rules, integrations, security/privacy, data/reporting, QA acceptance criteria, traceability, operations, and approval evidence.

Sources used while creating this pack:

- GitHub Docs: repository custom instructions, prompt files, and `AGENTS.md` support.
- VS Code Docs: custom agents, Agent Skills, and hooks.
