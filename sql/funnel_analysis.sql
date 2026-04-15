-- =====================================
-- SECTION 5: FUNNEL ANALYSIS
-- =====================================

WITH funnel AS (
    SELECT 1 AS stage_order, 'view' AS stage, COUNT(DISTINCT visitor_id) AS user_count
    FROM events_clean
    WHERE event_type = 'view'

    UNION ALL

    SELECT 2 AS stage_order, 'addtocart' AS stage, COUNT(DISTINCT visitor_id) AS user_count
    FROM events_clean
    WHERE event_type = 'addtocart'

    UNION ALL

    SELECT 3 AS stage_order, 'transaction' AS stage, COUNT(DISTINCT visitor_id) AS user_count
    FROM events_clean
    WHERE event_type = 'transaction'
)

SELECT 
    stage,
    user_count,
    ROUND(user_count / MAX(user_count) OVER (), 4) AS conversion_rate,
    ROUND(
        1 - (user_count / LAG(user_count) OVER (ORDER BY stage_order)),
        4
    ) AS drop_off_rate
FROM funnel
ORDER BY stage_order;
