--- Insert Data into Unified via 'UNION ALL'

INSERT INTO dbo.Facts_Multiple_Channels_Ads (
    data_date,
    platform,
    campaign_id,
    campaign_name,
    impressions,
    click,
    spend,
    conversions
)

-- Facebook
SELECT
    date as Data_Date,
    'Facebook' AS Platform,
    campaign_id,
    campaign_name,
    impressions,
    clicks as click,
    spend,
    conversions
 FROM dbo.facebook_ads

UNION ALL

-- Google
SELECT
    date as Data_Date, ---change string to date
    'Google' AS Platform,
    campaign_id,
    campaign_name,
    impressions,
    clicks as click,
    cost as spend,
    conversions
FROM dbo.google_ads

UNION ALL

-- TikTok
SELECT
    date as Data_Date,
    'Tiktok' AS Platform,
    campaign_id,
    campaign_name,
    impressions,
    clicks as click,
    cost as spend,
    conversions
 FROM dbo.tiktok_ads;


