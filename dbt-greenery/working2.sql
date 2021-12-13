with total_unique_sessions as (

select distinct session_id
from events


),

total_page_views as (

select distinct session_id
from events
where event_type ='page_view'

),

total_add_to_carts as (

select distinct session_id
from events
where event_type ='add_to_cart'

),

sessions_with_transactions as (

select distinct session_id
from events
where event_type ='checkout'

)
select 
       COUNT(total_unique_sessions.session_id),
       COUNT(total_page_views.session_id),
       COUNT(total_add_to_carts.session_id),
       COUNT(sessions_with_transactions.session_id)
from total_unique_sessions
left outer join total_page_views 
       on total_unique_sessions.session_id = total_page_views.session_id
left outer join total_add_to_carts 
       on total_unique_sessions.session_id = total_add_to_carts.session_id    
left outer join sessions_with_transactions 
       on total_unique_sessions.session_id = sessions_with_transactions.session_id    


with session_bool as (
    SELECT
    session_id,
    COUNT(CASE WHEN event_type = 'add_to_cart' THEN 1 END) AS atc,
    COUNT(CASE WHEN event_type = 'checkout' THEN 1 END) AS c 
    FROM dbt_tgraham.fct_events
    GROUP BY 1
)

SELECT COUNT(CASE WHEN (atc > 0 or c > 0) THEN 1 END) AS level_two
FROM  session_bool       