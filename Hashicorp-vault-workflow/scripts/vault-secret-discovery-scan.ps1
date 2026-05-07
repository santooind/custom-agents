[CmdletBinding()]
param(
    [string]$Target = "."
)

$ErrorActionPreference = "Stop"

if (-not (Test-Path -LiteralPath $Target)) {
    Write-Error "Target not found: $Target"
    exit 2
}

if (-not (Get-Command rg -ErrorAction SilentlyContinue)) {
    Write-Error "This scanner requires ripgrep (rg) for safe, scoped discovery."
    exit 2
}

function Redact-Output {
    process {
        $_ `
            -replace "((?:[A-Za-z0-9_.-]*(?:password|passwd|pwd|token|secret|api[_-]?key|private[_-]?key|DATABASE_URL|connectionString)[A-Za-z0-9_.-]*)\s*[:=]\s*)\S+", '$1<redacted>' `
            -replace "((?:Authorization|Proxy-Authorization):\s*(?:Bearer|Basic)\s+)\S+", '$1<redacted>'
    }
}

Write-Output "Vault discovery scan target: $Target"
Write-Output ""

Write-Output "== Stack indicators =="
& rg --files $Target 2>$null |
    & rg '(^|/)(package.json|pom.xml|build.gradle|requirements.txt|pyproject.toml|go.mod|Cargo.toml|Gemfile|composer.json|Dockerfile|docker-compose.*|Chart.yaml|values.yaml|main.tf|terragrunt.hcl|Jenkinsfile|azure-pipelines.*|.*gitlab-ci.*|.*github/workflows/.*)$' 2>$null
Write-Output ""

Write-Output "== Secret handling indicators (values redacted; inspect paths and keys only) =="
& rg -n --hidden `
    --glob '!**/.git/**' `
    --glob '!**/node_modules/**' `
    --glob '!**/vendor/**' `
    --glob '!**/dist/**' `
    --glob '!**/build/**' `
    'dotenv|VAULT_ADDR|VAULT_TOKEN|vault|AWS_SECRET_ACCESS_KEY|AZURE_CLIENT_SECRET|GOOGLE_APPLICATION_CREDENTIALS|DATABASE_URL|SPRING_DATASOURCE|connectionString|password|passwd|api[_-]?key|secret|private[_-]?key|token' `
    $Target 2>$null | Redact-Output
Write-Output ""

Write-Output "== Terraform Vault boundary indicators =="
& rg -n --hidden `
    --glob '!**/.git/**' `
    --glob '!**/node_modules/**' `
    --glob '!**/vendor/**' `
    --glob '!**/dist/**' `
    --glob '!**/build/**' `
    'vault_(kv_secret|generic_secret)|data\s+"vault_|nonsensitive\(|sensitive\s*=' `
    $Target 2>$null | Redact-Output
Write-Output ""

Write-Output "Discovery scan completed. Do not copy live secret values into documents."
