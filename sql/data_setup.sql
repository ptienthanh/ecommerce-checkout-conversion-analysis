-- =====================================
-- SECTION 1: DATA SETUP
-- =====================================

CREATE DATABASE ecommerce_db;
USE ecommerce_db;

CREATE TABLE events (
    event_timestamp BIGINT,
    visitor_id BIGINT,
    event_type VARCHAR(50),
    item_id BIGINT,
    transaction_id BIGINT NULL
);

LOAD DATA LOCAL INFILE '/path/events.csv'
INTO TABLE events
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(event_timestamp, visitor_id, event_type, item_id, @transaction_id)
SET transaction_id = NULLIF(@transaction_id, '');
