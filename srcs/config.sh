
#service mysql start

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
rm /var/www/html/index.nginx-debian.html

# wordpress
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv ./wordpress/ /var/www/html/
cp ./wp-config.php /var/www/html/wordpress/
cp ./monpetitponey.png /var/www/html/wordpress/
chown -R www-data:www-data /var/www/html/wordpress/*
cp ./wp_42.sql /var/www/html/wordpress/

#mysql
service mysql start
echo  "CREATE DATABASE wp_42;" | mysql -u root
echo "CREATE USER 'ldes-cou'@'localhost';" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wp_42.* TO 'ldes-cou'@'localhost';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root
mysql wp_42 -u root < wp_42.sql

service php7.3-fpm start
service nginx start
echo "Autoindex is set to $autoindex"
#sleep infinity

bash
