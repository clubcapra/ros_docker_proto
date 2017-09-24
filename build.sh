#!/bin/bash
docker build . -t capra/ros --build-arg USER=$USER --build-arg UID=$UID --build-arg GID=$(id -g $UID)
