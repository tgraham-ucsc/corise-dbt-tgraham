with total_visits as  (

    select count(*) from {{ ref('fct_events') }}

),

total_orders as (

    select count(*) from {{ ref('fct_orders') }}
    
)

select round(total_orders.count * 100.0 / total_visits.count , 1) as conversion_rate
from total_orders, total_visits 
