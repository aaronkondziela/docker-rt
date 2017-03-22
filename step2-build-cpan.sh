#!/usr/bin/env bash
echo "Step 2: Create an image with rt deps installed from cpan."
echo "This can take a while; go get coffee."
read -p "Hit enter to proceed..." X
docker build -f Dockerfile-2-cpan -t docker-rt-cpan .
