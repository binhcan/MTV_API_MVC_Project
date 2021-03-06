USE [API_Server]
GO
ALTER TABLE [dbo].[UserWithRoles] DROP CONSTRAINT [FK_UserWithRoles_Users]
GO
ALTER TABLE [dbo].[UserWithRoles] DROP CONSTRAINT [FK_UserWithRoles_RolesInDepartment]
GO
ALTER TABLE [dbo].[Files] DROP CONSTRAINT [DF_Files_createDate]
GO
ALTER TABLE [adm].[Rewards] DROP CONSTRAINT [DF_Rewards_CreateDate]
GO
/****** Object:  Index [UniqueEcode_Users]    Script Date: 8/17/2020 1:52:44 AM ******/
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UniqueEcode_Users]
GO
/****** Object:  Table [dbo].[UserWithRoles]    Script Date: 8/17/2020 1:52:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserWithRoles]') AND type in (N'U'))
DROP TABLE [dbo].[UserWithRoles]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/17/2020 1:52:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[RolesInDepartment]    Script Date: 8/17/2020 1:52:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesInDepartment]') AND type in (N'U'))
DROP TABLE [dbo].[RolesInDepartment]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 8/17/2020 1:52:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files]') AND type in (N'U'))
DROP TABLE [dbo].[Files]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 8/17/2020 1:52:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
DROP TABLE [dbo].[Departments]
GO
/****** Object:  Table [adm].[Rewards]    Script Date: 8/17/2020 1:52:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Rewards]') AND type in (N'U'))
DROP TABLE [adm].[Rewards]
GO
/****** Object:  Table [adm].[Results]    Script Date: 8/17/2020 1:52:44 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Results]') AND type in (N'U'))
DROP TABLE [adm].[Results]
GO
/****** Object:  Schema [adm]    Script Date: 8/17/2020 1:52:44 AM ******/
DROP SCHEMA [adm]
GO
/****** Object:  Schema [adm]    Script Date: 8/17/2020 1:52:44 AM ******/
CREATE SCHEMA [adm]
GO
/****** Object:  Table [adm].[Results]    Script Date: 8/17/2020 1:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [adm].[Results](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ecode] [nvarchar](100) NOT NULL,
	[WinOnRound] [int] NOT NULL,
	[WinOnStage] [int] NOT NULL,
	[Status] [bit] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Results] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [adm].[Rewards]    Script Date: 8/17/2020 1:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [adm].[Rewards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Quantity] [int] NULL,
	[Image] [nvarchar](200) NULL,
	[Round] [int] NULL,
	[NoOfRound] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Rewards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 8/17/2020 1:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[departmentName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 8/17/2020 1:52:44 AM ******/
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
	[createDate] [datetime] NULL,
	[updateDate] [datetime] NULL,
	[path] [nvarchar](200) NULL,
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesInDepartment]    Script Date: 8/17/2020 1:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesInDepartment](
	[id] [int] NOT NULL,
	[deptId] [int] NOT NULL,
	[roleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_RolesInDepartment] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[deptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 8/17/2020 1:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eCode] [nvarchar](100) NULL,
	[firstName] [nvarchar](100) NOT NULL,
	[givenName] [nvarchar](100) NOT NULL,
	[email] [nvarchar](100) NULL,
	[description] [nvarchar](max) NULL,
	[password] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_AdmUsers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserWithRoles]    Script Date: 8/17/2020 1:52:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserWithRoles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[eCode] [nvarchar](100) NOT NULL,
	[deptId] [int] NULL,
	[roleId] [int] NULL,
 CONSTRAINT [PK_UserWithRoles] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [adm].[Rewards] ON 

INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (4, N'Tủ lạnh LG GN-M255BL - 255', 1, N'img/adm/bg-img/2_1.png', 8, 1, CAST(N'2020-08-14T00:29:49.517' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (5, N'Quạt điều hòa Daikio DKA-04000A', 2, N'img/adm/bg-img/1.png', 7, 2, CAST(N'2020-08-14T00:38:42.677' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (6, N'Cây lau nhà 360 độ', 3, N'img/adm/bg-img/4.jpg', 6, 2, CAST(N'2020-08-14T00:40:09.217' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (7, N'Bia Heiniken', 60, N'img/adm/bg-img/3.png', 5, 3, CAST(N'2020-08-14T00:41:13.093' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (8, N'Dầu ăn  Simply 5L', 4, N'img/adm/bg-img/6.png', 4, 3, CAST(N'2020-08-14T00:53:15.217' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (9, N'Nước giặt Ariel', 55, N'img/adm/bg-img/9.jpg', 3, 3, CAST(N'2020-08-14T00:54:56.153' AS DateTime))
SET IDENTITY_INSERT [adm].[Rewards] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([id], [departmentName], [description]) VALUES (1, N'ADM', N'Administration department')
INSERT [dbo].[Departments] ([id], [departmentName], [description]) VALUES (2, N'HR', N'Human Resources department')
INSERT [dbo].[Departments] ([id], [departmentName], [description]) VALUES (3, N'Accounting', N'Accounting department')
INSERT [dbo].[Departments] ([id], [departmentName], [description]) VALUES (4, N'SE', N'Software Engineering department')
INSERT [dbo].[Departments] ([id], [departmentName], [description]) VALUES (5, N'ENG 01', N'Engineering department No 01')
INSERT [dbo].[Departments] ([id], [departmentName], [description]) VALUES (6, N'ENG 02', N'Engineering department No 02')
INSERT [dbo].[Departments] ([id], [departmentName], [description]) VALUES (7, N'LOG', N'Logistics department')
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Files] ON 

INSERT [dbo].[Files] ([id], [guid], [fileName], [extension], [userCreate], [userUpdate], [createDate], [updateDate], [path]) VALUES (1, N'abc', N'abc.jpg', NULL, NULL, NULL, CAST(N'2020-07-07T14:35:05.583' AS DateTime), NULL, NULL)
SET IDENTITY_INSERT [dbo].[Files] OFF
GO
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (1, 4, N'Manager')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (2, 4, N'Developer')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (3, 4, N'Help Desk')
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [eCode], [firstName], [givenName], [email], [description], [password]) VALUES (3, N'000000', N'SUPER', N'ADMIN', N'admin@meiko-t.com.vn', N'Trương phòng SE', N'D033E22AE348AEB5660FC2140AEC35850C4DA997')
INSERT [dbo].[Users] ([id], [eCode], [firstName], [givenName], [email], [description], [password]) VALUES (20, N'112892', N'Quân', N'Lê Văn', N'quan.le-112892@meiko-t.com.vn', N'Nhân viên phòng SE,', N'C4AEDBFA2D97A32A582B186D7CB17572F21C7CAE')
INSERT [dbo].[Users] ([id], [eCode], [firstName], [givenName], [email], [description], [password]) VALUES (1021, N'112852', N'Lan Anh', N'Nguyễn', N'anh.nguyen-112852@meiko-t.com.vn', N'Nhân viên phòng SE', N'D033E22AE348AEB5660FC2140AEC35850C4DA997')
INSERT [dbo].[Users] ([id], [eCode], [firstName], [givenName], [email], [description], [password]) VALUES (1022, N'111070', N'Hoa', N'Nguyễn', N'hoa.nguyen-111070@meiko-t.com.vn', N'Nhân viên phòng SE', N'D033E22AE348AEB5660FC2140AEC35850C4DA997')
INSERT [dbo].[Users] ([id], [eCode], [firstName], [givenName], [email], [description], [password]) VALUES (1023, N'112576', N'Hải', N'Phạm', N'hai.pham-112576@meiko-t.com.vn', N'Nhân viên phòng SE', N'D033E22AE348AEB5660FC2140AEC35850C4DA997')
INSERT [dbo].[Users] ([id], [eCode], [firstName], [givenName], [email], [description], [password]) VALUES (1024, N'110176', N'Bình', N'Nguyễn Thanh', N'nguyen.thanh.binh-110176@mk-t.com.vn', N'Trưởng phòng SE', N'D033E22AE348AEB5660FC2140AEC35850C4DA997')
INSERT [dbo].[Users] ([id], [eCode], [firstName], [givenName], [email], [description], [password]) VALUES (1025, N'108873', N'Ánh', N'Vũ Ngọc', N'vu.ngoc.anh-108873@mk-t.com.vn', N'Nhân viên phòng SE', N'D033E22AE348AEB5660FC2140AEC35850C4DA997')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserWithRoles] ON 

INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (2, N'112892', 4, 2)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (1003, N'112852', 4, 3)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (1004, N'111070', 4, 2)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (1005, N'112576', 4, 3)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (1006, N'110176', 4, 1)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (1007, N'108873', 4, 3)
SET IDENTITY_INSERT [dbo].[UserWithRoles] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqueEcode_Users]    Script Date: 8/17/2020 1:52:45 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UniqueEcode_Users] UNIQUE NONCLUSTERED 
(
	[eCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [adm].[Rewards] ADD  CONSTRAINT [DF_Rewards_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[UserWithRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserWithRoles_RolesInDepartment] FOREIGN KEY([roleId], [deptId])
REFERENCES [dbo].[RolesInDepartment] ([id], [deptId])
GO
ALTER TABLE [dbo].[UserWithRoles] CHECK CONSTRAINT [FK_UserWithRoles_RolesInDepartment]
GO
ALTER TABLE [dbo].[UserWithRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserWithRoles_Users] FOREIGN KEY([eCode])
REFERENCES [dbo].[Users] ([eCode])
GO
ALTER TABLE [dbo].[UserWithRoles] CHECK CONSTRAINT [FK_UserWithRoles_Users]
GO
