-- Objective:
-- Validate dataset integrity before analysis.

-- Checks Performed:
-- 1. Verified date range using MIN and MAX on order_date.
-- 2. Checked for NULL values in key columns (order_id, customer_id, sales).
-- 3. Confirmed row-level uniqueness using COUNT(*) vs COUNT(DISTINCT row_id).

-- Business Importance:
-- Ensures results are not skewed by missing data or duplicated rows.

-- Date range
SELECT 
  MIN(order_date) AS min_order_date,
  MAX(order_date) AS max_order_date
FROM superstore_raw;

-- Null checks for key fields
SELECT
  SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS null_order_id,
  SUM(CASE WHEN order_date IS NULL THEN 1 ELSE 0 END) AS null_order_date,
  SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS null_customer_id,
  SUM(CASE WHEN sales IS NULL THEN 1 ELSE 0 END) AS null_sales
FROM superstore_raw;

-- Row ID uniqueness (sanity check)
SELECT 
  COUNT(*) AS total_rows,
  COUNT(DISTINCT row_id) AS distinct_row_id
FROM superstore_raw;