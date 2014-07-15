#
# RethinkDB Dockerfile
#
# https://github.com/wordtreefoundation/dockerfiles/tree/master/rethinkdb
#

FROM dockerfile/ubuntu

# Install most recent RethinkDB from rethinkdb ubuntu repository
RUN \
  ( echo "deb http://download.rethinkdb.com/apt trusty main" | \
    sudo tee /etc/apt/sources.list.d/rethinkdb.list ) && \
  ( wget -qO- http://download.rethinkdb.com/apt/pubkey.gpg | \
    sudo apt-key add - ) && \
  sudo apt-get update && \
  sudo apt-get install -y rethinkdb

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["rethinkdb", "--bind", "all"]

# Expose ports.
#   - 8080: web UI
#   - 28015: process
#   - 29015: cluster
EXPOSE 8080
EXPOSE 28015
EXPOSE 29015

# Example Usage:
#
# docker run --name rethinkdb -v /r/data/rethinkdb:/data -d \
#            -p 8080:8080 -p 28015:28015 -p 29015:29015 \
#            wordtree/rethinkdb \
#            rethinkdb --bind all --cache-size 4096