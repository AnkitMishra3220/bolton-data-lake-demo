INSERT INTO
`bolton-data-lake.bronze.offices`
SELECT * FROM
EXTERNAL_QUERY("projects/bolton-data-lake/locations/europe-west3/connections/bolton-data-lake-demo-my-sql",
"select * from company.offices;")
WHERE update_timestamp > (
SELECT processed_timestamp FROM
`bolton-data-lake.data_lake_metadata.ingestion` where tablename = 'offices') ;

UPDATE `bolton-data-lake.data_lake_metadata.ingestion`
SET processed_timestamp = (SELECT MAX(update_timestamp) FROM `bolton-data-lake.bronze.offices`)
WHERE tablename = "offices";