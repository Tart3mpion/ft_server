
service mysql start

#Rights

chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#Nginx
mv ./nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-enabled/default

#openSSL
mkdir /etc/nginx/ssl/
openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=IledeFrance/L=LParis/O=Ecole/OU=42 Department/CN=www.localhost.com"
 
#phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz
mv phpMyAdmin-4.9.7-all-languages/ /var/www/html/phpmyadmin
cp ./config.php /var/www/html/phpmyadmin/config.inc.php
cp /var/www/html/phpmyadmin/index.php /var/www/html/


# wordpress
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv ./wordpress/ /var/www/html/
cp ./wp-config.php /var/www/html/wordpress/

#mysql
echo "CREATE DATABASE your_wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'user'@'localhost'"| mysql -u root --skip-password 
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password 
echo "GRANT ALL PRIVILEGES ON *.* TO 'user'@'localhost';"| mysql -u root --skip-password 
echo "FLUSH PRIVILEGES ;" | mysql -u root --skip-password

service php7.3-fpm start
service nginx start
#sleep infinity

bash
