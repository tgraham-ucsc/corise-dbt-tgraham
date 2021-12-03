select
  o.order_id,
  o.user_id,
  o.promo_id,
  o.address_id,
  o.created_at as order_date,
  o.order_cost,
  o.shipping_cost,
  o.order_total,
  o.tracking_id,
  o.shipping_service,
  o.estimated_delivery_at as estimated_delivery_date,
  o.delivered_at as actual_delivery_date,
  o.status as order_status,
  p.discount as promo_discount
from {{ ref ('base_orders') }} o
Left join {{ ref ('base_promos') }} p
on o.promo_id = p.promo_id