{{
  config(
    materialized='table'
  )
}}

with page_views as (
  select count(page_url) total_page_views,
    user_id
  from {{ ref('stg_events') }}
  group by user_id
),

user_orders as (
  select count(order_id) total_orders,
    user_id
  from {{ ref('stg_orders') }}
  group by user_id
),

max_order as (
  select max(created_at) last_order, user_id
  from {{ ref('stg_orders') }}
  group by user_id
),

min_order as (
  select min(created_at) first_order, user_id
  from {{ ref('stg_orders') }}
  group by user_id
),



total_cost as (
  select sum(round (cast( order_cost as numeric),2)) total_spend,
   user_id
  from {{ ref('stg_orders') }}
  group by user_id
),


users as (
  select *
  from {{ ref('stg_users') }}
),

final as (
  select page_views.total_page_views,
    user_orders.total_orders,
    total_cost.total_spend,
    min_order.first_order,
    max_order.last_order,
    users.full_name
  from page_views
    left join user_orders using (user_id)
    left join users using (user_id)
    left join total_cost using (user_id)
    left join max_order using (user_id)
    left join min_order using (user_id)
)

select * from final

    