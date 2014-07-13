#
# Nginx Dockerfile
#
# https://github.com/wordtreefoundation/docker-nginx
#

FROM wordtree/golang

# Install requirements
RUN apt-get update -qy && \
    apt-get install --no-install-recommends -qy software-properties-common

# [A] Install confd from layerhq with JsonUnmarshalObject support
RUN go get -u github.com/wordtreefoundation/confd
RUN mkdir -p /etc/confd/{conf.d,templates}
ADD nginx.toml /etc/confd/conf.d/nginx.toml
ADD nginx.conf.tmpl /etc/confd/templates/nginx.conf.tmpl

# [B] Install etcd
RUN go get -u github.com/coreos/etcd
ADD etcd.conf /etc/etcd/etcd.conf

# [C] Install nginx
RUN add-apt-repository -y ppa:nginx/stable && \
    apt-get update -q && \
    apt-get install --no-install-recommends -qy nginx && \
    echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
    chown -R www-data:www-data /var/lib/nginx

# Define mountable directories
VOLUME ["/data", "/etc/nginx/sites-enabled", "/var/log/nginx"]

# Define working directory
WORKDIR /etc/nginx

# Expose etcd ports
EXPOSE 4001 7001

# Expose nginx ports
EXPOSE 80 443

# Define default command.
ADD run.sh /run.sh
CMD /run.sh
