SELECT 

    CONCAT(FirstName, ' ',LastName) AS EmployeeName,
    Title AS EmployeeTitle,
    CurrencyName AS Currency,
    SUM(SalesAmount) AS TotalSalesAmount


FROM FactResellerSales AS frs
    INNER JOIN DimEmployee AS de
    ON frs.EmployeeKey = de.EmployeeKey
    INNER JOIN DimCurrency AS dc
    ON frs.CurrencyKey = dc.CurrencyKey 
    INNER JOIN DimSalesTerritory AS dst
    ON frs.SalesTerritoryKey = dst.SalesTerritoryKey


WHERE dst.SalesTerritoryGroup =N'Europe'
AND de.[Status] = N'Current'

GROUP BY FirstName, LastName, Title, CurrencyName

ORDER BY EmployeeName, TotalSalesAmount ASC

