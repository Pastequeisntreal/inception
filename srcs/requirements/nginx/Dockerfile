FROM debian:bookworm

RUN apt-get update && \
    apt-get install -y nginx openssl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /etc/nginx/ssl

COPY conf/nginx.conf /etc/nginx/nginx.conf
COPY conf/default.conf /etc/nginx/conf.d/default.conf
COPY tools/generate_cert.sh /generate_cert.sh

RUN chmod +x /generate_cert.sh

ENTRYPOINT ["/generate_cert.sh"]

EXPOSE 443