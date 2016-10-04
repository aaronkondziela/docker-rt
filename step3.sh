#!/usr/bin/env bash
echo "Step 3: Building a docker-rt image based on the step 2 cpan image."
read -p "Image name [docker-rt]: " NAME
if [ "$NAME" == "" ] ; then echo "Using default of docker-rt" ; NAME="docker-rt" ; fi

docker build -f Dockerfile-3-rtsetup -t "$NAME" .
