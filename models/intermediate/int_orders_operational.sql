SELECT 
    orders_id,
    date_date,
    ROUND(margin+shipping_fee-logcost-CAST(ship_cost as float64),2) AS operational_margin,
    quantity,
    revenue,
    purchase_cost,
    margin
FROM {{ref("int_orders_margin")}}
JOIN {{ref("stg_raw__ship")}}
USING(orders_id)
ORDER BY orders_id DESC