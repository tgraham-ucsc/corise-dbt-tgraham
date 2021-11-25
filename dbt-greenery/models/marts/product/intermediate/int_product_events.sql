{{
  config(
    materialized='table'
  )
}}


select 
   e.event_id,
   e.session_id,
   e.user_id,
   e.page_url,
   e.event_date,
   e.event_type,
   e.product_id,
   p.product_name,
   p.product_price
from {{ ref('stg_events') }} e
join {{ ref('stg_products') }} p
  on e.product_id = p.product_id