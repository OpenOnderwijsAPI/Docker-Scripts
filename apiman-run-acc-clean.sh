#!/bin/sh
#
# Script for a clean installation and start of apiman-ooapi-poc container

NAME=apiman-ooapi-poc

#Stop and remove container if it exists.
if docker ps -a -f name=$NAME | grep -q $NAME; then
	echo "Found $NAME container. Removing it!"
	docker rm -f $NAME
fi

#Start a new container
$(dirname $0)/apiman-run-acc.sh
