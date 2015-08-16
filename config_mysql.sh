#!/bin/bash

__mysql_config() {
echo "Running the mysql_config function."
chown -R mysql:mysql /var/lib/mysql
/etc/init.d/mysql start
sleep 10
}

__start_mysql() {
echo "Running the start_mysql function."
mysqladmin -u root password mysqlPassword

mysql -uroot -pmysqlPassword -e "CREATE DATABASE oic"
mysql -uroot -pmysqlPassword -e "CREATE USER 'oic'@'localhost' IDENTIFIED BY 'oic'"
mysql -uroot -pmysqlPassword -e "GRANT ALL PRIVILEGES ON oic.* TO 'oic'@'%'"
mysql -uroot -pmysqlPassword -e "GRANT ALL PRIVILEGES ON oic.* TO 'oic'@'localhost'"
mysql -uroot -pmysqlPassword -e "FLUSH PRIVILEGES"	
mysql -uroot -pmysqlPassword -e "source mysql_auth_install.sql"

mysql -uroot -pmysqlPassword -e "CREATE DATABASE fhir_ut"
mysql -uroot -pmysqlPassword -e "CREATE USER 'fhir_ut'@'localhost' IDENTIFIED BY 'fhir_ut'"
mysql -uroot -pmysqlPassword -e "GRANT ALL PRIVILEGES ON fhir_ut.* TO 'fhir_ut'@'%'"
mysql -uroot -pmysqlPassword -e "GRANT ALL PRIVILEGES ON fhir_ut.* TO 'fhir_ut'@'localhost'"
mysql -uroot -pmysqlPassword -e "FLUSH PRIVILEGES"	

#mysql -uroot -pmysqlPassword -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'root' WITH GRANT OPTION"
killall mysqld
sleep 10
}

# Call all functions
__mysql_config
__start_mysql
