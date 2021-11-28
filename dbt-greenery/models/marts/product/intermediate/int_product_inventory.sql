{{
  config(
    materialized='table'
  )
}}

select
    p.product_id,
    p.product_name,
    p.product_price,
    p.available_quantity,
    oi.order_id,
    oi.order_quantity
from {{ ref('stg_products') }} p
 join {{ ref('stg_order_items') }} oi
   on p.product_id = oi.product_id