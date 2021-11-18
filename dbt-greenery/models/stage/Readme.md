
## How many users do we have?

```
-- calculate total number of users
with total_users as (
    select count(distinct user_id)
    from users
)
select *
from total_users

```
## On average, how many orders do we receive per hour?

```
-- calculate number of days and divide by 24
with total_hours as (
    select count(distinct(date_trunc('day', created_at))) * 24
    from dbt_tgraham.stg_orders
),
-- count distinct number of orders
total_orders as (
    select count(distinct order_id)
    from dbt_tgraham.stg_orders
)
-- divde total_orders by total_hours

 select (
         select *
         from total_orders
     ) / (
         select *
         from total_hours
     ) as average_orders_per_hour

```

## On average, how long does an order take from being placed to being delivered?

```

-- calculate diff between delivered and created to the hour
with total_delivery_hours as (

select  sum(EXTRACT(EPOCH FROM delivered_at - created_at )/3600)
from dbt_tgraham.stg_orders
where status = 'delivered'
),

-- calculate total orders
total_orders as (
select count(distinct order_id)
from dbt_tgraham.stg_orders
where status = 'delivered'
)
-- divide total_delivery_hours by total_orders 
-- multiply by 24 and round to days
 select round((
         select *
         from total_delivery_hours
     ) / (
         select *
         from total_orders
     ) / 24) as average_days_per_delivery

```

## How many users have only made one purchase? Two purchases? Three+ purchases?
```
select count(a.user_id), a.count
from (
select user_id,
    count(order_id)
from dbt_tgraham.stg_orders
group by user_id
having count(*) <= 3) a

group by 2
order by 2

```

## On average, how many unique sessions do we have per hour?

```
with total_hours as (
    select count(distinct(date_trunc('day', created_at))) * 24
    from dbt_tgraham.stg_events
),

total_sessions as (
    select count(distinct session_id)
    from dbt_tgraham.stg_events
)

-- divde total_hours by total_sessions

 select (
         select *
         from total_hours
     ) / (
         select *
         from total_sessions
     ) as average_sessions_per_hour

```