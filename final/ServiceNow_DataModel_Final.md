# Final ServiceNow Data Model: HashiCorp Vault Self-Service Portal

**Version:** 5.1 (Executive Architect Approved)  
**Date:** 1 April 2026  
**Status:** APPROVED  
**Design Philosophy:** A mature, native-first ServiceNow architecture that prioritizes long-term supportability, scalability, and adherence to platform best practices.

---

## 1. Executive Summary

This document presents the final, approved data model for the HashiCorp Vault Self-Service Portal. It is the result of reviewing the initial design (v3.2, 10 custom tables), the revised native-first proposal (v4.0, 5 custom tables), and then hardening the architecture through executive review into 6 custom tables.

The primary driver of this design is to **maximize the use of native ServiceNow platform capabilities** while retaining purpose-built custom tables where the platform genuinely cannot serve the requirement.

**Key Architectural Decisions:**
-   **No Custom Request Tables:** All onboarding and dynamic access requests are handled as native `sc_req_item` records, configured via Service Catalog variables. This eliminates `x_att2_vault_onboarding_request` and `x_att2_vault_dynamic_access_request`.
-   **No Custom Transaction Log:** Integration execution tracing is handled by IntegrationHub native logs. This eliminates `x_att2_vault_transaction_log`.
-   **Targeted Custom Audit Table:** Enterprise security demands a structured integration audit log for API-driven Vault events (e.g., `SECRET_ROTATE`). Native `sys_audit` cannot store Correlation IDs, event types, or KV versions in a queryable format. `x_att2_vault_audit_event` is retained.
-   **Consolidated Scope Model:** A single `x_att2_vault_scope` table replaces the separate `x_att2_vault_application` and `x_att2_vault_sub_application` tables.
-   **Local Secret Metadata:** `x_att2_vault_secret_metadata` enables fast portal rendering. Secret values are **NEVER** stored.

---

## 2. Final Table Inventory

### Custom Tables (6 Total)

| # | Table Name | Purpose | Justification |
|---|---|---|---|
| 1 | `x_att2_vault_scope` | Canonical record for a Vault workload (app or sub-app). | Persists the link between an iTap application, a sub-scope (if any), and its unique Terraform Workspace ID. Central anchor for all objects. |
| 2 | `x_att2_vault_scope_environment` | Tracks the onboarding readiness of a scope per environment. | Durable, queryable record of which scope/environment combinations are `ONBOARDED`. Essential for portal validation. |
| 3 | `x_att2_vault_database_registry` | Vault-specific metadata overlay for a CMDB database instance. | CMDB lacks Vault mount paths, connection names, or DBA assignment groups. Enriches the CI without altering it. |
| 4 | `x_att2_vault_dynamic_access` | Governance record of a provisioned dynamic database access grant. | Definitive record of what access is `ACTIVE` or `DISABLED`. Used for the "Manage Dynamic Access" portal. |
| 5 | `x_att2_vault_secret_metadata` | Tracks static secret keys and their lifecycle. | Powers the static secrets portal efficiently without Vault API polling per page load (US_2.1–2.5). |
| 6 | `x_att2_vault_audit_event` | Immutable integration audit log. | Security best practice. Captures structured API-driven events with typed fields for InfoSec reporting. |

### Native Tables Leveraged

| Table | Role in This Solution |
|---|---|
| `sc_req_item` | **The core request record.** Used for onboarding and dynamic access RITMs. Extended with 7 custom fields. |
| `sc_cat_item` | Defines the two primary catalog items (Onboarding, Dynamic Access). |
| `sysapproval_approver` | Manages native DBA approval records for dynamic access requests. |
| `sys_user` / `sys_user_group` | User and group identity for ownership, assignment, and approvals. |
| `cmdb_ci_db_instance` | **Referenced, not copied.** System of record for database identity. |
| **iTap Application Table** | **Referenced, not copied.** System of record for application identity and ownership. |
| `sys_properties` | Application configuration (timeouts, feature flags, URLs). |
| `sys_audit` / `sys_journal_field` | Native audit trail and activity stream for RITM and governance records. |

---

## 3. The Native Request Model: `sc_req_item`

Two catalog items generate standard `sc_req_item` records. All user input is stored as catalog variables. Seven custom fields (prefixed `u_x_att2_`) are added directly to `sc_req_item`.

### Custom Fields on `sc_req_item`

