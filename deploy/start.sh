#!/bin/sh
set -eu

exec java \
  -Xms64m \
  -Xmx320m \
  -Xss256k \
  -XX:MaxMetaspaceSize=128m \
  -jar /app/app.jar
