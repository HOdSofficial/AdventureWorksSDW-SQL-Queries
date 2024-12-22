-- MANIPULATING DATA COMMON ERRORS 
SELECT

EnglishProductName,
EnglishDescription,
Color,
[Status],
Class,
SafetyStockLevel


FROM DimProduct


WHERE SafetyStockLevel BETWEEN  500 AND 1000 AND [Status] IS NOT NULL  -- BETWEEN IS INCLUSIVE OF BOTH ENDS ANYTIME YOU USE BETWEEN FOR DATES
-- WHERE (SafetyStockLevel) >= 500 AND SafetyStockLevel <= 1000 AND [Status] IS NOT NULL -- RECOMMENDED FOR DATAES
-- WHERE Color IN ('Black','Sliver,White', 'Yellow') 

-- LIKE to  find partial matches
SELECT 
FirstName,
EmailAddress 

FROM DimCustomer

WHERE  FirstName LIKE '_R_%'
-- USING IIF STATAMENT 
SELECT 
FirstName,
LastName,
EmailAddress,
YearlyIncome
IIF(YearlyIncome>5000,'AboveAverage','BelowAverage') AS IncomeCategory

FROM DimCustomer

WHERE  FirstName LIKE '_R_%'


SELECT 
FirstName,
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
NumberChildrenAtHome AS ActualChildren,

FROM DimCustomer

WHERE  FirstName LIKE '_R_%'


