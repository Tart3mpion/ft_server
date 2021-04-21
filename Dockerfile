FROM debian:buster

MAINTAINER ldes-cou (ldes-cou@student.42.fr)

RUN apt-get update \
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

#ADD default /etc/nginx/sites-available/default

EXPOSE 80
CMD ["nginx"]

#to access nginx
	#docker run -d -p 80:80 
