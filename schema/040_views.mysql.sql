-- Auto-generated from schema-views-mysql.yaml (map@sha1:FFA9A9D6FA9EE079B0DAEBB6FEE023C138E8FFA1)
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
