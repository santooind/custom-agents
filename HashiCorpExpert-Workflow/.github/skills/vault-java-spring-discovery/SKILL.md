---
name: vault-java-spring-discovery
description: "Discover Java, Spring, Spring Boot, Java EE, XML configuration, datasource, and legacy secret handling patterns."
argument-hint: "[target repository path]"
---

# Vault Java Spring Discovery

## Applicability

Run when repository evidence includes Java/JVM files, Maven, Gradle, Spring, Java EE, Struts, servlet descriptors, XML config, WAR/EAR packaging, or JDBC.

## Scan Procedure

1. Detect framework and version evidence from:
   - `pom.xml`
   - `build.gradle`
   - `application.properties`
   - `application.yml`
   - `bootstrap.properties`
   - `web.xml`
   - Spring XML files
2. Detect configuration loading:
   - `@Value`
   - `Environment`
   - `PropertyPlaceholderConfigurer`
   - `context:property-placeholder`
   - externalized config locations
3. Detect runtime model:
   - embedded Spring Boot
   - servlet container
   - Java EE app server
   - batch process
   - scheduled job
4. Detect datasource patterns:
   - JDBC URLs
   - JNDI
   - HikariCP, Tomcat JDBC, DBCP, C3P0
   - Hibernate/JPA
   - dynamic routing datasource
   - multi-tenant datasource
5. Detect current Vault or cloud secret library usage:
   - `spring-cloud-vault`
   - Vault Java Driver
   - AWS Secrets Manager
   - Azure Key Vault
   - GCP Secret Manager

## Risk Notes

Flag:

- Spring XML property placeholder complexity
- startup-only config loading
- datasource pool rotation limitations
- legacy app-server ownership of secrets
- encrypted properties requiring decryption utility migration

## Output

Return findings under:

- `technology-stack`
- `secret-handling`
- `database`
- `deployment-architecture`
- `operational-risk`

