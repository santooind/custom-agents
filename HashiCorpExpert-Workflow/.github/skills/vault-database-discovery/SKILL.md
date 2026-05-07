---
name: vault-database-discovery
description: "Discover database connectivity, connection pools, ORM, dynamic datasource, and rotation implications."
argument-hint: "[target repository path]"
---

# Vault Database Discovery

## Applicability

Always run a lightweight check. Deepen when database evidence exists.

## Scan Procedure

Detect:

- JDBC URLs
- connection strings
- datasource beans
- JNDI datasources
- HikariCP, Tomcat JDBC, DBCP, C3P0
- Hibernate, JPA, MyBatis
- Entity Framework
- SQLAlchemy, Django ORM
- multi-tenant datasource
- routing datasource
- read/write split

## Risk Analysis

Flag:

- startup-only datasource initialization
- long-lived connection pools
- rotation without pool eviction
- hardcoded fallback credentials
- dynamic tenant databases
- app-server managed datasource ownership

## Recommendation Signals

- Dynamic database secrets are preferred when database engine support, application pooling, and rotation operations are mature.
- Static KV may be interim when legacy pooling or operational windows block dynamic secrets.

