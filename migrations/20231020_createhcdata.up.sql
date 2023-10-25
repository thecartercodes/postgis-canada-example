BEGIN;

CREATE SCHEMA IF NOT EXISTS statcan;

CREATE TABLE IF NOT EXISTS statcan.healthcare_facilities (
    idx text primary key,
    facility_name text,
    source_facility_type text,
    odhf_facility_type text,
    provider text,
    unit text,
    street_no text,
    street_name text,
    postal_code char(7),
    city text,
    province char(2),
    source_format_str_address text,
    CSDname text,
    CSDuid text,
    Pruid text,
    latitude numeric(32,8),
    longitude numeric(32,8)
)
;

\COPY statcan.healthcare_facilities FROM 'tmp/ODHF_v1.1/odhf_v1.1.csv' WITH CSV HEADER ENCODING 'WIN1252';

COMMIT;
