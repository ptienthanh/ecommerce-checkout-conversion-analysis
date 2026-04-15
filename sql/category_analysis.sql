-- =====================================
-- SECTION 7: CATEGORY ANALYSIS
-- =====================================

WITH product_funnel AS (
    SELECT 
        item_id,
        COUNT(DISTINCT CASE WHEN event_type = 'view' THEN visitor_id END) AS view_users,
        COUNT(DISTINCT CASE WHEN event_type = 'addtocart' THEN visitor_id END) AS cart_users,
        COUNT(DISTINCT CASE WHEN event_type = 'transaction' THEN visitor_id END) AS purchase_users
    FROM events_clean
    GROUP BY item_id
)

SELECT 
    item_id AS category,
    view_users,
    cart_users,
    purchase_users,
    ROUND(purchase_users / view_users, 4) AS conversion_rate
FROM product_funnel
WHERE view_users > 50   -- filter noise (quan trọng)
ORDER BY conversion_rate DESC;
