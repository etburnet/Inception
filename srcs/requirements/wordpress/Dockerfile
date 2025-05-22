FROM debian:bullseye

RUN apt update && apt install -y \
    php-fpm \
    php-mysql \
    curl \
    unzip

RUN curl -O https://wordpress.org/latest.tar.gz && \
    tar -xzf latest.tar.gz && \
    rm latest.tar.gz && \
    mkdir -p /var/www/html && \
    mkdir -p /run/php && \
    mv wordpress/* /var/www/html &&  \
    rm -rf wordpress

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

EXPOSE 9000

COPY ./tools/wp_config.sh ./wp_config.sh

ENTRYPOINT ["./wp_config.sh"]

CMD ["php-fpm7.4", "-F"]