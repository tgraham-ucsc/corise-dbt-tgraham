{{
  config(
    materialized='table'
  )
}}


select 
  o.order_id,
  o.user_id,
  o.order_date,
  o.order_cost,
  oi.product_id,
  oi.order_quantity
from {{ ref('stg_orders') }} o
left join {{ ref('stg_order_items') }} oi
  on o.order_id = oi.order_id 
 