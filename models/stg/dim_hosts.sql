{{
    config(
    materialized='view',
    schema='stg')
}}

WITH land_hosts AS(
    SELECT * FROM {{ref('src_hosts')}}
)
SELECT 
HOST_ID,
NVL(HOST_NAME,'Anonymous') AS HOST_NAME,
IS_SUPERHOST,
CREATED_AT,
UPDATED_AT

FROM land_hosts
