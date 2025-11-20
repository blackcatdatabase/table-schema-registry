-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  schema_registry_versions_latest
-- Latest version per system/component
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_schema_versions_latest AS
WITH ranked AS (
  SELECT
    system_name,
    component,
    version,
    checksum,
    applied_at,
    meta,
    ROW_NUMBER() OVER (PARTITION BY system_name, component ORDER BY applied_at DESC) AS rn
  FROM schema_registry
)
SELECT
  system_name,
  component,
  version,
  checksum,
  applied_at,
  meta
FROM ranked
WHERE rn = 1
ORDER BY system_name, component;

-- Auto-generated from schema-views-mysql.psd1 (map@62c9c93)
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

