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
  o.promo_discount
from {{ ref('stg_orders') }} o
 