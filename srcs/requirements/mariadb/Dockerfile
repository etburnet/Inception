FROM debian:bullseye

RUN apt update && \
    apt install -y \
	mariadb-server \
	systemctl

RUN mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld

COPY ./conf/mariadb.cnf /etc/mysql/my.cnf

COPY ./tools/create_db.sh ./create_db.sh

EXPOSE 3306

CMD ["./create_db.sh"]
