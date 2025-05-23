# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: eburnet <eburnet@student.42,fr>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2025/05/23 14:43:11 by eburnet           #+#    #+#              #
#    Updated: 2025/05/23 14:46:36 by eburnet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

build:
	mkdir -p /home/eburnet/data/wp
	mkdir -p /home/eburnet/data/mariadb
	docker compose -f srcs/docker-compose.yml build

up: build
	docker compose -f srcs/docker-compose.yml up -d

down:
	docker compose -f srcs/docker-compose.yml down

clean: dowm
	docker system prune -a -f --volumes
	sudo rm /home/eburnet/data/* -Rf

.PHONY: build up dowm clean