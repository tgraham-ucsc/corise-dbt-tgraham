{{
  config(
    materialized='table'
  )
}}

SELECT 
  o.order_id,
  o.user_id,
  o.promo_id,
  o.address_id,
  o.created_at,
  o.order_cost,
  o.shipping_cost,
  o.order_total,
  o.tracking_id,
  o.shipping_service,
  o.estimated_delivery_at,
  o.delivered_at,
  o.status,
  p.discount
FROM {{ ref ('base_orders') }} o
Left JOIN {{ ref ('base_promos') }} p
on o.promo_id = p.promo_id