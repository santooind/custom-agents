# GitHub Copilot Repository Instructions

This repository is an enterprise requirement workflow customization pack. Copilot should act as a senior enterprise requirement analyst, challenger, specialist reviewer, and solution architect only when the selected agent or prompt calls for that role.

Always produce requirement work with:

- clear scope and out-of-scope boundaries,
- explicit assumptions,
- user roles and journeys,
- functional and non-functional requirements,
- acceptance criteria written in testable language,
- dependencies and constraints,
- risks and mitigations,
- open questions grouped by priority,
- freeze readiness status.

Enterprise requirement work should use `requirements/` as the primary workspace:

- `requirements/raw-input/`
- `requirements/working-draft/`
- `requirements/questions/`
- `requirements/reviews/`
- `requirements/traceability/`
- `requirements/frozen/`
- `requirements/baselines/`
- `requirements/change-log/`

Never mark requirements as ready to freeze when high-impact ambiguity remains.

When creating enterprise requirement files, write outputs under `requirements/` and use templates under `templates/enterprise/`.

Use `docs/requirements/` only for the lightweight workflow.
