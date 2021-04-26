FROM debian:buster

MAINTAINER ldes-cou (ldes-cou@student.42.fr)

RUN apt-get update 
RUN apt-get install -y nginx
#RUN apt-get install openssl
#RUN apt-get install -y mariadb-server
#RUN apt-get install -y wget
#RUN apt-get install -y vim
    #php-mbstring php-zip php-gd\
    #wget https://files.phpmyadmin.net/phpMyAdmin/4.9.7/phpMyAdmin-4.9.7-all-languages.tar.gz \
    #tar xvf phpMyAdmin-4.9.7-all-languages.tar.gz \
    #mv phpMyAdmin-4.9.7-all-languages/ /usr/share/phpmyadmin \
    #mkdir -p /var/lib/phpmyadmin/tmp \
    #chown -R www-data:www-data /var/lib/phpmyadmin \
    #cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php 
    
    #rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \ 
    #echo "daemon off;" >> /etc/nginx/nginx.conf


EXPOSE 80
#CMD ["nginx"]

