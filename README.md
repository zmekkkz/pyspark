# PySpark Docker Environment

This repository contains a Docker-based PySpark environment for data processing and analysis.

## Components

- **Spark Master**: Main Spark cluster coordinator
- **Spark Workers**: Processing nodes that execute tasks
- **JupyterLab**: Interactive Python notebook environment with PySpark integration

## Setup Instructions

1. Create required directories (if not already present):
   ```bash
   mkdir -p jobs data jars notebooks
   ```

2. Start the environment:
   ```bash
   docker-compose up -d
   ```

3. Access JupyterLab:
   - URL: [http://localhost:8888](http://localhost:8888)
   - No password required (configured as open access)

4. Access Spark Master UI:
   - URL: [http://localhost:8080](http://localhost:8080)

## Working with Data Files

### File Path Issue

When using PySpark in this Docker environment, you'll encounter an important difference in how files are accessed:

- In **Jupyter notebooks**: Files are accessed at `/home/jovyan/work/data/`
- In **Spark workers**: The same files are at `/opt/bitnami/spark/data/`

This path difference is why you might see errors like:
````
