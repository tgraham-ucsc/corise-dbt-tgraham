{{
  config(
    materialized='table'
  )
}}

select product_id,
    product_name,
    product_price,
    available_quantity    
from {{ ref('stg_products') }}