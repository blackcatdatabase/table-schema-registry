-- Auto-generated from joins-postgres.yaml (map@85230ed)
-- engine: postgres
-- view:   schema_registry_versions_latest

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
