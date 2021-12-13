WITH session_bool as (

SELECT session_id,
       COUNT(case WHEN event_type='page_view' THEN 1 END) as pv,
       COUNT(case WHEN event_type='add_to_cart' THEN 1 END) as atc,
       COUNT(case WHEN event_type='checkout' THEN 1 END) as c
FROM {{ (ref('fct_events')) }} 
group by 1

),


product_funnel as (

SELECT COUNT(CASE WHEN (pv > 0 or atc > 0 or c > 0) THEN 1 END) as level_1,
       COUNT(CASE WHEN (atc > 0 or c > 0) THEN 1 END) as level_2,
       COUNT(CASE WHEN (c > 0) THEN 1 END) as level_3
FROM session_bool


)

select * from product_funnel





