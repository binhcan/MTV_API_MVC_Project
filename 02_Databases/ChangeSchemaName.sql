USE [API_Server]
GO

CREATE SCHEMA adm AUTHORIZATION [dbo]
GO

ALTER SCHEMA adm
TRANSFER dbo.Rewards
GO

