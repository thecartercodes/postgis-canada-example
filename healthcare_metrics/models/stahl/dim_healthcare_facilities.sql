{{ config(materialized = 'table') }}

select
    hf.*
    , cd.cduid
    , cd.landarea as land_area
    , coalesce(cd.cdname, 'Unknown') as census_division_name
from {{ source('statcan', 'healthcare_facilities') }} as hf
left join {{ source('statcan', 'census_divisions') }} as cd on st_covers(
    cd.geom
    , st_setsrid(
        st_makepoint(
            hf.longitude::double precision
            , hf.latitude::double precision
        )
        , 3347
    )
)
