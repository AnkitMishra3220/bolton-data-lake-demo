CREATE OR REPLACE TABLE `bolton-data-lake.gold.dim_customer`
AS SELECT
  `customerNumber` as id,
  `customerName` as name,
  `contactLastName` ,
  `contactFirstName` ,
  `phone` ,
  `addressLine1` ,
  `addressLine2` ,
  `city` ,
  `state` ,
  `postalCode` ,
  `country` ,
  `salesRepEmployeeNumber`,
  `creditLimit`
FROM  `bolton-data-lake.silver.customers`;