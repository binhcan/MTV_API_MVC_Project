USE [API_Server]
GO
ALTER TABLE [dbo].[UserWithRoles] DROP CONSTRAINT [FK_UserWithRoles_Users]
GO
ALTER TABLE [dbo].[UserWithRoles] DROP CONSTRAINT [FK_UserWithRoles_RolesInDepartment]
GO
ALTER TABLE [dbo].[UserRoleInProjects] DROP CONSTRAINT [FK_UserRoleInProjects_Users]
GO
ALTER TABLE [dbo].[UserRoleInProjects] DROP CONSTRAINT [FK_UserRoleInProjects_Projects]
GO
ALTER TABLE [dbo].[RoleInProjects] DROP CONSTRAINT [FK_RoleInProjects_Projects]
GO
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [FK_Projects_Departments]
GO
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [DF_Users_SettingDarkMode]
GO
ALTER TABLE [dbo].[Projects] DROP CONSTRAINT [DF_Projects_CreateDate]
GO
ALTER TABLE [dbo].[Mobile_Applications] DROP CONSTRAINT [DF_Mobile_Applications_UpdateDate]
GO
ALTER TABLE [dbo].[Mobile_Applications] DROP CONSTRAINT [DF_Mobile_Applications_CreateDate]
GO
ALTER TABLE [dbo].[Files] DROP CONSTRAINT [DF_Files_createDate]
GO
ALTER TABLE [adm].[Rounds] DROP CONSTRAINT [DF_Round_UpdateDate]
GO
ALTER TABLE [adm].[Rounds] DROP CONSTRAINT [DF_Round_CreateDate]
GO
ALTER TABLE [adm].[Rewards] DROP CONSTRAINT [DF_Rewards_CreateDate]
GO
/****** Object:  Index [UniqueEcode_Users]    Script Date: 10/7/2020 9:03:46 AM ******/
ALTER TABLE [dbo].[Users] DROP CONSTRAINT [UniqueEcode_Users]
GO
/****** Object:  Index [Unique_Departments]    Script Date: 10/7/2020 9:03:46 AM ******/
ALTER TABLE [dbo].[Departments] DROP CONSTRAINT [Unique_Departments]
GO
/****** Object:  Table [dbo].[UserWithRoles]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserWithRoles]') AND type in (N'U'))
DROP TABLE [dbo].[UserWithRoles]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users]') AND type in (N'U'))
DROP TABLE [dbo].[Users]
GO
/****** Object:  Table [dbo].[UserRoleInProjects]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[UserRoleInProjects]') AND type in (N'U'))
DROP TABLE [dbo].[UserRoleInProjects]
GO
/****** Object:  Table [dbo].[RolesToPermissions]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesToPermissions]') AND type in (N'U'))
DROP TABLE [dbo].[RolesToPermissions]
GO
/****** Object:  Table [dbo].[RolesInDepartment]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RolesInDepartment]') AND type in (N'U'))
DROP TABLE [dbo].[RolesInDepartment]
GO
/****** Object:  Table [dbo].[RoleInProjects]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[RoleInProjects]') AND type in (N'U'))
DROP TABLE [dbo].[RoleInProjects]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Projects]') AND type in (N'U'))
DROP TABLE [dbo].[Projects]
GO
/****** Object:  Table [dbo].[ModulesForUsers]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ModulesForUsers]') AND type in (N'U'))
DROP TABLE [dbo].[ModulesForUsers]
GO
/****** Object:  Table [dbo].[Mobile_Applications]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Mobile_Applications]') AND type in (N'U'))
DROP TABLE [dbo].[Mobile_Applications]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files]') AND type in (N'U'))
DROP TABLE [dbo].[Files]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Employee]') AND type in (N'U'))
DROP TABLE [dbo].[Employee]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Departments]') AND type in (N'U'))
DROP TABLE [dbo].[Departments]
GO
/****** Object:  Table [adm].[Rounds]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Rounds]') AND type in (N'U'))
DROP TABLE [adm].[Rounds]
GO
/****** Object:  Table [adm].[Rewards]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Rewards]') AND type in (N'U'))
DROP TABLE [adm].[Rewards]
GO
/****** Object:  Table [adm].[Results]    Script Date: 10/7/2020 9:03:46 AM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[adm].[Results]') AND type in (N'U'))
DROP TABLE [adm].[Results]
GO
/****** Object:  Schema [adm]    Script Date: 10/7/2020 9:03:46 AM ******/
DROP SCHEMA [adm]
GO
/****** Object:  User [production_app]    Script Date: 10/7/2020 9:03:46 AM ******/
DROP USER [production_app]
GO
/****** Object:  User [production_app]    Script Date: 10/7/2020 9:03:46 AM ******/
CREATE USER [production_app] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Schema [adm]    Script Date: 10/7/2020 9:03:46 AM ******/
CREATE SCHEMA [adm]
GO
/****** Object:  Table [adm].[Results]    Script Date: 10/7/2020 9:03:46 AM ******/
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
/****** Object:  Table [adm].[Rewards]    Script Date: 10/7/2020 9:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [adm].[Rewards](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Quantity] [int] NULL,
	[Image] [nvarchar](100) NULL,
	[Round] [int] NULL,
	[NoOfRound] [int] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Rewards] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [adm].[Rounds]    Script Date: 10/7/2020 9:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [adm].[Rounds](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Round] [int] NOT NULL,
	[Stage] [int] NOT NULL,
	[QuantityOfStage] [int] NOT NULL,
	[IsDrawn] [bit] NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Image] [nvarchar](200) NULL,
	[FileEffect] [nvarchar](200) NULL,
	[VideoLenght] [int] NULL,
	[TimeoutAction] [int] NULL,
	[Animation] [int] NULL,
	[CreateDate] [datetime] NULL,
	[UpdateDate] [datetime] NULL,
 CONSTRAINT [PK_Round] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 10/7/2020 9:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ModuleNo] [int] NOT NULL,
	[DepartmentName] [nvarchar](100) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 10/7/2020 9:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Ecode] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[GivenName] [nvarchar](100) NOT NULL,
	[DeptID] [int] NOT NULL,
	[Email] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Files]    Script Date: 10/7/2020 9:03:46 AM ******/
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
 CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mobile_Applications]    Script Date: 10/7/2020 9:03:46 AM ******/
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
/****** Object:  Table [dbo].[ModulesForUsers]    Script Date: 10/7/2020 9:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ModulesForUsers](
	[UserId] [nvarchar](450) NOT NULL,
	[AllowedPaidForModules] [bigint] NOT NULL,
 CONSTRAINT [PK_ModulesForUsers] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Projects]    Script Date: 10/7/2020 9:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Projects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectName] [nvarchar](200) NULL,
	[DepartmentId] [int] NULL,
	[Detail] [nvarchar](max) NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleInProjects]    Script Date: 10/7/2020 9:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleInProjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[RoleNameInProject] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_RoleInProjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesInDepartment]    Script Date: 10/7/2020 9:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesInDepartment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deptId] [int] NOT NULL,
	[roleName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_RolesInDepartment] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[deptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RolesToPermissions]    Script Date: 10/7/2020 9:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RolesToPermissions](
	[RoleName] [nvarchar](450) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[PermissionsInRole] [varchar](max) NOT NULL,
 CONSTRAINT [PK_RolesToPermissions] PRIMARY KEY CLUSTERED 
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRoleInProjects]    Script Date: 10/7/2020 9:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoleInProjects](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ecode] [nvarchar](100) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[RolesInProjectID] [int] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_UserRoleInProjects] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/7/2020 9:03:46 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ECode] [nvarchar](100) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[GivenName] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Description] [nvarchar](max) NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Phone] [decimal](10, 0) NULL,
	[About] [nvarchar](max) NULL,
	[Facebook] [nvarchar](200) NULL,
	[Avatar] [nvarchar](max) NULL,
	[SettingDarkMode] [bit] NULL,
	[SidebarColor] [nvarchar](100) NULL,
 CONSTRAINT [PK_AdmUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserWithRoles]    Script Date: 10/7/2020 9:03:46 AM ******/
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
SET IDENTITY_INSERT [adm].[Results] ON 

INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3031, N'102294', 1, 1, 1, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3032, N'109735', 1, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3033, N'111034', 1, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3034, N'111356', 1, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3035, N'104117', 1, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3036, N'112422', 1, 4, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3037, N'107434', 1, 4, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3038, N'108661', 1, 4, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3039, N'112304', 1, 4, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3040, N'102033', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3041, N'107812', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3042, N'112937', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3043, N'113042', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3044, N'111212', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3045, N'107892', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3046, N'113019', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3047, N'110978', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3048, N'104255', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3049, N'109179', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3050, N'113091', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3051, N'108796', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3052, N'100014', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3053, N'107496', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3054, N'112715', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3055, N'100156', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3056, N'109191', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3057, N'111982', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3058, N'107849', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3059, N'112169', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3060, N'105947', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3061, N'100291', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3062, N'109873', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3063, N'112488', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3064, N'109860', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3065, N'112119', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3066, N'100556', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3067, N'113022', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3068, N'112479', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3069, N'111286', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3070, N'107529', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3071, N'102978', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3072, N'113009', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3073, N'112781', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3074, N'113086', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3075, N'110586', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3076, N'106503', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3077, N'112867', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3078, N'112576', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3079, N'112914', 2, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3080, N'112977', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3081, N'107150', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3082, N'104074', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3083, N'112906', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3084, N'103561', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3085, N'106048', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3086, N'103416', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3087, N'113110', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3088, N'105797', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3089, N'111609', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3090, N'112079', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3091, N'112254', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3092, N'103919', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3093, N'105616', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3094, N'112831', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3095, N'113024', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3096, N'106512', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3097, N'112864', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3098, N'113046', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3099, N'100330', 2, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3100, N'104016', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3101, N'101180', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3102, N'113100', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3103, N'113067', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3104, N'112577', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3105, N'108304', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3106, N'102637', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3107, N'113013', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3108, N'106861', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3109, N'102759', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3110, N'112344', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3111, N'113082', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3112, N'103918', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3113, N'108342', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3114, N'113062', 3, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3115, N'112552', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3116, N'107845', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3117, N'107474', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3118, N'107601', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3119, N'100057', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3120, N'107430', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3121, N'102779', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3122, N'109858', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3123, N'101079', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3124, N'105988', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3125, N'112573', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3126, N'100754', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3127, N'102691', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3128, N'103733', 3, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3129, N'112852', 3, 2, NULL, NULL)
GO
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3130, N'100607', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3131, N'105902', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3132, N'111269', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3133, N'110531', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3134, N'104989', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3135, N'100260', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3136, N'106761', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3137, N'107164', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3138, N'103662', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3139, N'102897', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3140, N'105397', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3141, N'109141', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3142, N'103311', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3143, N'107715', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3144, N'105373', 3, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3145, N'113026', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3146, N'100062', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3147, N'113066', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3148, N'113054', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3149, N'108108', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3150, N'113048', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3151, N'110734', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3152, N'100263', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3153, N'107552', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3154, N'113051', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3155, N'100252', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3156, N'106748', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3157, N'112282', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3158, N'102565', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3159, N'110157', 4, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3160, N'102857', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3161, N'111399', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3162, N'113027', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3163, N'112868', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3164, N'100086', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3165, N'113074', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3166, N'112238', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3167, N'107428', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3168, N'111688', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3169, N'112691', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3170, N'111740', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3171, N'113018', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3172, N'110520', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3173, N'100782', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3174, N'112386', 4, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3175, N'100619', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3176, N'100253', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3177, N'112234', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3178, N'106972', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3179, N'105065', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3180, N'110780', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3181, N'100334', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3182, N'113014', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3183, N'100351', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3184, N'108650', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3185, N'112654', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3186, N'100516', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3187, N'105007', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3188, N'105467', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3189, N'103370', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3190, N'104773', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3191, N'102288', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3192, N'100385', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3193, N'106637', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3194, N'104504', 4, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3195, N'108691', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3196, N'106701', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3197, N'108244', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3198, N'104983', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3199, N'103814', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3200, N'112505', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3201, N'112891', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3202, N'112718', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3203, N'113094', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3204, N'108402', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3205, N'106757', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3206, N'108787', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3207, N'110295', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3208, N'113079', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3209, N'109548', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3210, N'110754', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3211, N'109435', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3212, N'108238', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3213, N'110676', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3214, N'100163', 5, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3215, N'106140', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3216, N'112523', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3217, N'107784', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3218, N'100210', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3219, N'106819', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3220, N'110806', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3221, N'113036', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3222, N'105146', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3223, N'104320', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3224, N'113103', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3225, N'103577', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3226, N'112846', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3227, N'102286', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3228, N'113109', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3229, N'100196', 5, 2, NULL, NULL)
GO
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3230, N'107128', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3231, N'100824', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3232, N'106852', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3233, N'100319', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3234, N'113065', 5, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3235, N'102794', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3236, N'107426', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3237, N'112904', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3238, N'108522', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3239, N'100056', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3240, N'109734', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3241, N'103322', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3242, N'102675', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3243, N'111070', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3244, N'107887', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3245, N'110984', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3246, N'106154', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3247, N'113080', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3248, N'100582', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3249, N'112939', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3250, N'107064', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3251, N'112088', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3252, N'103388', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3253, N'107252', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3254, N'107080', 5, 3, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3255, N'112403', 6, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3256, N'112227', 6, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3257, N'111409', 6, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3258, N'112946', 6, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3259, N'105750', 6, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3260, N'106921', 6, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3261, N'106728', 6, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3262, N'107249', 6, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3263, N'109395', 6, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3264, N'113107', 6, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3265, N'101733', 6, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3266, N'113106', 6, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3267, N'112385', 6, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3268, N'110855', 6, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3269, N'111092', 6, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3270, N'102860', 7, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3271, N'100438', 7, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3272, N'100126', 7, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3273, N'112976', 7, 2, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (3274, N'112970', 8, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4031, N'107423', 1, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4032, N'100291', 1, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4033, N'107487', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4034, N'107563', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4035, N'112795', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4036, N'106672', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4037, N'109490', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4038, N'104640', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4039, N'107032', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4040, N'111243', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4041, N'107892', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4042, N'106049', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4043, N'110229', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4044, N'106728', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4045, N'107474', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4046, N'111400', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4047, N'113087', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4048, N'105634', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4049, N'100883', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4050, N'112032', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4051, N'105451', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4052, N'100013', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4053, N'110295', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4054, N'103733', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4055, N'113108', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4056, N'106716', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4057, N'103561', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4058, N'105584', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4059, N'112967', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4060, N'112937', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4061, N'104068', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4062, N'112654', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4063, N'100147', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4064, N'100664', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4065, N'112881', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4066, N'105797', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4067, N'109858', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4068, N'102121', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4069, N'106714', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4070, N'112385', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4071, N'106987', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4072, N'106760', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4073, N'100778', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4074, N'113040', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4075, N'111609', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4076, N'113051', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4077, N'111034', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4078, N'113028', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4079, N'104255', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4080, N'109162', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4081, N'112234', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4082, N'112694', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4083, N'102294', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4084, N'111554', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4085, N'110855', 2, 1, NULL, NULL)
GO
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4086, N'113046', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4087, N'104015', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4088, N'110437', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4089, N'103519', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4090, N'113110', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4091, N'107807', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4092, N'113001', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4093, N'112939', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4094, N'113058', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4095, N'107953', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4096, N'113081', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4097, N'102263', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4098, N'112880', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4099, N'112420', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4100, N'109221', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4101, N'110780', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4102, N'110726', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4103, N'105921', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4104, N'102287', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4105, N'107431', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4106, N'112690', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4107, N'100022', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4108, N'112904', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4109, N'113094', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4110, N'113083', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4111, N'105947', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4112, N'111455', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4113, N'113022', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4114, N'103742', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4115, N'108983', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4116, N'107053', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4117, N'103919', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4118, N'112963', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4119, N'113019', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4120, N'106518', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4121, N'112973', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4122, N'113111', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4123, N'104440', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4124, N'101080', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4125, N'106987', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4126, N'112826', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4127, N'113054', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4128, N'104068', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4129, N'102423', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4130, N'105939', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4131, N'113101', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4132, N'100157', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4133, N'113109', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4134, N'110176', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4135, N'106210', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4136, N'104016', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4137, N'105414', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4138, N'110676', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4139, N'106672', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4140, N'112827', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4141, N'100196', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4142, N'110729', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4143, N'103982', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4144, N'112820', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4145, N'106921', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4146, N'110520', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4147, N'110554', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4148, N'105401', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4149, N'100754', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4150, N'107869', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4151, N'107619', 2, 1, NULL, NULL)
INSERT [adm].[Results] ([ID], [Ecode], [WinOnRound], [WinOnStage], [Status], [Description]) VALUES (4152, N'102751', 2, 1, NULL, NULL)
SET IDENTITY_INSERT [adm].[Results] OFF
GO
SET IDENTITY_INSERT [adm].[Rewards] ON 

INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (1, N'Quạt điều hòa Daikio DKA-04000A', 4, N'img/adm/bg-img/1.png', 7, 2, CAST(N'2020-08-14T08:04:40.563' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (2, N'Tủ lạnh LG GN-M255BL - 255', 1, N'img/adm/bg-img/2_1.png', 8, 1, CAST(N'2020-08-14T08:06:18.280' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (3, N'Cây lau nhà 360 độ', 15, N'img/adm/bg-img/4.jpg', 6, 2, CAST(N'2020-08-14T08:08:39.273' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (4, N'Bia Heiniken', 60, N'img/adm/bg-img/3.png', 5, 3, CAST(N'2020-08-14T08:10:34.210' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (5, N'Dầu ăn  Simply 5L', 50, N'img/adm/bg-img/6.png', 4, 3, CAST(N'2020-08-14T08:11:52.270' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (6, N'Nước giặt Ariel', 55, N'img/adm/bg-img/9.jpg', 3, 3, CAST(N'2020-08-14T08:13:22.367' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (7, N'Bộ 3 bát sứ có nắp', 60, N'img/adm/bg-img/5.png', 2, 3, CAST(N'2020-08-14T08:14:37.553' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (8, N'Bộ cốc thủy tinh', 2, N'img/adm/bg-img/7.jpg', 1, 2, CAST(N'2020-08-14T08:15:50.823' AS DateTime))
INSERT [adm].[Rewards] ([ID], [Name], [Quantity], [Image], [Round], [NoOfRound], [CreateDate]) VALUES (9, N'à', 0, N'g', 0, 0, CAST(N'2020-09-12T12:35:16.000' AS DateTime))
SET IDENTITY_INSERT [adm].[Rewards] OFF
GO
SET IDENTITY_INSERT [adm].[Rounds] ON 

INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (1, 1, 1, 2, 1, N'Bộ cốc thủy tinh', N'img/adm/bg-img/coc-vnpt.jpg', N'video/r1.mp4', NULL, 10, NULL, CAST(N'2020-08-17T18:31:40.047' AS DateTime), CAST(N'2020-08-17T18:31:40.047' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (2, 1, 2, 1, 1, N'Bộ ấm trà sứ', N'img/adm/bg-img/teacup.png', N'video/r1.mp4', NULL, 10, NULL, CAST(N'2020-08-17T18:32:43.370' AS DateTime), CAST(N'2020-08-17T18:32:43.370' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (3, 1, 3, 2, 1, N'Sạc đa năng', N'img/adm/bg-img/charge.png', N'video/r1.mp4', NULL, 10, NULL, CAST(N'2020-08-17T18:34:23.690' AS DateTime), CAST(N'2020-08-17T18:34:23.690' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (5, 1, 4, 4, 1, N'Ô che', N'img/adm/bg-img/umbrela.png', N'video/r1.mp4', NULL, 10, NULL, CAST(N'2020-08-17T18:35:51.833' AS DateTime), CAST(N'2020-08-17T18:35:51.833' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (6, 2, 1, 20, 1, N'Bộ 3 bát sứ có nắp', N'img/adm/bg-img/5.png', N'video/r2.mp4', NULL, 10, NULL, CAST(N'2020-08-17T18:37:02.743' AS DateTime), CAST(N'2020-08-17T18:37:02.743' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (7, 2, 2, 20, 1, N'Bộ 3 bát sứ có nắp', N'img/adm/bg-img/5.png', N'video/r2.mp4', NULL, 10, NULL, CAST(N'2020-08-17T18:37:02.743' AS DateTime), CAST(N'2020-08-17T18:37:02.743' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (8, 2, 3, 20, 1, N'Bộ 3 bát sứ có nắp', N'img/adm/bg-img/5.png', N'video/r2.mp4', NULL, 10, NULL, CAST(N'2020-08-17T18:37:02.743' AS DateTime), CAST(N'2020-08-17T18:37:02.743' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (9, 3, 1, 15, 1, N'Nước giặt Ariel', N'img/adm/bg-img/9.jpg', N'video/r8.mp4', NULL, 11, NULL, CAST(N'2020-08-18T15:21:05.087' AS DateTime), CAST(N'2020-08-18T15:21:05.087' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (10, 3, 2, 15, 1, N'Nước giặt Ariel', N'img/adm/bg-img/9.jpg', N'video/r8.mp4', NULL, 11, NULL, CAST(N'2020-08-18T15:21:26.567' AS DateTime), CAST(N'2020-08-18T15:21:26.567' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (11, 3, 3, 15, 1, N'Nước giặt Ariel', N'img/adm/bg-img/9.jpg', N'video/r8.mp4', NULL, 11, NULL, CAST(N'2020-08-18T15:21:50.447' AS DateTime), CAST(N'2020-08-18T15:21:50.447' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (12, 4, 1, 15, 1, N'Dầu ăn  Simply 5L', N'img/adm/bg-img/6.png', N'video/r4.mp4', NULL, 10, NULL, CAST(N'2020-08-18T15:22:33.313' AS DateTime), CAST(N'2020-08-18T15:22:33.313' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (13, 4, 2, 15, 1, N'Dầu ăn  Simply 5L', N'img/adm/bg-img/6.png', N'video/r4.mp4', NULL, 10, NULL, CAST(N'2020-08-18T15:22:49.490' AS DateTime), CAST(N'2020-08-18T15:22:49.490' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (14, 4, 3, 20, 1, N'Dầu ăn  Simply 5L', N'img/adm/bg-img/6.png', N'video/r4.mp4', NULL, 10, NULL, CAST(N'2020-08-18T15:23:03.487' AS DateTime), CAST(N'2020-08-18T15:23:03.487' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (15, 5, 1, 20, 1, N'Bia Heiniken', N'img/adm/bg-img/3.png', N'video/r5.mp4', NULL, 10, NULL, CAST(N'2020-08-18T15:24:09.677' AS DateTime), CAST(N'2020-08-18T15:24:09.677' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (16, 5, 2, 20, 1, N'Bia Heiniken', N'img/adm/bg-img/3.png', N'video/r5.mp4', NULL, 10, NULL, CAST(N'2020-08-18T15:24:30.073' AS DateTime), CAST(N'2020-08-18T15:24:30.073' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (17, 5, 3, 20, 1, N'Bia Heiniken', N'img/adm/bg-img/3.png', N'video/r5.mp4', NULL, 10, NULL, CAST(N'2020-08-18T15:24:46.547' AS DateTime), CAST(N'2020-08-18T15:24:46.547' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (18, 6, 1, 7, 1, N'Cây lau nhà Mega home X5', N'img/adm/bg-img/4.jpg', N'video/r6.mp4', NULL, 10, NULL, CAST(N'2020-08-18T15:25:25.347' AS DateTime), CAST(N'2020-08-18T15:25:25.347' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (20, 6, 2, 8, 1, N'Cây lau nhà Mega home X5', N'img/adm/bg-img/4.jpg', N'video/r6.mp4', NULL, 10, NULL, CAST(N'2020-08-18T15:25:55.357' AS DateTime), CAST(N'2020-08-18T15:25:55.357' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (21, 7, 1, 2, 1, N'Kangaro KG50F22', N'img/adm/bg-img/1.png', N'video/r7.mp4', NULL, 10, NULL, CAST(N'2020-08-18T15:26:58.110' AS DateTime), CAST(N'2020-08-18T15:26:58.110' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (22, 7, 2, 2, 1, N'Kangaro KG50F22', N'img/adm/bg-img/1.png', N'video/r7.mp4', NULL, 10, NULL, CAST(N'2020-08-18T15:27:17.610' AS DateTime), CAST(N'2020-08-18T15:27:17.610' AS DateTime))
INSERT [adm].[Rounds] ([ID], [Round], [Stage], [QuantityOfStage], [IsDrawn], [Name], [Image], [FileEffect], [VideoLenght], [TimeoutAction], [Animation], [CreateDate], [UpdateDate]) VALUES (23, 8, 1, 1, 1, N'Tủ lạnh LG GN-M255BL - 255', N'img/adm/bg-img/2_1.png', N'video/r3.mp4', NULL, 20, NULL, CAST(N'2020-08-18T15:27:47.090' AS DateTime), CAST(N'2020-08-18T15:27:47.090' AS DateTime))
SET IDENTITY_INSERT [adm].[Rounds] OFF
GO
SET IDENTITY_INSERT [dbo].[Departments] ON 

INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (1, 1, N'ADM', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (2, 2, N'AI', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (3, 3, N'BM', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (4, 4, N'CR', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (5, 5, N'ENG1', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (6, 6, N'ENG2', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (7, 7, N'LOG', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (8, 8, N'MF', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (9, 9, N'OS', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (10, 10, N'QC', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (11, 11, N'SCM1', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (12, 12, N'SCM2', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (13, 13, N'SE', NULL)
INSERT [dbo].[Departments] ([Id], [ModuleNo], [DepartmentName], [Description]) VALUES (14, 14, N'Training', NULL)
SET IDENTITY_INSERT [dbo].[Departments] OFF
GO
SET IDENTITY_INSERT [dbo].[Files] ON 

INSERT [dbo].[Files] ([id], [guid], [fileName], [extension], [userCreate], [userUpdate], [createDate], [updateDate]) VALUES (1, N'104707f6eac9', N'6d9e9c5d-2816-4519-b07e-8e82feaa154d.jpg', N'.jpg                                              ', N'112892', N'112892', CAST(N'2020-09-19T10:47:07.960' AS DateTime), CAST(N'2020-09-19T10:47:07.960' AS DateTime))
INSERT [dbo].[Files] ([id], [guid], [fileName], [extension], [userCreate], [userUpdate], [createDate], [updateDate]) VALUES (2, N'123237bec72a', N'82c7a123-9e13-4a99-a236-038b56129966.jpg', N'.jpg                                              ', N'112892', N'112892', CAST(N'2020-09-19T12:32:37.647' AS DateTime), CAST(N'2020-09-19T12:32:37.647' AS DateTime))
INSERT [dbo].[Files] ([id], [guid], [fileName], [extension], [userCreate], [userUpdate], [createDate], [updateDate]) VALUES (3, N'1242579c698a', N'2a6ae8ba-70fe-4dcf-89c5-4af01f5b1a23.jpg', N'.jpg                                              ', N'112892', N'112892', CAST(N'2020-09-19T12:42:58.303' AS DateTime), CAST(N'2020-09-19T12:42:58.303' AS DateTime))
INSERT [dbo].[Files] ([id], [guid], [fileName], [extension], [userCreate], [userUpdate], [createDate], [updateDate]) VALUES (4, N'13211840dce2', N'26356051-410d-4e8c-831c-17faff629c98.jpg', N'.jpg                                              ', N'112892', N'112892', CAST(N'2020-09-19T13:21:19.140' AS DateTime), CAST(N'2020-09-19T13:21:19.140' AS DateTime))
INSERT [dbo].[Files] ([id], [guid], [fileName], [extension], [userCreate], [userUpdate], [createDate], [updateDate]) VALUES (5, N'135312b2cf22', N'40a1aabf-477d-41ad-aaef-8828b51a98ed.jpg', N'.jpg                                              ', N'112892', N'112892', CAST(N'2020-09-19T13:53:13.307' AS DateTime), CAST(N'2020-09-19T13:53:13.307' AS DateTime))
INSERT [dbo].[Files] ([id], [guid], [fileName], [extension], [userCreate], [userUpdate], [createDate], [updateDate]) VALUES (6, N'1555126fe585', N'6d21aae1-b46b-4795-b79d-e98bccc022ca.jpg', N'.jpg                                              ', N'104160', N'104160', CAST(N'2020-09-19T15:55:13.043' AS DateTime), CAST(N'2020-09-19T15:55:13.043' AS DateTime))
INSERT [dbo].[Files] ([id], [guid], [fileName], [extension], [userCreate], [userUpdate], [createDate], [updateDate]) VALUES (7, N'15571352d887', N'b954856c-4cfe-4b6f-a799-27f73e60a09e.jpg', N'.jpg                                              ', N'104160', N'104160', CAST(N'2020-09-19T15:57:13.563' AS DateTime), CAST(N'2020-09-19T15:57:13.563' AS DateTime))
INSERT [dbo].[Files] ([id], [guid], [fileName], [extension], [userCreate], [userUpdate], [createDate], [updateDate]) VALUES (8, N'1558376ee1d4', N'e8bac832-13f2-420a-96e2-41dda7b5aa6d.jpg', N'.jpg                                              ', N'104160', N'104160', CAST(N'2020-09-19T15:58:37.490' AS DateTime), CAST(N'2020-09-19T15:58:37.490' AS DateTime))
INSERT [dbo].[Files] ([id], [guid], [fileName], [extension], [userCreate], [userUpdate], [createDate], [updateDate]) VALUES (9, N'1018554abe9c', N'ffd35f09-2ee4-4fe8-975e-ef09595f7e67.png', N'.png                                              ', N'Xu', N'Xu', CAST(N'2020-09-29T10:18:56.350' AS DateTime), CAST(N'2020-09-29T10:18:56.350' AS DateTime))
SET IDENTITY_INSERT [dbo].[Files] OFF
GO
SET IDENTITY_INSERT [dbo].[Mobile_Applications] ON 

INSERT [dbo].[Mobile_Applications] ([Id], [ApplicationName], [Version], [Path], [BuildNumber], [Project], [Description], [CreateDate], [UpdateDate]) VALUES (1, N'LOG_Vendors_Tracability', N'1.0.2', N'Helper/Mobile_app/V-1.0.2.apk', 1, N'LOG', N'Vendor trace', CAST(N'2020-09-22T08:48:18.007' AS DateTime), CAST(N'2020-09-22T08:48:18.007' AS DateTime))
INSERT [dbo].[Mobile_Applications] ([Id], [ApplicationName], [Version], [Path], [BuildNumber], [Project], [Description], [CreateDate], [UpdateDate]) VALUES (5, N'LOG_Vendors_Tracability', N'1.0.3', N'Helper/Mobile_app/V-1.0.3.apk', 2, N'LOG', NULL, CAST(N'2020-09-22T08:49:47.683' AS DateTime), CAST(N'2020-09-22T08:49:47.683' AS DateTime))
INSERT [dbo].[Mobile_Applications] ([Id], [ApplicationName], [Version], [Path], [BuildNumber], [Project], [Description], [CreateDate], [UpdateDate]) VALUES (6, N'LOG_Vendors_Tracability', N'1.0.4', N'Helper/Mobile_app/V-1.0.4.apk', 3, N'LOG', N'Vendor', CAST(N'2020-09-22T08:50:41.480' AS DateTime), CAST(N'2020-09-22T08:50:41.480' AS DateTime))
INSERT [dbo].[Mobile_Applications] ([Id], [ApplicationName], [Version], [Path], [BuildNumber], [Project], [Description], [CreateDate], [UpdateDate]) VALUES (7, N'LOG_Vendors_Tracability', N'1.0.5', N'Helper/Mobile_app/V-1.0.5.apk', 4, N'LOG', N'Vendor', CAST(N'2020-09-22T08:58:01.390' AS DateTime), CAST(N'2020-09-22T08:58:01.390' AS DateTime))
INSERT [dbo].[Mobile_Applications] ([Id], [ApplicationName], [Version], [Path], [BuildNumber], [Project], [Description], [CreateDate], [UpdateDate]) VALUES (8, N'LOG_Vendors_Tracability', N'1.0.6', N'Helper/Mobile_app/V-1.0.6.apk', 5, N'LOG', N'Vendor', CAST(N'2020-09-22T10:06:48.693' AS DateTime), CAST(N'2020-09-22T10:06:48.693' AS DateTime))
SET IDENTITY_INSERT [dbo].[Mobile_Applications] OFF
GO
INSERT [dbo].[ModulesForUsers] ([UserId], [AllowedPaidForModules]) VALUES (N'99e0b23c-c1f3-41c3-bc5f-96c7cfd2c7f8', 3)
INSERT [dbo].[ModulesForUsers] ([UserId], [AllowedPaidForModules]) VALUES (N'9e50a8b6-a9b1-4843-a618-20f468fba354', 1)
GO
SET IDENTITY_INSERT [dbo].[Projects] ON 

INSERT [dbo].[Projects] ([Id], [ProjectName], [DepartmentId], [Detail], [CreateDate]) VALUES (1, N'Multi Skill Quiz', 13, N'Testing system', CAST(N'2020-09-30T13:12:57.543' AS DateTime))
INSERT [dbo].[Projects] ([Id], [ProjectName], [DepartmentId], [Detail], [CreateDate]) VALUES (2, N'Quay thưởng', 1, N'Quay thưởng tết', CAST(N'2020-09-30T13:30:28.090' AS DateTime))
INSERT [dbo].[Projects] ([Id], [ProjectName], [DepartmentId], [Detail], [CreateDate]) VALUES (3, N'Vendor Traceability', 7, N'Truy nguyên LOG', CAST(N'2020-10-06T15:21:41.883' AS DateTime))
INSERT [dbo].[Projects] ([Id], [ProjectName], [DepartmentId], [Detail], [CreateDate]) VALUES (4, N'Meeting Management', 1, N'Quản lý đặt lịch họp', CAST(N'2020-10-06T15:23:15.820' AS DateTime))
SET IDENTITY_INSERT [dbo].[Projects] OFF
GO
SET IDENTITY_INSERT [dbo].[RoleInProjects] ON 

INSERT [dbo].[RoleInProjects] ([Id], [ProjectId], [RoleNameInProject]) VALUES (1, 1, N'PR1_Admin')
INSERT [dbo].[RoleInProjects] ([Id], [ProjectId], [RoleNameInProject]) VALUES (2, 1, N'PR1_Manager')
INSERT [dbo].[RoleInProjects] ([Id], [ProjectId], [RoleNameInProject]) VALUES (3, 1, N'PR1_Staff')
INSERT [dbo].[RoleInProjects] ([Id], [ProjectId], [RoleNameInProject]) VALUES (4, 2, N'PR2_Admin')
INSERT [dbo].[RoleInProjects] ([Id], [ProjectId], [RoleNameInProject]) VALUES (5, 2, N'PR2_Manager')
INSERT [dbo].[RoleInProjects] ([Id], [ProjectId], [RoleNameInProject]) VALUES (6, 2, N'PR2_Staff')
SET IDENTITY_INSERT [dbo].[RoleInProjects] OFF
GO
SET IDENTITY_INSERT [dbo].[RolesInDepartment] ON 

INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (15, 1, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (16, 2, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (17, 3, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (18, 4, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (19, 5, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (20, 6, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (21, 7, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (22, 8, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (23, 9, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (24, 10, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (25, 11, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (26, 12, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (27, 13, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (28, 14, N'Employee')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (29, 13, N'Admin')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (30, 13, N'Manager')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (31, 13, N'Staff')
INSERT [dbo].[RolesInDepartment] ([id], [deptId], [roleName]) VALUES (32, 7, N'Line Leader')
SET IDENTITY_INSERT [dbo].[RolesInDepartment] OFF
GO
INSERT [dbo].[RolesToPermissions] ([RoleName], [Description], [PermissionsInRole]) VALUES (N'Admin', N'Admin can manage users, but not read data', N'H4-002100300031')
INSERT [dbo].[RolesToPermissions] ([RoleName], [Description], [PermissionsInRole]) VALUES (N'Manager', N'Managers can read/write the data', N'H4-00100011001300120030')
INSERT [dbo].[RolesToPermissions] ([RoleName], [Description], [PermissionsInRole]) VALUES (N'Staff', N'Staff can only read data', N'H4-00100030')
GO
SET IDENTITY_INSERT [dbo].[UserRoleInProjects] ON 

INSERT [dbo].[UserRoleInProjects] ([Id], [Ecode], [ProjectId], [RolesInProjectID], [Description]) VALUES (1, N'112892', 1, 1, N'Quyền Admin trên project 01')
INSERT [dbo].[UserRoleInProjects] ([Id], [Ecode], [ProjectId], [RolesInProjectID], [Description]) VALUES (2, N'112892', 1, 2, N'Quyền Manager trên project 01')
INSERT [dbo].[UserRoleInProjects] ([Id], [Ecode], [ProjectId], [RolesInProjectID], [Description]) VALUES (3, N'111070', 1, 3, N'Quyền Staff trên project 01')
INSERT [dbo].[UserRoleInProjects] ([Id], [Ecode], [ProjectId], [RolesInProjectID], [Description]) VALUES (4, N'112892', 2, 4, N'Quyền Admin trên project 02')
SET IDENTITY_INSERT [dbo].[UserRoleInProjects] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4193, N'100013', N'Lê Thị The', NULL, N'Le.Thi.The100013@mtv.com.vn', NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4194, N'100014', N'Nguyễn Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4195, N'100022', N'Nguyễn Thiên Khoa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4196, N'100023', N'Nguyễn Thiện Quý', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4197, N'100035', N'Nguyễn Xuân Hinh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4198, N'100049', N'Nguyễn Tiến Trường', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4199, N'100056', N'Nguyễn Văn Trung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4200, N'100057', N'Nguyễn Thị Ái', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4201, N'100062', N'Trần Thị Gái', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4202, N'100065', N'Nguyễn Thị Hoà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4203, N'100070', N'Nguyễn Thị Bích Ngọc', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4204, N'100086', N'Vũ Văn Thuỷ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4205, N'100089', N'Phạm Thị Diệp', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4206, N'100118', N'Vũ Đình Cần', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4207, N'100126', N'Nguyễn Thị Thuý', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4208, N'100127', N'Nguyễn Thị Tuyến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4209, N'100128', N'Trần Thị Tâm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4210, N'100144', N'Lê Đắc Tuấn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4211, N'100147', N'Nguyễn Thị Sim', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4212, N'100156', N'Nguyễn Thị Giang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4213, N'100157', N'Phạm Thị Mai', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4214, N'100159', N'Nguyễn Thị Thà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4215, N'100163', N'Lương Thị Tuyết', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4216, N'100164', N'Phạm Thị Thuận', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4217, N'100182', N'Nguyễn Văn Quang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4218, N'100183', N'Đoàn Văn Thành', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4219, N'100189', N'Đoàn Thanh Bình', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4220, N'100196', N'Đào Thị Bích', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4221, N'100210', N'Trần Thị Linh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4222, N'100216', N'Nguyễn Thị Hồng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4223, N'100227', N'Bùi Thị Thắm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4224, N'100239', N'Nguyễn Thị Minh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4225, N'100252', N'Nguyễn Thị Thắm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4226, N'100253', N'Nguyễn Thị Thoả', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4227, N'100254', N'Nguyễn Thị Thuỷ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4228, N'100258', N'Lương Ngọc Hải', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4229, N'100260', N'Phạm Thị Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4230, N'100263', N'Hoàng Thị Ngần', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4231, N'100291', N'Lê Thị Xuân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4232, N'100319', N'Nguyễn Thị Mến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4233, N'100330', N'Ngô Thị Huế', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4234, N'100334', N'Phạm Thị Nhung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4235, N'100337', N'Phạm Thị Thuỳ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4236, N'100351', N'Trần Thị Phượng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4237, N'100385', N'Nguyễn Văn Mạnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4238, N'100438', N'Hoàng Thị Thực', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4239, N'100440', N'Phạm Thị Thuỳ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4240, N'100516', N'Trần Thanh Thục', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4241, N'100518', N'Nguyễn Mạnh Tiến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4242, N'100531', N'Đồng Văn Điệp', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4243, N'100556', N'Đặng Thị Hoa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4244, N'100560', N'Phạm Thị Thuỳ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4245, N'100577', N'Đỗ Thị Bình', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4246, N'100582', N'Phạm Thị Quỳnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4247, N'100607', N'Nguyễn Thị Dung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4248, N'100619', N'Nguyễn Thị Luy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4249, N'100626', N'Nguyễn Thị Kim Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4250, N'100633', N'Phạm Thị Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4251, N'100660', N'Trần Thị Nhàn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4252, N'100664', N'Cù Thị Quế', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4253, N'100698', N'Nguyễn Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4254, N'100705', N'Nguyễn Thị Thương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4255, N'100722', N'Nguyễn Thị Dự', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4256, N'100754', N'Vũ Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4257, N'100778', N'Mai Thị Hường', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4258, N'100782', N'Hoàng Thị Luận', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4259, N'100788', N'Vũ Thị Xoan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4260, N'100821', N'Nguyễn Thị Tám', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4261, N'100824', N'Nguyễn Thị Ngọc', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4262, N'100883', N'Hoàng Thị Thơm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4263, N'100892', N'Vũ Thị Nhung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4264, N'100913', N'Phạm Thị Hoa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4265, N'100915', N'Vũ Thị Hậu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4266, N'100920', N'Nguyễn Thị Mai Quyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4267, N'101067', N'Đỗ Thị Miến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4268, N'101079', N'Nguyễn Thị Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4269, N'101080', N'Nguyễn Hữu Thanh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4270, N'101180', N'Phạm Thị Liên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4271, N'101191', N'Trần Trung Hiếu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4272, N'101401', N'Vũ Văn Quý', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4273, N'101424', N'Nhữ Thị Huệ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4274, N'101511', N'Phạm Thanh Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4275, N'101594', N'Nguyễn Thị Loan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4276, N'101733', N'Bùi Thị Đổi', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4277, N'101942', N'Phạm Thị Vui', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4278, N'102033', N'Phạm Văn Hưng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4279, N'102037', N'Trần Thị Linh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4280, N'102054', N'Lương Đức Ngân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4281, N'102081', N'Nguyễn Thị Nhi', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4282, N'102121', N'Lê Thị Quý', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4283, N'102142', N'Đặng Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4284, N'102171', N'Vũ Thị Liên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4285, N'102210', N'Tống Thị Thu Thuỷ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4286, N'102222', N'Trần Thị Thế', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4287, N'102263', N'Bùi Thị Luân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4288, N'102286', N'Vũ Thị Lý', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4289, N'102287', N'Lê Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4290, N'102288', N'Trần Thị Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4291, N'102294', N'Phạm Thị Giang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4292, N'102358', N'Nguyễn Thị Vân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4293, N'102362', N'Đào Thị Nhung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4294, N'102363', N'Phạm Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4295, N'102397', N'Nguyễn Thị Loan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4296, N'102423', N'Hà Thị My', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4297, N'102565', N'Hoàng Thị Lư', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4298, N'102597', N'Vũ Thị Huệ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4299, N'102637', N'Lê Văn Đăng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4300, N'102675', N'Lê Thị An', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4301, N'102679', N'Nguyễn Thị Hoài', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4302, N'102691', N'Đoàn Thị Thơm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4303, N'102751', N'Trần Thị Sim', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4304, N'102759', N'Nguyễn Thị Nghệ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4305, N'102779', N'Vũ Xuân Chiến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4306, N'102794', N'Phạm Thị Hiên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4307, N'102857', N'Lê Thị My', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4308, N'102860', N'Vũ Hữu Dưỡng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4309, N'102866', N'Nguyễn Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4310, N'102886', N'Đặng Thị Thuý', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4311, N'102897', N'Hoàng Thị Liên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4312, N'102906', N'Nguyễn Thị Lượt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4313, N'102923', N'Nguyễn Thị Thơ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4314, N'102953', N'Nông Thị Giang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4315, N'102978', N'Phạm Thị Nhẫn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4316, N'102987', N'Lê Thị Dựu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4317, N'103039', N'Nguyễn Thị Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4318, N'103051', N'Đinh Công Long', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4319, N'103278', N'Mai Thu Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4320, N'103296', N'Đào Thị Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4321, N'103304', N'Vũ Thị Thoan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4322, N'103311', N'Nguyễn Văn Cảnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4323, N'103322', N'Nguyễn Đình Hải', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4324, N'103360', N'Ngô Thị Chiên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4325, N'103370', N'Nguyễn Thị Hồng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4326, N'103388', N'Bùi Thị Huế', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4327, N'103416', N'Đoàn Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4328, N'103519', N'Nguyễn Thị Lý', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4329, N'103561', N'Nguyễn Thị Tươi', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4330, N'103577', N'Lê Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4331, N'103613', N'Nhữ Thị Nhinh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4332, N'103647', N'Nguyễn Thị Khánh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4333, N'103651', N'Đinh Thị Miền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4334, N'103660', N'Nguyễn Thị Quỳnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4335, N'103662', N'Vũ Thị Ngọc Ánh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4336, N'103733', N'Nguyễn Thị Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4337, N'103737', N'Lê Thị Thảo', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4338, N'103742', N'Lê Thuỷ Nguyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4339, N'103760', N'Trần Thị Liên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4340, N'103792', N'Đỗ Thị Hòa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4341, N'103795', N'Nguyễn Đức Tú', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4342, N'103814', N'Ngô Thị Hiếu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4343, N'103884', N'Nguyễn Thị Nhưng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4344, N'103918', N'Vũ Thị Hoàng Yến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4345, N'103919', N'Phạm Thị Yến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4346, N'103934', N'Phạm Thị Cảnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4347, N'103982', N'Nông Thị Nhâm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4348, N'104015', N'Nguyễn Thị Hương Tiếp', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4349, N'104016', N'Vũ Thị Thương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4350, N'104040', N'Bùi Thị Bài', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4351, N'104048', N'Hoàng Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4352, N'104068', N'Nguyễn Thị Yến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4353, N'104074', N'Nguyễn Thị Ngân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4354, N'104117', N'Đặng Thị Thơm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4355, N'104160', N'Thơ', N'Nguyễn Văn', N'N/A', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4356, N'104255', N'Phạm Thị Xuân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4357, N'104320', N'Dương Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4358, N'104360', N'Vũ Thị Lan Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4359, N'104375', N'Nguyễn Thị Tâm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4360, N'104403', N'Nguyễn Thị Nhã', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4361, N'104427', N'Đặng Thị Từ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4362, N'104440', N'Vũ Thị Nụ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4363, N'104447', N'Phạm Thị Thắm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4364, N'104504', N'Bùi Thị Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4365, N'104505', N'Lê Thị Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4366, N'104552', N'Phạm Thị Sản', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4367, N'104616', N'Trần Thị Nga', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4368, N'104640', N'Bùi Thị Thêu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4369, N'104667', N'Vũ Thị Huyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4370, N'104673', N'Cao Xuân Cường', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4371, N'104773', N'Nguyễn Thị Huyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4372, N'104774', N'Nguyễn Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4373, N'104837', N'Vũ Thị Vui', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4374, N'104907', N'Nguyễn Thị Huyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4375, N'104983', N'Nguyễn Bá Điệp', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4376, N'104989', N'Nguyễn Tuấn Tài', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4377, N'105007', N'Nguyễn Thị Ngọc Hân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4378, N'105027', N'Nguyễn Thị Năm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4379, N'105047', N'Nguyễn Huy Đạt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4380, N'105060', N'Nguyễn Thị Nhung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4381, N'105065', N'Vương Thị Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4382, N'105081', N'Trần Khắc Vượng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4383, N'105116', N'Hoàng Thị Vườn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4384, N'105146', N'Lê Thị Tuyết', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4385, N'105151', N'Nguyễn Thiên Khanh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4386, N'105274', N'Nguyễn Thị Thúy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4387, N'105356', N'Vũ Thị Diên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4388, N'105373', N'Nguyễn Thị Mỵ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4389, N'105397', N'Vũ Ngọc Long', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4390, N'105401', N'Nguyễn Thị Lệ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4391, N'105414', N'Nguyễn Thị Minh Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4392, N'105451', N'Nguyễn Thị Liên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4393, N'105462', N'Phạm Thị Đượm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4394, N'105467', N'Trần Văn Cảng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4395, N'105487', N'Vũ Thị Liên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4396, N'105524', N'Nguyễn Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4397, N'105535', N'Phạm Thị Ngoan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4398, N'105538', N'Nguyễn Thị Xim', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4399, N'105584', N'Vũ Văn Hùng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4400, N'105616', N'Nguyễn Thị Điệu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4401, N'105634', N'Nguyễn Thị Huyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4402, N'105653', N'Hoàng Thị Hoài', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4403, N'105669', N'Ngô Thị Thoan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4404, N'105695', N'Lê Duy Đông', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4405, N'105750', N'Nguyễn Thị Sang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4406, N'105751', N'Vũ Thị Duyến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4407, N'105775', N'Nguyễn Thị Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4408, N'105797', N'Lê Thị Tâm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4409, N'105878', N'Khúc Thị Diệp', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4410, N'105902', N'Vũ Thị Nhài', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4411, N'105921', N'Nguyễn Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4412, N'105928', N'Phạm Thị Nhạn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4413, N'105930', N'Vũ Thị Thùy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4414, N'105939', N'Trần Thị Xuyến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4415, N'105947', N'Lê Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4416, N'105948', N'Lê Thị Quyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4417, N'105949', N'Phạm Thị Nga', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4418, N'105988', N'Vũ Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4419, N'105991', N'Lê Thị Huyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4420, N'105999', N'Vương Thị Mai Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4421, N'106013', N'Phạm Thị Lức', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4422, N'106024', N'Nguyễn Văn Tùng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4423, N'106048', N'Nguyễn Thị Cúc', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4424, N'106049', N'Vũ Thị Thư', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4425, N'106064', N'Hà Thị Huyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4426, N'106089', N'Nguyễn Văn Hữu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4427, N'106140', N'Phạm Thị Ly', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4428, N'106154', N'Vũ Thị Thúy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4429, N'106210', N'Nguyễn Thị Thắm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4430, N'106217', N'Lương Thị Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4431, N'106229', N'Đoàn Thị Thanh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4432, N'106339', N'Đặng Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4433, N'106405', N'Trần Thị Tiệp', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4434, N'106434', N'Nguyễn Thị Dinh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4435, N'106468', N'Hoàng Thị Tính', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4436, N'106503', N'Trần Thị Thanh Mai', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4437, N'106512', N'Triệu Thị Liền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4438, N'106518', N'Đào Thị Lâm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4439, N'106542', N'Nguyễn Thị Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4440, N'106605', N'Nguyễn Minh Phượng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4441, N'106637', N'Đặng Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4442, N'106648', N'Vũ Thị Thúy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4443, N'106667', N'Vũ Thị Liên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4444, N'106671', N'Vũ Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4445, N'106672', N'Ngô Thị Huỳnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4446, N'106683', N'Nguyễn Thị Luyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4447, N'106701', N'Nguyễn Thị Ái', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4448, N'106704', N'Dương Thị Bảo Yến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4449, N'106706', N'Vũ Đức Việt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4450, N'106710', N'Nguyễn Thị Khuyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4451, N'106714', N'Phạm Trọng Nghệ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4452, N'106716', N'Nguyễn Đức Huy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4453, N'106728', N'Phạm Thị Ánh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4454, N'106748', N'Lê Thị Thúy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4455, N'106757', N'Vũ Thị Hiển', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4456, N'106760', N'Nguyễn Thị Ngà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4457, N'106761', N'Vũ Thị Huyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4458, N'106770', N'Hà Thị Tuyến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4459, N'106787', N'Phạm Thị Ánh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4460, N'106788', N'Phạm Thị Lụa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4461, N'106812', N'Phạm Thị Doan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4462, N'106819', N'Nguyễn Văn Trúc', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4463, N'106845', N'Phan Thị Huyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4464, N'106852', N'Hoàng Thị Nguyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4465, N'106861', N'Ngần Thị Thêu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4466, N'106863', N'Phạm Thị Thúy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4467, N'106868', N'Nguyễn Thị Mát', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4468, N'106901', N'Nguyễn Thị Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4469, N'106911', N'Tiêu Thị Ly', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4470, N'106921', N'Ma Thị Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4471, N'106924', N'Mai Thị Linh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4472, N'106944', N'Lê Trọng Kiên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4473, N'106966', N'Tuyên', N'Hoàng Văn', N'N/A', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4474, N'106972', N'Cù Thị Thu Huyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4475, N'106979', N'Nguyễn Văn Thịnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4476, N'106980', N'Tăng Xuân Mùi', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4477, N'106987', N'Bùi Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4478, N'107025', N'Lý Thị Luận', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4479, N'107032', N'Nguyễn Khắc Tiệp', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4480, N'107044', N'Hoàng Thị Thanh Huyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4481, N'107053', N'Hà Thị Tấm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4482, N'107064', N'Nguyễn Thị Ngoan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4483, N'107070', N'Vương Thị Bích', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4484, N'107077', N'Nguyễn Thị Hồng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4485, N'107080', N'Vũ Văn Tùng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4486, N'107100', N'Hà Thị Tú', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4487, N'107128', N'Đỗ Thị Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4488, N'107140', N'Phùng Công Oanh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4489, N'107145', N'Lê Văn Sơn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4490, N'107150', N'Nguyễn Thị Quyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4491, N'107152', N'Đào Thị Thu Châm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4492, N'107164', N'Lê Thị Long', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4493, N'107228', N'Nguyễn Đình Bình', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4494, N'107229', N'Nguyễn Thanh Tân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4495, N'107249', N'Vũ Xuân Tiến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4496, N'107252', N'Vũ Thị Lợi', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4497, N'107303', N'Trần Thị Như Mai', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4498, N'107320', N'Vũ Xuân Đạt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4499, N'107347', N'Đỗ Thị Tuyết', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4500, N'107354', N'Vũ Thị Hòa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4501, N'107375', N'Phan Thị Huyền Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4502, N'107389', N'Ngô Thị Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4503, N'107423', N'Phạm Thị Huyền Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4504, N'107426', N'Trần Minh Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4505, N'107428', N'Trần Văn Thuấn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4506, N'107430', N'Hoàng Minh Vĩ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4507, N'107431', N'Vũ Xuân Đông', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4508, N'107434', N'Lê Thị Vân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4509, N'107467', N'Nguyễn Thị Giang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4510, N'107474', N'Lương Đức Thuần', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4511, N'107487', N'Vũ Thị Ngọc Lan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4512, N'107496', N'Nguyễn Đức Dương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4513, N'107499', N'Trịnh Thị Lan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4514, N'107514', N'Hoàng Thị Mơ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4515, N'107529', N'Nguyễn Thị Xuyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4516, N'107533', N'Phạm Đình An', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4517, N'107541', N'Ngân', N'Lê Thị', N'meiko@mk-t.com.vn', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4518, N'107546', N'Vũ Thị Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4519, N'107552', N'Vì Thị Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4520, N'107554', N'Hoàng Thị Hiên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4521, N'107563', N'Nguyễn Đức Nghiêm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4522, N'107578', N'Sáng', N'Bùi Hữu', N'meiko@mk-t.com.vn', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4523, N'107601', N'Nguyễn Đức Thịnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4524, N'107603', N'Bùi Thị Hậu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4525, N'107612', N'Vũ Văn Cường', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4526, N'107619', N'Nguyễn Thị Vui', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4527, N'107669', N'Nguyễn Thị Thúy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4528, N'107689', N'Phan Thị Thu Yến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4529, N'107714', N'Lê Thị Mến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4530, N'107715', N'Nguyễn Nhật Minh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4531, N'107771', N'Lương Thị Yến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4532, N'107784', N'Nguyễn Thị Hoa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4533, N'107807', N'Nguyễn Thị Liễu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4534, N'107812', N'Nguyễn Thị Hoài', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4535, N'107839', N'Vũ Thị Chuyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4536, N'107845', N'Phạm Xuân Thắng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4537, N'107848', N'Nguyễn Văn An', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4538, N'107849', N'Trần Đắc Thái', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4539, N'107869', N'Đặng Văn Cường', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4540, N'107887', N'Lê Ngọc Hoàng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4541, N'107892', N'Hoàng Văn Việt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4542, N'107908', N'Nguyễn Văn Chí', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4543, N'107953', N'Bùi Thị Thương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4544, N'107960', N'Lưu Thị Ngân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4545, N'107979', N'Phạm Văn Hải', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4546, N'107980', N'Phạm Thị Huân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4547, N'108046', N'Nguyễn Đình Hãnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4548, N'108052', N'Khương Thị Mến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4549, N'108063', N'Phạm Thị May', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4550, N'108108', N'Phạm Thị Nhất', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4551, N'108136', N'Vũ Văn Biển', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4552, N'108238', N'Nguyễn Thị Dung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4553, N'108244', N'Nguyễn Thị Hòa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4554, N'108262', N'Nguyễn Thị Thủy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4555, N'108304', N'Trần Thị Tho', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4556, N'108339', N'Vũ Thị Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4557, N'108342', N'Lê Thị Lệ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4558, N'108402', N'Nguyễn Khắc Tú', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4559, N'108406', N'Lê Văn Tiến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4560, N'108453', N'Nguyễn Thị Tuyết', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4561, N'108496', N'Nguyễn Thị Thương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4562, N'108522', N'Phạm Thị Hạnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4563, N'108650', N'Lê Huy Hùng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4564, N'108656', N'Trần Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4565, N'108657', N'Lăng Thị Đào', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4566, N'108661', N'Nguyễn Thị Vân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4567, N'108678', N'Nguyễn Thị Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4568, N'108691', N'Nguyễn Thị Hóa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4569, N'108726', N'Trần Trọng Khoa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4570, N'108787', N'Lê Văn Băng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4571, N'108796', N'Nguyễn Đức Chung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4572, N'108873', N'Vũ Ngọc Ánh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4573, N'108932', N'Thái Thị Thu Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4574, N'108946', N'Vũ Thị Nhung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4575, N'108983', N'Nguyễn Thị Ngần', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4576, N'109092', N'Nguyễn Thị Thanh Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4577, N'109107', N'Đỗ Thị Mai Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4578, N'109108', N'Đỗ Thị Ngọc Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4579, N'109141', N'Nguyễn Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4580, N'109162', N'Vũ Thị Hồng Hải', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4581, N'109179', N'Đặng Văn Thịnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4582, N'109191', N'Lê Thị Nhật Lệ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4583, N'109221', N'Nguyễn Thị Tuyến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4584, N'109224', N'Nguyễn Thị Quỳnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4585, N'109234', N'Nguyễn Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4586, N'109268', N'Nguyễn Văn Quý', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4587, N'109381', N'Mạnh', N'Vũ Văn', N'N/A', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4588, N'109395', N'Phạm Thị Minh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4589, N'109425', N'Ngô Văn Thanh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4590, N'109432', N'Lê Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4591, N'109435', N'Lô Thị Mùi', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4592, N'109452', N'Phạm Thị Thơm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4593, N'109490', N'Dương Văn Việt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4594, N'109511', N'Mai Thị Đàm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4595, N'109513', N'Nguyễn Thị Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4596, N'109548', N'Vũ Văn Minh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4597, N'109584', N'Hà Thị Danh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4598, N'109617', N'Nguyễn Thị Liễu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4599, N'109627', N'Nguyễn Đức Dưỡng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4600, N'109633', N'Phạm Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4601, N'109637', N'Phạm Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4602, N'109667', N'Hoàng Thị Thơm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4603, N'109727', N'Vũ Xuân Dũng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4604, N'109734', N'Nguyễn Thị Xim', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4605, N'109735', N'Vũ Thị Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4606, N'109854', N'Đinh Văn Tài', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4607, N'109855', N'Nguyễn Bá Định', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4608, N'109858', N'Đỗ Thị Thục Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4609, N'109860', N'Vũ Thị Kim Phượng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4610, N'109867', N'Nguyễn Văn Tân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4611, N'109870', N'Vũ Văn Hậu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4612, N'109871', N'Phạm Văn Tùng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4613, N'109873', N'Hà Thị Xuân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4614, N'109906', N'Trần Thị Hòa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4615, N'110063', N'Nguyễn Minh Chiến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4616, N'110095', N'Phạm Tuấn Hưởng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4617, N'110157', N'Nguyễn Thị Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4618, N'110176', N'Nguyễn Thanh Bình', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4619, N'110185', N'Nguyễn Văn Lăng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4620, N'110218', N'Đặng Thị Hạnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4621, N'110229', N'Nguyễn Thị Oanh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4622, N'110240', N'Thi', N'Trần Quang', N'N/A', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4623, N'110293', N'Nông Quang Linh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4624, N'110295', N'Bùi Văn Tấn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4625, N'110426', N'Đặng Thị Tâm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4626, N'110433', N'Nguyễn Thị Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4627, N'110437', N'Nguyễn Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4628, N'110439', N'Trịnh Thu Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4629, N'110477', N'Nguyễn Thị Như Nguyệt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4630, N'110483', N'Phạm Thị Giáp', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4631, N'110504', N'Nguyễn Vũ Bình', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4632, N'110520', N'Vũ Thị Kim Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4633, N'110531', N'Nguyễn Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4634, N'110543', N'Nguyễn Thị Phượng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4635, N'110546', N'Vũ Thị Thủy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4636, N'110554', N'Nguyễn Thị Nga', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4637, N'110586', N'Vũ Thị Phượng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4638, N'110665', N'Nguyễn Quốc Nhận', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4639, N'110676', N'Vũ Thị Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4640, N'110679', N'Vũ Thị Thoan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4641, N'110714', N'Nguyễn Văn Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4642, N'110726', N'Vũ Văn Hướng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4643, N'110729', N'Nguyễn Thị Thúy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4644, N'110734', N'Trần Văn Nam', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4645, N'110737', N'Nguyễn Khắc Sử', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4646, N'110754', N'Lê Duyên Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4647, N'110780', N'Lương Khắc Hợp', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4648, N'110806', N'Phạm Thị Loan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4649, N'110855', N'Mai Thị Ngọc Lan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4650, N'110978', N'Nguyễn Văn Thìn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4651, N'110984', N'Nguyễn Văn Nam', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4652, N'110996', N'Trần Thị Dinh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4653, N'111034', N'Nguyễn Thị Nga', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4654, N'111055', N'Ngô Thị Hồng Nhung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4655, N'111069', N'Nguyễn Văn Lượng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4656, N'111070', N'Nguyễn Thị Hoa', NULL, NULL, NULL, N'C4AEDBFA2D97A32A582B186D7CB17572F21C7CAE', NULL, NULL, NULL, NULL, NULL, 0, N'green')
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4657, N'111090', N'Phạm Bá Duy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4658, N'111092', N'Lê Thị Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4659, N'111124', N'Nguyễn Bình Minh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4660, N'111127', N'Phạm Thanh Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4661, N'111212', N'Lương Thị Nhất', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4662, N'111243', N'Cao Thị Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4663, N'111269', N'Lý Hữu Cánh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4664, N'111286', N'Trần Văn Thượng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4665, N'111356', N'Ma Văn Ngát', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4666, N'111381', N'Phạm Thị An', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4667, N'111399', N'Đỗ Thị Lan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4668, N'111400', N'Nguyễn Văn Tiến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4669, N'111409', N'Nguyễn Đình Ngọc', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4670, N'111455', N'Phạm Huy Khánh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4671, N'111470', N'Phạm Thị Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4672, N'111518', N'Nguyễn Thị Thu Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4673, N'111519', N'Nguyễn Thị Quyến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4674, N'111554', N'Phạm Việt Hòa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4675, N'111609', N'Lê Thị Mỹ Linh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4676, N'111613', N'Phạm Thị Huyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4677, N'111688', N'Đào Xuân Nguyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4678, N'111690', N'Phạm Thị Nga', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4679, N'111733', N'Nguyễn Xuân Mạnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4680, N'111740', N'Phạm Công Luân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4681, N'111982', N'Nguyễn Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4682, N'112014', N'Trần Duy Dương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4683, N'112032', N'Lê Thị Nguyệt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4684, N'112043', N'Nguyễn Quang Tân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4685, N'112079', N'Quan Văn Báo', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4686, N'112088', N'Đào Thị Hồng Vân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4687, N'112098', N'Phạm Thị Như Quỳnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4688, N'112119', N'Nguyễn Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4689, N'112132', N'Nguyễn Ngọc Thuân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4690, N'112169', N'Ngô Thị Thuy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4691, N'112216', N'Vũ Thị Dựng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4692, N'112227', N'Hoàng Thị Tự', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4693, N'112230', N'Hoàng Văn Đạt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4694, N'112234', N'Nguyễn Kim Hoàng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4695, N'112238', N'Nguyễn Thị Đào', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4696, N'112245', N'Nguyễn Thị Thương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4697, N'112253', N'Ngô Thị Hồng Hạnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4698, N'112254', N'Nguyễn Thị Lan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4699, N'112258', N'Nguyễn Văn Chiều', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4700, N'112282', N'Nguyễn Phương Mai', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4701, N'112285', N'Trương Kim Yêu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4702, N'112296', N'Nguyễn Thừa Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4703, N'112304', N'Phạm Đình Minh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4704, N'112311', N'Tân Văn Tài', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4705, N'112319', N'Đoàn Mạnh Tâm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4706, N'112323', N'Nguyễn Ngọc Khanh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4707, N'112338', N'Nguyễn Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4708, N'112342', N'Trần Thị Tuyết', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4709, N'112344', N'Hoàng Thị Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4710, N'112345', N'Hoàng Đình Tuân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4711, N'112360', N'Pờ A Thuyết', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4712, N'112385', N'Nguyễn Thị Hạ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4713, N'112386', N'Nguyễn Sỹ Hải', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4714, N'112403', N'Doãn Hoàng Ngọc', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4715, N'112420', N'Phạm Văn Nhất', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4716, N'112422', N'Nguyễn Vũ Luận', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4717, N'112431', N'Hoàng Văn Ngãi', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4718, N'112450', N'Tân Văn Hình', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4719, N'112476', N'Nguyễn Thị Hải Ninh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4720, N'112479', N'Hoàng Thị Bao', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4721, N'112484', N'Vũ Trọng Quý', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4722, N'112488', N'Nguyễn Trí Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4723, N'112505', N'Vi Kim Hội', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4724, N'112507', N'Nguyễn Văn Tiến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4725, N'112520', N'Nguyễn Thị Ánh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4726, N'112523', N'Lê Thanh Tùng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4727, N'112551', N'Phạm Thị Duyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4728, N'112552', N'Vàng Văn Nhương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4729, N'112572', N'Trần Thị Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4730, N'112573', N'Bùi Thị Châm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4731, N'112576', N'Phạm Thị Hải', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4732, N'112577', N'Cao Thị Liên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4733, N'112600', N'Nguyễn Văn Đức', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4734, N'112624', N'Nguyễn Thị Son', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4735, N'112642', N'Hoàng Thị Tấm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4736, N'112654', N'Lê Thị Dương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4737, N'112657', N'Lưu Xuân Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4738, N'112665', N'Hà Thị Hương Thùy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4739, N'112682', N'Đoàn Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4740, N'112689', N'Khuyến', N'Lương Văn', N'N/A', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4741, N'112690', N'Đào Huy Phong', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4742, N'112691', N'Phạm Thị Huệ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4743, N'112692', N'Nguyễn Thị Lân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4744, N'112694', N'Quân', N'Nguyễn Công', N'N/A', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4745, N'112715', N'Lê Văn Bình', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4746, N'112718', N'Đặng Thái Dương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4747, N'112721', N'Đặng Thị Nguyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4748, N'112746', N'Đinh Thị Huyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4749, N'112750', N'Lê Thị Huê', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4750, N'112758', N'Lô Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4751, N'112772', N'Nông Xuân Thắng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4752, N'112776', N'Nông Đình Chánh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4753, N'112778', N'Vũ Đình Duẩn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4754, N'112781', N'Nguyễn Xuân Hải', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4755, N'112783', N'Nguyễn Thị Pha', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4756, N'112789', N'Nguyễn Hữu Dự', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4757, N'112795', N'Chu Văn Hải', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4758, N'112797', N'Nguyễn Thị Loan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4759, N'112803', N'Lê Xuân Đức', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4760, N'112807', N'Lê Văn Thanh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4761, N'112808', N'Hoàng Văn Cường', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4762, N'112820', N'Trần Thị Hồng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4763, N'112826', N'Dương Thị Diễm Quỳnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4764, N'112827', N'Lưu Thị Trà My', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4765, N'112831', N'Cao Thị Thì', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4766, N'112843', N'Lê Thị Thanh Nhàn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4767, N'112846', N'Phạm Tiến Hải', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4768, N'112847', N'Hà Văn Thiện', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4769, N'112848', N'Phan Công Ất', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4770, N'112852', N'Nguyễn Thị Lan Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4771, N'112863', N'Ma Văn Nghĩa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4772, N'112864', N'Phạm Thị Nghĩa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4773, N'112867', N'Vũ Thị Lan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4774, N'112868', N'Hoàng Thị Thêu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4775, N'112871', N'Vũ Thị Nhu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4776, N'112876', N'Nguyễn Văn Tu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4777, N'112877', N'Nguyễn Công Hải', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4778, N'112880', N'Phạm Thị Thúy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4779, N'112881', N'Nguyễn Thị Dung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4780, N'112886', N'Dũng', N'Nguyễn Văn', N'N/A', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4781, N'112891', N'Nguyễn Thị Việt Trinh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4782, N'112892', N'Quân', N'Lê Văn', N'quanle-112892@meiko-t.com.vn', NULL, N'9A0A9073FC5683D385C7079E3D717ADDD98B4DAC', N'Cẩm Giàng', CAST(338553433 AS Decimal(10, 0)), N'I''m Q', NULL, NULL, 0, N'green')
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4783, N'112895', N'Nguyễn Thị La', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4784, N'112904', N'Lò Văn Hoàng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4785, N'112906', N'Phạm Thị Hậu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4786, N'112909', N'Nguyễn Danh Quang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4787, N'112910', N'Hoàng Văn Lợi', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4788, N'112914', N'Đỗ Thị Hoa Quỳnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4789, N'112920', N'Ngô Thị Thanh Nga', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4790, N'112929', N'Lê Thị Hoa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4791, N'112937', N'Nguyễn Văn Tân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4792, N'112939', N'Nguyên Văn Sơn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4793, N'112946', N'Chu Thị Thu Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4794, N'112963', N'Nguyễn Thị Mỹ Linh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4795, N'112966', N'Nguyễn Minh Đức', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4796, N'112967', N'Đán Văn Đạt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4797, N'112970', N'Phạm Thị Ngân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4798, N'112971', N'Thền Thu Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4799, N'112973', N'Trần Thị Kim Tiến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4800, N'112976', N'Nguyễn Thị Linh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4801, N'112977', N'Nguyễn Thị Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4802, N'112980', N'Nguyễn Thị Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4803, N'112981', N'Nông Hoàng Thị Hiền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4804, N'112997', N'Vũ Thúy Nga', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4805, N'113001', N'Lê Kiều Linh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4806, N'113007', N'Bùi Thị Hạnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4807, N'113008', N'Nguyễn Thị Kiều Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4808, N'113009', N'Bùi Thị Ngần', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4809, N'113010', N'Chu Thị Kiều Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4810, N'113013', N'Hoàng Thị Nhung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4811, N'113014', N'Vừ Kim Bông', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4812, N'113015', N'Nguyễn Kỳ Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4813, N'113016', N'Nguyễn Thị Hải Chi', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4814, N'113018', N'Nguyễn Thị Kim Thu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4815, N'113019', N'Bùi Thị Cúc', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4816, N'113020', N'Phạm Hồng Thanh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4817, N'113021', N'Hoàng Thị Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4818, N'113022', N'Hiếu', N'Nguyễn Văn', N'N/A', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4819, N'113023', N'Nguyễn Bá Sang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4820, N'113024', N'Nghiêm Thị Kim Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4821, N'113025', N'Lô Thị Xoan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4822, N'113026', N'Nguyễn Thị Hà', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4823, N'113027', N'Hơ Thị Tông', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4824, N'113028', N'Hơ Thị Đua', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4825, N'113029', N'Hơ Thị Dia', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4826, N'113030', N'Đoàn Thị Hồng Nhung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4827, N'113035', N'Nguyễn Văn Linh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4828, N'113036', N'Nguyễn Viết Hùng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4829, N'113040', N'Nông Hoàng Điền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4830, N'113041', N'Dương Phú Hoàng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4831, N'113042', N'Nguyễn Trường Việt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4832, N'113044', N'Thào Thị Páo', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4833, N'113045', N'Giàng Mí Vư', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4834, N'113046', N'Lê Huy Khang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4835, N'113047', N'Phạm Minh Hằng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4836, N'113048', N'Vương Thị Quỳnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4837, N'113049', N'Nguyễn Thị Xuyên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4838, N'113050', N'Nông Kim Phượng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4839, N'113051', N'Giàng Mí Say', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4840, N'113053', N'Lê Đức Việt Hoàng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4841, N'113054', N'Phạm Trọng Tài', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4842, N'113055', N'Thao Công Xua', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4843, N'113056', N'Ninh Văn May', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4844, N'113057', N'Hoàng Thị Đạt', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4845, N'113058', N'Hoàng Thị Thầm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4846, N'113059', N'Lê Thị Hương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4847, N'113061', N'Phạm Trường Sơn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4848, N'113062', N'Phạm Văn Phương', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4849, N'113063', N'Nguyễn Quang Khuê', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4850, N'113064', N'Mai Trọng Hậu', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4851, N'113065', N'Nguyễn Hữu Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4852, N'113066', N'Tráng Seo Bồng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4853, N'113067', N'Lê Việt Anh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4854, N'113069', N'Phạm Đức Hạnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4855, N'113070', N'Nguyễn Thị Trang', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4856, N'113071', N'Dương Thị Phương Lan', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4857, N'113073', N'Hoàng Thị Thuận', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4858, N'113074', N'Lê Thị Trường', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4859, N'113075', N'Ngô Thị Châm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4860, N'113076', N'Hoàng Thị Xuyến', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4861, N'113077', N'Đỗ Ngọc Ánh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4862, N'113078', N'Bàn Thi Kim', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4863, N'113079', N'Phàn Thị Yên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4864, N'113080', N'Lưu Quang Vũ', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4865, N'113081', N'Quàng Văn Hướng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4866, N'113082', N'Lương Văn Hoàng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4867, N'113083', N'Hân', N'Nguyễn Công', N'N/A', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4868, N'113084', N'Nguyễn Văn Kiên', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4869, N'113085', N'Lê Quốc Thắng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4870, N'113086', N'Giàng A Do', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4871, N'113087', N'Ngô Thanh Liêm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4872, N'113088', N'Tho Minh Tuấn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4873, N'113089', N'Dương Văn Tuân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4874, N'113090', N'Lương Quang Thiêm', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4875, N'113091', N'Nguyễn Viết Lộc', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4876, N'113092', N'Nguyễn Thế Đoàn', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4877, N'113093', N'Nguyễn Ngọc Hải', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4878, N'113094', N'Võ Hồ Thanh Long', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4879, N'113095', N'Vũ Ngọc Hợp', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4880, N'113096', N'Bạc Cầm Quyền', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4881, N'113097', N'Chu Thị Linh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4882, N'113098', N'Vũ Thị Xuân', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4883, N'113099', N'Bùi Thị Thùy', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4884, N'113100', N'Lê Thị Nhung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4885, N'113101', N'Nguyễn Thị Xa', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4886, N'113102', N'Lương Thị Dung', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4887, N'113103', N'Đỗ Nga My', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4888, N'113104', N'Nguyễn Văn Quyết', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4889, N'113105', N'Lê Văn Quyết', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4890, N'113106', N'Trịnh Đình Đô', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4891, N'113107', N'Nguyễn Viết Cường', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
GO
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4892, N'113108', N'Nguyễn Thị  Thái', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4893, N'113109', N'Phạm Diễm Quỳnh', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4894, N'113110', N'Lê Thị Phượng', NULL, NULL, NULL, N'mtv', NULL, NULL, NULL, NULL, NULL, 1, NULL)
INSERT [dbo].[Users] ([Id], [ECode], [FirstName], [GivenName], [Email], [Description], [Password], [Address], [Phone], [About], [Facebook], [Avatar], [SettingDarkMode], [SidebarColor]) VALUES (4895, N'113111', N'Điệp', N'Trương Văn', N'N/A', NULL, N'5D1615A6F3744783774728CC006B53302FA10200', NULL, NULL, NULL, NULL, NULL, 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[UserWithRoles] ON 

INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (1, N'100013', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (2, N'100014', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (3, N'100022', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (4, N'100023', 4, 18)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (5, N'100035', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (6, N'100049', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (7, N'100056', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (8, N'100057', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (9, N'100062', 9, 23)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (10, N'100065', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (11, N'100070', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (12, N'100086', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (13, N'100089', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (14, N'100118', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (15, N'100126', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (16, N'100127', 9, 23)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (17, N'100128', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (18, N'100144', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (19, N'100147', 9, 23)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (20, N'100156', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (21, N'100157', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (22, N'100159', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (23, N'100163', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (24, N'100164', 9, 23)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (25, N'100182', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (26, N'100183', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (27, N'100189', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (28, N'100196', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (29, N'100210', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (30, N'100216', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (31, N'100227', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (32, N'100239', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (33, N'100252', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (34, N'100253', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (35, N'100254', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (36, N'100258', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (37, N'100260', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (38, N'100263', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (39, N'100291', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (40, N'100319', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (41, N'100330', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (42, N'100334', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (43, N'100337', 9, 23)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (44, N'100351', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (45, N'100385', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (46, N'100438', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (47, N'100440', 3, 17)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (48, N'100516', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (49, N'100518', 9, 23)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (50, N'100531', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (51, N'100556', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (52, N'100560', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (53, N'100577', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (54, N'100582', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (55, N'100607', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (56, N'100619', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (57, N'100626', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (58, N'100633', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (59, N'100660', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (60, N'100664', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (61, N'100698', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (62, N'100705', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (63, N'100722', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (64, N'100754', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (65, N'100778', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (66, N'100782', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (67, N'100788', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (68, N'100821', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (69, N'100824', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (70, N'100883', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (71, N'100892', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (72, N'100913', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (73, N'100915', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (74, N'100920', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (75, N'101067', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (76, N'101079', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (77, N'101080', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (78, N'101180', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (79, N'101191', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (80, N'101401', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (81, N'101424', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (82, N'101511', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (83, N'101594', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (84, N'101733', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (85, N'101942', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (86, N'102033', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (87, N'102037', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (88, N'102054', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (89, N'102081', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (90, N'102121', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (91, N'102142', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (92, N'102171', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (93, N'102210', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (94, N'102222', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (95, N'102263', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (96, N'102286', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (97, N'102287', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (98, N'102288', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (99, N'102294', 8, 22)
GO
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (100, N'102358', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (101, N'102362', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (102, N'102363', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (103, N'102397', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (104, N'102423', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (105, N'102565', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (106, N'102597', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (107, N'102637', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (108, N'102675', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (109, N'102679', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (110, N'102691', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (111, N'102751', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (112, N'102759', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (113, N'102779', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (114, N'102794', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (115, N'102857', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (116, N'102860', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (117, N'102866', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (118, N'102886', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (119, N'102897', 3, 17)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (120, N'102906', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (121, N'102923', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (122, N'102953', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (123, N'102978', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (124, N'102987', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (125, N'103039', 9, 23)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (126, N'103051', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (127, N'103278', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (128, N'103296', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (129, N'103304', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (130, N'103311', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (131, N'103322', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (132, N'103360', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (133, N'103370', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (134, N'103388', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (135, N'103416', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (136, N'103519', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (137, N'103561', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (138, N'103577', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (139, N'103613', 9, 23)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (140, N'103647', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (141, N'103651', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (142, N'103660', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (143, N'103662', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (144, N'103733', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (145, N'103737', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (146, N'103742', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (147, N'103760', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (148, N'103792', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (149, N'103795', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (150, N'103814', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (151, N'103884', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (152, N'103918', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (153, N'103919', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (154, N'103934', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (155, N'103982', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (156, N'104015', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (157, N'104016', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (158, N'104040', 4, 18)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (159, N'104048', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (160, N'104068', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (161, N'104074', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (162, N'104117', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (163, N'104160', 7, 32)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (164, N'104255', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (165, N'104320', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (166, N'104360', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (167, N'104375', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (168, N'104403', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (169, N'104427', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (170, N'104440', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (171, N'104447', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (172, N'104504', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (173, N'104505', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (174, N'104552', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (175, N'104616', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (176, N'104640', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (177, N'104667', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (178, N'104673', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (179, N'104773', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (180, N'104774', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (181, N'104837', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (182, N'104907', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (183, N'104983', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (184, N'104989', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (185, N'105007', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (186, N'105027', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (187, N'105047', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (188, N'105060', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (189, N'105065', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (190, N'105081', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (191, N'105116', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (192, N'105146', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (193, N'105151', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (194, N'105274', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (195, N'105356', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (196, N'105373', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (197, N'105397', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (198, N'105401', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (199, N'105414', 10, 24)
GO
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (200, N'105451', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (201, N'105462', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (202, N'105467', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (203, N'105487', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (204, N'105524', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (205, N'105535', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (206, N'105538', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (207, N'105584', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (208, N'105616', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (209, N'105634', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (210, N'105653', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (211, N'105669', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (212, N'105695', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (213, N'105750', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (214, N'105751', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (215, N'105775', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (216, N'105797', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (217, N'105878', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (218, N'105902', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (219, N'105921', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (220, N'105928', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (221, N'105930', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (222, N'105939', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (223, N'105947', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (224, N'105948', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (225, N'105949', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (226, N'105988', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (227, N'105991', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (228, N'105999', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (229, N'106013', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (230, N'106024', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (231, N'106048', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (232, N'106049', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (233, N'106064', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (234, N'106089', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (235, N'106140', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (236, N'106154', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (237, N'106210', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (238, N'106217', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (239, N'106229', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (240, N'106339', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (241, N'106405', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (242, N'106434', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (243, N'106468', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (244, N'106503', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (245, N'106512', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (246, N'106518', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (247, N'106542', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (248, N'106605', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (249, N'106637', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (250, N'106648', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (251, N'106667', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (252, N'106671', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (253, N'106672', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (254, N'106683', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (255, N'106701', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (256, N'106704', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (257, N'106706', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (258, N'106710', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (259, N'106714', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (260, N'106716', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (261, N'106728', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (262, N'106748', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (263, N'106757', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (264, N'106760', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (265, N'106761', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (266, N'106770', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (267, N'106787', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (268, N'106788', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (269, N'106812', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (270, N'106819', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (271, N'106845', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (272, N'106852', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (273, N'106861', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (274, N'106863', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (275, N'106868', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (276, N'106901', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (277, N'106911', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (278, N'106921', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (279, N'106924', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (280, N'106944', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (281, N'106966', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (282, N'106972', 9, 23)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (283, N'106979', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (284, N'106980', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (285, N'106987', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (286, N'107025', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (287, N'107032', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (288, N'107044', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (289, N'107053', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (290, N'107064', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (291, N'107070', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (292, N'107077', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (293, N'107080', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (294, N'107100', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (295, N'107128', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (296, N'107140', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (297, N'107145', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (298, N'107150', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (299, N'107152', 7, 21)
GO
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (300, N'107164', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (301, N'107228', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (302, N'107229', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (303, N'107249', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (304, N'107252', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (305, N'107303', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (306, N'107320', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (307, N'107347', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (308, N'107354', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (309, N'107375', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (310, N'107389', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (311, N'107423', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (312, N'107426', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (313, N'107428', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (314, N'107430', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (315, N'107431', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (316, N'107434', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (317, N'107467', 4, 18)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (318, N'107474', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (319, N'107487', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (320, N'107496', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (321, N'107499', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (322, N'107514', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (323, N'107529', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (324, N'107533', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (325, N'107541', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (326, N'107546', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (327, N'107552', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (328, N'107554', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (329, N'107563', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (330, N'107578', 7, 32)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (331, N'107601', 9, 23)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (332, N'107603', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (333, N'107612', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (334, N'107619', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (335, N'107669', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (336, N'107689', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (337, N'107714', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (338, N'107715', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (339, N'107771', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (340, N'107784', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (341, N'107807', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (342, N'107812', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (343, N'107839', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (344, N'107845', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (345, N'107848', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (346, N'107849', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (347, N'107869', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (348, N'107887', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (349, N'107892', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (350, N'107908', 9, 23)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (351, N'107953', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (352, N'107960', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (353, N'107979', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (354, N'107980', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (355, N'108046', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (356, N'108052', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (357, N'108063', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (358, N'108108', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (359, N'108136', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (360, N'108238', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (361, N'108244', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (362, N'108262', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (363, N'108304', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (364, N'108339', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (365, N'108342', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (366, N'108402', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (367, N'108406', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (368, N'108453', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (369, N'108496', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (370, N'108522', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (371, N'108650', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (372, N'108656', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (373, N'108657', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (374, N'108661', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (375, N'108678', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (376, N'108691', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (377, N'108726', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (378, N'108787', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (379, N'108796', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (380, N'108873', 13, 27)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (381, N'108932', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (382, N'108946', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (383, N'108983', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (384, N'109092', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (385, N'109107', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (386, N'109108', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (387, N'109141', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (388, N'109162', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (389, N'109179', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (390, N'109191', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (391, N'109221', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (392, N'109224', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (393, N'109234', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (394, N'109268', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (395, N'109381', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (396, N'109395', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (397, N'109425', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (398, N'109432', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (399, N'109435', 8, 22)
GO
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (400, N'109452', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (401, N'109490', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (402, N'109511', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (403, N'109513', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (404, N'109548', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (405, N'109584', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (406, N'109617', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (407, N'109627', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (408, N'109633', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (409, N'109637', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (410, N'109667', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (411, N'109727', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (412, N'109734', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (413, N'109735', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (414, N'109854', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (415, N'109855', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (416, N'109858', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (417, N'109860', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (418, N'109867', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (419, N'109870', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (420, N'109871', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (421, N'109873', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (422, N'109906', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (423, N'110063', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (424, N'110095', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (425, N'110157', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (426, N'110176', 13, 27)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (427, N'110185', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (428, N'110218', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (429, N'110229', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (430, N'110240', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (431, N'110293', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (432, N'110295', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (433, N'110426', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (434, N'110433', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (435, N'110437', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (436, N'110439', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (437, N'110477', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (438, N'110483', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (439, N'110504', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (440, N'110520', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (441, N'110531', 4, 18)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (442, N'110543', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (443, N'110546', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (444, N'110554', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (445, N'110586', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (446, N'110665', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (447, N'110676', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (448, N'110679', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (449, N'110714', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (450, N'110726', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (451, N'110729', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (452, N'110734', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (453, N'110737', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (454, N'110754', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (455, N'110780', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (456, N'110806', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (457, N'110855', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (458, N'110978', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (459, N'110984', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (460, N'110996', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (461, N'111034', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (462, N'111055', 3, 17)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (463, N'111069', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (464, N'111070', 13, 27)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (465, N'111090', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (466, N'111092', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (467, N'111124', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (468, N'111127', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (469, N'111212', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (470, N'111243', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (471, N'111269', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (472, N'111286', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (473, N'111356', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (474, N'111381', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (475, N'111399', 3, 17)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (476, N'111400', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (477, N'111409', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (478, N'111455', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (479, N'111470', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (480, N'111518', 3, 17)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (481, N'111519', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (482, N'111554', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (483, N'111609', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (484, N'111613', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (485, N'111688', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (486, N'111690', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (487, N'111733', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (488, N'111740', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (489, N'111982', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (490, N'112014', 11, 25)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (491, N'112032', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (492, N'112043', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (493, N'112079', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (494, N'112088', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (495, N'112098', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (496, N'112119', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (497, N'112132', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (498, N'112169', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (499, N'112216', 8, 22)
GO
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (500, N'112227', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (501, N'112230', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (502, N'112234', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (503, N'112238', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (504, N'112245', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (505, N'112253', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (506, N'112254', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (507, N'112258', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (508, N'112282', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (509, N'112285', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (510, N'112296', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (511, N'112304', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (512, N'112311', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (513, N'112319', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (514, N'112323', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (515, N'112338', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (516, N'112342', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (517, N'112344', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (518, N'112345', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (519, N'112360', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (520, N'112385', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (521, N'112386', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (522, N'112403', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (523, N'112420', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (524, N'112422', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (525, N'112431', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (526, N'112450', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (527, N'112476', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (528, N'112479', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (529, N'112484', 6, 20)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (530, N'112488', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (531, N'112505', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (532, N'112507', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (533, N'112520', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (534, N'112523', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (535, N'112551', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (536, N'112552', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (537, N'112572', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (538, N'112573', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (539, N'112576', 13, 27)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (540, N'112577', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (541, N'112600', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (542, N'112624', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (543, N'112642', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (544, N'112654', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (545, N'112657', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (546, N'112665', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (547, N'112682', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (548, N'112689', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (549, N'112690', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (550, N'112691', 12, 26)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (551, N'112692', 4, 18)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (552, N'112694', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (553, N'112715', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (554, N'112718', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (555, N'112721', 10, 24)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (556, N'112746', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (557, N'112750', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (558, N'112758', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (559, N'112772', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (560, N'112776', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (561, N'112778', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (562, N'112781', 5, 19)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (563, N'112783', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (564, N'112789', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (565, N'112795', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (566, N'112797', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (567, N'112803', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (568, N'112807', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (569, N'112808', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (570, N'112820', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (571, N'112826', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (572, N'112827', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (573, N'112831', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (574, N'112843', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (575, N'112846', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (576, N'112847', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (577, N'112848', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (578, N'112852', 13, 27)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (579, N'112863', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (580, N'112864', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (581, N'112867', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (582, N'112868', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (583, N'112871', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (584, N'112876', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (585, N'112877', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (586, N'112880', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (587, N'112881', 1, 15)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (588, N'112886', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (589, N'112891', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (590, N'112892', 13, 29)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (591, N'112895', 3, 17)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (592, N'112904', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (593, N'112906', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (594, N'112909', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (595, N'112910', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (596, N'112914', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (597, N'112920', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (598, N'112929', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (599, N'112937', 6, 20)
GO
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (600, N'112939', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (601, N'112946', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (602, N'112963', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (603, N'112966', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (604, N'112967', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (605, N'112970', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (606, N'112971', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (607, N'112973', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (608, N'112976', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (609, N'112977', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (610, N'112980', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (611, N'112981', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (612, N'112997', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (613, N'113001', 2, 16)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (614, N'113007', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (615, N'113008', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (616, N'113009', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (617, N'113010', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (618, N'113013', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (619, N'113014', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (620, N'113015', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (621, N'113016', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (622, N'113018', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (623, N'113019', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (624, N'113020', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (625, N'113021', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (626, N'113022', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (627, N'113023', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (628, N'113024', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (629, N'113025', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (630, N'113026', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (631, N'113027', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (632, N'113028', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (633, N'113029', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (634, N'113030', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (635, N'113035', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (636, N'113036', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (637, N'113040', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (638, N'113041', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (639, N'113042', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (640, N'113044', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (641, N'113045', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (642, N'113046', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (643, N'113047', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (644, N'113048', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (645, N'113049', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (646, N'113050', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (647, N'113051', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (648, N'113053', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (649, N'113054', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (650, N'113055', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (651, N'113056', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (652, N'113057', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (653, N'113058', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (654, N'113059', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (655, N'113061', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (656, N'113062', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (657, N'113063', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (658, N'113064', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (659, N'113065', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (660, N'113066', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (661, N'113067', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (662, N'113069', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (663, N'113070', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (664, N'113071', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (665, N'113073', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (666, N'113074', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (667, N'113075', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (668, N'113076', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (669, N'113077', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (670, N'113078', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (671, N'113079', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (672, N'113080', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (673, N'113081', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (674, N'113082', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (675, N'113083', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (676, N'113084', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (677, N'113085', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (678, N'113086', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (679, N'113087', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (680, N'113088', 7, 21)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (681, N'113089', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (682, N'113090', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (683, N'113091', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (684, N'113092', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (685, N'113093', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (686, N'113094', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (687, N'113095', 8, 22)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (688, N'113096', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (689, N'113097', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (690, N'113098', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (691, N'113099', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (692, N'113100', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (693, N'113101', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (694, N'113102', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (695, N'113103', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (696, N'113104', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (697, N'113105', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (698, N'113106', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (699, N'113107', 14, 28)
GO
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (700, N'113108', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (701, N'113109', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (702, N'113110', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (703, N'113111', 14, 28)
INSERT [dbo].[UserWithRoles] ([id], [eCode], [deptId], [roleId]) VALUES (704, N'112892', 13, 31)
SET IDENTITY_INSERT [dbo].[UserWithRoles] OFF
GO
/****** Object:  Index [Unique_Departments]    Script Date: 10/7/2020 9:03:46 AM ******/
ALTER TABLE [dbo].[Departments] ADD  CONSTRAINT [Unique_Departments] UNIQUE NONCLUSTERED 
(
	[ModuleNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UniqueEcode_Users]    Script Date: 10/7/2020 9:03:46 AM ******/
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [UniqueEcode_Users] UNIQUE NONCLUSTERED 
(
	[ECode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [adm].[Rewards] ADD  CONSTRAINT [DF_Rewards_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [adm].[Rounds] ADD  CONSTRAINT [DF_Round_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [adm].[Rounds] ADD  CONSTRAINT [DF_Round_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Files] ADD  CONSTRAINT [DF_Files_createDate]  DEFAULT (getdate()) FOR [createDate]
GO
ALTER TABLE [dbo].[Mobile_Applications] ADD  CONSTRAINT [DF_Mobile_Applications_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Mobile_Applications] ADD  CONSTRAINT [DF_Mobile_Applications_UpdateDate]  DEFAULT (getdate()) FOR [UpdateDate]
GO
ALTER TABLE [dbo].[Projects] ADD  CONSTRAINT [DF_Projects_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
ALTER TABLE [dbo].[Users] ADD  CONSTRAINT [DF_Users_SettingDarkMode]  DEFAULT ((1)) FOR [SettingDarkMode]
GO
ALTER TABLE [dbo].[Projects]  WITH CHECK ADD  CONSTRAINT [FK_Projects_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Projects] CHECK CONSTRAINT [FK_Projects_Departments]
GO
ALTER TABLE [dbo].[RoleInProjects]  WITH CHECK ADD  CONSTRAINT [FK_RoleInProjects_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[RoleInProjects] CHECK CONSTRAINT [FK_RoleInProjects_Projects]
GO
ALTER TABLE [dbo].[UserRoleInProjects]  WITH CHECK ADD  CONSTRAINT [FK_UserRoleInProjects_Projects] FOREIGN KEY([ProjectId])
REFERENCES [dbo].[Projects] ([Id])
GO
ALTER TABLE [dbo].[UserRoleInProjects] CHECK CONSTRAINT [FK_UserRoleInProjects_Projects]
GO
ALTER TABLE [dbo].[UserRoleInProjects]  WITH NOCHECK ADD  CONSTRAINT [FK_UserRoleInProjects_Users] FOREIGN KEY([Ecode])
REFERENCES [dbo].[Users] ([ECode])
GO
ALTER TABLE [dbo].[UserRoleInProjects] CHECK CONSTRAINT [FK_UserRoleInProjects_Users]
GO
ALTER TABLE [dbo].[UserWithRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserWithRoles_RolesInDepartment] FOREIGN KEY([roleId], [deptId])
REFERENCES [dbo].[RolesInDepartment] ([id], [deptId])
GO
ALTER TABLE [dbo].[UserWithRoles] CHECK CONSTRAINT [FK_UserWithRoles_RolesInDepartment]
GO
ALTER TABLE [dbo].[UserWithRoles]  WITH CHECK ADD  CONSTRAINT [FK_UserWithRoles_Users] FOREIGN KEY([eCode])
REFERENCES [dbo].[Users] ([ECode])
GO
ALTER TABLE [dbo].[UserWithRoles] CHECK CONSTRAINT [FK_UserWithRoles_Users]
GO
