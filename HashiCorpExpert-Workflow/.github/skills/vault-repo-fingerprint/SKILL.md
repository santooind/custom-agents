---
name: vault-repo-fingerprint
description: "Fingerprint repository type, languages, frameworks, runtimes, build tools, package managers, deployment indicators, infrastructure model, and monorepo shape."
argument-hint: "[target repository path]"
---

# Vault Repo Fingerprint

## Applicability

Always run first.

## Scan Procedure

1. Identify root shape: single app, monorepo, partial repo, generated export, legacy source dump, or unknown.
2. Detect language evidence from file types and manifests:
   - Java/JVM: `.java`, `.kt`, `pom.xml`, `build.gradle`, `WEB-INF`, `web.xml`, WAR/EAR indicators.
   - Node.js: `package.json`, `.js`, `.ts`, lockfiles.
   - Python: `.py`, `requirements.txt`, `pyproject.toml`, Pipfile.
   - .NET: `.csproj`, `.sln`, `.cs`, `appsettings.json`, `web.config`.
3. Detect frameworks without assuming versions:
   - Spring Boot, Spring Framework, Spring XML, Java EE, Struts, Hibernate.
   - Express, NestJS, Next.js.
   - Django, Flask, FastAPI, Celery.
   - ASP.NET, ASP.NET Core.
4. Detect build tools and package managers:
   - Maven, Gradle, npm, yarn, pnpm, pip, Poetry, NuGet, MSBuild.
5. Detect deployment and infrastructure indicators:
   - Kubernetes, OpenShift, Helm, Docker, Docker Compose, VM/app-server, serverless, Terraform, CI/CD platform.
6. Record confidence and evidence for each detected item.

## Output

Return normalized facts:

- `languages`
- `frameworks`
- `runtime`
- `build_tools`
- `package_managers`
- `deployment_models`
- `infrastructure_models`
- `monorepo_indicators`
- `partial_repository_indicators`

## Safety

Do not inspect binary artifacts beyond metadata. Do not extract packaged archives unless the user explicitly approves.

