#!/bin/bash

if [ $1 = "devops" ]; then
    if [ $2 = "build" ]; then
        docker compose up --build -d && docker compose ps -a
    elif [ $2 = "clean" ]; then
        docker compose stop database frontend backend && docker compose rm database frontend backend
    elif [ $2 = "deploy" ]; then
        if [ $3 = "backend" ]; then
            mv /home/monthon/INT221-BACKEND/target/kanbanborad-0.0.1-SNAPSHOT.jar /home/sysadmin/group-compose/backend/target/deploy.jar
        elif [ $3 = "frontend" ]; then
            mv /home/chanachai/INT221-FRONTEND/dist/* /home/sysadmin/group-conpose/frontend/dist/
        else
            echo "backend - move .jar file to dedplot site."
            echo "frontend - move "dist" to deploy site."
        fi
    else
        echo "build - build container from docker compose."
        echo "clean - stop and delete current docker container in compose."
        echo "deploy <site> - deploy "fronted" or "backend", which's require root access."
    fi
elif [ $1 = "developer" ]; then
    if [ $2 = "backend" ]; then
        git clone https://github.com/INT221-INTEGRATED-KW1/INT221-BACKEND.git && sh ./INT221-BACKEND/mvnw clean package
    elif [ $2 = "frontend" ]; then
        git clone https://github.com/INT221-INTEGRATED-KW1/INT221-FRONTEND.git && cd ./INT221-FRONTEND && npm i && npm run build
    else
        echo "backend - build back-end project"
        echo "frontend - build front-end project"
    fi
fi