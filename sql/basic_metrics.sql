-- =====================================
-- SECTION 4: BASIC METRICS
-- =====================================

-- Calculate key business metrics from cleaned dataset

SELECT 'total_users' AS metric, COUNT(DISTINCT visitor_id) AS value
FROM events_clean

UNION ALL

SELECT 'total_events', COUNT(*)
FROM events_clean

UNION ALL

SELECT 'total_add_to_cart', COUNT(*)
FROM events_clean
WHERE event_type = 'addtocart'

UNION ALL

SELECT 'total_purchases', COUNT(*)
FROM events_clean
WHERE event_type = 'transaction';
