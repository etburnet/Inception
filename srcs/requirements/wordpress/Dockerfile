FROM debian:bullseye

RUN apt update && apt install -y \
    php-fpm \
    php-mysql \
    curl \
    unzip

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
	chmod +x wp-cli.phar && \
	mv wp-cli.phar /usr/local/bin/wp

COPY ./tools/wp_config.sh ./wp_config.sh

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT ["/wp_config.sh"]