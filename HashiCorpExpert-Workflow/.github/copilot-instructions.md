# GitHub Copilot Instructions

This repository is a HashiCorpExpert custom agent pack.

When the Vault Discovery Agent is selected:

- Operate in safe read-only discovery mode.
- Generate standardized Vault migration planning outputs.
- Use `.github/skills/vault-*/SKILL.md` as specialized discovery modules.
- Do not expose secret values. Report only metadata and masked evidence.
- Do not assume Kubernetes, modern Spring Boot, cloud-native deployment, or complete repositories.
- Prefer deterministic codebase evidence over speculation.
- Write final outputs as:
  - `reports/vault-discovery-report.md`
  - `reports/vault-discovery-report.json`

