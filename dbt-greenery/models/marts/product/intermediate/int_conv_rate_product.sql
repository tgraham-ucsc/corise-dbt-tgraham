with add_to_cart as (
    
    select 
      atc.session_id,
      atc.product_name
    from {{ ref('fct_events') }} atc
    where atc.event_type = 'add_to_cart'

),

checkout as (
    select 
      c.session_id,
      c.product_name
    from {{ ref('fct_events') }} c
    where c.event_type = 'checkout'

),

total_orders as (
    select 
      count(add_to_cart.session_id) as orders,
      add_to_cart.product_name
    from add_to_cart
    join checkout 
      on checkout.session_id = add_to_cart.session_id
    group by add_to_cart.product_name
),

page_views as (
    
    select 
      count(page_url) as page_views,
      product_name
    from {{ ref('fct_events') }}
    group by product_name

)

select 
  total_orders.orders,
  page_views.page_views,
  page_views.product_name,
 round(total_orders.orders * 100.0 / page_views.page_views, 1) as conversion_rate
from page_views
  join total_orders 
  on page_views.product_name = total_orders.product_name
