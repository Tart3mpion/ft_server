
service mysql start

#Rights

chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#website folder
mkdir -p var/www/localhost/
cp ./infos.php var/www/localhost/index.php

#Nginx
mv ./nginx.conf /etc/nginx/sites-available/
ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
rm -rf /etc/nginx/sites-enabled/default

#openSSL
mkdir /etc/nginx/ssl/
openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=IledeFrance/L=LParis/O=Ecole/OU=42 Department/CN=www.localhost.com"
 


#phpmyadmin
mkdir /var/www/localhost/phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz
tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz
mv phpMyAdmin-4.9.7-all-languages/ /var/www/localhost/phpmyadmin
cp ./config.php /var/www/localhost/phpmyadmin


# wordpress
wget -c https://wordpress.org/latest.tar.gz
tar -xvzf latest.tar.gz
mv ./wordpress/ /var/www/localhost/
cp ./wp-config.php /var/www/localhost/wordpress/



#mysql
#mysql_secure_installation
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT SELECT, INSERT, UPDATE, DELETE ON phpmyadmin.* TO 'root'@'localhost' IDENTIFIED BY 'password';" #| mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY 'password' WITH GRANT OPTION;" #| mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

service php7.3-fpm start
service nginx start
#sleep infinity

bash
