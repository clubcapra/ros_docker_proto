#!/bin/bash

user=""
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

docker start $name # make sure the container is running
docker exec -it $user $name bash
