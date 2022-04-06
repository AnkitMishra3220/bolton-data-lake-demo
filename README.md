# bolton-data-lake-demo
![Alt text](datalake.png?raw=true "DataLake")
# Prerequisite
  1. Google Cloud 
  2. gcloud CLI (https://cloud.google.com/sdk/docs/install) 
  3. Cloud SQL 
  4. DataGrip (Optional)

Cloud SQL:

1. curl -o cloud_sql_proxy https://dl.google.com/cloudsql/cloud_sql_proxy.darwin.amd64
2. chmod +x cloud_sql_proxy
3. ./cloud_sql_proxy -instances=bolton-data-lake:europe-west3:bolton-data-lake-demo-my-sql=tcp:3306

  