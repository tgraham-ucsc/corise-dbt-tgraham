select
  u.first_name,
  u.last_name,
  e.session_id,
  e.user_id,
  e.page_url,
  e.event_type,
  e.event_date,
  o.order_id,
  o.order_total,
  o.order_status
from {{ ref('stg_orders') }} o
join {{ ref('stg_events') }} e
  on e.user_id = o.user_id
join {{ ref('stg_users') }} u
  on e.user_id = u.user_id