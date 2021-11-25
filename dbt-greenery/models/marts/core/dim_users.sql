{{
  config(
    materialized='table'
  )
}}

select 
  u.user_id,
  full_name,
  u.email_address,
  u.phone_number,
  a.address,
  a.zipcode,
  a.state,
  a.country
from {{ ref('stg_users')}} u
left join {{ ref('stg_addresses') }} a 
  on u.address_id = a.address_id    