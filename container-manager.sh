#!/bin/bash

if [ $1 = "build" ]; then
    docker compose up --build -d && docker compose ps -a
elif [ $1 = "clean" ]; then
    docker compose down && docker rmi -f $(docker images -aq)
elif [ $1 = "deploy" ]; then
    if [ $2 = "backend" ]; then
        mv /home/monthon/INT221-BACKEND/target/kanbanborad-0.0.1-SNAPSHOT.jar /home/sysadmin/group-compose/backend/target/deploy.jar
    elif [ $2 = "frontend" ]; then
        mv /home/chanachai/INT221-FRONTEND/* /home/sysadmin/group-compose/frontend/src/
    else
        echo "backend - move .jar file to dedplot site."
        echo "frontend - move "dist" to deploy site."
    fi
else
    echo "build - build container from docker compose."
    echo "clean - stop and delete current docker container in compose, which's require root access."
    echo "deploy <site> - deploy "fronted" or "backend", which's require root access."
fi