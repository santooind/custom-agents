# <Solution Name> ServiceNow Data Model

## 1. Document Control

| Field | Value |
|---|---|
| Version |  |
| Date |  |
| Status | `Draft | Needs Answers | Ready For Review | Approved | Frozen` |
| Owner |  |
| Source Inputs |  |

## 2. Executive Architecture Summary

<Briefly explain the data model philosophy and key design decisions.>

## 3. Design Philosophy

| ID | Principle | Design Impact |
|---|---|---|
| DMP-001 | Native-first ServiceNow model | Use native request, approval, user/group, and audit tables where they fit. |
| DMP-002 | No secret values in ServiceNow | Store metadata only. |

## 4. Final Table Inventory

### Custom Tables

| # | Table Name | Purpose | Justification |
|---|---|---|---|
| 1 |  |  |  |

### Native Tables Leveraged

| Table | Role In This Solution | Custom Fields / Notes |
|---|---|---|
| `sc_req_item` | Core request record |  |
| `sysapproval_approver` | Native approval records |  |
| `sys_user` / `sys_user_group` | Identity and assignment |  |
| `sys_properties` | Configuration controls |  |

## 5. Native Request Model

| Field Name | Label | Type | Reference | Used For | Notes |
|---|---|---|---|---|---|
|  |  |  |  |  |  |

## 6. Catalog Items

| Catalog Item | Category | Flow / Subflow | Request Table |
|---|---|---|---|
|  |  |  | `sc_req_item` |

## 7. Custom Table Schemas

### Table 1: `<table_name>`

**Purpose:**  
**Justification:**  
**Owner:**  

| Column Name | Label | Data Type | Max Length | Nullable | Default | Reference | Unique Key / Index | Notes |
|---|---|---|---|---|---|---|---|---|
| `sys_id` | Sys ID | GUID | 32 | No | Auto |  | PK |  |

**Unique Keys / Indexes:**

| Name | Fields | Condition | Rationale |
|---|---|---|---|
|  |  |  |  |

**Choice Lists:**

| Field | Choice Value | Label | Meaning |
|---|---|---|---|
|  |  |  |  |

## 8. Access Control Model

| Table | Operation | Who | Row-Level Condition | Notes |
|---|---|---|---|---|
|  | Create |  |  |  |
|  | Read |  |  |  |
|  | Write |  |  |  |
|  | Delete |  |  |  |

## 9. Business Rules And Validation

| ID | Rule Name | Table | Event | Logic | Priority |
|---|---|---|---|---|---|
| BR-001 |  |  | Before Insert |  | High |

## 10. Application Configuration (`sys_properties`)

| Property Name | Default | Description | Owner |
|---|---|---|---|
|  |  |  |  |

## 11. Audit Event Model

| Event Type | Resource Type | Trigger | Required Fields |
|---|---|---|---|
|  |  |  |  |

## 12. Planned Data Additions / Parked Stories

| Story / Future Capability | Data Addition | Dependency | Revisit Trigger |
|---|---|---|---|
|  |  |  |  |

## 13. Architectural Flow Examples

### 13.1 Onboarding Flow

<Explain how records are created/updated during onboarding.>

### 13.2 Dynamic Access Flow

<Explain full lifecycle for dynamic access.>

### 13.3 Static Secret Flow

<Explain static secret metadata flow without storing secret values.>

## 14. Open Questions

| ID | Question | Why It Matters | Blocks Approval |
|---|---|---|---|
| Q-001 |  |  | Yes |

## 15. Review Checklist

- [ ] Native tables are used where appropriate.
- [ ] Every custom table has justification.
- [ ] Secret values are not stored.
- [ ] Fields include data type, length, nullability, references, and key/index notes.
- [ ] ACLs and row-level access are defined.
- [ ] Business rules and validation rules are defined.
- [ ] sys_properties are documented.
- [ ] ERD relationships are clear.
