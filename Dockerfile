FROM debian:buster

LABEL ldes-cou (ldes-cou@student.42.fr)

#WORKDIR /ft_server

RUN apt-get update && apt-get install -y nginx 
RUN apt-get install -y openssl
RUN apt-get install -y mariadb-server
RUN apt-get install -y wget
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
RUN apt-get install -y vim

COPY srcs/nginx.conf ./
COPY srcs/infos.php ./
COPY srcs/config.sh ./
COPY srcs/config.php ./
COPY srcs/wp-config.php ./

EXPOSE 80
EXPOSE 443

ENV AUTOINDEX on
CMD bash ./config.sh

