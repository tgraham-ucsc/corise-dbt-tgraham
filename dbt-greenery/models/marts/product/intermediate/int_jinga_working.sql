{{
  config(
    materialized='table'
  )
}}


{%

    set event_types = [
        'delete_from_cart',
        'checkout',
        'page_view',
        'add_to_cart',
        'package_shipped',
        'account_created'
    ]
%}

select
  session_id,
  user_id,
  product_id,
  product_name

  {% for event_type in event_types %}
  , sum(case when event_type = '{{event_type}}' then 1 else 0 end) as {{event_type}} 
{% endfor %}
from {{ ref('fct_events') }}

group by 1,2,3,4
     

