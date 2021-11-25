{{
  config(
    materialized='table'
  )
}}

SELECT id,
    product_id,
    name as product_name,
    price as product_price,
    quantity as available_quantity
FROM {{ source('tutorial', 'products') }}