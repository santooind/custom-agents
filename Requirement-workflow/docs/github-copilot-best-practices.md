# GitHub Copilot Customization Best Practices

Use the smallest customization that solves the problem.

## What Goes Where

| Need | Use | Location |
|---|---|---|
| Always-on repository rules | Custom instructions | `.github/copilot-instructions.md` |
| File or domain-specific rules | Instruction files | `.github/instructions/*.instructions.md` |
| Repeatable one-shot command | Prompt file | `.github/prompts/*.prompt.md` |
| Persistent role or persona | Custom agent | `.github/agents/*.agent.md` |
| Portable capability with procedure, examples, scripts | Agent Skill | `.github/skills/<skill-name>/SKILL.md` |
| Deterministic automation | Hook | `.github/hooks/*.json` plus `scripts/` |
| Cross-agent shared rules | AGENTS.md | `AGENTS.md` |

## Agent Design

- Give each agent one job.
- Give orchestrator agents access to specialist subagents.
- Keep critic and reviewer agents independent from drafting agents.
- Let handoffs guide the user between phases instead of hiding all review steps.
- Use read-only tools for pure review agents when the environment supports the exact tool names you need.

## Requirement Workflow Design

- Draft first, then critique.
- Critique before freeze, not after implementation starts.
- Convert every major gap into a user-answerable question.
- Treat security, data, compliance, analytics, support, and rollout as requirement topics, not late engineering details.
- Keep acceptance criteria tied to requirement IDs.

## Hook Design

- Hooks should do deterministic work only: audit, validate, format, block clearly unsafe actions.
- Keep hook scripts short and readable.
- Log enough to debug agent workflow behavior, but do not log secrets or sensitive raw requirement content.
- Prefer validation scripts that can also run manually.

## Freeze Policy

Do not freeze a requirement when:

- a business decision is missing,
- a user promise is ambiguous,
- security or data handling is unclear,
- acceptance criteria cannot be tested,
- rollout or migration impact is unknown,
- a high-severity review finding is unresolved.

## Suggested GitHub Delivery Model

- Create one GitHub issue per requirement document.
- Use sub-issues or task lists for major `REQ-###` items.
- Add labels such as `requirements`, `needs-answer`, `ready-for-review`, `ready-to-freeze`, and `frozen`.
- Link pull requests back to requirement IDs and acceptance criteria IDs.
- Require checks for tests, lint, security, and documentation updates before merge.
