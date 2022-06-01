SELECT *
FROM {{ref('fct_reviews')}} fr
LEFT JOIN {{ref('dim_listings')}} dl
ON fr.LISTING_ID=dl.listing_id
WHERE TO_DATE(fr.REVIEW_DATE) <= TO_DATE(dl.created_at)