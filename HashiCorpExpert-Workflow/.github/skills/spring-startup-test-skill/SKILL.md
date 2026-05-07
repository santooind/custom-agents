---
name: spring-startup-test-skill
description: "Define validation for Java/Spring startup, config loading, datasource initialization, @Value, Spring XML, and bean lifecycle risks."
argument-hint: "[migration plan, implementation summary, Java/Spring files]"
---

# Spring Startup Test Skill

## Applicability

Use when Java/Spring config, startup, datasource, or bean initialization is impacted.

## Test Focus

- Spring context starts
- `application.yml/properties` binding still resolves
- `bootstrap.yml` behavior if present
- `@Value` placeholders resolve
- Spring XML property placeholders resolve
- datasource bean initializes
- missing Vault-rendered file fails safely

## Safe Automated Checks

- `mvn -q test`
- `./gradlew test`
- targeted Spring context test when present

## Manual Validation Required

- [ ] Application starts in lower environment.
- [ ] No unresolved placeholders.
- [ ] Datasource initializes.
- [ ] Health endpoint reports ready.

