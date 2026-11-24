with airports_snapshot AS (
    select * from {{ ref('scd_silver_airports') }}
)
select
    *
from
    airports_snapshot
where
    airport_ident = '01CN'
order by
    dbt_valid_from