---
name: vault-logging-risk-discovery
description: "Discover logging, diagnostics, exception handling, and environment dump risks that may expose secrets."
argument-hint: "[target repository path]"
---

# Vault Logging Risk Discovery

## Applicability

Always run a lightweight check.

## Scan Procedure

Search for:

- logging full configuration objects
- logging environment variables
- printing connection strings
- exception handlers that dump request headers
- debug flags
- shell `set -x`
- CI commands that echo variables
- HTTP interceptors logging authorization headers
- datasource or secret initialization logs

## Findings

Classify:

- `env-dump-risk`
- `credential-log-risk`
- `debug-log-risk`
- `ci-echo-risk`
- `header-log-risk`

## Recommendation Signals

Vault migration should include redaction tests when logging risk is medium or higher.

