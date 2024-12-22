--BASIC SQL FORMATTING
-- USING ISNULL IIF AND COALSCENE
SELECT 
    FirstName,
    IIF(MiddleNamE IS NULL, 'UNION', MiddleName) AS MiddleName, -- dealing with NUll
    ISNULL(MiddleName, 'UNKW') AS MiddleName2,
    COALESCE(MiddleName, 'UNKW') AS MiddleName3,
    LastName,
    EmailAddress,
    YearlyIncome,
    IIF(YearlyIncome>5000,'AboveAverage','BelowAverage') AS IncomeCategory,
    CASE 
        WHEN NumberChildrenAtHome = 0 THEN '0'
        WHEN NumberChildrenAtHome = 1 THEN '1'
        WHEN NumberChildrenAtHome BETWEEN 2 AND 4 THEN '2-4'
        WHEN NumberChildrenAtHome >=5 THEN '5+'
        ELSE 'UNKW'
        END AS NumberChildrenAtHome,
    NumberChildrenAtHome AS ActualChildren

FROM DimCustomer
WHERE IIF(YearlyIncome >50000,'AboveAverage', 'BelowAverage') = 'AboveAverage'


