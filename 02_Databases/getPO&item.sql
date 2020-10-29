USE [TEV_Test_App]
GO
SELECT
	[P].[po_num],
	[P].[po_line],
	[P].[po_release],
	[P].[qty_ordered],
	[P].[item],
	[P].[qty_received],
	[P].[po_vend_num],
	[P].[whse],
	[I].[order_min],
	[I].[description],
	[IL].[whse],
	[IL].[loc]
FROM
	[dbo].[poitem_mst] AS [P]
INNER JOIN 
	[dbo].[item_mst] AS [I]
ON 
	[P].[item] = [I].[item]
INNER JOIN
	[dbo].[itemloc_mst] AS [IL]
ON
	[IL].[item] = [I].[item] AND
	[IL].[whse] = [P].[whse]
WHERE 
	[P].[po_num]= 'TU.LOG.SE' AND
	[P].[po_line]= '1'
	AND [IL].[rank] = 1 
	--AND[IL].[whse] = 'TUN'
--AND P.[item] = 'SONYUSBC006'
--GROUP BY P.[po_num]
GO