ARG   ALP_VERSION=3.18
ARG   DEB_VERSION=bullseye
FROM alpine:${ALP_VERSION}

ENV NGINX_VERSION 1.26.0
ENV PKG_RELEASE   1

ARG HOST_42
# Add user for Nginx
RUN set -x\
   && addgroup -g 101 -S nginx\
   && adduser -S -D -H -u 101 -h /var/cache/nginx -s /sbin/nologin\
     -G nginx -g nginx nginx\
   && apk update && apk --no-cache add nginx vim openrc openssl

RUN apk add --no-cache envsubst

COPY ./config/inception.conf /etc/nginx/http.d/default.conf

COPY  ./config/entrypoint.sh /entrypoint.sh
RUN   chmod +x /entrypoint.sh

RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:4096 \
	-keyout /etc/nginx/ssl/kmehour.key -out /etc/nginx/ssl/kmehour.crt \
	-subj "/C=CA/ST=Quebec/L=Montreal/O=Security/OU=IT Department/CN=$HOST_42"

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
