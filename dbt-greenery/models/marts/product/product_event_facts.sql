{{
  config(
    materialized='table'
   )
}}

with pivot_views as (

select 
  product_name,
  product_price,
  min(event_date) as first_view,
  max(event_date) as last_view,
extract(
        day
        from max(event_date) - min(event_date)
    ) as days_between,
  {{ dbt_utils.pivot(
    'event_type',
    dbt_utils.get_column_values(ref('int_product_events'), 'event_type')
  ) }}
from {{ ref('int_product_events') }}
group by product_name,
  product_price
)
select *
from pivot_views

