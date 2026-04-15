-- =====================================
-- SECTION 8: TIME ANALYSIS (BY HOUR)
-- =====================================

SELECT 
    HOUR(FROM_UNIXTIME(event_timestamp / 1000)) AS hour_of_day,
    COUNT(*) AS total_events,
    COUNT(CASE WHEN event_type = 'transaction' THEN 1 END) AS total_purchases
FROM events_clean
GROUP BY hour_of_day
ORDER BY hour_of_day;
