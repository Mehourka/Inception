ARG   ALP_VERSION=3.18
ARG   DEB_VERSION=bullseye
FROM alpine:${ALP_VERSION}

ENV NGINX_VERSION 1.26.0
ENV PKG_RELEASE   1

RUN set -x\
    && apk update && apk --no-cache add wget openrc

# Install Wordpress
RUN mkdir -p /www/ && cd /www/\
    && wget https://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz && rm latest.tar.gz

RUN set -x\
   && apk update && apk --no-cache add php81 php81-fpm php81-mysqli \
   && addgroup wordpress_user \
   && adduser -D -H -G wordpress_user wordpress_user \
   # Listend to all ports
   && sed -i 's/127.0.0.1/0.0.0.0/' /etc/php81/php-fpm.d/www.conf \
   # Enable php-mysqli module
   && sed -i 's/;extension=mysqli/extension=mysqli/' /etc/php81/php.ini


CMD ["php-fpm81", "-F", "-O"]



