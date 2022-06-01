{{
    config(
    materialized='table',
    schema='stg')
}}

WITH stg_hosts AS(
    SELECT * FROM {{ ref('dim_hosts')}}
),
stg_listings AS(
    SELECT * FROM {{ ref('dim_listings')}}
)
SELECT 
h.HOST_ID,
h.HOST_NAME,
IS_SUPERHOST,
LISTING_ID,
LISTING_NAME,
ROOM_TYPE,
MINIMUM_NIGHTS,
PRICE,
GREATEST(h.CREATED_AT,l.CREATED_AT) AS CREATED_AT,
GREATEST(h.UPDATED_AT,l.UPDATED_AT) AS UPDATED_AT

FROM 
stg_hosts h
LEFT JOIN 
stg_listings l ON h.HOST_ID=l.HOST_ID