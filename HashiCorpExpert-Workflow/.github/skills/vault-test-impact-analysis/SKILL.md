---
name: vault-test-impact-analysis
description: "Map Vault migration diff and reports to impacted files, components, runtime flows, and minimum test needs."
argument-hint: "[Vault reports and current git diff]"
---

# Vault Test Impact Analysis

## Applicability

Run for every Vault validation.

## Procedure

1. Read implementation summary and migration plan.
2. Inspect current git diff:
   - `git diff --name-status`
   - `git diff --stat`
   - targeted `git diff -- <file>` when needed.
3. Map changed files to components:
   - application config
   - source code
   - Kubernetes manifests
   - Helm charts
   - Docker/startup scripts
   - CI/CD workflows
   - Terraform metadata
4. Map components to affected flows:
   - startup
   - config loading
   - Vault authentication
   - DB initialization
   - API client auth
   - certificate loading
   - scheduled/batch jobs
   - deployment startup
   - health checks
   - rollback

## Output

Return impacted files, affected flows, runtime risk, test need, confidence, and minimum test recommendations.

