-- =====================================
-- SECTION 3: FUNNEL ANALYSIS
-- =====================================

SELECT 
    COUNT(DISTINCT CASE WHEN event_type = 'view' THEN visitor_id END) AS view_users,
    COUNT(DISTINCT CASE WHEN event_type = 'addtocart' THEN visitor_id END) AS cart_users,
    COUNT(DISTINCT CASE WHEN event_type = 'transaction' THEN visitor_id END) AS purchase_users
FROM events;
