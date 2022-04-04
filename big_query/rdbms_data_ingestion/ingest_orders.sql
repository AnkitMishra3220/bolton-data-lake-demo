INSERT INTO
`bolton-data-lake.bronze.orders`
SELECT * FROM
EXTERNAL_QUERY("projects/bolton-data-lake/locations/europe-west3/connections/bolton-data-lake-demo-my-sql",
"select * from company.orders;")
WHERE update_timestamp > (
SELECT processed_timestamp FROM
`bolton-data-lake.data_lake_metadata.ingestion` where tablename = 'orders') ;

UPDATE `bolton-data-lake.data_lake_metadata.ingestion`
SET processed_timestamp = (SELECT MAX(update_timestamp) FROM `bolton-data-lake.bronze.orders`)
WHERE tablename = "orders";