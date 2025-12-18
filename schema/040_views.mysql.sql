-- Auto-generated from schema-views-mysql.yaml (map@sha1:B3C579FF17AC186C47D2C4AC86B0738DB2308BF2)
-- engine: mysql
-- table:  schema_registry

-- Contract view for [schema_registry]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_schema_registry AS
SELECT
  id,
  system_name,
  component,
  version,
  checksum,
  applied_at,
  meta
FROM schema_registry;
