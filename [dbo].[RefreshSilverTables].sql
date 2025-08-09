/****** Object:  StoredProcedure [dbo].[RefreshSilverTables]    Script Date: 09-08-2025 09:42:48 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



Create   PROCEDURE [dbo].[RefreshSilverTables]
AS
BEGIN
    SET NOCOUNT ON;

    -- Drop and create Customer_data_excel
    DROP TABLE IF EXISTS Silver_DWH.dbo.Customer_data_excel;
    CREATE TABLE Silver_DWH.dbo.Customer_data_excel AS
    SELECT * 
    FROM Silver_DWH.dbo.Customer_data_excel
    WHERE CustomerKey IS NOT NULL;

    -- Drop and create Date_data_excel
    DROP TABLE IF EXISTS Silver_DWH.dbo.Date_data_excel;
    CREATE TABLE Silver_DWH.dbo.Date_data_excel AS
    SELECT *
    FROM Silver_DWH.dbo.Date_data_excel
    WHERE DateKey IS NOT NULL;

    -- Drop and create Product_data_excel
    DROP TABLE IF EXISTS Silver_DWH.dbo.Product_data_excel;
    CREATE TABLE Silver_DWH.dbo.Product_data_excel AS
    SELECT *
    FROM Silver_DWH.dbo.Product_data_excel
    WHERE ProductKey IS NOT NULL;

    -- Drop and create Reseller_data_excel
    DROP TABLE IF EXISTS Silver_DWH.dbo.Reseller_data_excel;
    CREATE TABLE Silver_DWH.dbo.Reseller_data_excel AS
    SELECT *
    FROM Silver_DWH.dbo.Reseller_data_excel;

    -- Drop and create Sales_data_excel
    DROP TABLE IF EXISTS Silver_DWH.dbo.Sales_data_excel;
    CREATE TABLE Silver_DWH.dbo.Sales_data_excel AS
    SELECT *
    FROM Silver_DWH.dbo.Sales_data_excel;

    -- Drop and create Sales_Order_data_excel
    DROP TABLE IF EXISTS Silver_DWH.dbo.Sales_Order_data_excel;
    CREATE TABLE Silver_DWH.dbo.Sales_Order_data_excel AS
    SELECT *
    FROM Silver_DWH.dbo.Sales_Order_data_excel;

    -- Drop and create Sales_Customer
    DROP TABLE IF EXISTS Silver_DWH.dbo.Sales_Customer;
    CREATE TABLE Silver_DWH.dbo.Sales_Customer AS
    SELECT *
    FROM Silver_DWH.dbo.Sales_Customer;

    -- Drop and create Sales_SalesOrderDetail
    DROP TABLE IF EXISTS Silver_DWH.dbo.Sales_SalesOrderDetail;
    CREATE TABLE Silver_DWH.dbo.Sales_SalesOrderDetail AS
    SELECT *
    FROM Silver_DWH.dbo.Sales_SalesOrderDetail;

    -- Drop and create Sales_SalesOrderHeader
    DROP TABLE IF EXISTS Silver_DWH.dbo.Sales_SalesOrderHeader;
    CREATE TABLE Silver_DWH.dbo.Sales_SalesOrderHeader AS
    SELECT *
    FROM Silver_DWH.dbo.Sales_SalesOrderHeader;

    -- Drop and create Sales_SalesPerson
    DROP TABLE IF EXISTS Silver_DWH.dbo.Sales_SalesPerson;
    CREATE TABLE Silver_DWH.dbo.Sales_SalesPerson AS
    SELECT *
    FROM Silver_DWH.dbo.Sales_SalesPerson;

    -- Drop and create Sales_SalesTerritory
    DROP TABLE IF EXISTS Silver_DWH.dbo.Sales_SalesTerritory;
    CREATE TABLE Silver_DWH.dbo.Sales_SalesTerritory AS
    SELECT *
    FROM Silver_DWH.dbo.Sales_SalesTerritory;

    -- Drop and create Sales_Store
    DROP TABLE IF EXISTS Silver_DWH.dbo.Sales_Store;
    CREATE TABLE Silver_DWH.dbo.Sales_Store AS
    SELECT *
    FROM Silver_DWH.dbo.Sales_Store;

END
GO


