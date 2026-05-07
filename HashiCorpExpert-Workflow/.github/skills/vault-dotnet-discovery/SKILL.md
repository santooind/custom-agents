---
name: vault-dotnet-discovery
description: "Discover .NET configuration, appsettings, web.config, Key Vault, database, and auth patterns."
argument-hint: "[target repository path]"
---

# Vault Dotnet Discovery

## Applicability

Run when repository evidence includes `.cs`, `.csproj`, `.sln`, `appsettings.json`, `web.config`, ASP.NET, ASP.NET Core, or dotnet build files.

## Scan Procedure

1. Detect framework:
   - ASP.NET Framework
   - ASP.NET Core
   - worker service
   - console/batch app
2. Detect configuration access:
   - `IConfiguration`
   - `ConfigurationManager`
   - `GetConnectionString`
   - `Environment.GetEnvironmentVariable`
3. Detect providers:
   - Azure Key Vault
   - VaultSharp
   - AWS Secrets Manager
4. Detect database and auth:
   - Entity Framework
   - ADO.NET
   - connection strings
   - LDAP/AD
   - certificates
5. Flag risks:
   - appsettings secret keys
   - web.config transforms
   - startup-only config binding

## Output

Return normalized findings with masked evidence.

