-- USING TEXT FUNCTION
SELECT 
--ProductKey, # we can remove Productkeyu and Productalternatekey
--ProductAlternateKey,
EnglishProductName AS ProductName,
EnglishDescription AS ProductDescription,
CONCAT(EnglishProductName,'-', EnglishDescription) AS ProductNameAndDescription,
LEN(EnglishDescription) AS DesriptionLength,
UPPER(EnglishProductName) AS UpperProductName,
LOWER(EnglishProductName) AS LowerProductName,
REPLACE(EnglishProductName,'Front', 'Ultra Durable Front') AS EnglishProductName,
LEFT(ProductAlternateKey, 2) AS ProductShort,
RIGHT(ProductAlternateKey,LEN(ProductAlternateKey)-3) AS ProductAlternateKey2
FROM DimProduct
WHERE ProductKey = 555

