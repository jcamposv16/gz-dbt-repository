SELECT 
    date_date,
    ROUND((operational_margin-ads_cost),2) AS ads_margin,
    average_basquet,
    operational_margin,
    ads_cost,
    ads_impression,
    ads_clicks,
FROM {{ref("finance_days")}}
JOIN {{ref("int_campaigns_day")}}
USING(date_date)
ORDER BY date_date DESC
