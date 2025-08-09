-- Drop the view dim_CustomerJoin if it exists
IF OBJECT_ID('dbo.dim_CustomerJoin', 'V') IS NOT NULL
    DROP VIEW dbo.dim_CustomerJoin;
GO

-- Create the view dim_CustomerJoin
CREATE VIEW dbo.dim_CustomerJoin AS
SELECT 
    a.CustomerID,                 -- Identifier for the customer
    a.PersonID,                   -- Identifier for the person
    a.TerritoryID,                -- Identifier for the sales territory
    b.CustomerKey AS CustomerKey, -- Identifier for the customer in the customer data
    a.AccountNumber,              -- Account number for the customer
    b.Customer_ID,                -- Customer identifier
    b.Customer,                   -- Customer name
    b.City,                       -- City of the customer
    b.[State-Province] AS StateProvince,  -- State or province of the customer
    b.[Country-Region] AS CountryRegion,  -- Country or region of the customer
    b.Postal_Code                 -- Postal code of the customer
FROM 
    dbo.Sales_Customer a
INNER JOIN 
    dbo.Customer_data_excel b 
    ON a.CustomerID = b.CustomerKey;
GO

-- Drop the view dim_SalesPersonStore if it exists
IF OBJECT_ID('dbo.dim_SalesPersonStore', 'V') IS NOT NULL
    DROP VIEW dbo.dim_SalesPersonStore;
GO

-- Create the view dim_SalesPersonStore
CREATE VIEW dbo.dim_SalesPersonStore AS
SELECT 
    sp.BusinessEntityID AS SalesPersonID,     -- SalesPerson Identifier
    st.BusinessEntityID AS StoreID,           -- Store Identifier
    sp.TerritoryID,                           -- Sales Territory
    sp.SalesQuota,                            -- Sales Quota
    sp.Bonus,                                 -- Bonus
    sp.CommissionPct,                         -- Commission Percentage
    sp.SalesYTD,                              -- Sales Year-To-Date
    sp.SalesLastYear,                         -- Sales Last Year
    st.Name AS StoreName                      -- Store Name
FROM 
    dbo.Sales_SalesPerson sp
INNER JOIN 
    dbo.Sales_Store st ON sp.BusinessEntityID = st.SalesPersonID;
GO

-- Drop the view dim_SalesTerritory if it exists
IF OBJECT_ID('dbo.dim_SalesTerritory', 'V') IS NOT NULL
    DROP VIEW dbo.dim_SalesTerritory;
GO

-- Create the view dim_SalesTerritory
CREATE VIEW dbo.dim_SalesTerritory AS
SELECT 
    TerritoryID,          -- Identifier for the sales territory
    Name,                 -- Name of the sales territory
    CountryRegionCode,    -- Country or region code
    [Group],              -- Group of the sales territory
    SalesYTD,             -- Sales Year-To-Date
    SalesLastYear,        -- Sales Last Year
    CostYTD,              -- Cost Year-To-Date
    CostLastYear          -- Cost Last Year
FROM 
    dbo.Sales_SalesTerritory;
GO

-- Drop the view dim_DateData if it exists
IF OBJECT_ID('dbo.dim_DateData', 'V') IS NOT NULL
    DROP VIEW dbo.dim_DateData;
GO

-- Create the view dim_DateData
CREATE VIEW dbo.dim_DateData AS
SELECT * 
FROM dbo.Date_data;
GO

-- Drop the view dim_ProductData if it exists
IF OBJECT_ID('dbo.dim_ProductData', 'V') IS NOT NULL
    DROP VIEW dbo.dim_ProductData;
GO

-- Create the view dim_ProductData
CREATE VIEW dbo.dim_ProductData AS
SELECT * 
FROM dbo.Product_data_excel;
GO

-- Drop the view dim_ResellerData if it exists
IF OBJECT_ID('dbo.dim_ResellerData', 'V') IS NOT NULL
    DROP VIEW dbo.dim_ResellerData;
GO

-- Create the view dim_ResellerData
CREATE VIEW dbo.dim_ResellerData AS
SELECT * 
FROM dbo.Reseller_data_excel;
GO

-- Drop the view fact_JoinedOrders if it exists
IF OBJECT_ID('dbo.fact_JoinedOrders', 'V') IS NOT NULL
    DROP VIEW dbo.fact_JoinedOrders;
GO

-- Create the view fact_JoinedOrders
CREATE VIEW dbo.fact_JoinedOrders AS
SELECT 
    e.SalesOrderId,           -- Identifier for the sales order
    e.SalesOrderLineKey,      -- Unique key for the sales order line
    e.SalesOrder,            -- Order identifier
    e.SalesOrderLine,       -- Line item identifier
    e.Channel,                -- Sales channel (e.g., online, in-store)
    d.SalesOrderDetailID,     -- Identifier for the order detail
    d.OrderQty,               -- Quantity of the order
    d.ProductID,              -- Identifier for the product
    d.CarrierTrackingNumber,  -- Tracking number for the carrier
    d.SpecialOfferID,         -- Identifier for any special offer
    d.UnitPrice,              -- Unit price of the product
    d.UnitPriceDiscount,      -- Discount applied to the unit price
    d.LineTotal,              -- Total amount for the line item
    h.OrderDate,              -- Date the order was placed
    h.DueDate,                -- Date the order is due
    h.ShipDate,               -- Date the order was shipped
    h.CustomerID,             -- Identifier for the customer
    h.SalesPersonID,          -- Identifier for the salesperson
    h.TerritoryID,            -- Identifier for the sales territory
    h.ShipMethodID,           -- Identifier for the shipping method
    h.TotalDue,               -- Total amount due for the order
    s.ResellerKey,            -- Key for the reseller
    s.CustomerKey AS SalesCustomerKey, -- Identifier for the customer in the sales data
    s.ProductKey,             -- Identifier for the product in the sales data
    s.OrderDateKey,           -- Key for the order date in the sales data
    s.DueDateKey,             -- Key for the due date in the sales data
    s.ShipDateKey,            -- Key for the ship date in the sales data
    s.SalesTerritoryKey,      -- Key for the sales territory in the sales data
    s.OrderQuantity,         -- Quantity of the order
    s.UnitPrice as Unit_Price,             -- Unit price of the product
    s.ExtendedAmount,        -- Extended amount for the product
    s.UnitPriceDiscountPct, -- Discount percentage applied to the unit price
    s.ProductStandardCost,  -- Standard cost of the product
    s.TotalProductCost,     -- Total cost of the product
    s.SalesAmount            -- Total sales amount
FROM [dbo].[SalesOrder_data_excel] e
INNER JOIN 
   [dbo].[SalesOrderHeader] h ON e.SalesOrderId = h.SalesOrderID
INNER JOIN 
    [dbo].[SalesOrderDetail] d ON h.SalesOrderID = d.SalesOrderID
INNER JOIN
    [dbo].[Sales_data_excel] s ON e.SalesOrderLineKey = s.SalesOrderLineKey;
GO

