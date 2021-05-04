FROM debian:buster

LABEL ldes-cou (ldes-cou@student.42.fr)

WORKDIR /ft_server

#download services
RUN apt-get update && apt-get install -y \
	nginx \ 
	openssl\
	mariadb-server\
	wget
RUN apt-get install -y php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap \
&& wget -c https://wordpress.org/latest.tar.gz \
&& tar -xvzf latest.tar.gz \
&& wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz \
&& tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz


#install nginx
COPY srcs/nginx.conf /etc/nginx/sites-available/
COPY srcs/config.sh ./
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/ \
&& rm -rf /etc/nginx/sites-enabled/default

#openSSL
RUN mkdir /etc/nginx/ssl/ \
&& openssl req -newkey rsa:4096 -x509 -sha256 -days 3650 -nodes -out /etc/nginx/ssl/localhost.pem -keyout /etc/nginx/ssl/localhost.key -subj "/C=FR/ST=IledeFrance/L=LParis/O=Ecole/OU=42 Department/CN=www.localhost.com"

#config phpmyadmin
RUN mv phpMyAdmin-4.9.7-all-languages/ /var/www/html/phpmyadmin \
&& rm /var/www/html/index.nginx-debian.html
COPY srcs/config.php /var/www/html/phpmyadmin/config.inc.php


#install wordpress
RUN mv ./wordpress/ /var/www/html/
COPY srcs/monpetitponey.png /var/www/html/wordpress/
COPY srcs/wp_42.sql /var/www/html/wordpress/
COPY srcs/wp-launch.sh ./
COPY srcs/wp-config.php /var/www/html/wordpress/
RUN chown -R www-data:www-data /var/www/html/wordpress/*

#set autoindex
COPY srcs/autoindex.sh ./

EXPOSE 80 443

ENV autoindex=on
CMD bash ./config.sh

