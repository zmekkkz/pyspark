from pyspark.sql import SparkSession

# Initialize Spark session
spark = SparkSession.builder \
    .appName("CSV to PostgreSQL") \
    .config("spark.master", "spark://spark-master:7077") \
    .getOrCreate()
    
# No need to specify driver - already included in classpath through the mounted jars
postgres_url = "jdbc:postgresql://host.docker.internal:5433/mek"
properties = {
    "user": "airflow",
    "password": "airflow",
    "driver": "org.postgresql.Driver"
}
df = spark.read.jdbc(url=postgres_url, table="idc_btt", properties=properties)
# Show the DataFrame to verify
df.show()

# Write the DataFrame to PostgreSQL
#df.write.jdbc(url=postgres_url, table="idc_btt_1", mode="overwrite", properties=properties)

# Stop the Spark session
spark.stop()