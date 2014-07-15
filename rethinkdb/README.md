# RethinkDB

This directory contains a Dockerfile for RethinkDB 1.13.1

## Dependencies

- [dockerfile/ubuntu](https://registry.hub.docker.com/u/dockerfile/ubuntu/)

## Volumes

Volumes are optional. If you'd like to keep the data outside of the container
(something that is advisable but not necessary, i.e. you probably don't need it
in development mode), then add "-v <datadir>:/data" to the Usage options below.

- /data

## Usage

    docker run -d -p 8080:8080 -p 28015:28015 -p 29015:29015 dockerfile/rethinkdb

## Web UI

Now load up your shiny new RethinkDB server at http://docker:8080/ (where
'docker' points to your docker machine--if you're running Linux, docker is
probably just "localhost", but if you're on a Mac or Windows, you'll need to
set a DNS entry to point "docker" to your Linux VM where docker is running).
