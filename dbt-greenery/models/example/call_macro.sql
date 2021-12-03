{% set query %}

    select
      distinct event_type
    from {{ ref('fct_events') }}

{% endset %}



select
  session_id,
  user_id,
  product_id,
  product_name

  {% for event_type in get_result_set(query) %}
  , sum(case when event_type = '{{event_type}}' then 1 else 0 end) as {{event_type}} 
  {% endfor %}

from {{ ref('fct_events') }}

group by 1,2,3,4
     