# Architecture Workflow

This folder is a GitHub Copilot/Codex customization pack for creating enterprise architecture documents, architecture interface documents, ADRs, specialist reviews, traceability, and architecture freeze baselines.

It supports two layers:

- **Enterprise architecture workflow**: mode-aware architecture work for general solution architecture.
- **ServiceNow/Terraform/Vault workflow**: domain-specific architecture for SNOW, Terraform, and HashiCorp Vault integrations.

## Enterprise Workflow Modes

Use the smallest mode that is safe:

| Mode | Use When | Agents |
|---|---|---|
| `Light` | Small/internal design, low risk, no formal approval | Solution Architect, Question Curator, Challenger, ADR Agent |
| `Standard` | Normal product/client architecture | Solution Architect, Challenger, Domain, Integration, Data, Platform/DevOps, Ops, ADR, Traceability |
| `Enterprise Freeze` | High-risk, regulated, security/privacy-sensitive, production-critical, cost-sensitive, contractual, or formal baseline | Full enterprise architecture set plus relevant vendor specialists |
| `Auto` | Unsure | Orchestrator chooses and explains why |

Run:

```text
/enterprise-architecture-workflow
```

Shortcut prompts:

```text
/light-architecture-workflow
/standard-architecture-workflow
/freeze-architecture
```

The enterprise workflow writes to:

- `architecture/working-draft/`
- `architecture/questions/`
- `architecture/reviews/`
- `architecture/interface-docs/`
- `architecture/decisions/`
- `architecture/traceability/`
- `architecture/frozen/` only after explicit approval.

See [enterprise-architecture-workflow.md](docs/enterprise-architecture-workflow.md) for the full mode, handoff, file ownership, and freeze model.

## ServiceNow / Terraform / Vault Workflow

The workflow is designed for architectures where:

- ServiceNow is the service management and request/governance system.
- Terraform is the infrastructure provisioning and policy-as-code execution layer.
- Vault is the secrets management system.
- Static secret values are stored and operated through Vault workflows, not Terraform, to avoid sensitive values entering Terraform state or plan files.

## Domain Multi-Agent Workflow

1. `Architecture Orchestrator` coordinates all specialists and produces the final document package.
2. `ServiceNow Architect Agent` defines SNOW catalog, workflow, approvals, integration, CMDB, audit, and operational architecture.
3. `Terraform Architect Agent` defines IaC modules, state, pipeline, provider, environment, and provisioning architecture.
4. `HashiCorp Vault Agent` defines secret engines, policies, auth methods, namespaces, audit, and static secret operating model.
5. `Architecture Critic Agent` reviews gaps, security risks, state leakage risk, unclear ownership, and operational failures.
6. `Architecture Question Curator` creates the final user-facing questions needed before architecture freeze.

## Main Outputs

The workflow creates or updates:

- `docs/architecture/<solution-name>.architecture.md`
- `docs/architecture/<solution-name>.snow-architecture.md`
- `docs/architecture/<solution-name>.aid-snow-terraform.md`
- `docs/architecture/<solution-name>.aid-snow-vault.md`
- `docs/architecture/<solution-name>.security-review.md`
- `docs/architecture/<solution-name>.open-questions.md`

## Use In VS Code With GitHub Copilot

Open `Architecture-workflow` as the workspace root, or copy this folder's `.github`, `.vscode`, `.mcp`, `AGENTS.md`, `mcp`, `scripts`, and `templates` folders into a target repository.

Run:

```text
/architecture-workflow
```

or:

```text
Use the Architecture Orchestrator agent. Raw input: <paste architecture goal>
```

## Security Rule

Terraform may manage Vault configuration such as mounts, policies, auth methods, namespaces, and metadata. Terraform must not create, read, or output long-lived static secret values. Static secret values must be entered through approved Vault operational workflows such as Vault UI, CLI, API, ServiceNow fulfillment action, or controlled break-glass runbook.

## Included MCP Configuration

This package includes MCP configuration templates in:

- `.mcp/mcp.json`
- `mcp/README.md`
- `mcp/servicenow-mcp.example.json`
- `mcp/vault-mcp.example.json`
- `mcp/terraform-mcp.example.json`

They are intentionally examples because MCP servers and credentials differ by organization. Do not commit live tokens, instance URLs with secrets, or Vault root tokens.

## Sources Reflected In This Pack

- HashiCorp Vault static secrets and programmatic management guidance.
- HashiCorp Terraform sensitive data and state guidance.
- ServiceNow IntegrationHub connection and credential alias guidance.
- VS Code and GitHub Copilot customization conventions for custom agents, prompts, instructions, skills, hooks, and `AGENTS.md`.
