{{
  config(
    materialized='incremental',
    on_schema_change='fail',
    schema='stg'
  )
}}

WITH src_reviews AS(
    SELECT 
    {{ dbt_utils.surrogate_key(['LISTING_ID',
    'REVIEW_DATE',
    'REVIEWER_NAME',
    'REVIEW_TEXT',
    'REVIEW_SENTIMENT']) }} AS review_id,
    * FROM {{ref('src_reviews')}}
    {% if is_incremental()%}
    WHERE REVIEW_DATE>(SELECT MAX(REVIEW_DATE) FROM {{this}})
    {%endif%}
)
SELECT * FROM src_reviews