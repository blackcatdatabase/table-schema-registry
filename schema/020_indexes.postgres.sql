-- Auto-generated from schema-map-postgres.yaml (map@74ce4f4)
-- engine: postgres
-- table:  schema_registry

CREATE INDEX IF NOT EXISTS idx_schema_component ON schema_registry (system_name, component);
