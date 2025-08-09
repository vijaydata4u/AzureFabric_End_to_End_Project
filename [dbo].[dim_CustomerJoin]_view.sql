/****** Object:  View [dbo].[dim_CustomerJoin]    Script Date: 09-08-2025 09:48:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Create the view dim_CustomerJoin
CREATE VIEW [dbo].[dim_CustomerJoin] AS
SELECT 
    a.CustomerID,             -- Identifier for the customer
    a.PersonID,                   -- Identifier for the person
    a.TerritoryID,                -- Identifier for the sales territory
    b.CustomerKey AS CustomerKey, -- Identifier for the customer in the customer data
    a.AccountNumber,              -- Account number for the customer
                                  -- Customer identifier
    b.Customer,                   -- Customer name
    b.City,                       -- City of the customer
    b.[State-Province] AS StateProvince,  -- State or province of the customer
    b.[Country-Region] AS CountryRegion,  -- Country or region of the customer
    b.PostalCode                 -- Postal code of the customer
FROM 
    [dbo].[Customer] a
INNER JOIN 
    [dbo].[Customer_data_excel] b 
    ON a.CustomerID = b.CustomerKey;

GO


