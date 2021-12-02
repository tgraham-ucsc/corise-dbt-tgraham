with total_visits as  (

    select count(*) from {{ ref('fct_events') }}

),

total_orders as (

    select count(*) from {{ ref('fct_orders') }}
    

)

select (
        select *
        from total_visits
    ) / (
        select *
        from total_orders
    ) as conversion_rate
