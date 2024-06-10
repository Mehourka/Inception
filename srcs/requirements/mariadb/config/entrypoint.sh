#! /usr/bin/env ash

if [ -d /var/lib/mysql/mysql ]; then
  echo [Entrypoint] MySql directory already present, skipping creation
else
 mysql_install_db --user=mysql --ldata=/var/lib/mysql
fi


# usr/bin/mysqld --user=mysql --bootstrap --verbose=0 --skip-name-resolve --skip-networking=0 << EOF
# CREATE DATABASE ${DB_NAME};
# CREATE USER '${DB_USER}'@'localhost' identified by '${DB_PASSWORD}';
# EOF
exec /usr/bin/mysqld --user=mysql --console --skip-name-resolve --skip-networking=0 $@

exec "$@"
