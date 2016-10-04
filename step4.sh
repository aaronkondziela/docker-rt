#!/usr/bin/env bash
read -p "Use --rm flag to create ephemeral container? [Y/n] " YN
RM="--rm"
case "$YN" in
	[Nn]* ) RM="" ;;
esac

read -p "What image name should we run? [docker-rt:latest]: " IMAGE
if [ "$IMAGE" == "" ] ; then echo "Using default image name docker-rt:latest" ; IMAGE="docker-rt" ; fi

echo "Go run /opt/docker-rt/setup.sh and use thisisatest when prompted to set passwords."
echo "If all is well, rt should be available at localhost:80 on the host system."
docker run -it -p 80:80 $RM -v /opt/rt-src:/opt/rt-src "$IMAGE" bash
