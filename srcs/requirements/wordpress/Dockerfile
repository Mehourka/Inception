ARG     ALP_VERSION=3.18
ARG     DEB_VERSION=bullseye
FROM alpine:${ALP_VERSION}

ARG     USER_PASSWORD
ARG     USER_NAME

ENV NGINX_VERSION 1.26.0
ENV PKG_RELEASE   1

RUN set -x\
    && apk update && apk --no-cache add wget openrc mysql-client

# Install Wordpress
RUN mkdir -p /www/ && cd /www/\
    && wget https://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz && rm latest.tar.gz

RUN set -x\
   && apk update && apk --no-cache add php81 php81-fpm php81-mysqli php81-mysqlnd php81-phar php81-iconv\
   # Enable php-mysqli module
   # && sed -i 's/;extension=mysqli/extension=mysqli/' /etc/php81/php.ini
   && extension=mysqli.so >> /etc/php81/php.ini

COPY ./config/kmehour.42.conf /etc/php81/php-fpm.d/www.conf 

COPY	./config/entrypoint.sh /entrypoint.sh
RUN		chmod +x /entrypoint.sh

ENTRYPOINT  ["/entrypoint.sh"]

CMD ["php-fpm81", "-F", "-O"]
