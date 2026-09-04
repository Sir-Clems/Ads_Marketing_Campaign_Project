# ADS MARKETING CAMPAIGN PROJECT

 ## Multi-Channel Ads Marketing Campaign Analysis

The project is an end-to-end marketing analytics that consolidates Facebook, Google, and TikTok advertising performance into one fact table, then turns it into a Power BI dashboard for channel and campaign decision-making.


![Project Workflow chart](/images/ads_campaign_workflow.png)


## Project overview

Paid-media data is often spread across platforms with different exports and reporting conventions. This project brings three channel-level CSV extracts together in Microsoft SQL Server using `UNION ALL`, then uses Power BI to measure performance by day, platform, and campaign.


## Business objective

Create a single view of advertising performance that helps a marketing team:

1.  Monitor spend, reach, clicks, and conversions;
2.  Compare the contribution of Facebook, Google, and TikTok;
3.  Identify campaign groups that deserve optimisation or incremental investment; and
4.  Track daily spend alongside conversions.


## Data sources

| Source | Description |
|---|---|
|[Facebook Ads csv](data_source/01_facebook_ads.csv) | Facebook campaign performance export |
| [Google Ads Campaign csv](data_source/02_google_ads.csv) | Google Ads campaign performance export |
|[Tiktok Ads Campaign csv](data_source/03_tiktok_ads.csv) | TikTok campaign performance export |

Each extract contains channel campaign-performance records which are standardized into a common reporting structure.


## Data preparation and modelling

The three platform tables were combined in Microsoft SQL Server into a single reporting fact table:


**Data Consolidation.**

*Below is the sql script used to create the  `Facts Table`*

[Fact table creation sql script](/sql_scripts/data_consolidation_create_table.sql)

*The sql script below was used Insert Data into Unified Table via `UNION ALL`*

[Insert into unified table sql script](/sql_scripts/data_consolidation_insert_into.sql)


`UNION ALL` is appropriate because the source tables are separate platform extracts; preserving all rows avoids unintentionally removing valid campaign records that share the same metric values.

The consolidated table `Facts_Multiple_Channel_Ads`, was then loaded into Power BI for transformation, measure creation, and dashboard design. The dashboard supports filtering by platform and campaign name.


## KPI definitions

| KPI | Calculation | Why it matters |
|---|---|---|
| Total Spend | `SUM(Spend)` | Total paid-ad investment |
| Total Impressions | `SUM(Impressions)` | Delivered ad exposure |
| Total Clicks | `SUM(Clicks)` | Engagement or engagement with the ad |
| Total Conversions | `SUM(Conversions)` | Desired business actions |
| CPA | `Total Spend / Total Conversions` | Cost to generate a conversion |
| CTR | `Total Clicks / Total Impressions` | Click efficiency |
| CPC | `Total Spend / Total Clicks` | Cost to acquire a click |


## The Campaign Dashboard

![Power BI dashboard overview](/images/power_bi_dashboard.png)



## The Dashboard results

The completed dashboard reports the following headline performance:

| Metric | Result |
|---|---:|
| Total spend | **$130.24K** |
| Total impressions | **40M** |
| Total clicks | **688K** |
| Total conversions | **13K** |
| CPA | **$9.75** |
| CTR | **1.70%** |
| CPC | **$0.19** |



### Channel highlights

1.  **TikTok** generated the largest share of both spend and conversions: **$74.27K** in spend and **6,750** conversions.

2.  **Google Ads** contributed **4,218** conversions from **$37.69K** in spend, making it an important conversion driver alongside TikTok.

3.  **Facebook** accounted for the remaining **2,395** conversions and adds useful channel diversification.

4.  The dashboard's daily chart makes it possible to inspect whether higher investment days are followed by proportional conversion growth, while campaign filters support drill-down analysis.



## Insights and Recommendations

### Recommendations

1. **Prioritise TikTok campaigns.**  
   Keep funding TikTok because it generates approximately half of all conversions. Identify the campaign groups with the strongest CPA and conversion results, then increase their budget gradually.

2. **Check CPA before moving budget.**  
   Compare the CPA and conversion quality of each TikTok and Google campaign group. Move budget only to campaigns that deliver conversions at an acceptable cost.

3. **Fix weak campaigns before scaling them.**  
   Identify campaigns with high CPC or CPA, low CTR, or few conversions. Test new creatives, audience segments, keywords, and landing-page versions. Increase budget only after the tests improve performance.

4. **Track spend and conversions every day.**  
   Compare each campaign’s daily spend with its conversion results. If spend rises but conversions do not, check for audience saturation or creative fatigue, then reduce or reallocate the budget.



## Tools Used
Microsoft SQL Server, SQL, Power BI


## Data formats
CSV


## Repository structure

```text
Ads _Marketing_Campaign_Project
|
│   .gitignore
│   README.md
│   
├───data_source
│       01_facebook_ads.csv
│       02_google_ads.csv
│       03_tiktok_ads.csv
│       
├───images
│       ads_campaign_workflow.png
│       power_bi_dashboard.png
│       
└───sql_scripts
        data_consolidation_create_table.sql
        data_consolidation_insert_into.sql
        


## How to reproduce

1. Load the three CSV files into Microsoft SQL Server as staging/source tables.

2. Standardize compatible fields and consolidate them with `UNION ALL` into `Facts_Multiple_Channel_Ads`.

3. Load the fact table into Power BI.

4. Create measures for spend, impressions, clicks, conversions, CPA, CTR, and CPC.

5. Build KPI cards, daily spend-versus-conversion trend analysis, platform comparison, campaign-level detail, and platform/campaign slicers.


## Author

**Akpehe Terlumun Clement** | Data Analyst

*clementqs@gmail.com*
