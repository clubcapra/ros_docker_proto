#!/bin/bash

if [ $UID -eq 0 ]; then
    echo "Do not run this script as root"
    exit 1
fi

# Check if the user is in the docker group
if id -nG | grep -qw 'docker'; then
    DOCKER='docker'
else
    DOCKER='sudo docker'
fi

$DOCKER build . -t capra/ros --build-arg USER=$(id -un) --build-arg UID=$UID --build-arg GID=$(id -g $UID)
