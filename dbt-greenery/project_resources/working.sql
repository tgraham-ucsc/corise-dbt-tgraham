with orders_by_products as (

    select 
     order_id,
     product_id,
     order_cost,
     order_total
    from fct_orders
     
     




select 
  du.full_name,
  dp.product_name,
  count(distinct order_id) total_orders,
  sum(fo.order_cost),
  sum(fo.order_total),
  du.zipcode
  
from dbt_tgraham.fct_orders fo
join dbt_tgraham.dim_products dp
  on fo.product_id = dp.product_id
join dbt_tgraham.dim_users du  
  on fo.user_id = du.user_id
group by fo.product_id, product_name, full_name, zipcode
order by full_name

