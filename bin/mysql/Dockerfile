FROM mysql:5.7

ENV MYSQL_ROOT_PASSWORD 123secret
ENV MYSQL_DATABASE bookedscheduler
ENV MYSQL_USER bookedscheduler
ENV MYSQL_PASSWORD 123secret


ENV MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/run/mysqld \
    MYSQL_LOG_DIR=/var/log/mysql

RUN /etc/init.d/mysql start && \
         mysql -u root -p$MYSQL_ROOT_PASSWORD  -e "GRANT ALL on bookedscheduler.* to 'bookedscheduler'@'mysql' identified by '123secret';FLUSH PRIVILEGES;" && \
        mysql -u root -p${MYSQL_ROOT_PASSWORD} 


COPY create-schema.sql /docker-entrypoint-initdb.d/
COPY create-data.sql /docker-entrypoint-initdb.d/

