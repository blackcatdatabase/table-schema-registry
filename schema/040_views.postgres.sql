-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
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

-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  schema_registry_versions_latest
-- Latest version per system/component
CREATE OR REPLACE VIEW vw_schema_versions_latest AS
SELECT DISTINCT ON (system_name, component)
  system_name,
  component,
  version,
  checksum,
  applied_at,
  meta
FROM schema_registry
ORDER BY system_name, component, applied_at DESC;

