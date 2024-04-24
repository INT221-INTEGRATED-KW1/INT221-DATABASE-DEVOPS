if [ $1 = "backend" ]; then
        mv ./target/$2 /home/sysadmin/group-compose/backend/target/deploy.jar
elif [ $1 = "frontend" ]; then
        mv ./dist/* /home/sysadmin/group-conpose/frontend/dist/
else
    echo "backend [jar-file.jar] - move .jar file to deplot site."
    echo "frontend - move "dist" to deploy site."
fi