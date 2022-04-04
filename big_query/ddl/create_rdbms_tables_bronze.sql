CREATE TABLE `bolton-data-lake.bronze.customers` (
  `customerNumber` INT64,
  `customerName` STRING,
  `contactLastName` STRING,
  `contactFirstName` STRING,
  `phone` STRING,
  `addressLine1` STRING,
  `addressLine2` STRING,
  `city` STRING,
  `state` STRING,
  `postalCode` STRING,
  `country` STRING,
  `salesRepEmployeeNumber` INT64,
  `creditLimit` NUMERIC,
  `update_timestamp` TIMESTAMP) ;

CREATE TABLE `bolton-data-lake.bronze.employees` (
  `employeeNumber` INT64,
  `lastName` STRING,
  `firstName` STRING,
  `extension` STRING,
  `email` STRING,
  `officeCode` STRING,
  `reportsTo` INT64,
  `jobTitle` STRING,
  `update_timestamp` TIMESTAMP) ;

CREATE TABLE `bolton-data-lake.bronze.offices` (
  `officeCode` STRING,
  `city` STRING,
  `phone` STRING,
  `addressLine1` STRING,
  `addressLine2` STRING,
  `state` STRING,
  `country` STRING,
  `postalCode` STRING,
  `territory` STRING,
  `update_timestamp` TIMESTAMP) ;
   
CREATE TABLE `bolton-data-lake.bronze.orderdetails` (
  `orderNumber` INT64,
  `productCode` STRING,
  `quantityOrdered` INT64,
  `priceEach` NUMERIC ,
  `orderLineNumber` INT64 ,
  `update_timestamp` TIMESTAMP) ;

CREATE TABLE `bolton-data-lake.bronze.orders` (
  `orderNumber` INT64,
  `orderDate` DATE ,
  `requiredDate` DATE ,
  `shippedDate` DATE,
  `status` STRING,
  `comments` STRING,
  `customerNumber` INT64,
  `update_timestamp` TIMESTAMP) ;

CREATE TABLE `bolton-data-lake.bronze.payments` (
  `customerNumber` INT64,
  `checkNumber` STRING,
  `paymentDate` DATE,
  `amount` NUMERIC,
  `update_timestamp` TIMESTAMP);

CREATE TABLE `bolton-data-lake.bronze.productlines` (
  `productLine` STRING,
  `textDescription` STRING,
  `htmlDescription` STRING,
  `update_timestamp` TIMESTAMP) ;

CREATE TABLE `bolton-data-lake.bronze.products` (
  `productCode` STRING,
  `productName` STRING,
  `productLine` STRING,
  `productScale` STRING,
  `productVendor` STRING,
  `productDescription` STRING,
  `quantityInStock` INT64 ,
  `buyPrice` NUMERIC ,
  `MSRP` NUMERIC ,
  `update_timestamp` TIMESTAMP) ;

CREATE TABLE `bolton-data-lake.data_lake_metadata.ingestion` (
    processed_timestamp timestamp,
    tablename string
);
  
  
