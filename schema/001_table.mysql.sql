-- Auto-generated from schema-map-mysql.yaml (map@94ebe6c)
-- engine: mysql
-- table:  schema_registry

CREATE TABLE IF NOT EXISTS schema_registry (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  system_name VARCHAR(120) NOT NULL,
  component VARCHAR(120) NOT NULL,
  version VARCHAR(64) NOT NULL,
  checksum VARCHAR(64) NULL,
  applied_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  meta JSON NULL,
  UNIQUE KEY uq_schema_version (system_name, component, version),
  INDEX idx_schema_component (system_name, component)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
