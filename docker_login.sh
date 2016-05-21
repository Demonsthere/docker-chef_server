#!/bin/bash -x
CONTAINER=$1

docker exec -ti ${CONTAINER} /bin/bash
