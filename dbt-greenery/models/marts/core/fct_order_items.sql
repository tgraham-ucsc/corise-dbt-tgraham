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
  o.shipping_cost,
  o.order_total,
  o.order_status,
  o.tracking_id,
  o.shipping_service,
  o.estimated_delivery_date,
  o.actual_delivery_date,
  o.promo_discount,
  oi.product_id,
  oi.order_quantity,
  p.product_name
from {{ ref('stg_orders') }} o
left join {{ ref('stg_order_items') }} oi
  on o.order_id = oi.order_id
  left join {{ ref('dim_products') }} p 
  on oi.product_id = p.product_id

 