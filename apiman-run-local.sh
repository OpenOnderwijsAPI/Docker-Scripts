#!/bin/sh
# Run the docker container locally in interacte mode with all ports exposes (HTTP,HTTPS and the HTTP management port)

DOCKER_IMAGE=docker-registry.finalist.nl:5000/surfnet/ooapi-poc
DOCKER_TAG=1.0
NAME=ooapi-poc

#Start the ooapi-poc container if it exist or create a new one.
if docker ps -a -f name=$NAME | grep -q $NAME; then
	echo "=> Docker container $NAME exists. Start it up!"
	docker start -ai $NAME
else
	echo "=> Docker container $NAME does not exist. Pull the image from the repo, create a new one!"
#	docker pull $DOCKER_IMAGE:$DOCKER_TAG
	docker run --name $NAME -ti -p 8080:8080 -p 8443:8443 -p 9990:9990 $DOCKER_IMAGE:$DOCKER_TAG 
fi
