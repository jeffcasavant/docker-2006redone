#! /bin/bash

./prep.sh

docker build server -t jeffcasavant/2006redone-server
docker build fileserver -t jeffcasavant/2006redone-fileserver
docker build clientdl -t jeffcasavant/2006redone-clientdl
docker push jeffcasavant/2006redone-server
docker push jeffcasavant/2006redone-fileserver
docker push jeffcasavant/2006redone-clientdl
