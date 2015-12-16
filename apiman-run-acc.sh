#!/bin/sh
# Run the OOAPI container as a deamon on HTTPS port 7443

DOCKER_IMAGE=docker-registry.finalist.nl:5000/surfnet/ooapi-poc
DOCKER_TAG=1.0
NAME=apiman-ooapi-poc

#Start the ooapi-poc container if it exist or create a new one.
if docker ps -a -f name=$NAME | grep -q $NAME; then
	echo "=> Docker container $NAME exists. Start it up!"
	docker start -ai $NAME
else
	echo "=> Docker container $NAME does not exist. Pull the image from the repo, create a new one!"
	docker pull $DOCKER_IMAGE:$DOCKER_TAG
	docker run --name $NAME -p 7443:8443 -d $DOCKER_IMAGE:$DOCKER_TAG 
fi


#Sleep 60 seconds before we validate if the docker container is still up and running.
echo "=> Sleep for 60 seconds before we validate the success of the job"
sleep 60

echo "=> Print the logging"
docker logs $NAME

# Verify if the docker container is still running. Wildfly should still be running or have crashed by now
# Signalling calling processes using the exit status code of grep
echo "=> Validate if we are still running"
docker ps -f name=$NAME -f status=running | grep -q $NAME
