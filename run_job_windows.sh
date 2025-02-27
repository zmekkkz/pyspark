#!/bin/bash

# Check if job name is provided
if [ -z "$1" ]; then
    echo "Usage: ./run_job_windows.sh <job_script_name>"
    echo "Example: ./run_job_windows.sh read_write_db_test.py"
    exit 1
fi

JOB_NAME=$1

echo "Running Spark job: $JOB_NAME"
# Use MSYS_NO_PATHCONV=1 to prevent Git Bash from converting paths
MSYS_NO_PATHCONV=1 docker exec -it pyspark-spark-master-1 spark-submit \
    --master spark://spark-master:7077 \
    --jars /opt/bitnami/spark/external_jars/*.jar \
    /opt/bitnami/spark/jobs/$JOB_NAME

echo "Job execution complete."
