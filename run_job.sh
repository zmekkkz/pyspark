#!/bin/bash

# Check if job name is provided
if [ -z "$1" ]; then
    echo "Usage: ./run_job.sh <job_script_name>"
    echo "Example: ./run_job.sh read_write_db_test.py"
    exit 1
fi

JOB_NAME=$1

# Convert Windows path to Unix path if running in Git Bash
if [[ "$OSTYPE" == "msys" ]]; then
    JOB_NAME=$(cygpath -u "$JOB_NAME")
fi

echo "Running Spark job: $JOB_NAME"
docker exec -it pyspark-spark-master-1 spark-submit \
    --master spark://spark-master:7077 \
    --jars /opt/bitnami/spark/external_jars/*.jar \
    /opt/bitnami/spark/jobs/$JOB_NAME

echo "Job execution complete."
