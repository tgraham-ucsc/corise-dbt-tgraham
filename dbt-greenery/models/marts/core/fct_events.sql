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
   case 
      when e.product_id = 'signup' then null
      when e.product_id = 'checkout' then null
      when e.product_id = 'shipping' then null
      when e.product_id = 'browse' then null
      when e.product_id = 'help' then null    
      when e.product_id = 'greenary.com' then null            
      else 
        e.product_id
   end,
   p.product_name,
   p.product_price
from {{ ref('stg_events') }} e
left join {{ ref('stg_products') }} p
  on e.product_id = p.product_id
