#! /usr/bin/env ash

if [ -d /var/lib/mysql/mysql ]; then
  echo [Entrypoint] MySql directory already present, skipping creation
else
 mysql_install_db --user=mysql --ldata=/var/lib/mysql
fi

# Config MySQL
usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 << EOF
FLUSH PRIVILEGES;
CREATE DATABASE IF NOT EXISTS ${DB_NAME};
CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}';
GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${DB_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
FLUSH PRIVILEGES;
EOF

# Configure file
cat << EOF > /etc/my.cnf.d/mariadb-server.cnf
[mysqld]
datadir=/var/lib/mysql
socket=/run/mysql/mysqld.sock
bind-address=*
port=3306
user=mysql
EOF
# exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@

exec mysqld_safe 
