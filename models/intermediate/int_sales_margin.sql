SELECT 
    products_id,
    purchase_price,
    quantity,
    revenue,
    ---purchase_price*quantity AS purchase_cost,
    ---revenue-(purchase_price*quantity) AS margin
JOIN {{ref("stg_raw__product")}}
USING(products_id)