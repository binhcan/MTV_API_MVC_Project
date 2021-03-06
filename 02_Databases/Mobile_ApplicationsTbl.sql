USE [API_Server]
GO
ALTER TABLE [dbo].[Mobile_Applications] DROP CONSTRAINT [DF_Mobile_Applications_UpdateDate]
GO
ALTER TABLE [dbo].[Mobile_Applications] DROP CONSTRAINT [DF_Mobile_Applications_CreateDate]
GO
/****** Object:  Table [dbo].[Mobile_Applications]    Script Date: 9/26/2020 9:27:02 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mobile_Applications]') AND type in (N'U'))
DROP TABLE [dbo].[Mobile_Applications]
GO
/****** Object:  Table [dbo].[Mobile_Applications]    Script Date: 9/26/2020 9:27:02 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mobile_Applications](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ApplicationName] [nvarchar](200) NOT NULL,
	[Version] [nvarchar](100) NOT NULL,
	[Path] [nvarchar](max) NOT NULL,
	[BuildNumber] [int] NULL,
	[Project] [nvarchar](200) NULL,
	[Description] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Mobile_Applications] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Mobile_Applications] ON 

INSERT [dbo].[Mobile_Applications] ([Id], [ApplicationName], [Version], [Path], [BuildNumber], [Project], [Description], [CreateDate], [UpdateDate]) VALUES (1, N'LOG_Vendors_Tracability', N'1.0.2', N'Helper/Mobile_app/V-1.0.2.apk', 1, N'LOG', N'Vendor trace', CAST(N'2020-09-22T08:48:18.007' AS DateTime), CAST(N'2020-09-22T08:48:18.007' AS DateTime))
INSERT [dbo].[Mobile_Applications] ([Id], [ApplicationName], [Version], [Path], [BuildNumber], [Project], [Description], [CreateDate], [UpdateDate]) VALUES (5, N'LOG_Vendors_Tracability', N'1.0.3', N'Helper/Mobile_app/V-1.0.3.apk', 2, N'LOG', NULL, CAST(N'2020-09-22T08:49:47.683' AS DateTime), CAST(N'2020-09-22T08:49:47.683' AS DateTime))
INSERT [dbo].[Mobile_Applications] ([Id], [ApplicationName], [Version], [Path], [BuildNumber], [Project], [Description], [CreateDate], [UpdateDate]) VALUES (6, N'LOG_Vendors_Tracability', N'1.0.4', N'Helper/Mobile_app/V-1.0.4.apk', 3, N'LOG', N'Vendor', CAST(N'2020-09-22T08:50:41.480' AS DateTime), CAST(N'2020-09-22T08:50:41.480' AS DateTime))
INSERT [dbo].[Mobile_Applications] ([Id], [ApplicationName], [Version], [Path], [BuildNumber], [Project], [Description], [CreateDate], [UpdateDate]) VALUES (7, N'LOG_Vendors_Tracability', N'1.0.5', N'Helper/Mobile_app/V-1.0.5.apk', 4, N'LOG', N'Vendor', CAST(N'2020-09-22T08:58:01.390' AS DateTime), CAST(N'2020-09-22T08:58:01.390' AS DateTime))
INSERT [dbo].[Mobile_Applications] ([Id], [ApplicationName], [Version], [Path], [BuildNumber], [Project], [Description], [CreateDate], [UpdateDate]) VALUES (8, N'LOG_Vendors_Tracability', N'1.0.6', N'Helper/Mobile_app/V-1.0.6.apk', 5, N'LOG', N'Vendor', CAST(N'2020-09-22T10:06:48.693' AS DateTime), CAST(N'2020-09-22T10:06:48.693' AS DateTime))
SET IDENTITY_INSERT [dbo].[Mobile_Applications] OFF
GO
ALTER TABLE [dbo].[Mobile_Applications] ADD  CONSTRAINT [DF_Mobile_Applications_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Mobile_Applications] ADD  CONSTRAINT [DF_Mobile_Applications_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
