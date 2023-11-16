#!/bin/bash

function docker-build-image() {
    local DOCKER_FOLDER="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

    docker build -t centos-station  \
    --build-arg ARG_HOME_DIR=$HOME     \
    --build-arg UID=$(id -u)               \
    --build-arg GID=$(id -g)             \
    --build-arg USERNAME=$(whoami)    \
    ${DOCKER_FOLDER}

}

function docker-run-container() {
    docker run -it -d centos-station
}

function help-menu() {
    echo "To build an image use:"
    echo "docker-build-image"
    echo "To run a container from the built image use:"
    echo "docker-run-container"
}

help-menu
