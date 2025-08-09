SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create or ALTER PROCEDURE RefreshSilverTables
AS
BEGIN
    SET NOCOUNT ON;

    -- Drop and create Customer_data_excel
    DROP TABLE IF EXISTS SilverDW.dbo.Customer_data_excel;
    CREATE TABLE SilverDW.dbo.Customer_data_excel AS
    SELECT * 
    FROM BronzeLK.dbo.Customer_data_excel
    WHERE CustomerKey IS NOT NULL;

    -- Drop and create Date_data_excel
    DROP TABLE IF EXISTS SilverDW.dbo.Date_data_excel;
    CREATE TABLE SilverDW.dbo.Date_data_excel AS
    SELECT *
    FROM BronzeLK.dbo.Date_data_excel
    WHERE DateKey IS NOT NULL;

    -- Drop and create Product_data_excel
    DROP TABLE IF EXISTS SilverDW.dbo.Product_data_excel;
    CREATE TABLE SilverDW.dbo.Product_data_excel AS
    SELECT *
    FROM BronzeLK.dbo.Product_data_excel
    WHERE ProductKey IS NOT NULL;

    -- Drop and create Reseller_data_excel
    DROP TABLE IF EXISTS SilverDW.dbo.Reseller_data_excel;
    CREATE TABLE SilverDW.dbo.Reseller_data_excel AS
    SELECT *
    FROM BronzeLK.dbo.Reseller_data_excel;

    -- Drop and create Sales_data_excel
    DROP TABLE IF EXISTS SilverDW.dbo.Sales_data_excel;
    CREATE TABLE SilverDW.dbo.Sales_data_excel AS
    SELECT *
    FROM BronzeLK.dbo.Sales_data_excel;

    -- Drop and create Sales_Order_data_excel
    DROP TABLE IF EXISTS SilverDW.dbo.Sales_Order_data_excel;
    CREATE TABLE SilverDW.dbo.Sales_Order_data_excel AS
    SELECT *
    FROM BronzeLK.dbo.Sales_Order_data_excel;

    -- Drop and create Sales_Customer
    DROP TABLE IF EXISTS SilverDW.dbo.Sales_Customer;
    CREATE TABLE SilverDW.dbo.Sales_Customer AS
    SELECT *
    FROM BronzeLK.dbo.Sales_Customer;

    -- Drop and create Sales_SalesOrderDetail
    DROP TABLE IF EXISTS SilverDW.dbo.Sales_SalesOrderDetail;
    CREATE TABLE SilverDW.dbo.Sales_SalesOrderDetail AS
    SELECT *
    FROM BronzeLK.dbo.Sales_SalesOrderDetail;

    -- Drop and create Sales_SalesOrderHeader
    DROP TABLE IF EXISTS SilverDW.dbo.Sales_SalesOrderHeader;
    CREATE TABLE SilverDW.dbo.Sales_SalesOrderHeader AS
    SELECT *
    FROM BronzeLK.dbo.Sales_SalesOrderHeader;

    -- Drop and create Sales_SalesPerson
    DROP TABLE IF EXISTS SilverDW.dbo.Sales_SalesPerson;
    CREATE TABLE SilverDW.dbo.Sales_SalesPerson AS
    SELECT *
    FROM BronzeLK.dbo.Sales_SalesPerson;

    -- Drop and create Sales_SalesTerritory
    DROP TABLE IF EXISTS SilverDW.dbo.Sales_SalesTerritory;
    CREATE TABLE SilverDW.dbo.Sales_SalesTerritory AS
    SELECT *
    FROM BronzeLK.dbo.Sales_SalesTerritory;

    -- Drop and create Sales_Store
    DROP TABLE IF EXISTS SilverDW.dbo.Sales_Store;
    CREATE TABLE SilverDW.dbo.Sales_Store AS
    SELECT *
    FROM BronzeLK.dbo.Sales_Store;

END
GO
