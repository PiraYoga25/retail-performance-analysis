-- Objective:
-- Segment customers into one-time vs repeat buyers and measure revenue contribution.

-- Approach:
-- Created a customer-level aggregation using a CTE to calculate total orders and total spend.
-- Classified customers based on order count.
-- Calculated revenue share percentage for each segment.

-- Business Importance:
-- Determines whether revenue is driven by customer retention or one-time purchases.
-- Highlights dependence on repeat customers.

WITH customer_orders AS (
    SELECT
        customer_id,
        COUNT(DISTINCT order_id) AS total_orders,
        SUM(sales) AS total_spend
    FROM superstore_raw
    GROUP BY customer_id
)
SELECT
    CASE 
        WHEN total_orders = 1 THEN 'One-Time'
        ELSE 'Repeat'
    END AS customer_type,
    COUNT(*) AS num_customers,
    ROUND(SUM(total_spend), 2) AS total_revenue,
    ROUND(
        100.0 * SUM(total_spend) / NULLIF((SELECT SUM(sales) FROM superstore_raw), 0),
        2
    ) AS revenue_share_pct
FROM customer_orders
GROUP BY customer_type
ORDER BY total_revenue DESC;