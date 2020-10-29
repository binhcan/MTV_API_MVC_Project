USE [API_Server]
GO
SELECT [U].[eCode],
	[U].[givenName],
	[DEP].DepartmentName AS Departments,
	[PR].ProjectName,
	[URIP].RolesInProjectName AS ROLE_NAME
FROM 
	[dbo].[Users] as U
INNER JOIN 
	[dbo].[UserRoleInProjects] AS URIP
ON 
	[U].[eCode] = [URIP].[eCode]
INNER JOIN 
	[dbo].[Projects] AS PR
ON 
	[URIP].[ProjectId] = [PR].[Id]
INNER JOIN 
	[dbo].[Departments] AS DEP
ON 
	[PR].[DepartmentId] = [DEP].[Id]
GO