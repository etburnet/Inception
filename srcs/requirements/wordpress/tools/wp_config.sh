#!/bin/bash

mkdir -p /run/php

if [ ! -f /var/www/html/wp-config.php ]; then
	curl -O https://wordpress.org/latest.tar.gz
	tar -xzf latest.tar.gz
	rm latest.tar.gz
	cp -r wordpress/* /var/www/html/

	wp config create --allow-root \
				--dbname=$DB_NAME \
				--dbuser=$SQL_USER \
				--dbpass=$SQL_PASS \
				--dbhost=mariadb:3306 \
				--path=/var/www/html

	wp core install --allow-root \
				--url=$DOMAIN_NAME \
				--title=eburnet \
				--admin_user=$WP_ADM \
				--admin_password=$WP_ADM_PASS \
				--admin_email=$WP_ADM_MAIL \
				--skip-email \
				--path=/var/www/html

	wp user create --allow-root \
				$WP_USER \
				$WP_USER_MAIL \
				--user_pass=$WP_USER_PASS \
				--allow-root \
				--path=/var/www/html
	
	wp theme install https://downloads.wordpress.org/theme/generatepress.3.6.0.zip --allow-root --activate --path=/var/www/html
fi

exec php-fpm7.4 -F