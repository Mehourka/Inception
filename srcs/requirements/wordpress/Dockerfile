ARG   ALP_VERSION=3.18
ARG   DEB_VERSION=bullseye
FROM alpine:${ALP_VERSION}

ENV NGINX_VERSION 1.26.0
ENV PKG_RELEASE   1

# Add user for Nginx
RUN set -x\
   && addgroup -g 101 -S nginx\
   && adduser -S -D -H -u 101 -h /var/cache/nginx -s /sbin/nologin\
     -G nginx -g nginx nginx\
   && apk update && apk --no-cache add nginx vim openrc

CMD ["nginx", "-g", "daemon off;"]



