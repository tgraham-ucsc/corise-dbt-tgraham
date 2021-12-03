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

with product_conv_rate as (
  
    select * from {{ ref('int_conv_rate_product') }} 

),

product_event_facts as (

  select 
    fe.product_name,
    fe.product_price,
    min(fe.event_date) as first_view,
    max(fe.event_date) as last_view,
    extract(day from max(fe.event_date) - min(fe.event_date)) as days_between
  
  {% for event_type in get_result_set(query) %}
  , sum(case when fe.event_type = '{{event_type}}' then 1 else 0 end) as {{event_type}} 
  {% endfor %}
  ,product_conv_rate.orders as orders_by_product
  ,product_conv_rate.conversion_rate
  from {{ ref('fct_events') }} fe
  join product_conv_rate
  on fe.product_name = product_conv_rate.product_name
  group by fe.product_name, fe.product_price, product_conv_rate.conversion_rate, product_conv_rate.orders

)

select * from product_event_facts





