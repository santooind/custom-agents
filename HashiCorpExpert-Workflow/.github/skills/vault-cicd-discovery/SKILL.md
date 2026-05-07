---
name: vault-cicd-discovery
description: "Discover CI/CD platforms, secret references, environment injection, and OIDC/JWT opportunities."
argument-hint: "[target repository path]"
---

# Vault CI/CD Discovery

## Applicability

Always run a lightweight check.

## Scan Procedure

Detect:

- GitHub Actions
- GitLab CI
- Jenkins
- Azure DevOps
- Bitbucket Pipelines
- CircleCI
- Argo CD
- Flux

Search for metadata-only references:

- `${{ secrets.* }}`
- Jenkins credentials binding
- GitLab protected variables
- Azure variable groups
- deployment tokens
- service principal usage
- registry credentials
- Terraform variables and backends

## Risks

Flag:

- secrets passed as build args
- secrets printed in shell scripts
- `.env` generation in pipeline
- Terraform secret payload variables
- CI logs that may echo environment

## Recommendation Signals

- Prefer OIDC/JWT auth from CI/CD to Vault.
- Avoid long-lived Vault tokens in CI variables.
- Avoid static secret payloads in Terraform state or plan files.

## Output

Return CI/CD impact, auth recommendation inputs, and masked evidence.

