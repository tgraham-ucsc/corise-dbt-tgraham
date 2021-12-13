{% 
  set event_types = [
    'account_created',
    'page_view',
    'add_to_cart',
    'delete_from_cart',
    'checkout'
  ]
%}

select
  event_date,
  user_id,
  session_id
  {% for event_type in event_types %}
  , count(distinct case when event_type = '{{event_type}}' then event_id end) as {{event_type}}
  {% endfor %}
from {{ ref("fct_events") }}
group by 1, 2, 3