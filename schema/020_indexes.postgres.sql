-- Auto-generated from schema-map-postgres.psd1 (map@62c9c93)
-- engine: postgres
-- table:  schema_registry
CREATE INDEX IF NOT EXISTS idx_schema_component ON schema_registry (system_name, component);
