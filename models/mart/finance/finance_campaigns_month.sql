SELECT 
    DATE_TRUNC(date_date, MONTH) AS date_month,
    ROUND(SUM(ads_margin),2) AS ads_margin,
    ROUND(SUM(average_basquet),2) AS average_basquet,
    ROUND(SUM(operational_margin),2) AS operational_margin,
    ROUND(SUM(ads_cost),2) AS ads_cost,
    ROUND(SUM(ads_impression),2) AS ads_impression,
    ROUND(SUM(ads_clicks),2) AS ads_clicks,
FROM {{ref("finance_campaigns_day")}}
GROUP BY date_month