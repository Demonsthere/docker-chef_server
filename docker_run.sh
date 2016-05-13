#!/bin/bash -x
CONTAINER=$1
docker run --privileged -p 8080:8080 -p 8443:8443 -d -v /Users/i319397/gitHub/docker-chef_server/bookshelf:/bookshelf ${CONTAINER}
#-v bookshelf:/var/opt/chef-server/bookshelf/data/bookshelf