| Field Name | Label | Type | Used For |
|---|---|---|---|
| `u_x_att2_vault_scope` | Vault Scope | Reference → `x_att2_vault_scope` | Links the RITM to the scope record. |
| `u_x_att2_scope_environment` | Scope Environment | Reference → `x_att2_vault_scope_environment` | Links the RITM to the specific environment being onboarded or used. |
| `u_x_att2_database_registry` | Database | Reference → `x_att2_vault_database_registry` | (Dynamic Access only) Links to the target database. |
| `u_x_att2_execution_status` | Execution Status | Choice | Tracks backend provisioning: `QUEUED`, `PROCESSING`, `COMPLETED`, `FAILED`. |
| `u_x_att2_correlation_id` | Correlation ID | String(64) | Unique ID for cross-system traceability (SNOW ↔ Terraform ↔ Vault). |
| `u_x_att2_terraform_run_id` | Terraform Run ID | String(100) | The run identifier returned by the Terraform API. |
| `u_x_att2_error_summary` | Error Summary | String(1000) | User-friendly error message for failed provisioning. |

### Catalog Items

| Catalog Item | Category | Flow |
|---|---|---|
| **Onboard Application to HashiCorp Vault** | HashiCorp Vault & Secrets Management | `FD_Vault_Onboarding_Flow` |
| **Request Dynamic Database Access** | HashiCorp Vault & Secrets Management | `FD_Vault_Dynamic_Access_Flow` |

---

## 4. Custom Table Schemas

### Table 1: `x_att2_vault_scope`

**Purpose:** Definitive record of a workload that can be onboarded to Vault. Replaces `vault_application` and `vault_sub_application`.

| Column Name | Label | Type | Reference | Notes |
|---|---|---|---|---|
| `u_number` | Number | String | | Auto-number: `VSCP` |
| `u_itap_application` | iTap Application | Reference | `[iTap Table]` | **Live reference.** Single source of truth for app ownership. |
| `u_is_sub_application` | Is Sub-Application | Boolean | | `false` for parent app, `true` for sub-app. |
| `u_sub_app_name` | Sub-Application Name | String(255) | | User-provided name. Null if `u_is_sub_application` is false. |
| `u_normalized_name` | Normalized Name | String(255) | | System-generated key (lowercase, hyphens) for uniqueness and Vault naming. |
| `u_terraform_workspace_id` | Terraform Workspace ID | String(100) | | Single workspace ID for this scope, shared across all its environments. |
| `u_created_by` | Created By | Reference | `sys_user` | Who registered this scope. |
| `u_created_on` | Created On | Date/Time | | When this scope was registered. Default: `NOW()`. |
| `active` | Active | Boolean | | Native active flag. |

**Indexes:** Unique on (`u_itap_application`, `u_is_sub_application`, `u_normalized_name`).

**Fields read from iTap via dot-walking (NOT stored):**

| What You Need | How to Access |
|---|---|
| Application Name | `u_itap_application.name` |
| MOTS ID | `u_itap_application.u_mots_id` |
| App Owner | `u_itap_application.u_app_owner` |
| Security Analyst | `u_itap_application.u_security_analyst` |
| Alternative Owner | `u_itap_application.u_alternate_owner` |
| Organization | `u_itap_application.u_organization` |

### Table 2: `x_att2_vault_scope_environment`

**Purpose:** Tracks the onboarding status of a single scope in a single environment. Key validation table for all portal actions.

| Column Name | Label | Type | Reference | Notes |
|---|---|---|---|---|
| `u_scope` | Vault Scope | Reference | `x_att2_vault_scope` | Parent scope. |
| `u_environment` | Environment | Choice | | `DEV`, `TEST`, `PROD`. |
| `u_onboarding_status` | Onboarding Status | Choice | | `NOT_ONBOARDED`, `IN_PROGRESS`, `ONBOARDED`, `FAILED`. |
| `u_vault_role_name` | Vault Role Name | String(255) | | Generated: `role-{env}-{mots_id}[-{sub_app}]`. |
| `u_vault_path` | Vault Secret Path | String(500) | | Generated: `secret/data/{org}/{env}/{mots_id}[/{sub_app}]`. |
| `u_last_onboarding_ritm` | Last Onboarding RITM | Reference | `sc_req_item` | Link to the RITM that last changed the status. |
| `active` | Active | Boolean | | Native active flag. |

**Indexes:** Unique on (`u_scope`, `u_environment`).

### Table 3: `x_att2_vault_database_registry`

**Purpose:** Enriches CMDB database CIs with Vault-specific metadata.

