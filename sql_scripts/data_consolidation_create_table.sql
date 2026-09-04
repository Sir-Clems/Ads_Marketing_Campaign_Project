use Adsmarketing

---Data Consolidation.

---Create Facts Table
CREATE TABLE dbo.Facts_All_Channels_Ads (
    data_date date,
    platform varchar(50),
    campaign_id varchar(50),
    campaign_name varchar(100),
    impressions int,
    click int,
    spend decimal(10,3),
    conversions int
   );


