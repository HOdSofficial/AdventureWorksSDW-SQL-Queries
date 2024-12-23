SELECT 

    do.OrganizationName AS Organisation,

    da.AccountType AS AccountType,
    da.AccountDescription AS  Account,
      
    SUM(ff.Amount) AS Amt

FROM FactFinance AS ff
    INNER JOIN  DimOrganization AS do
    ON ff.OrganizationKey = do.OrganizationKey
    INNER JOIN DimAccount AS da
    ON ff.AccountKey = da.AccountKey
    INNER JOIN DimScenario AS ds
    ON ff.ScenarioKey = ff.ScenarioKey
    INNER JOIN  DimDate AS dd
    ON ff.DateKey = dd.DateKey
   
WHERE  ds.ScenarioName = N'Actual'
    AND dd.CalendarYear = '2011'
    AND dd.EnglishMonthName = N'January'
    AND do.OrganizationName = N'Southwest Division'
    AND da.AccountType = 'Expenditures'

GROUP BY  do.OrganizationName, da.AccountType, da.AccountDescription

ORDER BY Amt DESC