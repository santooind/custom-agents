# HashiCorp Vault Workflow

This folder is a GitHub Copilot / Codex agent customization pack for discovering, planning, implementing, testing, operating, and releasing HashiCorp Vault integration in an existing application codebase.

It is designed for migration work where an application already has some secret handling pattern, such as `.env` files, framework config, Kubernetes secrets, CI variables, cloud secret managers, hardcoded credentials, or Terraform-managed values, and the team wants a safe Vault-backed design.

## Enterprise Workflow Modes

Use the smallest mode that is safe:

| Mode | Use When | Agents |
|---|---|---|
| `Light` | Metadata-only discovery or low-risk internal assessment | Discovery, Question Curator, Challenger |
| `Standard` | Normal application Vault adoption planning | Discovery, Challenger, Identity/Policy, Lifecycle, Platform Integration, Testing |
| `Enterprise Release` | Production rollout, regulated data, privileged access, client-facing commitment, cross-team migration, or release approval | Full enterprise Vault agent set |
| `Auto` | Unsure | Orchestrator chooses and explains why |

Run:

```text
/enterprise-vault-workflow
```

Shortcut prompts:

```text
/light-vault-workflow
/standard-vault-workflow
/vault-release-readiness
```

The enterprise workflow writes to:

- `vault/discovery/`
- `vault/design/`
- `vault/policies/`
- `vault/implementation/`
- `vault/tests/`
- `vault/questions/`
- `vault/reviews/`
- `vault/operations/`
- `vault/release/`
- `vault/frozen/` only after explicit approval.

See [enterprise-vault-workflow.md](docs/enterprise-vault-workflow.md) for modes, handoffs, file ownership, and release readiness rules.

## Multi-Agent Workflow

1. `Vault Workflow Orchestrator` coordinates the end-to-end adoption workflow and owns final readiness.
2. `Vault Discovery Architect` analyzes the target codebase, extracts the tech stack, maps current secret handling, chooses the best Vault integration pattern, and creates the discovery document.
3. `Vault Implementation Agent` applies the approved design by changing application code, configuration, deployment manifests, CI/CD, and runbooks.
4. `Vault Test Automation Agent` creates a test case document and deterministic automation scripts for local, CI, and deployment validation.

The original workflow remains available through:

```text
/vault-workflow
```

## Main Outputs

The workflow creates or updates:

- `docs/vault/<app-name>.discovery.md`
- `docs/vault/<app-name>.implementation-plan.md`
- `docs/vault/<app-name>.test-cases.md`
- `scripts/vault/<app-name>-vault-validation.sh`
- `scripts/vault/<app-name>-vault-validation.ps1`

## Use In VS Code With GitHub Copilot

Open `Hashicorp-vault-workflow` as the workspace root, or copy this folder's `.github`, `.vscode`, `.mcp`, `AGENTS.md`, `mcp`, `scripts`, and `templates` folders into the target repository.

Run:

```text
/vault-workflow
```

or:

```text
Use the Vault Workflow Orchestrator. Target codebase: <path>. Goal: <Vault migration goal>
```

## Safety Rules

- Do not print, copy, commit, or persist live secret values.
- Prefer metadata-only discovery. Redact any accidental secret-like values.
- Terraform may configure Vault infrastructure, policies, auth methods, namespaces, and mounts, but must not manage long-lived static secret payloads.
- Application code should retrieve secrets at runtime through the least risky pattern for the platform: Vault Agent injection, CSI driver, Kubernetes auth, AppRole, JWT/OIDC auth, cloud IAM auth, or SDK access only when runtime injection is not practical.
- CI/CD should use short-lived identity-based authentication where possible.

## Design Best Practice

This pack uses a hybrid design:

- Agents carry role, safety rules, decision logic, and handoff expectations.
- Skills stay compact and procedural.
- Templates enforce the required architecture, implementation, and test evidence.
- Scripts and hooks enforce repeatable checks such as secret-boundary scans and document linting.

This split keeps the agents strong enough for security-sensitive Vault work without turning every file into a duplicated manual.

## Included MCP Examples

MCP examples live in:

- `.mcp/mcp.json`
- `mcp/README.md`
- `mcp/vault-readonly.example.json`
- `mcp/repo-discovery.example.json`

They are intentionally placeholders. Do not commit Vault root tokens, live client tokens, production AppRole secret IDs, or credential-bearing URLs.

## Folder Map

- `.github/agents`: persistent role agents.
- `.github/prompts`: reusable slash-command prompts.
- `.github/instructions`: file-scoped documentation and implementation rules.
- `.github/skills`: reusable Vault discovery, implementation, and testing procedures.
- `.github/hooks`: lifecycle hook configuration.
- `templates`: standard output templates.
- `scripts`: deterministic scanners, linters, and hook helpers.
- `examples`: sample raw input.
- `mcp`: MCP setup notes and examples.

## Windows Support

The workflow includes both Bash and PowerShell automation:

- macOS/Linux/WSL/Git Bash: use `*.sh` scripts.
- Windows PowerShell/PowerShell 7: use `*.ps1` scripts.

The PowerShell scripts require `rg` / ripgrep for the discovery scan and boundary lint. The app-specific validation template can fall back to PowerShell search for basic checks, but ripgrep is still recommended for consistency.
