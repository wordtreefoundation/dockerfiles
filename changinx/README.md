# chaNginx

This repository contains a Dockerfile with nginx, etcd, and confd with a template that auto-generates an nginx conf file for each API service that wants to auto-mount itself to the path.

## Dependencies

- [wordtree/golang](https://registry.hub.docker.com/u/wordtree/golang/)

## Volumes

- /data
- /etc/nginx/sites-enabled
- /var/log/nginx

## Usage

    ```docker run --name changinx -d \
                  -v /tmp/data:/data \
                  -p 80:80 -p 443:443 -p 4001:4001 \
                  wordtree/nginx```

After few seconds, open `http://<host>` to see the welcome page.

## Notes

To manually test that the /etc/nginx/sites-enabled/default conf file is being written automatically, try:

```curl -L http://localhost:4001/v2/keys/apps/one \
        -d 'value={"ip":123,"port":5000,"mountpoint":"/api"}' -XPUT```

and then cat the file:

```docker -it --rm --volumes-from changinx wordtree/changinx cat /etc/nginx/sites-enabled/default```
