USE [master]
GO
/****** Object:  Database [DeviceSystem]    Script Date: 7/11/2020 2:47:30 PM ******/
CREATE DATABASE [DeviceSystem] ON  PRIMARY 
( NAME = N'DeviceSystem', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DeviceSystem.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DeviceSystem_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\DeviceSystem_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DeviceSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DeviceSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DeviceSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DeviceSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DeviceSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DeviceSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [DeviceSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DeviceSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DeviceSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DeviceSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DeviceSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DeviceSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DeviceSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DeviceSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DeviceSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DeviceSystem] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DeviceSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DeviceSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DeviceSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DeviceSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DeviceSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DeviceSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DeviceSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DeviceSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DeviceSystem] SET  MULTI_USER 
GO
ALTER DATABASE [DeviceSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DeviceSystem] SET DB_CHAINING OFF 
GO
USE [DeviceSystem]
GO
/****** Object:  Table [dbo].[AreaDepts]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AreaDepts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](20) NULL,
 CONSTRAINT [PK_Dept] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AreaGroups]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AreaGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeptId] [int] NOT NULL,
	[Name] [varchar](20) NULL,
 CONSTRAINT [PK_Area] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AreaLines]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AreaLines](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AreaId] [int] NULL,
	[Name] [varchar](20) NULL,
	[Descript] [nvarchar](100) NULL,
 CONSTRAINT [PK_Line] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AreaRole]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AreaRole](
	[UserId] [int] NOT NULL,
	[DeptId] [int] NULL,
	[AreaId] [int] NULL,
	[Role] [varchar](10) NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_AreaRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CaliInfos]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CaliInfos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceCode] [varchar](10) NULL,
	[DateSend] [datetime] NULL,
	[DateCheck] [datetime] NULL,
	[Result] [varchar](20) NULL,
	[Note] [nvarchar](250) NULL,
	[UserSend] [nvarchar](100) NULL,
	[Suplier] [nvarchar](100) NULL,
 CONSTRAINT [PK_CaliInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CsheetConfirmContents]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CsheetConfirmContents](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NOT NULL,
	[DeviceTypeId] [int] NOT NULL,
	[Max] [float] NOT NULL,
	[Min] [float] NOT NULL,
	[ConfirmContent] [nvarchar](350) NULL,
 CONSTRAINT [PK_ConfirmContent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CsheetDailys]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CsheetDailys](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CodeJig] [varchar](10) NULL,
	[CheckUser] [nvarchar](100) NULL,
	[CheckDate] [datetime] NULL,
	[Shift] [varchar](10) NULL,
	[Model] [varchar](150) NULL,
	[StatusConfirm] [varchar](10) NULL,
	[Note] [nvarchar](150) NULL,
	[Line] [nvarchar](50) NULL,
	[ConfirmUser] [nvarchar](100) NULL,
	[ConfirmDate] [datetime] NULL,
	[ApproveUser] [nvarchar](100) NULL,
	[ApproveDate] [datetime] NULL,
	[DateCreate] [datetime] NULL,
	[UserCreate] [varchar](50) NULL,
	[DateComplete] [datetime] NULL,
 CONSTRAINT [PK_ChecksheetDaily] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CsheetDeviceDrops]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CsheetDeviceDrops](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[DeviceTypeId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_DeviceDrop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CsheetDropLists]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CsheetDropLists](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ItemId] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_DropList] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CsheetFormDetails]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CsheetFormDetails](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChecksheetFormId] [int] NULL,
	[ItemId] [int] NULL,
	[Stt] [int] NULL,
 CONSTRAINT [PK_ChecksheetFormDetail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CsheetForms]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CsheetForms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FormCode] [varchar](50) NULL,
	[CreateDate] [datetime] NULL,
	[CreateUser] [nvarchar](100) NULL,
	[ApproveDate] [datetime] NULL,
	[ApproveUser] [nvarchar](100) NULL,
	[Note] [nvarchar](100) NULL,
	[Ver] [int] NULL,
	[Status] [varchar](10) NULL,
	[DeviceTypeId] [int] NOT NULL,
 CONSTRAINT [PK_ChecksheetForm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CsheetGroups]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CsheetGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CatalogId] [int] NULL,
	[Name] [nvarchar](350) NULL,
	[Status] [varchar](10) NULL,
	[Stt] [int] NULL,
 CONSTRAINT [PK_CheckSheetGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CsheetItems]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CsheetItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupId] [int] NULL,
	[ItemName] [nvarchar](350) NULL,
	[TypeResult] [varchar](10) NULL,
	[UsingAll] [varchar](5) NULL,
	[Max] [float] NULL,
	[Min] [float] NULL,
	[ConfirmContent] [nvarchar](350) NULL,
	[Status] [varchar](10) NULL,
	[Method] [nvarchar](250) NULL,
	[Group_normal] [nvarchar](100) NULL,
	[Unit] [varchar](20) NULL,
 CONSTRAINT [PK_ChecksheetItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CsheetResults]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CsheetResults](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChecksheetDailyId] [int] NULL,
	[ItemId] [int] NULL,
	[Stt] [int] NULL,
	[Result] [varchar](50) NULL,
 CONSTRAINT [PK_ChecksheetResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeviceCatalogs]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeviceCatalogs](
	[Name] [nvarchar](150) NULL,
	[Code] [varchar](10) NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Catalog_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeviceInfos]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeviceInfos](
	[DeviceCode] [varchar](10) NOT NULL,
	[DeviceModelId] [int] NULL,
	[Name] [nvarchar](200) NULL,
	[LineId] [int] NULL,
	[Status] [varchar](10) NULL,
	[Maker] [nvarchar](100) NULL,
	[Model] [varchar](100) NULL,
	[Serial] [varchar](20) NULL,
	[FaCode] [varchar](20) NULL,
	[AccountCode] [varchar](20) NULL,
	[MaintainId] [int] NULL,
	[DateUse] [datetime] NULL,
	[Wattage] [int] NULL,
	[Voltage] [int] NULL,
	[Pneumatic] [int] NULL,
	[Image] [varchar](50) NULL,
	[ContentImage] [varbinary](max) NULL,
	[DocuId] [int] NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_DeviceInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeviceModels]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DeviceModels](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceTypeId] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[CaliDealine] [int] NULL,
	[MaintainDealine] [int] NULL,
	[Unit] [varchar](10) NULL,
 CONSTRAINT [PK_DeviceModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DeviceTypes]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DeviceTypes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Cali] [int] NULL,
	[CatalogId] [int] NULL,
	[Frequentcheck] [int] NULL,
 CONSTRAINT [PK_DeviceType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoEdits]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InfoEdits](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Ngid] [int] NULL,
	[ContentEdit] [nvarchar](350) NULL,
	[UserCheck] [nvarchar](100) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_InfoEdit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InfoNgs]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InfoNgs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceCode] [varchar](10) NULL,
	[ContentNG] [nvarchar](550) NULL,
	[Date] [datetime] NULL,
	[UserSend] [nvarchar](100) NULL,
	[Note] [nvarchar](350) NULL,
 CONSTRAINT [PK_InfoNg] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaintainForms]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaintainForms](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[MaintainItem] [nvarchar](150) NULL,
	[ResultType] [varchar](10) NULL,
	[Frequencycheck] [int] NULL,
 CONSTRAINT [PK_MaintainForm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaintainInfos]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MaintainInfos](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DeviceCode] [varchar](10) NULL,
	[Date] [datetime] NULL,
	[Checkcontent] [nvarchar](250) NULL,
	[Result] [varchar](10) NULL,
	[Note] [nvarchar](450) NULL,
	[UserCheck] [nvarchar](100) NULL,
	[TaskId] [int] NULL,
 CONSTRAINT [PK_MaintainInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MaintainParts]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaintainParts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PartName] [nvarchar](150) NULL,
	[PartId] [int] NULL,
	[MaintainId] [int] NULL,
 CONSTRAINT [PK_MaintainPart] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/11/2020 2:47:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](100) NULL,
	[Password] [varchar](50) NULL,
	[Role] [varchar](20) NULL,
	[DeptId] [int] NULL,
	[AreaId] [int] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[AreaDepts] ON 

INSERT [dbo].[AreaDepts] ([Id], [Name]) VALUES (1, N'ENG2')
INSERT [dbo].[AreaDepts] ([Id], [Name]) VALUES (2, N'ENG1')
INSERT [dbo].[AreaDepts] ([Id], [Name]) VALUES (6, N'Log')
SET IDENTITY_INSERT [dbo].[AreaDepts] OFF
SET IDENTITY_INSERT [dbo].[AreaGroups] ON 

INSERT [dbo].[AreaGroups] ([Id], [DeptId], [Name]) VALUES (2, 1, N'Tunner')
INSERT [dbo].[AreaGroups] ([Id], [DeptId], [Name]) VALUES (4, 1, N'test')
SET IDENTITY_INSERT [dbo].[AreaGroups] OFF
SET IDENTITY_INSERT [dbo].[AreaLines] ON 

INSERT [dbo].[AreaLines] ([Id], [AreaId], [Name], [Descript]) VALUES (1, 2, N'Line2', NULL)
SET IDENTITY_INSERT [dbo].[AreaLines] OFF
SET IDENTITY_INSERT [dbo].[CsheetConfirmContents] ON 

INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (1, 53, 3, 2, 1, N'xác nhận giá trị khí (1-2)')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (2, 53, 4, 2, 1, N'xác nhận giá trị khí (1-2)')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (3, 66, 3, 8, 7, N'xác nhận giá trị')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (4, 66, 4, 8, 7, N'xác nhận giá trị')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (5, 68, 3, 3, 2, N'dsfdsf')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (6, 68, 4, 3, 2, N'dsfdsf')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (7, 72, 3, 23, 1, N'xác nhận test')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (8, 72, 4, 23, 1, N'xác nhận test')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (11, 87, 3, 3, 2, N'fdsf')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (12, 87, 4, 3, 2, N'fdsf')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (13, 89, 3, 3, 2, N'fsdf')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (14, 89, 4, 3, 2, N'fsdf')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (15, 90, 3, 3, 2, N'fdsfds')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (16, 90, 4, 3, 2, N'fdsfds')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (17, 91, 3, 555, 1, N'Sờ kỹ vào nha')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (18, 91, 4, 555, 1, N'Sờ kỹ vào nha')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (19, 92, 4, 45, 23, N'Nhìn kỹ vào nha')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (20, 94, 3, 66, 1, N'qqq')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (21, 94, 4, 66, 1, N'qqq')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (24, 97, 3, 13, 1, N'Check bằng tay')
INSERT [dbo].[CsheetConfirmContents] ([Id], [ItemId], [DeviceTypeId], [Max], [Min], [ConfirmContent]) VALUES (25, 97, 4, 13, 1, N'Check bằng tay')
SET IDENTITY_INSERT [dbo].[CsheetConfirmContents] OFF
SET IDENTITY_INSERT [dbo].[CsheetDeviceDrops] ON 

INSERT [dbo].[CsheetDeviceDrops] ([Id], [ItemId], [DeviceTypeId], [Name], [Value]) VALUES (1, 54, 3, N'ver1', N'ver1')
INSERT [dbo].[CsheetDeviceDrops] ([Id], [ItemId], [DeviceTypeId], [Name], [Value]) VALUES (2, 54, 3, N'ver2', N'ver2')
INSERT [dbo].[CsheetDeviceDrops] ([Id], [ItemId], [DeviceTypeId], [Name], [Value]) VALUES (3, 54, 3, N'ver3', N'ver3')
INSERT [dbo].[CsheetDeviceDrops] ([Id], [ItemId], [DeviceTypeId], [Name], [Value]) VALUES (4, 54, 4, N'ver1', N'ver1')
INSERT [dbo].[CsheetDeviceDrops] ([Id], [ItemId], [DeviceTypeId], [Name], [Value]) VALUES (5, 54, 4, N'ver2', N'ver2')
INSERT [dbo].[CsheetDeviceDrops] ([Id], [ItemId], [DeviceTypeId], [Name], [Value]) VALUES (6, 54, 4, N'ver3', N'ver3')
INSERT [dbo].[CsheetDeviceDrops] ([Id], [ItemId], [DeviceTypeId], [Name], [Value]) VALUES (7, 69, 3, N'12', N'12')
INSERT [dbo].[CsheetDeviceDrops] ([Id], [ItemId], [DeviceTypeId], [Name], [Value]) VALUES (8, 69, 3, N'13', N'13')
INSERT [dbo].[CsheetDeviceDrops] ([Id], [ItemId], [DeviceTypeId], [Name], [Value]) VALUES (10, 69, 4, N'drop2', N'drop2')
INSERT [dbo].[CsheetDeviceDrops] ([Id], [ItemId], [DeviceTypeId], [Name], [Value]) VALUES (22, 70, 5, N'86', N'86')
SET IDENTITY_INSERT [dbo].[CsheetDeviceDrops] OFF
SET IDENTITY_INSERT [dbo].[CsheetDropLists] ON 

INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (1, 57, N'Drop1', N'Drop1')
INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (2, 57, N'Drop2', N'Drop2')
INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (4, 59, N'drop1', N'drop1')
INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (5, 59, N'drop2', N'drop2')
INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (6, 61, N'0.2', N'0.2')
INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (7, 61, N'0.3', N'0.3')
INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (8, 63, N'value1', N'value1')
INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (9, 63, N'Value2', N'Value2')
INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (10, 65, N'value1', N'value1')
INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (11, 65, N'value2', N'value2')
INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (12, 84, N'drop2', N'drop2')
INSERT [dbo].[CsheetDropLists] ([Id], [ItemId], [Name], [Value]) VALUES (13, 84, N'drop2', N'drop2')
SET IDENTITY_INSERT [dbo].[CsheetDropLists] OFF
SET IDENTITY_INSERT [dbo].[CsheetGroups] ON 

INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (16, 3, N'group1', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (17, 3, N'group2', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (18, 3, N'group3', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (20, 3, N'group5', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (21, 3, N'group6', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (23, 3, N'group51', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (24, 3, N'fdgfdg', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (26, 3, N'fsdf', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (27, 3, N'fsdljfld', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (28, 3, N'fskldfjlsd', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (29, 3, N'fdsfds', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (30, 3, N'dgsdfdf', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (31, 3, N'xxZX', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (32, 3, N'sdsd', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (33, 3, N'vjkcvk', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (34, 3, N'fdshfk', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (35, 3, N'dsfd', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (36, 3, N'dsfdhth', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (37, 3, N'fthg', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (38, 3, N'fthgfds', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (39, 3, N'test', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (40, 3, N'kljdfkl', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (41, 3, N'kljdfklưert', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (42, 3, N'kljdfklưertty', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (43, 3, N'kljdfklưerttyt', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (44, 3, N'kljdfklưerttytr', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (45, 3, N'kljdfklưerttytrd', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (46, 3, N'kljdfklư', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (47, 3, N'kljdfklưd', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (48, 3, N'kljdfklưdd', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (49, 3, N'kljdfklưddd', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (50, 3, N'xcx', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (51, 3, N'xcxf', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (52, 3, N'mới tinh ', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (53, 5, N'group3', N'Using', NULL)
INSERT [dbo].[CsheetGroups] ([Id], [CatalogId], [Name], [Status], [Stt]) VALUES (54, 3, N'group mới', N'Using', NULL)
SET IDENTITY_INSERT [dbo].[CsheetGroups] OFF
SET IDENTITY_INSERT [dbo].[CsheetItems] ON 

INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (53, 16, N'kiểm tra áp lực khí', N'Number', N'No', NULL, NULL, N'xác nhận giá trị khí (1-2)', N'Using', N'Eye', N'Normal', N'Mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (54, 17, N'Xác nhận tên chương trình', N'Drop', N'No', NULL, NULL, N'Xác nhận ver chương trình', N'Using', N'Jig', N'Normal', NULL)
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (55, 16, N'kiemr tra type number for all', N'Number', N'Yes', 6, 5, N'xác nhận giá trị', N'Using', N'Hand', N'Normal', N'mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (56, 17, N'kiểm tra giá trị drop', N'Drop', N'Yes', NULL, NULL, N'xác nhận', N'Using', N'Eye', N'Normal', NULL)
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (57, 17, N'kiểm tra giá trị drop', N'Drop', N'Yes', NULL, NULL, N'xác nhận', N'Using', N'Eye', N'Normal', NULL)
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (59, 16, N'check gdrop', N'Drop', N'Yes', NULL, NULL, N'fdfs', N'Using', N'Hand', N'Normal', N'Mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (61, 16, N'kiểm tra giá  trị cân', N'Drop', N'Yes', NULL, NULL, N'fdsfsdf', N'Using', N'Hand', N'Normal', N'Kg')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (62, 18, N'kiểm tra áp lực khí', N'Drop', N'Yes', NULL, NULL, N'xác nhận khí', N'Using', N'Eye', N'Normal', N'Mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (63, 18, N'kiểm tra áp lực khí', N'Drop', N'Yes', NULL, NULL, N'xác nhận khí', N'Using', N'Eye', N'Normal', N'Mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (66, 20, N'áp lực khí', N'Number', N'No', NULL, NULL, N'xác nhận giá trị', N'Using', N'Hand', N'Normal', N'mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (67, 21, N'test', N'Number', N'Yes', 3, 2, N'fsdfsd', N'Using', N'Eye', N'Normal', N'mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (68, 21, N'kiểm tra item', N'Number', N'No', NULL, NULL, N'dsfdsf', N'Using', N'Jig', N'Special', N'mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (69, 21, N'kiểm tra drop', N'Drop', N'No', NULL, NULL, N'fsdfsf', N'Using', N'Jig', N'Special', N'mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (70, 16, N'tạo drop cho từng loại', N'Drop', N'No', NULL, NULL, N'fdfs', N'Using', N'Hand', N'Normal', N'Mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (72, 53, N'Item1', N'Number', N'No', NULL, NULL, N'xác nhận test', N'Using', N'Hand', N'Normal', N'Mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (75, 20, N'ìdsfsdf', N'Number', N'Yes', NULL, NULL, N'fdsfds', N'Using', N'Hand', N'Normal', N'mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (80, 18, N'cxzcxz', N'Text', N'Yes', NULL, NULL, N'cvcxvcx', N'Using', N'Hand', N'Normal', NULL)
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (81, 18, N'fdfsfsdf', N'Number', N'Yes', 3, 2, N'gdgfd', N'Using', N'Hand', N'Normal', N'mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (82, 18, N'test', N'Text', N'Yes', NULL, NULL, N'fdsfsd', N'Using', N'Hand', N'Normal', NULL)
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (83, 18, N'teste', N'Text', N'Yes', NULL, NULL, N'dsfsd', N'Using', N'Jig', N'Special', NULL)
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (84, 18, N'testedfdsf', N'Drop', N'Yes', NULL, NULL, N'fdfsd', N'Using', N'Hand', N'Normal', N'mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (85, 16, N'fjkds', N'Number', N'Yes', 3, 2, N'dfds', N'Using', N'Hand', N'Normal', N'fdsf')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (86, 23, N'vcxvcx', N'Text', N'Yes', NULL, NULL, N'vxvc', N'Using', N'Hand', N'Normal', NULL)
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (87, 23, N'sadfsd', N'Number', N'No', NULL, NULL, N'fdsf', N'Using', N'Hand', N'Normal', N'mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (88, 21, N'cfdsadf', N'Number', N'Yes', 4, 3, N'dsfd', N'Using', N'Hand', N'Normal', N'mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (89, 21, N'sádf', N'Number', N'No', NULL, NULL, N'fsdf', N'Using', N'Hand', N'Normal', N'fds')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (90, 21, N'new', N'Number', N'No', NULL, NULL, N'fdsfds', N'Using', N'Hand', N'Normal', N'Mpa')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (91, 17, N'@@@', N'Number', N'No', NULL, NULL, N'Sờ kỹ vào nha', N'Using', N'Hand', N'Normal', N'ads')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (92, 17, N'####', N'Number', N'No', NULL, NULL, N'Nhìn kỹ vào nha', N'Using', N'Eye', N'Normal', N'DPI')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (93, 20, N'@1214', N'Number', N'No', 1200, 1, N'Sờ kỹ vào nhaaaaa', N'Using', N'Hand', N'Normal', N'sad')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (94, 17, N'54321', N'Number', N'No', NULL, NULL, N'qqq', N'Using', N'Hand', N'Normal', N'ed')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (95, 17, N'24689', N'Number', N'No', NULL, NULL, N'alovvvvvvvvvv', N'Using', N'Jig', N'Normal', N'DPI')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (96, 17, N'taoj mowis', N'Number', N'No', NULL, NULL, N'chuaw suawr', N'Using', N'Hand', N'Normal', N'ung')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (97, 54, N'123', N'Number', N'No', NULL, NULL, N'Check bằng tay', N'Using', N'Hand', N'Normal', N'DPI')
INSERT [dbo].[CsheetItems] ([Id], [GroupId], [ItemName], [TypeResult], [UsingAll], [Max], [Min], [ConfirmContent], [Status], [Method], [Group_normal], [Unit]) VALUES (98, 54, N'1357', N'Number', N'No', NULL, NULL, N'CHeck jig a', N'Using', N'Jig', N'Normal', N'ads')
SET IDENTITY_INSERT [dbo].[CsheetItems] OFF
SET IDENTITY_INSERT [dbo].[DeviceCatalogs] ON 

INSERT [dbo].[DeviceCatalogs] ([Name], [Code], [Id]) VALUES (N'Máy móc', N'VM', 3)
INSERT [dbo].[DeviceCatalogs] ([Name], [Code], [Id]) VALUES (N'Dụng cụ', N'VD', 5)
SET IDENTITY_INSERT [dbo].[DeviceCatalogs] OFF
SET IDENTITY_INSERT [dbo].[DeviceModels] ON 

INSERT [dbo].[DeviceModels] ([Id], [DeviceTypeId], [Name], [CaliDealine], [MaintainDealine], [Unit]) VALUES (1, 3, N'MDS', 12, 1, NULL)
INSERT [dbo].[DeviceModels] ([Id], [DeviceTypeId], [Name], [CaliDealine], [MaintainDealine], [Unit]) VALUES (2, 3, N'1123', 12, 7, NULL)
INSERT [dbo].[DeviceModels] ([Id], [DeviceTypeId], [Name], [CaliDealine], [MaintainDealine], [Unit]) VALUES (3, 3, N'vxv', 12, 1, NULL)
SET IDENTITY_INSERT [dbo].[DeviceModels] OFF
SET IDENTITY_INSERT [dbo].[DeviceTypes] ON 

INSERT [dbo].[DeviceTypes] ([Id], [Name], [Cali], [CatalogId], [Frequentcheck]) VALUES (3, N'máy in kem thiếc', NULL, 3, 1)
INSERT [dbo].[DeviceTypes] ([Id], [Name], [Cali], [CatalogId], [Frequentcheck]) VALUES (4, N'máy hàn', NULL, 3, 1)
INSERT [dbo].[DeviceTypes] ([Id], [Name], [Cali], [CatalogId], [Frequentcheck]) VALUES (5, N'cxzcxzc', NULL, 3, 1)
INSERT [dbo].[DeviceTypes] ([Id], [Name], [Cali], [CatalogId], [Frequentcheck]) VALUES (6, N'fdfds', NULL, 3, 1)
INSERT [dbo].[DeviceTypes] ([Id], [Name], [Cali], [CatalogId], [Frequentcheck]) VALUES (7, N'fdfds2', NULL, 3, 1)
INSERT [dbo].[DeviceTypes] ([Id], [Name], [Cali], [CatalogId], [Frequentcheck]) VALUES (8, N'fdfds23', NULL, 3, 1)
INSERT [dbo].[DeviceTypes] ([Id], [Name], [Cali], [CatalogId], [Frequentcheck]) VALUES (9, N'fdfds234', NULL, 3, 1)
INSERT [dbo].[DeviceTypes] ([Id], [Name], [Cali], [CatalogId], [Frequentcheck]) VALUES (10, N'fdfds45', NULL, 3, 1)
INSERT [dbo].[DeviceTypes] ([Id], [Name], [Cali], [CatalogId], [Frequentcheck]) VALUES (11, N'fdsfsdf', NULL, 3, 1)
SET IDENTITY_INSERT [dbo].[DeviceTypes] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [Role], [DeptId], [AreaId]) VALUES (1, N'It', N'1', N'Admin', 0, 0)
INSERT [dbo].[Users] ([Id], [Username], [Password], [Role], [DeptId], [AreaId]) VALUES (2, N'Admin', N'1', N'Admin', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_CsheetConfirmContent]    Script Date: 7/11/2020 2:47:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_CsheetConfirmContent] ON [dbo].[CsheetConfirmContents]
(
	[DeviceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CsheetDeviceDrop]    Script Date: 7/11/2020 2:47:30 PM ******/
