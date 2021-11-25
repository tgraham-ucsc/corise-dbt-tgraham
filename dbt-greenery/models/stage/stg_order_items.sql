{{
  config(
    materialized='table'
  )
}}

SELECT id,
    order_id,
    product_id,
    quantity as order_quantity
FROM {{ source('tutorial', 'order_items') }}