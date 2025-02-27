from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("test").master("spark://spark-master:7077").getOrCreate()

df = spark.read.csv("/opt/bitnami/spark/data/idc_btt.csv", header=True, inferSchema=True)
df.show()

