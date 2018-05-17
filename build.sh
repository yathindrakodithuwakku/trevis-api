#!/usr/bin/env bash
#Run from the root dir of the project

#Get current date and time
timestamp=$(date + "%Y-%m-%d-%H-%M-%S")

echo "** Create the executable zip file"
sbt dist

echo "** Create the docker image"
docker build -t trevis-api .

echo "** Run the docker image"
docker run -it -p 9000:9000 -p 9443:9443 trevis-api