| Column Name | Label | Type | Reference | Notes |
|---|---|---|---|---|
| `u_number` | Number | String | | Auto-number: `VDB` |
| `u_cmdb_ci` | CMDB Database CI | Reference | `cmdb_ci_db_instance` | **Live reference.** Source of truth for DB host, port, type. |
| `u_environment` | Environment | Choice | | `DEV`, `TEST`, `PROD`. |
| `u_dba_assignment_group` | DBA Assignment Group | Reference | `sys_user_group` | Group responsible for approving access requests. |
| `u_vault_mount_path` | Vault Mount Path | String(255) | | Path where database secret engine is mounted. Default: `database/`. |
| `u_vault_connection_name` | Vault Connection Name | String(255) | | Connection name in Vault DB engine (e.g., `core-banking-postgres-prod`). |
| `u_supported` | Supported in Vault | Boolean | | `true` if this DB type is supported. Unsupported = hidden from forms. |
| `active` | Active | Boolean | | Native active flag. |

**Indexes:** Unique on (`u_cmdb_ci`, `u_environment`).

**Fields read from CMDB via dot-walking (NOT stored):**

| What You Need | How to Access |
|---|---|
| Database Name | `u_cmdb_ci.name` |
| Database Type | `u_cmdb_ci.type` |
| Hostname | `u_cmdb_ci.host_name` |
| Port | `u_cmdb_ci.tcp_port` |

### Table 4: `x_att2_vault_dynamic_access`

**Purpose:** Governance record representing a provisioned grant of dynamic access. Created *after* a request is approved and successfully provisioned by Terraform.

| Column Name | Label | Type | Reference | Notes |
|---|---|---|---|---|
| `u_number` | Number | String | | Auto-number: `VDA` |
| `u_scope_environment` | Scope Environment | Reference | `x_att2_vault_scope_environment` | The app scope/environment being granted access. |
| `u_database_registry` | Database | Reference | `x_att2_vault_database_registry` | The target database being accessed. |
| `u_permission_level` | Permission Level | Choice | | `READ_ONLY`, `READ_WRITE`. |
| `u_vault_role_name` | Vault Role Name | String(255) | | Name of the dynamic database role created in Vault. |
| `u_vault_path` | Vault Credential Path | String(500) | | API path to fetch credentials (e.g., `database/creds/{role_name}`). |
| `u_source_ritm` | Source RITM | Reference | `sc_req_item` | Link to the approved RITM that created this grant. |
| `u_status` | Status | Choice | | `ACTIVE`, `DISABLING`, `DISABLED`. |
| `u_disabled_by` | Disabled By | Reference | `sys_user` | User who initiated the disable action. |
| `u_disabled_on` | Disabled On | Date/Time | | Timestamp of successful disablement. |
| `active` | Active | Boolean | | Native active flag. |

**Indexes:** Unique on (`u_scope_environment`, `u_database_registry`) where `u_status` is `ACTIVE`.

### Table 5: `x_att2_vault_secret_metadata`

**Purpose:** Tracks metadata about static secrets managed via the portal. Essential for list views and audit history. Secret values are **NEVER** stored.

| Column Name | Label | Type | Reference | Notes |
|---|---|---|---|---|
| `u_number` | Number | String | | Auto-number: `VSEC` |
| `u_scope_environment` | Scope Environment | Reference | `x_att2_vault_scope_environment` | The scope where this secret lives. |
| `u_secret_name` | Secret Name | String(255) | | Logical key/name. Regex: `^[a-z0-9][a-z0-9._-]*$`. |
| `u_vault_path` | Vault Path | String(500) | | Full KV path: `secret/data/{org}/{env}/{mots_id}[/{sub_app}]/{secret_name}`. |
| `u_description` | Description | String(500) | | User-provided description. |
| `u_labels` | Labels / Tags | String(500) | | Comma-separated tags for filtering. |
| `u_latest_version` | Latest Version | Integer | | Tracks the highest known KV v2 version. |
| `u_status` | Status | Choice | | `ACTIVE`, `DELETED`. |
| `u_created_by` | Created By | Reference | `sys_user` | |
| `u_created_on` | Created On | Date/Time | | Default: `NOW()`. |
| `u_last_rotated_by` | Last Updated By | Reference | `sys_user` | Who last changed the secret value. |
| `u_last_rotated_on` | Last Updated On | Date/Time | | When the secret value was last changed. |
| `u_deleted_by` | Deleted By | Reference | `sys_user` | Hard-delete actor. |
| `u_deleted_on` | Deleted On | Date/Time | | Timestamp of deletion. |

**Indexes:** Unique on (`u_scope_environment`, `u_secret_name`) where `u_status = 'ACTIVE'`.

