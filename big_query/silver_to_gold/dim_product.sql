CREATE OR REPLACE TABLE `bolton-data-lake.gold.dim_product`
AS SELECT
    `productCode` as id,
    `productName` as product_name,
    `productLine` as product_line,
    `productScale` as product_scale,
    `productVendor` as product_vendor,
    `productDescription` as product_description,
FROM  `bolton-data-lake.silver.products`;