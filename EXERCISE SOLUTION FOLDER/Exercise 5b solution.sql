SELECT 

    da.AccountDescription AS  AccountDescription,
      
    SUM(ff.Amount) AS Amount,

    SUM(ff.Amount)/ (SELECT
            SUM(ff.Amount) AS Amount


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
                    AND dd.CalendarYear = 2013
                    AND do.OrganizationName = N'Canadian Division'
                    AND da.AccountType = N'Expenditures') * 100 PctOfTotal

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
    AND dd.CalendarYear = '2013'
    AND da.AccountType = N'Expenditures'
    AND do.OrganizationName = N'Canadian Division'

GROUP BY  da.AccountType, da.AccountDescription

ORDER BY Amount DESC


