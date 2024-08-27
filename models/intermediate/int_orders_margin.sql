SELECT 
    orders_id,
    date_date,
    ROUND(SUM(revenue),2) AS revenue,
    SUM(quantity) AS quantity,
    ROUND(SUM(CAST(purchase_price as float64)*quantity),2) AS purchase_cost,
    ROUND(SUM(revenue-(CAST(purchase_price as float64)*quantity)),2) AS margin
FROM {{ref("stg_raw__sales")}}
JOIN {{ref("stg_raw__product")}}
USING(products_id)
WHERE CAST(purchase_price AS FLOAT64) IS NOT NULL
GROUP BY orders_id, date_date
ORDER BY orders_id DESC