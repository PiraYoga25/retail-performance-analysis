-- Objective:
-- Calculate profit margin percentage by product category.

-- Approach:
-- Aggregated total sales and total profit by category.
-- Calculated margin as profit divided by sales.
-- Used NULLIF to prevent divide-by-zero errors.

-- Business Importance:
-- Profit margin provides a clearer comparison than raw profit alone.
-- Helps identify categories generating revenue but underperforming in profitability.

SELECT
    category,
    ROUND(SUM(sales), 2) AS total_sales,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct
FROM superstore_raw
GROUP BY category
ORDER BY total_sales DESC;