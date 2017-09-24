#!/bin/bash

if [ $# -ge 1 ]
then
    name=$1
else
    name='capra'
fi

docker run -it -v /tmp/.X11-unix:/tmp/.X11-unix:ro -e DISPLAY=$DISPLAY -v $(pwd):/capra -u $UID:$(id -g $UID) --name $name capra/ros
