SELECT 

CONCAT(dc.FirstName, ' ', dc.LastName) AS CustomerName,
dc.EmailAddress AS EmailAddress,
SUM(fs.SalesAmount) AS AmountSpent, -- it is aggregated by this column and gives 18,484 rows - this is aggregation using sum
dcy.CurrencyName AS Currency

FROM FactInternetSales AS fs
    INNER JOIN DimCustomer AS dc
    -- to speed up coding we can write FactInternetSales as fs and DimCustomer as dc
    ON fs.CustomerKey = dc.CustomerKey
    -- Marketing is pretty happy with the report but they will like us to filter down to  customers who pay in us dollars
    -- from our erd currency key is the pry key so we will use that to create a join
    INNER JOIN DimCurrency AS dcy 
    ON fs.CurrencyKey = dcy.CurrencyKey




GROUP BY dc.Firstname, dc.LastName, dc.EmailAddress, dcy.CurrencyName  -- this is anothere form of aggregation using text
-- FROM is evaluated 1st and Select is the last to be executed  and ORDER BY is the last to be executed
HAVING dcy.CurrencyName = N'US Dollar'

ORDER BY AmountSpent DESC



     