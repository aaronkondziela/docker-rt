#!/usr/bin/env bash
BRANCH=`cat /opt/rt-src/rt/.git/HEAD`
read -p "Current RT branch is $BRANCH - is this the version you want? [Y/n] " YNB
case "$YNB" in
	[Nn]* ) echo "Exiting, go pick the right branch!" ; exit ;;
esac

read -p "Did you remember to run git clean -x -f ? [Y/n] " YNB
case "$YNB" in
	[Nn]* ) echo "Exiting, go clean it up!" ; exit ;;
esac

read -p "Use --rm flag to create ephemeral container? [y/N] " YN
RM=""
case "$YN" in
	[Yy]* ) RM="--rm" ;;
esac

read -p "What image name should we run? [docker-rt:latest]: " IMAGE
if [ "$IMAGE" == "" ] ; then echo "Using default image name docker-rt:latest" ; IMAGE="docker-rt" ; fi

echo "Go run /opt/docker-rt/init.expect"
echo "   use thisisatest if prompted to set passwords."
echo "If all is well, rt should be available at localhost:80 on the host system."
docker run -it -p 80:80 $RM -v /opt/rt-src:/opt/rt-src -v /opt/rt-cx:/opt/rt-cx "$IMAGE" bash
