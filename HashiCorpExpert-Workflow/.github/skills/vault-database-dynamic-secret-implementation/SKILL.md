---
name: vault-database-dynamic-secret-implementation
description: "Implement approved dynamic database secret integration planning/configuration with rotation and connection pool safeguards."
argument-hint: "[approved migration plan, datasource files, and deployment config]"
---

# Vault Database Dynamic Secret Implementation

## Applicability

Use when Dynamic Database Secrets are selected for the migration phase.

## Approved Changes

May update approved files for:

- datasource configuration placeholders
- Vault Agent template paths for database credentials
- SDK lookup abstraction when SDK integration is selected
- tests for pool reconnect or restart behavior
- documentation of rotation and rollback behavior

## Do Not

- Do not add database usernames or passwords.
- Do not enable dynamic credentials if the migration plan marks them as later phase only.
- Do not assume connection pools can refresh credentials without tests.

## Implementation Guidance

- Treat rotation as runtime-sensitive.
- Preserve static credential fallback only during approved rollback window.
- Add tests or validation notes for pool eviction, reconnect, and restart.

