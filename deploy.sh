#!/bin/bash
#A script to deploy a docker container for arm64 and amd64
#architectures
echo "lol"

docker login -u marcusomara -p Xm6gpe46!

docker buildx ls | grep -q 'multibuilder'
if [ $? != 0 ]; then
   docker buildx create --name multibuilder
fi

docker buildx use multibuilder

if [ -z "$1" ]; then
    docker buildx build --platform linux/amd64,linux/arm64 -t marcusomara/johnson-and-johnson:latest --push .
else
    docker buildx build --platform linux/amd64,linux/arm64 -t marcusomara/johnson-and-johnson:$1 --push .
fi
