-- ============================================================
-- PROJECT  : Multi-Brand Beauty Marketing Campaign Analysis
-- FILE     : 04_kpi_analysis.sql
-- PURPOSE  : Calculate key marketing KPIs across dimensions
-- AUTHOR   : Muskan
-- TOOL     : PostgreSQL
-- ============================================================
-- KPIs Calculated:
--   CTR  = clicks / impressions * 100
--   CVR  = conversions / clicks * 100
--   ROAS = revenue / acquisition_cost
--   CPL  = acquisition_cost / leads
--   CPC  = acquisition_cost / clicks
-- ============================================================


-- ============================================================
-- 4.1 : KPIs BY BRAND
-- ============================================================

SELECT
    brand,
    ROUND(SUM(clicks)::NUMERIC / NULLIF(SUM(impressions), 0) * 100, 2)     AS ctr_percent,
    ROUND(SUM(conversions)::NUMERIC / NULLIF(SUM(clicks), 0) * 100, 2)     AS cvr_percent,
    ROUND(SUM(revenue)::NUMERIC / NULLIF(SUM(acquisition_cost), 0), 2)     AS roas,
    ROUND(SUM(acquisition_cost) / NULLIF(SUM(leads), 0), 2)                AS cpl,
    ROUND(SUM(acquisition_cost) / NULLIF(SUM(clicks), 0), 2)               AS cpc
FROM all_campaigns
GROUP BY brand
ORDER BY roas DESC;


-- ============================================================
-- 4.2 : KPIs BY CAMPAIGN TYPE
-- ============================================================

SELECT
    brand,
    campaign_type,
    COUNT(campaign_id)                                                      AS total_campaigns,
    ROUND(SUM(clicks)::NUMERIC / NULLIF(SUM(impressions), 0) * 100, 2)     AS ctr_percent,
    ROUND(SUM(conversions)::NUMERIC / NULLIF(SUM(clicks), 0) * 100, 2)     AS cvr_percent,
    ROUND(SUM(revenue)::NUMERIC / NULLIF(SUM(acquisition_cost), 0), 2)     AS roas,
    ROUND(SUM(acquisition_cost) / NULLIF(SUM(leads), 0), 2)                AS cpl,
    ROUND(SUM(acquisition_cost) / NULLIF(SUM(clicks), 0), 2)               AS cpc
FROM all_campaigns
GROUP BY brand, campaign_type
ORDER BY brand, roas DESC;


-- ============================================================
-- 4.3 : KPIs BY CHANNEL
-- Note: channel_used contains multiple channels per row
-- Using unnest() to split into individual channels
-- ============================================================

SELECT
    brand,
    TRIM(UNNEST(STRING_TO_ARRAY(channel_used, ',')))                        AS single_channel,
    COUNT(campaign_id)                                                      AS total_campaigns,
    ROUND(SUM(clicks)::NUMERIC / NULLIF(SUM(impressions), 0) * 100, 2)     AS ctr_percent,
    ROUND(SUM(conversions)::NUMERIC / NULLIF(SUM(clicks), 0) * 100, 2)     AS cvr_percent,
    ROUND(SUM(revenue)::NUMERIC / NULLIF(SUM(acquisition_cost), 0), 2)     AS roas,
    ROUND(SUM(acquisition_cost) / NULLIF(SUM(leads), 0), 2)                AS cpl,
    ROUND(SUM(acquisition_cost) / NULLIF(SUM(clicks), 0), 2)               AS cpc
FROM all_campaigns
GROUP BY brand, single_channel
ORDER BY brand, roas DESC;


-- ============================================================
-- 4.4 : KPIs BY CUSTOMER SEGMENT
-- ============================================================

SELECT
    brand,
    customer_segment,
    COUNT(campaign_id)                                                      AS total_campaigns,
    ROUND(SUM(clicks)::NUMERIC / NULLIF(SUM(impressions), 0) * 100, 2)     AS ctr_percent,
    ROUND(SUM(conversions)::NUMERIC / NULLIF(SUM(clicks), 0) * 100, 2)     AS cvr_percent,
    ROUND(SUM(revenue)::NUMERIC / NULLIF(SUM(acquisition_cost), 0), 2)     AS roas,
    ROUND(SUM(acquisition_cost) / NULLIF(SUM(leads), 0), 2)                AS cpl,
    ROUND(SUM(acquisition_cost) / NULLIF(SUM(clicks), 0), 2)               AS cpc
FROM all_campaigns
GROUP BY brand, customer_segment
ORDER BY brand, roas DESC;
