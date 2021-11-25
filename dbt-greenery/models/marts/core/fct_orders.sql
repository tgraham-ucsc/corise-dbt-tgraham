{{
  config(
    materialized='table'
  )
}}


select 
  o.order_id,
  o.user_id,
  oi.product_id,
  o.order_date,
  oi.order_quantity
from {{ ref('stg_orders') }} o
left join {{ ref('stg_order_items') }} oi
  on o.order_id = oi.order_id 
 