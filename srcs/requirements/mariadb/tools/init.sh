#!/bin/bash

# Si la base n'est pas encore initialisée
if [ ! -d "/var/lib/mysql/mysql" ]; then
  echo "launching MariaDB..."

  mysqld --initialize-insecure --user=mysql --datadir=/var/lib/mysql

  mysqld_safe --datadir=/var/lib/mysql &
  sleep 5

  mysql -u root <<-EOSQL
    CREATE DATABASE IF NOT EXISTS ${MYSQL_DATABASE};
    CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASSWORD}';
    GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE}.* TO '${MYSQL_USER}'@'%';
    ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
    FLUSH PRIVILEGES;
EOSQL

  killall mysqld
  sleep 2
fi

echo "MariaDB done."
exec mysqld_safe --datadir=/var/lib/mysql