FROM ghcr.io/dbt-labs/dbt-postgres:1.5.2

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -yqq \
    && apt-get install -yqq --no-install-recommends \
        postgis \
        curl \
        unzip \
        sudo \
        postgresql

ENTRYPOINT [ "/bin/bash" ]