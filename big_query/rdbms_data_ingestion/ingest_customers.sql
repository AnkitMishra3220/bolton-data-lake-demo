INSERT INTO
`bolton-data-lake.bronze.customers`
SELECT * FROM
EXTERNAL_QUERY("projects/bolton-data-lake/locations/europe-west3/connections/bolton-data-lake-demo-my-sql",
"select * from company.customers;")
WHERE update_timestamp > (
SELECT processed_timestamp FROM
`bolton-data-lake.data_lake_metadata.ingestion` where tablename = 'customers') ;

UPDATE `bolton-data-lake.data_lake_metadata.ingestion`
SET processed_timestamp = (SELECT MAX(update_timestamp) FROM `bolton-data-lake.bronze.customers`)
WHERE tablename = "customers";