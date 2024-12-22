CREATE VIEW vwOrderAll
AS
-- Sales and promo from internet sales
SELECT
    fs.SalesOrderNumber AS InvoiceNumber,
    fs.SalesOrderLineNumber AS InvoiceLineNumber,
    fs.OrderDate AS OrderDate,
    fs.TaxAmt AS TaxAmt,
    fs.Freight AS FreightAmt,
    Fs.OrderQuantity AS OrderQuantity,
    fs.SalesAmount AS SalesAmount,

    dp.EnglishProductName AS ProductName,
    dp.[Status] AS Status,

    dpsc.EnglishProductSubcategoryName AS ProductSubCategory,

    dpc.EnglishProductCategoryName AS ProductCategory,

    dst.SalesTerritoryCountry AS Country,
    dst.SalesTerritoryRegion AS Region,

    dpr.EnglishPromotionName AS PromotionName,
    dpr.EnglishPromotionType AS PromotionType,
    dpr.EnglishPromotionCategory AS Promotioncategory,

    dcy.CurrencyName AS CurrencyName,

    'Web' AS Source -- tobalance the number of rows and column of the 2 joined tables
    -- must have equal no. of expression in the target list


FROM FactInternetSales AS fs
    INNER JOIN DimProduct AS dp
    ON fs.ProductKey = dp.ProductKey
    INNER JOIN  DimProductSubCategory AS dpsc
    ON dp.ProductSubCategoryKey = dpsc.ProductSubCategoryKey
    INNER JOIN DimProductCategory AS dpc
    ON dpsc.ProductCategoryKey = dpc.ProductCategoryAlternateKey
    INNER JOIN DimSalesTerritory AS dst
    ON fs.SalesTerritoryKey = dst.SalesTerritoryKey
    INNER JOIN DimPromotion AS dpr
    ON fs.PromotionKey = dpr.PromotionKey
    INNER JOIN DimCurrency AS dcy
    ON fs.CurrencyKey = dcy.CurrencyKey

WHERE Year(OrderDate) IN (2012,2013)

UNION

-- SALES AND PROMO SUMMARY FROM RESELLERS SALES

SELECT
    fs.SalesOrderNumber AS InvoiceNumber,
    fs.SalesOrderLineNumber AS InvoiceLineNumber,
    fs.OrderDate AS OrderDate,
    fs.TaxAmt AS TaxAmt,
    fs.Freight AS FreightAmt,
    Fs.OrderQuantity AS OrderQuantity,
    fs.SalesAmount AS SalesAmount,

    dp.EnglishProductName AS ProductName,
    dp.[Status] AS Status,

    dpsc.EnglishProductSubcategoryName AS ProductSubCategory,

    dpc.EnglishProductCategoryName AS ProductCategory,

    dst.SalesTerritoryCountry AS Country,
    dst.SalesTerritoryRegion AS Region,

    dpr.EnglishPromotionName AS PromotionName,
    dpr.EnglishPromotionType AS PromotionType,
    dpr.EnglishPromotionCategory AS Promotioncategory,

    dcy.CurrencyName AS CurrencyName,

    dr.ResellerName AS Source -- TO IDENTIFY THE SOURCE


FROM FactResellerSales AS fs
    INNER JOIN DimProduct AS dp
    ON fs.ProductKey = dp.ProductKey
    INNER JOIN  DimProductSubCategory AS dpsc
    ON dp.ProductSubCategoryKey = dpsc.ProductSubCategoryKey
    INNER JOIN DimProductCategory AS dpc
    ON dpsc.ProductCategoryKey = dpc.ProductCategoryAlternateKey
    INNER JOIN DimSalesTerritory AS dst
    ON fs.SalesTerritoryKey = dst.SalesTerritoryKey
    INNER JOIN DimPromotion AS dpr
    ON fs.PromotionKey = dpr.PromotionKey
    INNER JOIN DimCurrency AS dcy
    ON fs.CurrencyKey = dcy.CurrencyKey
    INNER JOIN DimReseller AS dr
    ON fs.ResellerKey = dr.ResellerKey

WHERE YEAR(OrderDate) IN (2012,2013)

--UNION AND UNION ALL SHOULD HAVE THE SAME COLUMN NAME

GO