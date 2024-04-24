FROM mysql/mysql-server:8.0

WORKDIR /
RUN echo "mysql -u root -p < kanbanboard.sql" > include_data.sh
RUN chmod +x include_data.sh