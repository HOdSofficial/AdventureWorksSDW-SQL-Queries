-- MANIPULATING DATA COMMON ERRORS 
SELECT

EnglishProductName,
EnglishDescription,
Color,
[Status]
Class


FROM DimProduct

WHERE (Class<> 'H' OR Class IS NULL) AND [Status] IS NOT NULL 
-- AND IS EVALUATED FIRST
-- WHERE Status = 'Current'