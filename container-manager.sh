#!/bin/bash

if [ $1 = "devops" ]; then
    if [ $2 = "build" ]; then
        docker compose up --build -d && docker compose ps -a && docker ps -a
    elif [ $2 = "clean" ]; then
        docker compose stop database frontend backend tester && docker compose rm database frontend backend tester
        docker rmi -f $(docker images -aq)
    elif [ $2 = "deploy" ]; then
        if [ $3 = "backend" ]; then
            mv /home/monthon/INT221-BACKEND/target/kanbanborad-0.0.1-SNAPSHOT.jar /home/sysadmin/group-compose/backend/target/deploy.jar
        elif [ $3 = "frontend" ]; then
            mv /home/chanachai/INT221-FRONTEND/dist/ /home/sysadmin/group-compose/frontend/
        elif [ $3 = "tester" ]; then
            mkdir ./tester/src-fe
            cp -r /home/chanachai/INT221-FRONTEND/* /home/sysadmin/group-compose/tester/src-fe/
        else
            echo "backend - move .jar file to dedplot site."
            echo "frontend - move "dist" to deploy site."
        fi
    else
        echo "build - build container from docker compose."
        echo "clean - stop and delete current docker container in compose, which's require root access."
        echo "deploy <site> - deploy "fronted" or "backend", which's require root access."
    fi
fi