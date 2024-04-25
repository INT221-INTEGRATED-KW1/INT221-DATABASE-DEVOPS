if [ $1 = "backend" ]; then
        mv /home/monthon/INT221-BACKEND/target/kanbanborad-0.0.1-SNAPSHOT.jar /home/sysadmin/group-compose/backend/target/deploy.jar
elif [ $1 = "frontend" ]; then
        mv /home/chanachai/INT221-FRONTEND/dist/* /home/sysadmin/group-conpose/frontend/dist/
else
    echo "backend - move .jar file to deplot site."
    echo "frontend - move "dist" to deploy site."
fi