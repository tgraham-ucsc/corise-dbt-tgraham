{{
  config(
    materialized='table'
  )
}}

select 
    id,
    address_id,
    address,
    zipcode,
    state,
    country
FROM {{ source('tutorial', 'addresses') }}