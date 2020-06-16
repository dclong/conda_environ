#!/bin/bash

docker run -it \
    --hostname conda \
    --log-opt max-size=50m \
    -e DOCKER_USER=$(id -un) \
    -e DOCKER_USER_ID=$(id -u) \
    -e DOCKER_PASSWORD=$(id -un) \
    -e DOCKER_GROUP_ID=$(id -g) \
    -v "$(pwd)":/workdir \
    -v "$(dirname $HOME)":/home_host \
    dclong/conda /scripts/sys/init.sh /workdir/script.sh
