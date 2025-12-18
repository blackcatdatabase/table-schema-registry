-- Auto-generated from schema-map-postgres.yaml (map@sha1:621FDD3D99B768B6A8AD92061FB029414184F4B3)
-- engine: postgres
-- table:  schema_registry

CREATE INDEX IF NOT EXISTS idx_schema_component ON schema_registry (system_name, component);
