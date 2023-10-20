# Postgis Canada Example

This project demonstrates the usage of Postgis, a postgres extension for parsing geospatial data.

To start the services:

1) `docker compose -f docker-compose.yml up -d`

2) `make build`

The bootstrapping can take around ~5 minutes or so because the geometry parsing with `shp2pgsql` takes a second.

# Requirements

# For Ubuntu
`apt-get install postgresql postgis`