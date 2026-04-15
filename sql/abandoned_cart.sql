-- =====================================
-- SECTION 6: ABANDONED CART ANALYSIS
-- =====================================

WITH cart_users AS (
    SELECT DISTINCT visitor_id
    FROM events_clean
    WHERE event_type = 'addtocart'
),

purchase_users AS (
    SELECT DISTINCT visitor_id
    FROM events_clean
    WHERE event_type = 'transaction'
),

abandoned_users AS (
    SELECT c.visitor_id
    FROM cart_users c
    LEFT JOIN purchase_users p
        ON c.visitor_id = p.visitor_id
    WHERE p.visitor_id IS NULL
)

SELECT 
    (SELECT COUNT(*) FROM cart_users) AS total_cart_users,
    (SELECT COUNT(*) FROM purchase_users) AS total_purchase_users,
    (SELECT COUNT(*) FROM abandoned_users) AS abandoned_users,
    ROUND(
        (SELECT COUNT(*) FROM abandoned_users) * 1.0 
        / (SELECT COUNT(*) FROM cart_users),
        4
    ) AS abandoned_rate;
