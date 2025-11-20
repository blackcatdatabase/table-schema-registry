-- Auto-generated from schema-map-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  schema_registry
CREATE INDEX IF NOT EXISTS idx_schema_component ON schema_registry (system_name, component);
