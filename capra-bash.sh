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

user="-u $UID"
name="capra"

if [ $# -ge 1 ]; then
    if [ "$1" != "--root" ]; then
        name=$1
    else
        user="-u 0"

        if [ $# -ge 2 ]; then
            name=$2
        fi
    fi
fi

$DOCKER start $name # make sure the container is running
$DOCKER exec -it $user $name bash
