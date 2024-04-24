FROM mysql/mysql-server:8.0

# Use cronjob set to run the script after 1 minute.

WORKDIR /
RUN echo "mysql -u root -p < kanbanboard.sql" > include_data.sh
RUN chmod +x include_data.sh