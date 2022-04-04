-- Get me all rows from the table where there is no row with the same customer id and a larger timestamp.
CREATE OR REPLACE TABLE `bolton-data-lake.silver.employees` AS
select t.*
from `bolton-data-lake.bronze.employees` t
where not exists (select 1
                  from `bolton-data-lake.bronze.employees` t2
                  where t2.employeeNumber = t.employeeNumber and
                        t2.update_timestamp > t.update_timestamp
                 );