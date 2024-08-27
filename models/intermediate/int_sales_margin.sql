SELECT 
    products_id,
    CAST(purchase_price as float64) AS purchase_price,
    quantity,
    revenue,
    CAST(purchase_price as float64)*quantity AS purchase_cost,
    ROUND(revenue-(CAST(purchase_price as float64)*quantity),2) AS margin
FROM {{ref("stg_raw__sales")}}
JOIN {{ref("stg_raw__product")}}
USING(products_id)
WHERE CAST(purchase_price AS FLOAT64) IS NOT NULL