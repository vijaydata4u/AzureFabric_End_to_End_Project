/****** Object:  View [dbo].[dim_SalesPersonStore]    Script Date: 09-08-2025 09:46:15 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Create the view dim_SalesPersonStore
CREATE VIEW [dbo].[dim_SalesPersonStore] AS
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


