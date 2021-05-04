#mysql
service mysql start
echo  "CREATE DATABASE wp_42;" | mysql -u root
echo "CREATE USER 'ldes-cou'@'localhost';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wp_42.* TO 'ldes-cou'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
mysql wp_42 -u root < /var/www/html/wordpress/wp_42.sql

service php7.3-fpm start
service nginx start
echo "Autoindex is set to $autoindex"
#sleep infinity

bash
