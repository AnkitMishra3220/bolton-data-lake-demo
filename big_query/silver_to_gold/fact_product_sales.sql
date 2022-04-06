CREATE OR REPLACE TABLE `bolton-data-lake.gold.fact_product_sales` AS
SELECT c.customerNumber as cust_id,
o.orderNumber as order_id,
o.orderDate as date_id,
p.productCode as product_id,
od.priceEach as price,
od.quantityOrdered as quantity
FROM `bolton-data-lake.silver.customers` c
JOIN `bolton-data-lake.silver.orders` o
ON c.customerNumber = o.customerNumber
JOIN `bolton-data-lake.silver.orderdetails` od
ON o.orderNumber = od.orderNumber
JOIN `bolton-data-lake.silver.products` p
ON od.productCode = p.productCode;