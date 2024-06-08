#!/usr/bin/env sh

# Replace $HOST_42 in nginx config
envsubst '$HOST_42' < /etc/nginx/http.d/default.conf > /tmp/default.conf
mv /tmp/default.conf /etc/nginx/http.d/default.conf

exec "$@"
