-- Auto-generated from schema-map-postgres.yaml (map@sha1:FAEA49A5D5F8FAAD9F850D0F430ED451C5C1D707)
-- engine: postgres
-- table:  schema_registry

CREATE INDEX IF NOT EXISTS idx_schema_component ON schema_registry (system_name, component);
