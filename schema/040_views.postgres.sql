-- Auto-generated from schema-views-postgres.yaml (map@74ce4f4)
-- engine: postgres
-- table:  schema_registry

-- Contract view for [schema_registry]
CREATE OR REPLACE VIEW vw_schema_registry AS
SELECT
  id,
  system_name,
  component,
  version,
  checksum,
  applied_at,
  meta
FROM schema_registry;
