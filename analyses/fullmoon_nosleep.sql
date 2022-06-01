WITH full_moon_reviews AS(
    SELECT * FROM {{ref('full_moon_reviews')}}
)
SELECT COUNT(*) FROM 
full_moon_reviews
