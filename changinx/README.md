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

    docker run -d --name changinx -p 80:80 wordtree/changinx

After few seconds, open `http://<host>` to see the welcome page.

Ports 4001 and 7001 are exposed for etcd.