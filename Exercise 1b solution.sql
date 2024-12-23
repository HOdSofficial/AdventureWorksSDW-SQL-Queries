SELECT
SalesOrderNumber AS InvoiceNumber,
SalesOrderLineNumber AS InvoiceLineNumber,
SalesAmount

FROM FactInternetSales

WHERE CurrencyKey = 100

