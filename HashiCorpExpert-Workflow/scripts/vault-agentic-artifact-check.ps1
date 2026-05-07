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
$ValidationMd = Join-Path $Reports "vault-test-validation-report.md"
$ValidationJson = Join-Path $Reports "vault-test-validation-report.json"
$SecurityMd = Join-Path $Reports "vault-security-review.md"
$SecurityJson = Join-Path $Reports "vault-security-review.json"

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

if ((Test-Path $ValidationMd) -or (Test-Path $ValidationJson)) {
    if (-not (Test-AnyFile @($DiscoveryMd, $DiscoveryJson))) {
        Write-Host "Test validation report exists but discovery report is missing."
        $missing = $true
    }
    if (-not (Test-Path $Pattern)) {
        Write-Host "Test validation report exists but pattern decision is missing."
        $missing = $true
    }
    if (-not (Test-AnyFile @($MigrationMd, $MigrationJson))) {
        Write-Host "Test validation report exists but migration plan is missing."
        $missing = $true
    }
    if (-not (Test-AnyFile @($ImplementationMd, $ImplementationJson))) {
        Write-Host "Test validation report exists but implementation summary is missing."
        $missing = $true
    }
}

if ((Test-Path $SecurityMd) -or (Test-Path $SecurityJson)) {
    if (-not (Test-AnyFile @($DiscoveryMd, $DiscoveryJson))) {
        Write-Host "Security review exists but discovery report is missing."
        $missing = $true
    }
    if (-not (Test-Path $Pattern)) {
        Write-Host "Security review exists but pattern decision is missing."
        $missing = $true
    }
    if (-not (Test-AnyFile @($MigrationMd, $MigrationJson))) {
        Write-Host "Security review exists but migration plan is missing."
        $missing = $true
    }
    if (-not (Test-AnyFile @($ImplementationMd, $ImplementationJson))) {
        Write-Host "Security review exists but implementation summary is missing."
        $missing = $true
    }
    if (-not (Test-AnyFile @($ValidationMd, $ValidationJson))) {
        Write-Host "Security review exists but test validation report is missing."
        $missing = $true
    }
}

if ($missing) {
    Write-Host "Vault agentic artifact check failed."
    exit 1
}

Write-Host "Vault agentic artifact check passed."
