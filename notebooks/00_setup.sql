-- 00_setup.sql
-- Idempotent setup for Unity Catalog objects + minimal grants

-- 1) Create catalog & schema (safe to re-run)
CREATE CATALOG IF NOT EXISTS dev
  COMMENT 'Development catalog';

CREATE SCHEMA IF NOT EXISTS dev.retail
  COMMENT 'Retail schema in dev catalog';

-- Make sure we’re pointing at the right place
USE CATALOG dev;
USE SCHEMA retail;

-- 2) Create a managed Volume for dropping sample files
-- (Managed = no LOCATION clause)
CREATE VOLUME IF NOT EXISTS raw
  COMMENT 'Managed volume for raw sample files';

-- 3) Minimal privileges for analyst_group (adjust as needed)
