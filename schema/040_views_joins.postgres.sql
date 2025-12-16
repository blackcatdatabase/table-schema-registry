-- Auto-generated from core\joins-postgres.yaml (map@sha1:29CF395A3A4C8964482083733F8E613ABFBEF5CC)
-- engine: postgres
-- view:   schema_versions_latest

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
