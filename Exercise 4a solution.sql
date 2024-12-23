--DONE BY SAHEED HASSAN (LINKEDIN) GITHUB HODSOFFICIAL
SELECT TOP 5

    dpsc.EnglishProductSubcategoryName AS SubCategory,
    SUM(fs.SalesAmount) AS SalesAmount

FROM FactInternetSales AS fs
    INNER JOIN DimProduct AS dp
    ON fs.ProductKey = dp.ProductKey
    INNER JOIN DimProductSubcategory AS dpsc
    ON dp.ProductSubcategoryKey = dpsc.ProductSubcategoryKey
    INNER JOIN DimSalesTerritory AS dst
    ON fs.SalesTerritoryKey = dst.SalesTerritoryKey
    INNER JOIN DimCurrency AS dm
    ON fs.CurrencyKey = dm.CurrencyKey


WHERE SalesTerritoryCountry =  'United States'
AND CurrencyName = 'US Dollar'

GROUP BY  EnglishProductSubcategoryName

ORDER BY SalesAmount DESC
    
  
    

