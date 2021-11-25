{{
  config(
    materialized='table'
   )
}}

with pivot_views as (
select page_url,
       {{ dbt_utils.pivot('event_type', dbt_utils.get_column_values('dbt.dbt_tgraham.fct_events','event_type')) }}
--from {{ ref('fct_events') }}
from dbt.dbt_tgraham.fct_events
group by page_url
)

select * from pivot_views
