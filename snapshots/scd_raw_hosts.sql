{% snapshot scd_raw_hosts %}

{{
    config(
      target_schema='land',
      unique_key='id',
      strategy='check',
      check_cols=['NAME','IS_SUPERHOST','UPDATED_AT']
    )
}}

select * from {{ source('airbnb', 'hosts') }}

{% endsnapshot %}