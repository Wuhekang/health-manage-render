#!/bin/sh
set -eu

docker-entrypoint.sh mysqld --bind-address=127.0.0.1 &

until mysqladmin ping --host=127.0.0.1 --user=root --password="$MYSQL_ROOT_PASSWORD" --silent; do
  sleep 1
done

exec java -jar /app/app.jar
