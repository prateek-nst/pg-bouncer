#!/bin/bash
set -e

if [ -z "$(ls -A "$PGDATA")" ]; then
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
        CREATE USER dbuser WITH ENCRYPTED PASSWORD 'dbuser';
        CREATE DATABASE dbuser OWNER dbuser;

        CREATE USER user1 WITH ENCRYPTED PASSWORD 'user1';
        CREATE DATABASE user1 OWNER user1;

        CREATE USER user2 WITH ENCRYPTED PASSWORD 'user2';
        CREATE DATABASE user2 OWNER user2;

        CREATE USER user3 WITH ENCRYPTED PASSWORD 'user3';
        CREATE DATABASE user3 OWNER user3;
    EOSQL