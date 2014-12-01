# nginx https terminator

Docker image to terminate https for arbitrary upstream.
Supports `http` and `server` section customization with includes.

## Usage

```
docker run -d -p 443 -p 80 \
  -e NGINX_UPSTREAM=example.internal \
  -e NGINX_SERVER_NAME=example.com \
  -v /crt/file/on/host:/etc/nginx/certs/cert:ro
  -v /key/file/on/host:/etc/nginx/keys/key:ro
  bobrik/nginx-https-terminator
```

This will run nginx on ports `80` (http) and `443` (https),
redirect everything from http to https and proxy all
requests to `example.internal` with `Host: example.com`.

Certificate `/crt/file/on/host` with key `/key/file/on/host`
will be used.
