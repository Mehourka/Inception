ARG   ALP_VERSION=3.18
ARG   DEB_VERSION=bullseye
FROM alpine:${ALP_VERSION}

ENV NGINX_VERSION 1.26.0
ENV PKG_RELEASE   1

# Creation de deux compte
RUN   apk add doas; \
      adduser -D wordpress_super -G wheel; \
      echo "wp_super:pass123" | chpwd\
      adduser -D wp_user; \
      echo 'permit :wheel as root' > /etc/doas.d/doas.conf

RUN set -x\
    && apk update && apk --no-cache add wget openrc

# Install Wordpress
RUN mkdir -p /www/ && cd /www/\
    && wget https://wordpress.org/latest.tar.gz \
    && tar -xzvf latest.tar.gz && rm latest.tar.gz

RUN set -x\
   && apk update && apk --no-cache add php81 php81-fpm php81-mysqli \
   # Enable php-mysqli module
   && sed -i 's/;extension=mysqli/extension=mysqli/' /etc/php81/php.ini

COPY ./config/kmehour.42.conf /etc/php81/php-fpm.d/www.conf 
CMD ["php-fpm81", "-F", "-O"]
