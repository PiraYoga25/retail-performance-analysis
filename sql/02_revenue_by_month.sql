-- Objective:
-- Calculate total revenue per month to analyse sales trends over time.

-- Approach:
-- Grouped transactions by month using DATE_TRUNC and summed sales values.

-- Business Importance:
-- Helps identify seasonality, growth patterns, and performance changes across time.

SELECT
  DATE_TRUNC('month', order_date)::date AS month,
  ROUND(SUM(sales), 2) AS total_sales
FROM superstore_raw
GROUP BY 1
ORDER BY 1;