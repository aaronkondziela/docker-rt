#!/usr/bin/env bash

function just_run_it {
	read -p "What image name should we run? [${NAME}:latest]: " IMAGE
	if [ "$IMAGE" == "" ] ; then echo "Using default image name ${NAME}:latest" ; IMAGE="$NAME" ; fi

	echo "Go run /opt/docker-rt/init.expect"
	echo "   use thisisatest if prompted to set passwords."
	echo "If all is well, rt should be available at localhost:80 on the host system."
	docker run -it -p 80:80 $RM -v /opt/rt-src:/opt/rt-src -v /opt/rt-cx:/opt/rt-cx "$IMAGE" bash
}



echo "Step 3: Building a docker-rt image based on the step 2 cpan image."

read -p "Do you want to just run a new container and set up a new RT from an existing image? [y/N]: " YNB
case "$YNB" in
	[Yy]* ) echo "Ok..." ; NAME='docker-rt' ; just_run_it ; exit ;;
esac

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

read -p "Image name to build [docker-rt]: " NAME
if [ "$NAME" == "" ] ; then echo "Using default of docker-rt" ; NAME="docker-rt" ; fi
echo "Building dockerfile 3"
docker build -f Dockerfile-3-rtsetup -t "$NAME" .

just_run_it

