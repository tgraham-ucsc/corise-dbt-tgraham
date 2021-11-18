
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