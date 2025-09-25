FROM debian:11

RUN apt update && \
    apt install -y mariadb-server --no-install-recommends && \
    apt clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /run/mysqld/
RUN chown -R mysql:mysql /run/mysqld/

COPY tools/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh

COPY conf/mariadb.cnf /etc/mysql/mariadb.conf.d/mariadb.cnf

ENTRYPOINT ["/usr/local/bin/init.sh"]

CMD ["mariadbd"]