/****** Object:  View [dbo].[dim_ProductData]    Script Date: 09-08-2025 09:47:12 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Create the view dim_ProductData
CREATE VIEW [dbo].[dim_ProductData] AS
SELECT * 
FROM dbo.Product_data_excel;
GO


