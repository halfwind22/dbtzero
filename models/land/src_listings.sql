{{
    config(
    materialized='ephemeral',
    schema='land')
}}

WITH RAW_LISTINGS AS
(SELECT * FROM {{source('airbnb','listings')}})
SELECT 
id as listing_id,
name as listing_name,
listing_url,
room_type,
minimum_nights,
host_id, 
price as price_str_USD,
created_at,
updated_at

FROM RAW_LISTINGS