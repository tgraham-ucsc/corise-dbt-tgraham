{{
  config(
    materialized='table'
  )
}}


SELECT id,
    order_id,
    user_id,
    promo_id,
    address_id,
    created_at,
    order_cost,
    shipping_cost,
    order_total
FROM {{ source('tutorial', 'orders') }}