{{ config(materialized='table') }}

select
    province
    , census_division_name
    , city
    , odhf_facility_type
    , count(*) as facilities
from {{ ref('dim_healthcare_facilities') }}
group by
    grouping sets
    (
            (1, 4)
            , (1, 2, 4)
            , (1, 2, 3, 4)
    )
