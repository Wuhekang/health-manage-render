#!/bin/sh
set -eu

docker-entrypoint.sh mysqld \
  --bind-address=127.0.0.1 \
  --performance-schema=OFF \
  --innodb-buffer-pool-size=64M \
  --innodb-log-buffer-size=8M \
  --key-buffer-size=8M \
  --max-connections=30 \
  --table-open-cache=200 \
  --temptable-max-ram=16M &

until mysqladmin ping --host=127.0.0.1 --user=root --password="$MYSQL_ROOT_PASSWORD" --silent; do
  sleep 1
done

exec java \
  -Xms48m \
  -Xmx220m \
  -Xss256k \
  -XX:MaxMetaspaceSize=128m \
  -jar /app/app.jar
