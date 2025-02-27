from pyspark.sql import SparkSession

# Initialize Spark session with configurations - modified to not include the JAR here
# as we'll pass it via spark-submit command instead
spark = SparkSession.builder \
    .appName("CSV to PostgreSQL") \
    .config("spark.master", "spark://spark-master:7077")\
    .getOrCreate()
    
# Load data from CSV file into DataFrame
csv_file_path = "/opt/bitnami/spark/data/idc_btt.csv"
df = spark.read.csv(csv_file_path, header=True, inferSchema=True)

# Show the DataFrame to verify
df.show()

# PostgreSQL JDBC options
postgres_url = "jdbc:postgresql://host.docker.internal:5433/mek"
properties = {
    "user": "airflow",
    "password": "airflow",
    "driver": "org.postgresql.Driver"
}

# Write the DataFrame to PostgreSQL
df.write.jdbc(url=postgres_url, table="idc_btt", mode="overwrite", properties=properties)

# Stop the Spark session
spark.stop()
