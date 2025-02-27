# PySpark Docker Environment with Pre-loaded JDBC Drivers

This environment sets up a Spark cluster with pre-loaded JDBC drivers to avoid downloading them every time a job is submitted.

## Setup Instructions

1. Create directory structure and download dependencies:
   ```bash
   # Create necessary directories
   mkdir -p jobs data jars
   
   # Download JDBC drivers (run once)
   bash download_jars.sh
   ```

2. Start the Spark cluster:
   ```bash
   docker-compose up -d
   ```

3. Run a job:
   ```bash
   bash run_job.sh read_write_db_test.py
   ```

## How It Works

- JDBC driver JARs are downloaded once and stored in the `./jars` directory
- These JARs are mounted into the Spark containers at `/opt/bitnami/spark/external_jars`
- When submitting jobs, we include these JARs in the classpath automatically
- This prevents Spark from downloading the packages each time a job runs

## Folders Structure

- `jobs/`: Place your Spark job Python scripts here
- `data/`: Data files for your Spark jobs
- `jars/`: Pre-downloaded JDBC driver JARs

## Troubleshooting

If you experience issues with the JDBC connections:
- Ensure the host.docker.internal is resolvable from within containers
- Verify database credentials and connection parameters
- Check that the JDBC drivers are correctly mounted in the containers