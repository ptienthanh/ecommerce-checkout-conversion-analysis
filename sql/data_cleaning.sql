-- =====================================
-- SECTION 3: DATA CLEANING
-- =====================================

-- 1. Check missing values
SELECT
    SUM(CASE WHEN event_timestamp IS NULL THEN 1 ELSE 0 END) AS null_event_timestamp,
    SUM(CASE WHEN visitor_id IS NULL THEN 1 ELSE 0 END) AS null_visitor_id,
    SUM(CASE WHEN event_type IS NULL THEN 1 ELSE 0 END) AS null_event_type,
    SUM(CASE WHEN item_id IS NULL THEN 1 ELSE 0 END) AS null_item_id
FROM events;

-- 2. Check duplicate records
SELECT 
    event_timestamp,
    visitor_id,
    event_type,
    item_id,
    transaction_id,
    COUNT(*) AS duplicate_count
FROM events
GROUP BY event_timestamp, visitor_id, event_type, item_id, transaction_id
HAVING COUNT(*) > 1;

-- 3. Count duplicate groups
SELECT COUNT(*) AS duplicate_groups
FROM (
    SELECT 
        event_timestamp,
        visitor_id,
        event_type,
        item_id,
        transaction_id
    FROM events
    GROUP BY event_timestamp, visitor_id, event_type, item_id, transaction_id
    HAVING COUNT(*) > 1
) AS duplicate_check;

-- 4. Create cleaned dataset
DROP TABLE IF EXISTS events_clean;

CREATE TABLE events_clean AS
SELECT DISTINCT
    event_timestamp,
    visitor_id,
    event_type,
    item_id,
    transaction_id
FROM events
WHERE event_timestamp IS NOT NULL
  AND visitor_id IS NOT NULL
  AND event_type IS NOT NULL
  AND item_id IS NOT NULL;

-- 5. Validate cleaned data
SELECT COUNT(*) AS total_rows_clean FROM events_clean;

SELECT event_type, COUNT(*) AS total
FROM events_clean
GROUP BY event_type;
