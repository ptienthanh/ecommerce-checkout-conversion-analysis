-- =====================================
-- SECTION 8.1: TIME ANALYSIS (BY HOUR)
-- =====================================

SELECT 
    HOUR(FROM_UNIXTIME(event_timestamp / 1000)) AS hour_of_day,
    COUNT(*) AS total_events,
    COUNT(CASE WHEN event_type = 'transaction' THEN 1 END) AS total_purchases
FROM events_clean
GROUP BY hour_of_day
ORDER BY hour_of_day;

-- =====================================
-- SECTION 8.2: TIME ANALYSIS (BY DATE)
-- =====================================

SELECT 
    DATE(FROM_UNIXTIME(event_timestamp / 1000)) AS event_date,
    COUNT(*) AS total_events,
    COUNT(CASE WHEN event_type = 'transaction' THEN 1 END) AS total_purchases
FROM events_clean
GROUP BY event_date
ORDER BY event_date;
