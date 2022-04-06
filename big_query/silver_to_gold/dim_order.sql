CREATE OR REPLACE TABLE `bolton-data-lake.gold.dim_order`
AS SELECT
    `orderNumber` as id,
    `orderDate` as order_date,
    `requiredDate` as required_date,
    `shippedDate` as shipped_date,
    `status`,
    `comments`
FROM  `bolton-data-lake.silver.orders`;