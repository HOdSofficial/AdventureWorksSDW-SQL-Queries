-- ROLL UP IS 
-- when using heirachical data the group function doesnt perform well we had to use the roll up fucntion
--ROLLUP are similar function to the cube
SELECT

ProductCategory,
ProductSubCategory,
Sum(SalesAmount) AS TotalSales

FROM vwOrdersALL

WHERE YEAR(OrderDate) = 2013
AND Currency = N'US Dollar'

GROUP BY ROLLUP(ProductCategory, ProductSubCategory)

