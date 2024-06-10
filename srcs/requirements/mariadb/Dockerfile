ARG   ALP_VERSION=3.18
ARG   DEB_VERSION=bullseye
FROM alpine:${ALP_VERSION}

RUN addgroup db_user && adduser -H -D -G db_user db_user

RUN apk update && apk add --no-cache mariadb mariadb-client mariadb-server-utils
RUN mkdir -p /run/openrc/exclusive && touch /run/openrc/softlevel

ADD config/entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["./entrypoint.sh"]
