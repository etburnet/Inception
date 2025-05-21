#!/bin/bash

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
			--path=/var/www/html