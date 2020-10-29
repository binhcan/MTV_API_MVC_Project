USE [API_Server]
GO

/****** Object:  Table [dbo].[Files]    Script Date: 7/9/2020 5:01:21 PM ******/
DROP TABLE [dbo].[Files]
GO

/****** Object:  Table [dbo].[Files]    Script Date: 7/9/2020 5:01:21 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Files](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[guid] [nvarchar](200) NOT NULL,
	[fileName] [nvarchar](200) NOT NULL,
	[extension] [nchar](50) NULL,
	[userCreate] [nvarchar](200) NULL,
	[userUpdate] [nvarchar](200) NULL,
	[createDate] [datetime] NULL CONSTRAINT [DF_Files_createDate]  DEFAULT (getdate()),
	[updateDate] [datetime] NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


