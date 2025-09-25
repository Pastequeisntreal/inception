FROM debian:11

RUN apt update && \
    apt install -y nginx openssl && \
    apt clean && \
    rm -rf  /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

CMD ["nginx", "-g", "daemon off;"]