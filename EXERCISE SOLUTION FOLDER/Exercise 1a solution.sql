-- Select rows from a Table or View '[TableOrViewName]' in schema '[dbo]'
SELECT 

SalesOrderNumber AS InvoiceNumber,
SUM(TotalProductCost) AS TotalProductCost

FROM [FactInternetSales]

GROUP BY SalesOrderNumber

HAVING SUM(TotalProductCost) < 2000

ORDER BY TotalProductCost Desc