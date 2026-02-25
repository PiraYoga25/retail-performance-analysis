-- Objective:
-- Compare revenue and profit performance across product categories.

-- Approach:
-- Aggregated total sales and total profit by category.

-- Business Importance:
-- Identifies high-revenue vs high-margin categories and highlights potential profitability issues.

SELECT
  category,
  ROUND(SUM(sales), 2) AS total_sales,
  ROUND(SUM(profit), 2) AS total_profit
FROM superstore_raw
GROUP BY 1
ORDER BY total_sales DESC;