CREATE NONCLUSTERED INDEX [IX_CsheetDeviceDrop] ON [dbo].[CsheetDeviceDrops]
(
	[DeviceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_CsheetForm]    Script Date: 7/11/2020 2:47:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_CsheetForm] ON [dbo].[CsheetForms]
(
	[DeviceTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_DeviceInfo]    Script Date: 7/11/2020 2:47:30 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_DeviceInfo] ON [dbo].[DeviceInfos]
(
	[DeviceCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AreaGroups]  WITH CHECK ADD  CONSTRAINT [FK_AreaGroup_AreaDepts] FOREIGN KEY([DeptId])
REFERENCES [dbo].[AreaDepts] ([Id])
GO
ALTER TABLE [dbo].[AreaGroups] CHECK CONSTRAINT [FK_AreaGroup_AreaDepts]
GO
ALTER TABLE [dbo].[AreaLines]  WITH CHECK ADD  CONSTRAINT [FK_AreaLine_AreaGroup] FOREIGN KEY([AreaId])
REFERENCES [dbo].[AreaGroups] ([Id])
GO
ALTER TABLE [dbo].[AreaLines] CHECK CONSTRAINT [FK_AreaLine_AreaGroup]
GO
ALTER TABLE [dbo].[CsheetConfirmContents]  WITH CHECK ADD  CONSTRAINT [FK_CsheetConfirmContent_CsheetItem] FOREIGN KEY([ItemId])
REFERENCES [dbo].[CsheetItems] ([Id])
GO
ALTER TABLE [dbo].[CsheetConfirmContents] CHECK CONSTRAINT [FK_CsheetConfirmContent_CsheetItem]
GO
ALTER TABLE [dbo].[CsheetConfirmContents]  WITH CHECK ADD  CONSTRAINT [FK_CsheetConfirmContents_DeviceTypes] FOREIGN KEY([DeviceTypeId])
REFERENCES [dbo].[DeviceTypes] ([Id])
GO
ALTER TABLE [dbo].[CsheetConfirmContents] CHECK CONSTRAINT [FK_CsheetConfirmContents_DeviceTypes]
GO
ALTER TABLE [dbo].[CsheetDailys]  WITH CHECK ADD  CONSTRAINT [FK_CsheetDaily_DeviceInfo] FOREIGN KEY([CodeJig])
REFERENCES [dbo].[DeviceInfos] ([DeviceCode])
GO
ALTER TABLE [dbo].[CsheetDailys] CHECK CONSTRAINT [FK_CsheetDaily_DeviceInfo]
GO
ALTER TABLE [dbo].[CsheetDeviceDrops]  WITH CHECK ADD  CONSTRAINT [FK_CsheetDeviceDrop_CsheetItem] FOREIGN KEY([ItemId])
REFERENCES [dbo].[CsheetItems] ([Id])
GO
ALTER TABLE [dbo].[CsheetDeviceDrops] CHECK CONSTRAINT [FK_CsheetDeviceDrop_CsheetItem]
GO
ALTER TABLE [dbo].[CsheetDeviceDrops]  WITH CHECK ADD  CONSTRAINT [FK_CsheetDeviceDrop_DeviceTypes1] FOREIGN KEY([DeviceTypeId])
REFERENCES [dbo].[DeviceTypes] ([Id])
GO
ALTER TABLE [dbo].[CsheetDeviceDrops] CHECK CONSTRAINT [FK_CsheetDeviceDrop_DeviceTypes1]
GO
ALTER TABLE [dbo].[CsheetFormDetails]  WITH CHECK ADD  CONSTRAINT [FK_CsheetFormDetail_CsheetForm] FOREIGN KEY([ChecksheetFormId])
REFERENCES [dbo].[CsheetForms] ([Id])
GO
ALTER TABLE [dbo].[CsheetFormDetails] CHECK CONSTRAINT [FK_CsheetFormDetail_CsheetForm]
GO
ALTER TABLE [dbo].[CsheetGroups]  WITH CHECK ADD  CONSTRAINT [FK_CsheetGroup_DeviceCatalog] FOREIGN KEY([CatalogId])
REFERENCES [dbo].[DeviceCatalogs] ([Id])
GO
ALTER TABLE [dbo].[CsheetGroups] CHECK CONSTRAINT [FK_CsheetGroup_DeviceCatalog]
GO
ALTER TABLE [dbo].[CsheetItems]  WITH CHECK ADD  CONSTRAINT [FK_CsheetItems_CsheetGroups] FOREIGN KEY([GroupId])
REFERENCES [dbo].[CsheetGroups] ([Id])
GO
ALTER TABLE [dbo].[CsheetItems] CHECK CONSTRAINT [FK_CsheetItems_CsheetGroups]
GO
ALTER TABLE [dbo].[CsheetResults]  WITH CHECK ADD  CONSTRAINT [FK_CsheetResult_CsheetDaily] FOREIGN KEY([ChecksheetDailyId])
REFERENCES [dbo].[CsheetDailys] ([Id])
GO
ALTER TABLE [dbo].[CsheetResults] CHECK CONSTRAINT [FK_CsheetResult_CsheetDaily]
GO
ALTER TABLE [dbo].[DeviceInfos]  WITH CHECK ADD  CONSTRAINT [FK_DeviceInfo_AreaLine] FOREIGN KEY([LineId])
REFERENCES [dbo].[AreaLines] ([Id])
GO
ALTER TABLE [dbo].[DeviceInfos] CHECK CONSTRAINT [FK_DeviceInfo_AreaLine]
GO
ALTER TABLE [dbo].[DeviceInfos]  WITH CHECK ADD  CONSTRAINT [FK_DeviceInfo_DeviceModel] FOREIGN KEY([DeviceModelId])
REFERENCES [dbo].[DeviceModels] ([Id])
GO
ALTER TABLE [dbo].[DeviceInfos] CHECK CONSTRAINT [FK_DeviceInfo_DeviceModel]
GO
ALTER TABLE [dbo].[DeviceModels]  WITH CHECK ADD  CONSTRAINT [FK_DeviceModel_DeviceType] FOREIGN KEY([DeviceTypeId])
REFERENCES [dbo].[DeviceTypes] ([Id])
GO
ALTER TABLE [dbo].[DeviceModels] CHECK CONSTRAINT [FK_DeviceModel_DeviceType]
GO
ALTER TABLE [dbo].[DeviceTypes]  WITH CHECK ADD  CONSTRAINT [FK_DeviceType_DeviceCatalog] FOREIGN KEY([CatalogId])
REFERENCES [dbo].[DeviceCatalogs] ([Id])
GO
ALTER TABLE [dbo].[DeviceTypes] CHECK CONSTRAINT [FK_DeviceType_DeviceCatalog]
GO
USE [master]
GO
ALTER DATABASE [DeviceSystem] SET  READ_WRITE 
GO
