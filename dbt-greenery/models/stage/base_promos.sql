select
  promo_id,
  discout as discount,
  status
from {{ source('tutorial', 'promos') }}