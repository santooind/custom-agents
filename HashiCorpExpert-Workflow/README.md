# HashiCorpExpert Workflow

GitHub Copilot custom agent workflow pack for enterprise HashiCorp advisory work.

## Vault Discovery Agent

The initial workflow in this pack is the **Vault Discovery Agent**, a read-only discovery agent for generating standardized Vault migration planning reports across large enterprise application portfolios.

Invoke it with:

```text
/vault-discovery-agent
```

Primary files:

- `.github/agents/vault-discovery-agent.agent.md`
- `.github/prompts/vault-discovery-agent.prompt.md`
- `.github/skills/vault-*/SKILL.md`
- `.github/instructions/vault-discovery-report.instructions.md`
- `schemas/vault-discovery-report.schema.json`
- `docs/vault-discovery-agent-architecture.md`
- `examples/vault-discovery-report.md`
- `examples/vault-discovery-report.json`

The agent is intentionally metadata-only. It must not modify target application source code or expose secret values.

The generated report includes a `Code Change Impact Matrix` that identifies likely impacted files, components, current secret retrieval mechanisms, recommended Vault migration changes, complexity, runtime risk, testing impact, and confidence.
