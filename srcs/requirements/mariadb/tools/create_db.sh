#!/bin/bash

mariadbd --user=mysql --datadir=/var/lib/mysql &
sleep 1

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;
CREATE USER IF NOT EXISTS '${SQL_USER}'@'localhost' IDENTIFIED BY '${SQL_PASS}';
GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${SQL_USER}'@'localhost';
FLUSH PRIVILEGES;
EOF

wait %1