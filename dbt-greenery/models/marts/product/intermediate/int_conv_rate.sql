with total_orders as (

   select count(*) as orders
   from {{ ref('fct_events') }}
   where event_type = 'checkout'

),

total_visits as (

    select count(session_id) as visits
    from {{ ref('fct_events') }}

)

select round(total_orders.orders * 100.0 / total_visits.visits, 1) as conversion_rate
from total_orders, total_visits