**Business Rules:**
-   `u_secret_name` must match regex `^[a-z0-9][a-z0-9._-]*$`.
-   `u_status` transitions: `ACTIVE → DELETED` (one-way).
-   `DELETED` records are soft-deleted in SNOW (record retained for audit); hard-deleted in Vault via `DELETE /v1/secret/metadata/{path}`.
-   On insert: validate that `u_scope_environment.u_onboarding_status = ONBOARDED`.
-   On insert: validate SPOC is App Owner, Security Analyst, or Alternative Owner via iTap dot-walking.

### Table 6: `x_att2_vault_audit_event`

**Purpose:** Enterprise-grade, immutable integration audit trail. Captures API-driven actions and Terraform callbacks in a structured, highly reportable format.

| Column Name | Label | Type | Reference | Notes |
|---|---|---|---|---|
| `u_number` | Number | String | | Auto-number: `VAUD` |
| `u_scope_environment` | Scope Environment | Reference | `x_att2_vault_scope_environment` | Context for the logged event. |
| `u_event_type` | Event Type | Choice | | See Event Types table below. |
| `u_resource_type` | Resource Type | Choice | | `ONBOARDING`, `STATIC_SECRET`, `DYNAMIC_ACCESS`, `APPROLE`. |
| `u_resource_name` | Resource Name | String(500) | | The asset touched (e.g., Secret Name or Role Name). |
| `u_action_by` | Action By | Reference | `sys_user` | |
| `u_timestamp` | Timestamp | Date/Time | | Event occurrence time. Default: `NOW()`. |
| `u_reason` | Reason | String(1000) | | Audit justification (e.g., rotation reason, denial reason). |
| `u_correlation_id` | Correlation ID | String(64) | | Links to Terraform run or API call. |
| `u_source_record` | Source Record | String(100) | | `table:sys_id` link to triggering record. |
| `u_version` | Version | Integer | | KV version number (for secret events). |
| `u_ip_address` | Client IP | String(45) | | Requestor IP for security audit. |

**ACL:** Insert-only for system/service accounts. Read for SPOC (own apps), Security Analyst, Vault Admin, Auditor. **No update. No delete.**

### Event Types (Choice List)

| Event Type | Epic | Trigger |
|---|---|---|
| `ONBOARDING_SUBMITTED` | 1 | US 1.1 — Request created |
| `ONBOARDING_PROCESSING` | 1 | US 1.2 — Terraform run triggered |
| `ONBOARDING_COMPLETED` | 1 | US 1.3 — Policy + AppRole created |
| `ONBOARDING_FAILED` | 1 | US 1.3 — Provisioning error |
| `SECRET_CREATE` | 2 | US 2.1 — Static secret created via Vault KV API |
| `SECRET_ROTATE` | 2 | US 2.3 — Static secret value updated (new KV version) |
| `SECRET_DELETE` | 2 | US 2.4 — Static secret hard-deleted from Vault |
| `DYNAMIC_ACCESS_REQUEST_CREATE` | 3 | US 3.1 — Dynamic DB access request submitted |
| `DYNAMIC_ACCESS_APPROVE` | 3 | US 3.1 — DBA approved request |
| `DYNAMIC_ACCESS_DENY` | 3 | US 3.1 — DBA denied request |
| `DYNAMIC_ACCESS_PROCESSING` | 3 | US 3.2 — Terraform provisioning started |
| `DYNAMIC_ACCESS_PROVISION` | 3 | US 3.3 — Terraform provisioning completed |
| `DYNAMIC_ACCESS_FAILED` | 3 | US 3.3 — Terraform provisioning failed |
| `DYNAMIC_ACCESS_DISABLE` | 3 | US 3.6 — Dynamic access disabled |
| `POLICY_UPDATED` | Cross | Policy modified in Vault |

---

## 5. Application Configuration (`sys_properties`)

All application-level configuration uses native `sys_properties`, prefixed with `x_att2_vault.`.

