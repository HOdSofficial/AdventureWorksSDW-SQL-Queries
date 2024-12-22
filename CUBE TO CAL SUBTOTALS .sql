--  CUBE ALLOW US TO CALCULATE THE SUB TOTALS OF EAACH REGION WHERE SEE NULL IS THE SUB TOTAL

SELECT

Region,
ProductCategory,
Sum(SalesAmount) AS TotalSales

FROM vwOrdersALL

WHERE YEAR(OrderDate) = 2013
AND Currency = N'US Dollar'

GROUP BY CUBE(Region, ProductCategory)

