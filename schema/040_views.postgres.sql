-- Auto-generated from schema-views-postgres.yaml (map@sha1:3C365C10BD489376A27944AE10F143E1BE4D3BCF)
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
