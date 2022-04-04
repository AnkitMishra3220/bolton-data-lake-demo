-- Get me all rows from the table where there is no row with the same customer id and a larger timestamp.
CREATE OR REPLACE TABLE `bolton-data-lake.silver.orderdetails` AS
select t.*
from `bolton-data-lake.bronze.orderdetails` t
where not exists (select 1,2
                  from `bolton-data-lake.bronze.orderdetails` t2
                  where t2.orderNumber = t.orderNumber and
                        t2.productCode = t.productCode and
                        t2.update_timestamp > t.update_timestamp
                 );