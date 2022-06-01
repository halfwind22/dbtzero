{{
    config(
        materialized='table',
        schema='tgt'
    )
}}

with
    full_moon_dates as (select * from {{ ref("seed_full_moon_dates") }}),
    reviews as (select * from {{ ref("fct_reviews") }})

select
    r.*,
    case
        when fm.full_moon_date is null then 'Not a Full Moon' else 'Full Moon'
    end as is_full_moon

from reviews r
left join full_moon_dates fm on date(r.review_date) = dateadd(day, 1, fm.full_moon_date)
