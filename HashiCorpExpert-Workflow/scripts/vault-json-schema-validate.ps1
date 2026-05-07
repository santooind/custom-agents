param(
    [Parameter(Mandatory = $true)][string]$JsonFile,
    [string]$Type = "generic"
)

if (-not (Test-Path $JsonFile)) {
    Write-Host "JSON validation: $JsonFile not present; skipping."
    exit 0
}

try {
    $data = Get-Content -Raw -Path $JsonFile | ConvertFrom-Json
} catch {
    Write-Host "Invalid JSON: $JsonFile: $($_.Exception.Message)"
    exit 1
}

switch ($Type) {
    "discovery" {
        $required = @("schema_version", "generated_at", "application", "repository", "technology_stack", "deployment_model", "secret_inventory", "risk_findings", "code_change_impact_matrix", "recommended_vault_pattern", "effort_estimation", "migration_complexity_score", "evidence")
    }
    "migration" {
        $required = @("schema_version", "generated_at", "agent", "inputs_reviewed", "executive_summary", "selected_vault_pattern", "migration_scope", "secret_mapping_plan", "code_change_plan", "infrastructure_change_plan", "cicd_change_plan", "implementation_sequence", "minimum_test_plan", "rollback_plan", "cutover_plan", "risk_register", "open_questions", "implementation_readiness", "safety")
    }
    "implementation" {
        $required = @("schema_version", "generated_at", "agent", "mode", "inputs_reviewed", "approval_and_scope", "selected_pattern", "skills_applied", "files_changed", "secret_safety_controls", "validation_performed", "next_steps")
    }
    default {
        $required = @("schema_version")
    }
}

$props = $data.PSObject.Properties.Name
$missing = @()
foreach ($key in $required) {
    if ($props -notcontains $key) {
        $missing += $key
    }
}

if ($missing.Count -gt 0) {
    Write-Host "JSON validation failed for $JsonFile. Missing keys: $($missing -join ', ')"
    exit 1
}

Write-Host "JSON validation passed: $JsonFile"

