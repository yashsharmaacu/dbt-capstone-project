with runways as (
    select * from {{ ref('src_runways') }}
)

SELECT
    runway_id,
    airport_ident,
    runway_length_ft,
    runway_width_ft,
    case
        when (runway_surface = '' or runway_surface is null) then '__UNKNOWN__'
        else runway_surface
    end as runway_surface,
    runway_lighted,
    runway_closed
FROM
    runways