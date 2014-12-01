#!/bin/sh

set -e

if [ -z "${NGINX_UPSTREAM}" ]; then
    echo "NGINX_UPSTREAM not set, exiting"
    exit 1
fi

if [ -z "${NGINX_SERVER_NAME}" ]; then
    echo "NGINX_SERVER_NAME not set, exiting"
    exit 1
fi

if [ ! -e "/.initialized" ]; then
    echo "setting up nginx upstream"
    sed -i "s/%NGINX_SERVER_NAME%/${NGINX_SERVER_NAME}/g" /etc/nginx/nginx.conf
    sed -i "s/%NGINX_UPSTREAM%/${NGINX_UPSTREAM}/g" /etc/nginx/nginx.conf
    touch "/.initialized"
fi

exec nginx
