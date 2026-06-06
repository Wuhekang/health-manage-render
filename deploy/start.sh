#!/bin/sh
set -eu

docker-entrypoint.sh mysqld --bind-address=127.0.0.1 &
db_pid=$!

until mysqladmin ping --host=127.0.0.1 --user=root --password="$MYSQL_ROOT_PASSWORD" --silent; do
  if ! kill -0 "$db_pid" 2>/dev/null; then
    echo "MySQL exited before becoming ready"
    exit 1
  fi
  sleep 1
done

exec java -jar /app/app.jar
