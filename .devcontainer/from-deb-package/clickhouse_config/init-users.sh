#!/bin/bash
set -e

echo "Waiting for ClickHouse to become available..."

until clickhouse-client --user admin --password admin --query "SELECT 1" >/dev/null 2>&1; do
    sleep 1
done

echo "Creating user db_user"

PASSWORD=$(printf "%s" "$CH_USER_PASSWORD" | sed "s/'/''/g")

clickhouse-client --user admin --password admin --multiquery --query "
CREATE USER IF NOT EXISTS db_user IDENTIFIED BY '$PASSWORD';
GRANT db_admin TO db_user;
"

echo "ClickHouse users initialized."