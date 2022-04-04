CREATE TABLE IF NOT EXISTS `bolton-data-lake.data_lake_metadata.ingestion`
(processed_timestamp timestamp,
 tablename timestamp);

INSERT INTO `bolton-data-lake.data_lake_metadata.ingestion` values
('1995-01-01 00:00:01','customers'),
('1995-01-01 00:00:01','employees'),
('1995-01-01 00:00:01','offices'),
('1995-01-01 00:00:01','orderdetails'),
('1995-01-01 00:00:01','orders'),
('1995-01-01 00:00:01','payments'),
('1995-01-01 00:00:01','productlines'),
('1995-01-01 00:00:01','products');