---
name: vault-code-change-impact-analysis
description: "Identify likely code, configuration, infrastructure, CI/CD, and deployment files impacted by Vault migration, with confidence and testing/runtime risk."
argument-hint: "[normalized discovery findings and evidence]"
---

# Vault Code Change Impact Analysis

## Applicability

Run after discovery skills and before effort estimation, pattern recommendation, and report generation.

## Purpose

Translate discovery findings into a migration impact inventory. This skill does not change files. It identifies likely change locations, recommended replacement approaches, complexity, runtime risk, and testing impact.

## Per-Finding Impact Contract

For every finding, create one or more impact entries when evidence supports it.

Each entry must include:

- `area`
- `file_path`
- `component_or_module`
- `location_confidence`: `Exact`, `Probable`, or `Assumed`
- `secret_usage_purpose`
- `current_pattern`
- `current_retrieval_mechanism`
- `recommended_change`
- `replacement_approach`
- `modification_complexity`: `Low`, `Medium`, `High`, or `Critical`
- `runtime_impact_risk`: `Low`, `Medium`, `High`, or `Critical`
- `testing_impact`
- `backward_compatibility_concern`
- `confidence`
- `source_finding_ids`
- `evidence_ids`

## Areas

Classify entries as:

- `config-only`
- `code-level`
- `infrastructure`
- `cicd`
- `deployment-pipeline`
- `certificate`
- `database`
- `runtime`

## High-Confidence File Signals

Use exact files when evidence points directly to:

- `application.yml`
- `application.yaml`
- `application.properties`
- `bootstrap.yml`
- `bootstrap.yaml`
- `bootstrap.properties`
- Spring XML files
- files containing Spring `@Value`, `Environment`, or config binding evidence
- datasource config files or classes
- Kubernetes manifests containing `secretKeyRef`, `envFrom`, Secret volume mounts, or Vault annotations
- Helm `values.yaml`, `Chart.yaml`, or files under `templates/`
- `.tf`, `.tfvars`, or Terragrunt files with secret variables/resources
- `.github/workflows/*.yml`
- `Jenkinsfile`
- `.gitlab-ci.yml`
- `azure-pipelines.yml`
- `Dockerfile`
- `docker-compose.yml`
- entrypoint or startup scripts
- certificate, keystore, or truststore references

## Medium-Confidence Location Signals

Use probable locations when framework or convention strongly suggests impacted files but evidence is indirect:

- Spring Boot likely uses `src/main/resources/application.*`.
- Helm charts likely use `values*.yaml` and `templates/*`.
- Docker deployment likely uses Dockerfile and entrypoint scripts.
- CI secret references likely affect pipeline files and deployment jobs.
- JNDI datasources likely affect app-server configuration outside the repository.

Mark these as `Probable`.

## Low-Confidence Handling

When evidence is incomplete, mark entries as `Assumed` and create open questions. Do not overstate certainty.

## Current Retrieval Mechanism Examples

- hardcoded literal assignment
- environment variable lookup
- Spring property binding
- Spring `@Value`
- Spring XML property placeholder
- Kubernetes Secret env injection
- Kubernetes Secret volume mount
- Helm value substitution
- Terraform variable/resource
- CI/CD platform secret reference
- Docker build arg or environment variable
- JNDI datasource
- appsettings connection string
- certificate file load
- custom decryption utility

## Recommended Replacement Examples

- Vault Agent rendered config file
- Vault Agent Injector template
- Vault CSI mounted secret
- External Secrets Operator sync
- Vault SDK lookup with cache and lease handling
- AppRole-authenticated Vault Agent on VM
- Kubernetes Auth with service account role
- OIDC/JWT auth for CI/CD
- Vault dynamic database credentials
- Vault KV v2 static secret
- Vault PKI-issued certificate

## Impact Summary

Estimate:

- `likely_files_impacted`
- `likely_services_or_modules_impacted`
- `startup_runtime_impact_likelihood`
- `refactoring_likelihood`
- `backward_compatibility_concerns`

Use evidence-based counts where possible. Use ranges when uncertain, such as `3-6`.

## Migration Inventory

Group impacted work into:

- config-only changes
- code-level changes
- infrastructure changes
- CI/CD changes
- deployment pipeline changes

## Suggested Migration Sequence

Recommend a staged sequence:

1. Safe config-only changes first.
2. Low-risk static secret migrations.
3. CI/CD identity and secret flow cleanup.
4. Infrastructure and deployment integration.
5. Runtime-sensitive datasource, certificate, or refresh changes.
6. High-dependency modules and multi-tenant flows last.

Each sequence item must include:

- step number
- scope
- rationale
- dependencies
- confidence

## Potential Breaking Areas

Assess:

- startup bean initialization
- connection pool startup
- lazy initialization issues
- secret refresh timing
- token expiration handling
- Vault availability dependency
- Kubernetes auth failures
- certificate trust chain issues
- CI/CD variable name compatibility
- rollback to prior secret source

Each breaking-area item must include severity, likelihood, confidence, and test recommendation.

## Output

Return:

- code change impact matrix
- impact summary
- migration inventory
- suggested migration sequence
- potential breaking areas
- confidence scores
- assumptions and open questions
