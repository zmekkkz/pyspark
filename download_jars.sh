#!/bin/bash

# Create jars directory if it doesn't exist
mkdir -p jars

# Download PostgreSQL JDBC driver
echo "Downloading PostgreSQL JDBC driver..."
curl -o jars/postgresql-42.5.1.jar https://repo1.maven.org/maven2/org/postgresql/postgresql/42.5.1/postgresql-42.5.1.jar

# Download MySQL JDBC driver
echo "Downloading MySQL JDBC driver..."
curl -o jars/mysql-connector-java-8.0.33.jar https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.33/mysql-connector-java-8.0.33.jar

# Download MSSQL JDBC driver
echo "Downloading MSSQL JDBC driver..."
curl -o jars/mssql-jdbc-11.2.3.jre8.jar https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/11.2.3.jre8/mssql-jdbc-11.2.3.jre8.jar

echo "All JDBC drivers downloaded successfully!"
echo "You can now start your Spark cluster with 'docker-compose up'"
