service mysql start

#Rights
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#website folder
mkdir -p var/www/localhost
cp ./infos.php var/www/localhost/

#Nginx
mv ./nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/

#openSSL
mkdir /etc/nginx/ssl
openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out etc/nginx/ssl/localhost.pem -keyout etc/nginx/ssl/localhost.key -subj "/C=FR/ST=IledeFrance/L=LParis/O=Ecole/OU=42 Department/CN=www.localhost.com"

#phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz 
tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz 
mv phpMyAdmin-4.9.7-all-languages/ /usr/share/phpmyadmin
cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php


#mysql
#mysql_secure_installation
mariadb < /usr/share/phpmyadmin/sql/create_tables.sql
#echo "GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO 'pma'@'localhost' IDENTIFIED BY 'password';"
#echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;"
#echo "exit"

service php7.3-fpm start
service nginx start

bash
