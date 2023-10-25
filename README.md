# Postgis Canada Example

This project demonstrates the usage of Postgis, a postgres extension for parsing geospatial data.

To start the services:

`make build`

The bootstrapping can take around ~5 minutes or so because the geometry parsing with `shp2pgsql` takes a second.

# Requirements

`docker` with `docker compose`