select
  order_id,
  product_id,
  quantity as order_quantity
from {{ source('tutorial', 'order_items') }}