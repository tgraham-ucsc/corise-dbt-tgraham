{{
  config(
    
    materialized='table'
  )
}}

SELECT 
    user_id,
    first_name,
    last_name,
    first_name || ' ' || last_name AS full_name,
    email as email_address,
    phone_number,
    created_at,
    updated_at,
    address_id
FROM {{ source('tutorial', 'users') }}