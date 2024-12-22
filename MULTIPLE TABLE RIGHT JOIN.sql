-- THE PRODUCT MGT WANTS TO KNOW THE SALES REVENUE GENERATED BY EACH PRODUCT
 SELECT 

    dp.EnglishProductName AS ProductName,
    dp.Color AS ProductColor,
    ISNULL(dp.Size, 'UNKW') AS ProductSize,
    ISNULL(SUM(SalesAmount),0) AS SalesAmount,
    dp.[Status] AS Status

/*
FROM FactInternetSales AS fs
    RIGHT JOIN DimProduct as dp -- ALL ROWS FROM JOINT TABLES AND RETURN MATCHES WHERE AVAILABLE FROM THE FACT TABLES
    ON fs.ProductKey = dp.ProductKey */

FROM DimProduct AS dp -- preserve everything to the left i.e the dim product
    LEFT JOIN FactInternetSales AS fs
    ON dp.ProductKey = fs.ProductKey

WHERE dp.Status = N'Current'

GROUP BY dp.EnglishProductName, dp.Color, dp.[Size],dp.[Status]

ORDER BY SalesAmount DESC

/* Test for the number of rows in ENglish Product Name
SELECT
    EnglishProductName

FROM
    DimProduct

WHERE [Status] = N'Current'
*/