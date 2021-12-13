{{
  config(
    materialized='table'
   )
}}

{% set query %}

    select
      distinct event_type
    from {{ ref('fct_events') }}

{% endset %}

with pcr as (
  
    select * from {{ ref('int_conv_rate_product') }} 

),

product_event_facts as (

  select 
    fe.product_name,
    fe.product_price,
    pcr.orders as orders_by_product,
    pcr.conversion_rate

  {% for event_type in get_result_set(query) %}
  , sum(case when fe.event_type = '{{event_type}}' then 1 else 0 end) as {{event_type}} 
  {% endfor %}
 
  from {{ ref('fct_events') }} fe
  join pcr on fe.product_name = pcr.product_name
  group by 1, 2, 3, 4

)

select * from product_event_facts