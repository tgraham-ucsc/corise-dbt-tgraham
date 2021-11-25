{{
  config(
    materialized='table'
  )
}}

SELECT id,
    event_id,
    session_id,
    user_id,
    page_url,
    created_at as event_date,
    event_type,
    cast(reverse(split_part(reverse(page_url), '/', 1)) as VARCHAR) as product_id 
FROM {{ source('tutorial', 'events') }}