-- ============================================================
-- PROJECT  : Multi-Brand Beauty Marketing Campaign Analysis
-- FILE     : 01_create_tables.sql
-- PURPOSE  : Create tables for each brand and load CSV data
-- AUTHOR   : Muskan
-- TOOL     : PostgreSQL
-- ============================================================


-- ============================================================
-- STEP 1 : CREATE TABLES
-- ============================================================

CREATE TABLE nykaa_campaigns (
    campaign_id        VARCHAR(20),
    campaign_type      VARCHAR(50),
    target_audience    VARCHAR(100),
    duration           INT,
    channel_used       VARCHAR(50),
    impressions        INT,
    clicks             INT,
    leads              INT,
    conversions        INT,
    revenue            NUMERIC(10,2),
    acquisition_cost   NUMERIC(10,2),
    roi                NUMERIC(10,2),
    language           VARCHAR(50),
    engagement_score   NUMERIC(5,2),
    customer_segment   VARCHAR(100),
    campaign_date      DATE
);

CREATE TABLE purplle_campaigns (
    campaign_id        VARCHAR(20),
    campaign_type      VARCHAR(50),
    target_audience    VARCHAR(100),
    duration           INT,
    channel_used       VARCHAR(50),
    impressions        INT,
    clicks             INT,
    leads              INT,
    conversions        INT,
    revenue            NUMERIC(10,2),
    acquisition_cost   NUMERIC(10,2),
    roi                NUMERIC(10,2),
    language           VARCHAR(50),
    engagement_score   NUMERIC(5,2),
    customer_segment   VARCHAR(100),
    campaign_date      DATE
);

CREATE TABLE tira_campaigns (
    campaign_id        VARCHAR(20),
    campaign_type      VARCHAR(50),
    target_audience    VARCHAR(100),
    duration           INT,
    channel_used       VARCHAR(50),
    impressions        INT,
    clicks             INT,
    leads              INT,
    conversions        INT,
    revenue            NUMERIC(10,2),
    acquisition_cost   NUMERIC(10,2),
    roi                NUMERIC(10,2),
    language           VARCHAR(50),
    engagement_score   NUMERIC(5,2),
    customer_segment   VARCHAR(100),
    campaign_date      DATE
);


-- ============================================================
-- STEP 2 : LOAD CSV DATA
-- Note: Update file paths to match your local system
-- ============================================================

COPY nykaa_campaigns
FROM 'C:/your_path/nykaa_campaign_data.csv'
DELIMITER ',' CSV HEADER;

COPY purplle_campaigns
FROM 'C:/your_path/purplle_campaign_data.csv'
DELIMITER ',' CSV HEADER;

COPY tira_campaigns
FROM 'C:/your_path/tira_campaign_data.csv'
DELIMITER ',' CSV HEADER;


-- ============================================================
-- STEP 3 : VERIFY ROW COUNTS (Each should show 55,555)
-- ============================================================

SELECT COUNT(*) AS nykaa_rows   FROM nykaa_campaigns;
SELECT COUNT(*) AS purplle_rows FROM purplle_campaigns;
SELECT COUNT(*) AS tira_rows    FROM tira_campaigns;
