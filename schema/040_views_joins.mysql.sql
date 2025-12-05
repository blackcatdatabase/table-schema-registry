-- Auto-generated from joins-mysql.yaml (map@sha1:DA70105A5B799F72A56FEAB71A5171F946A770D2)
-- engine: mysql
-- view:   schema_versions_latest

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
