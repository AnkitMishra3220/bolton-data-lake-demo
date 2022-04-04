-- Get me all rows from the table where there is no row with the same customer id and a larger timestamp.
CREATE OR REPLACE TABLE `bolton-data-lake.silver.payments` AS
select t.*
from `bolton-data-lake.bronze.payments` t
where not exists (select 1
                  from `bolton-data-lake.bronze.payments` t2
                  where t2.customerNumber = t.customerNumber and
                        t2.checkNumber = t.checkNumber and
                        t2.update_timestamp > t.update_timestamp
                 );