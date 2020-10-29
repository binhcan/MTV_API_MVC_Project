USE [LuckyNumber]
GO

SELECT 
	[EMP].[Dept], 
	COUNT (DISTINCT [EMP].[Ecode]) AS 'TOTAL_EMPLOYEE_IN_DEPT'
FROM 
	[dbo].[Employee] AS [EMP]
GROUP BY 
	[EMP].[Dept]

GO