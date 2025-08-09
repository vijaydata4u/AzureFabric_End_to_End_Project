/****** Object:  StoredProcedure [dbo].[usp_Load_Gold_DWH]    Script Date: 09-08-2025 09:43:43 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_Load_Gold_DWH]
AS
BEGIN
    SET NOCOUNT ON;

    -- Drop existing Gold tables if they exist
    IF OBJECT_ID('Gold_DWH.dbo.dim_Customer', 'U') IS NOT NULL DROP TABLE Gold_DWH.dbo.dim_Customer;
    IF OBJECT_ID('Gold_DWH.dbo.dim_SalesPersonStore', 'U') IS NOT NULL DROP TABLE Gold_DWH.dbo.dim_SalesPersonStore;
    IF OBJECT_ID('Gold_DWH.dbo.dim_SalesTerritory', 'U') IS NOT NULL DROP TABLE Gold_DWH.dbo.dim_SalesTerritory;
    IF OBJECT_ID('Gold_DWH.dbo.dim_Date', 'U') IS NOT NULL DROP TABLE Gold_DWH.dbo.dim_Date;
    IF OBJECT_ID('Gold_DWH.dbo.dim_Product', 'U') IS NOT NULL DROP TABLE Gold_DWH.dbo.dim_Product;
    IF OBJECT_ID('Gold_DWH.dbo.dim_Reseller', 'U') IS NOT NULL DROP TABLE Gold_DWH.dbo.dim_Reseller;
    IF OBJECT_ID('Gold_DWH.dbo.fact_Orders', 'U') IS NOT NULL DROP TABLE Gold_DWH.dbo.fact_Orders;

    -- Load Gold tables from Silver_DWH, removing duplicates
    SELECT DISTINCT * 
    INTO Gold_DWH.dbo.dim_Customer
    FROM Silver_DWH.dbo.dim_CustomerJoin;

    SELECT DISTINCT * 
    INTO Gold_DWH.dbo.dim_SalesPersonStore
    FROM Silver_DWH.dbo.dim_SalesPersonStore;

    SELECT DISTINCT * 
    INTO Gold_DWH.dbo.dim_SalesTerritory
    FROM Silver_DWH.dbo.dim_SalesTerritory;

    SELECT DISTINCT * 
    INTO Gold_DWH.dbo.dim_Date
    FROM Silver_DWH.dbo.dim_DateData;

    SELECT DISTINCT * 
    INTO Gold_DWH.dbo.dim_Product
    FROM Silver_DWH.dbo.dim_ProductData;

    SELECT DISTINCT * 
    INTO Gold_DWH.dbo.dim_Reseller
    FROM Silver_DWH.dbo.dim_ResellerData;

    SELECT DISTINCT * 
    INTO Gold_DWH.dbo.fact_Orders
    FROM Silver_DWH.dbo.fact_JoinedOrders;

    PRINT 'Gold_DWH load completed successfully.';
END;
GO


