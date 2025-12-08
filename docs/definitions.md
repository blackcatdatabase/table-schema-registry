# schema_registry

Registry of schema versions applied to various components.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| applied_at |  | NO | CURRENT_TIMESTAMP(6) | When the version was applied. |
| component |  | NO |  | Component name (db, api, etc.). |
| checksum |  | YES |  | Checksum/signature of the migration bundle. |
| id | BIGINT | NO |  | Surrogate primary key. |
| meta | JSONB | YES |  | JSON metadata with migration context. |
| system_name | VARCHAR(120) | NO |  | System/service name. |
| version |  | NO |  | Version identifier. |

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
| vw_schema_registry | mysql | algorithm=MERGE, security=INVOKER | [packages\schema-registry\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/schema-registry/schema/040_views.mysql.sql) |
| vw_schema_versions_latest | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\schema-registry\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/schema-registry/schema/040_views_joins.mysql.sql) |
| vw_schema_registry | postgres |  | [packages\schema-registry\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/schema-registry/schema/040_views.postgres.sql) |
| vw_schema_versions_latest | postgres |  | [packages\schema-registry\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/schema-registry/schema/040_views_joins.postgres.sql) |
