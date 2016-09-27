#!/usr/bin/env bash
echo "Step 3: Building a docker-rt image based on the step 2 cpan image."
docker build -f Dockerfile-3-rtsetup -t docker-rt .
