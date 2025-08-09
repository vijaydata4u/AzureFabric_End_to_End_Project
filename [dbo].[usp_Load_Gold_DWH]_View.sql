/****** Object:  View [dbo].[fact_JoinedOrders]    Script Date: 09-08-2025 09:45:01 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Create the view fact_JoinedOrders
CREATE VIEW [dbo].[fact_JoinedOrders] AS
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


