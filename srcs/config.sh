#edition des droits
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

#Nginx
mkdir /var/www/localhost && touch /var/www/local/index.php
mv ./config.nginx etc/nginx/sites-available/
ln -s etc/nginx/sites-available/config.nginx etc/nginx/sites-enabled
rm -rf etc/nginx/sites-available/default


#phpmyadmin
wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz 
tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz 
mv phpMyAdmin-4.9.7-all-languages/ /usr/share/phpmyadmin 
mkdir -p /var/wwww/localhost/phpmyadmin/
cp /usr/share/phpmyadmin/config.sample.inc.php /var/wwww/localhost/phpmyadmin/

service nginx start

bash
