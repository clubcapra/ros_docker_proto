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

if [ $# -ge 1 ]
then
    name=$1
else
    name='capra'
fi

$DOCKER run -it -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$DISPLAY -v $(pwd):/capra -u $UID:$(id -g $UID) --net=host --name $name capra/ros
