
with total_visits as  (

    select count(*) from dbt_tgraham.fct_events

),

total_orders as (

    select count(*) from dbt_tgraham.fct_orders
    

)

select round(total_orders.count * 100.0 / total_visits.count , 1) as percent
from total_orders, total_visits 



-- SELECT availablePlaces, capacity, 
--        ROUND(availablePlaces * 100.0 / capacity, 1) AS Percent
-- FROM mytable