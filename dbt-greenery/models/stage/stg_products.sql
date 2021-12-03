select
  product_id,
  name as product_name,
  price as product_price,
  quantity as available_quantity
from {{ source('tutorial', 'products') }}