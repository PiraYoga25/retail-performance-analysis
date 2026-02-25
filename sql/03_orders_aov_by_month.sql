-- Objective:
-- Calculate monthly order volume and Average Order Value (AOV).

-- Approach:
-- Used COUNT(DISTINCT order_id) to avoid double-counting multi-line orders.
-- Calculated AOV as SUM(sales) divided by total unique orders.
-- Used NULLIF to prevent divide-by-zero errors.

-- Business Importance:
-- Determines whether revenue growth is driven by increased order volume or higher spending per order.

SELECT
  DATE_TRUNC('month', order_date)::date AS month,
  COUNT(DISTINCT order_id) AS orders,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS aov
FROM superstore_raw
GROUP BY 1
ORDER BY 1;