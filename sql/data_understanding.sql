-- =====================================
-- SECTION 2: DATA UNDERSTANDING
-- =====================================

SELECT COUNT(*) AS total_rows FROM events;

SELECT DISTINCT event_type FROM events;

SELECT COUNT(DISTINCT visitor_id) AS total_users FROM events;

SELECT COUNT(DISTINCT item_id) AS total_products FROM events;

SELECT event_type, COUNT(*) AS total
FROM events
GROUP BY event_type;
