FROM debian:11

RUN apt update && \
    apt install -y --no-install-recommends\
        wordpress\
        curl\
        php-fpm\
        php-mysql\
        php-cli && \
    apt clean && \
    rm -rf  /var/lib/apt/lists/*

RUN mkdir -p /run/php/
RUN chown -R www-data:www-data /run/php/

COPY conf/www.conf /etc/php/7.4/fpm/pool.d/www.conf
COPY ./tools/init.sh .
RUN chmod +x init.sh

ENTRYPOINT ["./init.sh"]

CMD ["php-fpm7.4", "-F"]