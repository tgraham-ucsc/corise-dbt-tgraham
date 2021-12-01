select
    du.full_name, 
     e.page_url,
    e.event_type,
    o.order_id,
    o.order_total,
    o.status
from public.orders o
    join public.events e
    on e.user_id = o.user_id
    join dbt_tgraham.dim_users du
    on e.user_id = du.user_id