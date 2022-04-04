CREATE TABLE IF NOT EXISTS  `bolton-data-lake.silver.customers` (
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

CREATE TABLE IF NOT EXISTS  `bolton-data-lake.silver.employees` (
  `employeeNumber` INT64,
  `lastName` STRING,
  `firstName` STRING,
  `extension` STRING,
  `email` STRING,
  `officeCode` STRING,
  `reportsTo` INT64,
  `jobTitle` STRING,
  `update_timestamp` TIMESTAMP) ;

CREATE TABLE IF NOT EXISTS  `bolton-data-lake.silver.offices` (
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
   
CREATE TABLE IF NOT EXISTS  `bolton-data-lake.silver.orderdetails` (
  `orderNumber` INT64,
  `productCode` STRING,
  `quantityOrdered` INT64,
  `priceEach` NUMERIC ,
  `orderLineNumber` INT64 ,
  `update_timestamp` TIMESTAMP) ;

CREATE TABLE IF NOT EXISTS  `bolton-data-lake.silver.orders` (
  `orderNumber` INT64,
  `orderDate` DATE ,
  `requiredDate` DATE ,
  `shippedDate` DATE,
  `status` STRING,
  `comments` STRING,
  `customerNumber` INT64,
  `update_timestamp` TIMESTAMP) ;

CREATE TABLE IF NOT EXISTS  `bolton-data-lake.silver.payments` (
  `customerNumber` INT64,
  `checkNumber` STRING,
  `paymentDate` DATE,
  `amount` NUMERIC,
  `update_timestamp` TIMESTAMP);

CREATE TABLE IF NOT EXISTS  `bolton-data-lake.silver.productlines` (
  `productLine` STRING,
  `textDescription` STRING,
  `htmlDescription` STRING,
  `update_timestamp` TIMESTAMP) ;

CREATE TABLE IF NOT EXISTS  `bolton-data-lake.silver.products` (
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