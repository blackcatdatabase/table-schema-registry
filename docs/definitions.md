# schema_registry

Registry of schema versions applied to various components.

## Columns
| Column | Type | Null | Default | Description | Crypto |
| --- | --- | --- | --- | --- | --- |
| id | BIGINT | NO |  | Surrogate primary key. |  |
| system_name | VARCHAR(120) | NO |  | System/service name. |  |
| component | mysql: VARCHAR(120) | NO |  | Component name (db, api, etc.). |  |
| version | mysql: VARCHAR(64) | NO |  | Version identifier. |  |
| checksum | mysql: VARCHAR(64) | YES |  | Checksum/signature of the migration bundle. |  |
| applied_at | mysql: DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | When the version was applied. |  |
| meta | mysql: JSON / postgres: JSONB | YES |  | JSON metadata with migration context. |  |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| uq_schema_version | system_name, component, version |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_schema_component | system_name,component | INDEX idx_schema_component (system_name, component) |
| uq_schema_version | system_name,component,version | UNIQUE KEY uq_schema_version (system_name, component, version) |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| uq_schema_version | system_name, component, version |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_schema_component | system_name,component | CREATE INDEX IF NOT EXISTS idx_schema_component ON schema_registry (system_name, component) |
| uq_schema_version | system_name,component,version | CONSTRAINT uq_schema_version UNIQUE (system_name, component, version) |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_schema_registry | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_schema_versions_latest | mysql | algorithm=TEMPTABLE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_schema_registry | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
| vw_schema_versions_latest | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
