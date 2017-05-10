#!/usr/bin/env bash

function just_run_it {
	echo "(If you just created this image, you can hit enter here)"
	read -p "What image name should we run? [${NAME}:latest]: " IMAGE
	if [ "$IMAGE" == "" ] ; then echo "Using default image name ${NAME}:latest" ; IMAGE="$NAME" ; fi

	echo -e "\n\nWhen done, go into /opt/docker-rt/ and run init.expect"
	echo "   use thisisatest if prompted to set passwords."
	echo "Remember to use script -qc bash for exec -it commands because of the TTY problem"
	echo -e "If all is well, rt should be available at localhost:80 on the host system.\n\n"
	docker run -it -p 80:80 $RM -v /opt/rt-src:/opt/rt-src -v /opt/rt-cx:/opt/rt-cx "$IMAGE" bash
}



echo "Step 3: Building a docker-rt image based on the step 2 cpan image."

read -p "Do you want to just run a new container and set up a new RT from an existing image? [y/N]: " YNB
case "$YNB" in
	[Yy]* ) echo "Ok..." ; NAME='docker-rt' ; just_run_it ; exit ;;
esac

pushd /opt/rt-src/rt >/dev/null
BRANCH=`git branch --points-at HEAD | grep -F '*' | sed 's/\* (\(.*\))/\1/' | sed 's/HEAD detached at/tag/'`
popd >/dev/null
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

read -p "Name the image we are about to create [docker-rt]: " NAME
if [ "$NAME" == "" ] ; then echo "Using default of docker-rt" ; NAME="docker-rt" ; fi
echo "Building dockerfile 3"
docker build -f Dockerfile-3-rtsetup -t "$NAME" .

just_run_it

