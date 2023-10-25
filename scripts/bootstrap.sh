#!/bin/bash

# Hack to allow for postgres container to listen on 5432
# which takes a second because the db init requires installation of deps

sleep 45

hc_filename=tmp_ODHF_v1_1.zip
proj_path=/usr/app

export PGPASSWORD=tm41m

curl -o $hc_filename https://www150.statcan.gc.ca/n1/en/pub/13-26-0001/2020001/ODHF_v1.1.zip
unzip $hc_filename -d tmp/
rm -f $hc_filename

psql -h postgres -p 5432 -d tm41m -U tm41m < $proj_path/migrations/20231020_createhcdata.up.sql

cd_filename=tmp_lcd_000b21a_e.zip

curl -o $cd_filename https://www12.statcan.gc.ca/census-recensement/2021/geo/sip-pis/boundary-limites/files-fichiers/lcd_000b21a_e.zip

unzip $cd_filename -d tmp/
rm -f $cd_filename

shp2pgsql -D -I -s 3347 tmp/lcd_000b21a_e.shp statcan.census_divisions | psql -h postgres -p 5432 -U tm41m -d tm41m

dbt run
