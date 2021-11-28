{{
  config(
    materialized='table'
  )
}}

with user_orders as (

  select count(order_id) as total_orders, 
    max(order_date) as most_recent_order, 
    min(order_date) as first_order,
    sum(round (cast( order_cost as numeric),2)) as total_spend,
    extract(day from actual_delivery_date - order_date) as days_to_deliver ,
    user_id
  from {{ ref('fct_orders') }}
    group by user_id, days_to_deliver
  ),

users as (
  select *
  from {{ ref('dim_users') }}
),

final as (
  select 
    user_orders.total_orders,
    user_orders.total_spend,
    user_orders.first_order,
    user_orders.most_recent_order,
    user_orders.days_to_deliver,
    users.full_name
  from user_orders 
    left join users using (user_id)
    
)

select * from final