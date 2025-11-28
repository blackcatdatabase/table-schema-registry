-- Auto-generated from joins-mysql.psd1 (map@mtime:2025-11-27T17:49:37Z)
-- engine: mysql
-- view:   schema_registry_versions_latest
-- Latest version per system/component
CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_schema_versions_latest AS
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
