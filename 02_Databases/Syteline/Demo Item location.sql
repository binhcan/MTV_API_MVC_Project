USE [TEV_Test_App]
GO
SELECT
	[ITEM].[item],
	[ITEM].[description],
	[ILOCATION].[whse],
	[ILOCATION].[loc]
FROM 
	[dbo].[item_mst] AS [ITEM]
INNER JOIN
	[dbo].[itemloc_mst] AS [ILOCATION]
ON
	[ILOCATION].[item] = [ITEM].[item]
WHERE
	[ITEM].[item] = '181448911' AND [ILOCATION].[rank] = 1