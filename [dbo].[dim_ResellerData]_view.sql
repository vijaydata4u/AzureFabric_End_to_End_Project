/****** Object:  View [dbo].[dim_ResellerData]    Script Date: 09-08-2025 09:46:45 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


-- Create the view dim_ResellerData
CREATE VIEW [dbo].[dim_ResellerData] AS
SELECT * 
FROM dbo.Reseller_data_excel;
GO


