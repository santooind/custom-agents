param(
    [string]$Root = "."
)

$Reports = Join-Path $Root "reports"
if (-not (Test-Path $Reports)) {
    Write-Host "Vault artifact check: reports directory not present; nothing to validate yet."
    exit 0
}

function Test-AnyFile {
    param([string[]]$Paths)
    foreach ($Path in $Paths) {
        if (Test-Path $Path) { return $true }
    }
    return $false
}

$missing = $false

$DiscoveryMd = Join-Path $Reports "vault-discovery-report.md"
$DiscoveryJson = Join-Path $Reports "vault-discovery-report.json"
$Pattern = Join-Path $Reports "vault-pattern-decision.md"
$MigrationMd = Join-Path $Reports "vault-migration-plan.md"
$MigrationJson = Join-Path $Reports "vault-migration-plan.json"
$ImplementationMd = Join-Path $Reports "vault-implementation-summary.md"
$ImplementationJson = Join-Path $Reports "vault-implementation-summary.json"

if (Test-Path $Pattern) {
    if (-not (Test-AnyFile @($DiscoveryMd, $DiscoveryJson))) {
        Write-Host "Pattern decision exists but discovery report is missing."
        $missing = $true
    }
}

if ((Test-Path $MigrationMd) -or (Test-Path $MigrationJson)) {
    if (-not (Test-AnyFile @($DiscoveryMd, $DiscoveryJson))) {
        Write-Host "Migration plan exists but discovery report is missing."
        $missing = $true
    }
    if (-not (Test-Path $Pattern)) {
        Write-Host "Migration plan exists but pattern decision is missing."
        $missing = $true
    }
}

if ((Test-Path $ImplementationMd) -or (Test-Path $ImplementationJson)) {
    if (-not (Test-AnyFile @($DiscoveryMd, $DiscoveryJson))) {
        Write-Host "Implementation summary exists but discovery report is missing."
        $missing = $true
    }
    if (-not (Test-Path $Pattern)) {
        Write-Host "Implementation summary exists but pattern decision is missing."
        $missing = $true
    }
    if (-not (Test-AnyFile @($MigrationMd, $MigrationJson))) {
        Write-Host "Implementation summary exists but migration plan is missing."
        $missing = $true
    }
}

if ($missing) {
    Write-Host "Vault agentic artifact check failed."
    exit 1
}

Write-Host "Vault agentic artifact check passed."

