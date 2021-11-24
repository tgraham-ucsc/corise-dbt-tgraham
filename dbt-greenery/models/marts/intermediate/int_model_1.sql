{{
  config(
    
    materialized='table'
  )
}}


with page_views as (

select count(page_url) total_page_views, user_id
from dbt_tgraham.stg_events
group by user_id

), 

user_orders as (

select count(order_id) total_orders, user_id
from dbt_tgraham.base_orders
group by user_id

),

users as (
    select * from dbt_tgraham.stg_users
),

final as (
select page_views.total_page_views,
       user_orders.total_orders,
       users.full_name
from page_views
     left join user_orders using (user_id)
     left join users using (user_id)
)

select * from final

    