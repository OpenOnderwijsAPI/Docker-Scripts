# SURFnet - Open Onderwijs API - Docker scripts
This project contains a number of scripts for doing a (clean) start of the OOAPI Docker container.

## Prerequisites
* Docker must be installed.
* The OOAPI Docker image must have been build locally.

## Run the docker images
You can start a new or existing docker container by using the command:

* Open Onderwijs API (locally):`apiman-run-local.sh`
* Open Onderwijs API (https://apiman.openderwijsapi.nl:7443) :`apiman-run-acc.sh`

You can start a new container by cleaning up any previously created container by using the command:

* Open Onderwijs API (locally):`apiman-run-local-clean.sh`
* Open Onderwijs API (https://apiman.openderwijsapi.nl:7443):`apiman-run-acc-clean.sh`