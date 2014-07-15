# chaNginx

This directory contains a Dockerfile for nginx with etcd and confd support

"Changin' X" is a self-modifying reverse proxy for web services that
auto-register themselves with nginx.

## Dependencies

- [wordtree/golang](https://registry.hub.docker.com/u/wordtree/golang/)

## Volumes

- /data
- /etc/nginx/sites-enabled
- /var/log/nginx

## Usage

    docker run -d -p 80:80 wordtree/nginx

## Attach persistent/shared directories

    docker run -d -p 80:80 -v <sites-enabled-dir>:/etc/nginx/sites-enabled -v <log-dir>:/var/log/nginx wordtree/nginx

After few seconds, open `http://<host>` to see the welcome page.
