#!/bin/bash -x
CONTAINER=$1
docker run --privileged -p 8080:8080 -p 8443:8443 -d ${CONTAINER}
#-v bookshelf:/var/opt/chef-server/bookshelf/data/bookshelf