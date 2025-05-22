FROM debian:bullseye

RUN apt update && \
    apt install -y \
	mariadb-server

RUN mkdir -p /run/mysqld && \
    chown mysql:mysql /run/mysqld

COPY ./conf/mariadb.cnf /etc/mysql/my.cnf

COPY ./tools/create_db.sh ./create_db.sh

EXPOSE 3306

ENTRYPOINT ["./create_db.sh"]

CMD ["mysql"]
