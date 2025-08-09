/****** Object:  View [dbo].[dim_SalesTerritory]    Script Date: 09-08-2025 09:45:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Create the view dim_SalesTerritory
CREATE VIEW [dbo].[dim_SalesTerritory] AS
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


