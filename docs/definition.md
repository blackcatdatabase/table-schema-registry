<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – schema_registry

Registry of schema versions applied to various components.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| system_name | VARCHAR(120) | NO | — | System/service name. |  |
| component | VARCHAR(120) | NO | — | Component name (db, api, etc.). |  |
| checksum | VARCHAR(64) | YES | — | Checksum/signature of the migration bundle. |  |
| applied_at | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | When the version was applied. |  |
| meta | JSONB | YES | — | JSON metadata with migration context. |  |