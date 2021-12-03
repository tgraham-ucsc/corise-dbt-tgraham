{{
  config(
    materialized='table'
  )
}}

{% set query %}

  select distinct product_id
  from {{ ref('stg_events') }}
  where product_id not in (
      select product_id
      from {{ ref('dim_products') }}
  )

    {% endset %}


select 
   e.event_id,
   e.session_id,
   e.user_id,
   e.page_url,
   e.event_date,
   e.event_type,
  case
     {% for product_id in get_result_set(query) -%}
       when e.product_id = '{{ product_id }}' then null 
     {% endfor -%}
  else
   e.product_id
  end, 
   p.product_name,
   p.product_price
from {{ ref('stg_events') }} e
left join {{ ref('stg_products') }} p
  on e.product_id = p.product_id
