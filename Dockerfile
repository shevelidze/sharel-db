FROM postgres:14.1-bullseye

ENV POSTGRES_PASSWORD "password"
COPY init-db.sql /docker-entrypoint-initdb.d/

EXPOSE 5432
