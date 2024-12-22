--BRIDGE TABLE ALLOWS US TO AVOID MANY TO MANY RELATIONSHIP  AT ALL
-- IT IS IMPORTANT TO UNDERSTANDF THE DATA THROUGH ERD (ENTITY RELATIONSHIP DIAGRAM)
-- MARKETING Want to see the list of sales reason along with the sales amount
SELECT 
--fs.SalesOrderNumber AS InvoiceNumber,
--fs.SalesOrderLineNumber AS InvoiceLineNumber,
dsr.SalesReasonReasonType AS SalesReason,
SUM(fs.SalesAmount) AS SalesAmount


FROM FactInternetSales AS fs
    INNER JOIN FactInternetSalesReason AS fsr
    ON fs.SalesOrderNumber= fsr.SalesOrderNumber AND fsr.SalesOrderLineNumber = fsr.SalesOrderLineNumber
    INNER JOIN DimSalesReason AS dsr
    ON fsr.SalesReasonKey = dsr.SalesReasonKey

--WHERE fs.SalesOrderNumber = 'SO51178'

GROUP BY dsr.SalesReasonReasonType