| Property Name | Default | Description |
|---|---|---|
| `x_att2_vault.terraform_api_base_url` | — | Terraform Cloud/Enterprise API endpoint. |
| `x_att2_vault.terraform_credential` | — | Connection & Credential Alias name for TFC auth. |
| `x_att2_vault.vault_credential` | — | Connection & Credential Alias name for direct Vault API auth. |
| `x_att2_vault.terraform_poll_interval_minutes` | `5` | Polling interval for Terraform run status. |
| `x_att2_vault.terraform_poll_start_after_minutes` | `10` | Delay before starting polling fallback. |
| `x_att2_vault.terraform_max_wait_hours` | `24` | Auto-fail PROCESSING RITMs after this duration. |
| `x_att2_vault.terraform_callback_timeout_minutes` | `30` | Callback timeout for dynamic access provisioning. |
| `x_att2_vault.terraform_max_retries` | `3` | Max Terraform API retry attempts. |
| `x_att2_vault.dynamic_access.sla_hours` | `72` | DBA approval timeout (auto-expire). |
| `x_att2_vault.dynamic_access.max_ttl_choices` | `1h,4h,24h,7d` | Available TTL options for dynamic access. |
| `x_att2_vault.dynamic_access.prod_confirm_required` | `true` | Require typed confirmation for PROD disable. |
| `x_att2_vault.max_rotation_per_day` | `3` | Max AppRole SecretID rotations per day (US_1.5 — Parked). |
| `x_att2_vault.secret_view_timeout_minutes` | `3` | Secret Zero reveal timeout (US_1.4 — Parked). |

---

## 6. Planned Data Additions (Parked Stories)

Several User Stories are currently parked with dependencies pending. When unparked, the data model will require targeted expansions:

-   **US_1.4 & US_1.5 (Secret Zero & SecretID Rotation):** Fields for `u_rotation_count`, `u_last_rotation_at`, `u_secret_retrieved_by`, and daily limits will be added to `x_att2_vault_scope_environment` or a new `x_att2_vault_credential_tracking` table.
-   **US_3.4 (Dynamic Lease Monitoring):** A new `x_att2_vault_dynamic_lease` table will hold lease metadata (lease ID, TTL, expiry, status) pulled from Vault audit streams.
-   **US_3.8 (Anomaly Detection):** Depends on US_3.4. Alert thresholds and spike detection logic.

---

## 7. Architectural Flow Examples

### 7.1. Onboarding Flow

1.  **Request:** User orders "Onboard Application to Vault" catalog item. A standard `sc_req_item` is created with custom fields populated.
2.  **Naming:** Artifacts are auto-generated: `pol-{env}-{mots_id}[-{sub_app}]`, `role-{env}-{mots_id}[-{sub_app}]`, `secret/data/{org}/{env}/{mots_id}[/{sub_app}]`.
3.  **Provisioning:** Flow Designer triggers Terraform API call with `u_x_att2_correlation_id`.
4.  **Callback:** Terraform completes and sends webhook. The callback script finds the RITM via Correlation ID, sets `u_x_att2_execution_status = COMPLETED`, stores `u_terraform_workspace_id` on `x_att2_vault_scope`, and sets `u_onboarding_status = ONBOARDED` on `x_att2_vault_scope_environment`.
5.  **Audit:** `ONBOARDING_COMPLETED` event written to `x_att2_vault_audit_event`.

### 7.2. Dynamic Access Flow (Full Lifecycle)

1.  **Request:** User orders "Request Dynamic Database Access". `sc_req_item` created.
2.  **Approval:** Native `sysapproval_approver` assigned to `u_dba_assignment_group` from `x_att2_vault_database_registry`.
3.  **DBA Action:** DBA approves. RITM `approval` becomes `approved`.
4.  **Provisioning:** Flow triggers Terraform API call.
5.  **Callback:** On success, `x_att2_vault_dynamic_access` record created with `u_status = ACTIVE`.
6.  **Disable:** App owner clicks [Disable] on portal. Terraform removes policy binding. Record status → `DISABLED`.
7.  **Re-enable:** Requires a brand new RITM (new request + new DBA approval).

### 7.3. Static Secret Flow (Direct Vault API)

1.  **Portal:** User navigates to "Manage Static Secrets" page, selects App → Sub-App → Environment.
2.  **Create:** User enters secret name + value → ServiceNow calls Vault KV API directly → On success, creates `x_att2_vault_secret_metadata` record (no value stored) + `SECRET_CREATE` audit event.
3.  **Edit:** User clicks [Edit] → enters new value → Vault auto-increments KV version → metadata `u_latest_version` updated + `SECRET_ROTATE` audit event.
4.  **Delete:** User clicks [Delete] → typed confirmation → `DELETE /v1/secret/metadata/{path}` (hard-delete all versions) → metadata status → `DELETED` + `SECRET_DELETE` audit event.
5.  **History:** User clicks [History] → reads from `x_att2_vault_audit_event` filtered by resource name.

---

*Version 5.1 — Executive Architect Approved — 1 April 2026*
