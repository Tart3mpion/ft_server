FROM debian:buster

LABEL ldes-cou (ldes-cou@student.42.fr)

RUN apt-get update
RUN apt-get install -y nginx
RUN apt-get install openssl
RUN apt-get install -y mariadb-server
RUN apt-get install -y wget
RUN apt-get install -y vim

COPY srcs/nginx.conf ./
COPY srcs/infos.php ./
COPY srcs/config.sh ./

EXPOSE 80
EXPOSE 443
CMD bash /config.sh

