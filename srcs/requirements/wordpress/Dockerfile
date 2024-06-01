ARG   ALP_VERSION=3.18
ARG   DEB_VERSION=bullseye
FROM alpine:${ALP_VERSION}

ENV NGINX_VERSION 1.26.0
ENV PKG_RELEASE   1

# Add user for Nginx
RUN set -x\
   && apk update && apk --no-cache add php81 php81-fpm openrc \
   && addgroup wordpress_user\
   && adduser -D -H -G wordpress_user wordpress_user\
   # Listend to all ports
   && sed -i 's/127.0.0.1/0.0.0.0/' /etc/php81/php-fpm.d/www.conf

   # && mkdir -p /run/openrc/ &&  touch /run/openrc/softlevel 
   # && openrc && service php-fpm81 start

# CMD ["/bin/sh", "-c", "sleep infinity"]
CMD ["php-fpm81", "-F", "-O"]



