FROM debian:bullseye

RUN apt update && \
    apt install -y nginx

RUN chmod 755 /var/www/html && \
	chown -R www-data:www-data /var/www/html

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
COPY ./conf/default.conf /etc/nginx/conf.d/default.conf
COPY ./conf/ssl/ /etc/nginx/ssl/

CMD ["nginx", "-g", "daemon off;"]