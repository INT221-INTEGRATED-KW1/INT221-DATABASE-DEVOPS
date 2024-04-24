if [ $1 = "build" ]; then
    docker compose up --build -d
elif [ $1 = "clean" ]; then
    docker compose stop database frontend backend && docker compose rm database frontend backend
else
    echo "build - build container from docker compose."
    echo "clean - stop and delete current docker container in compose."
fi