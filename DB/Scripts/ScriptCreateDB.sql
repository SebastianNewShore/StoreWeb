USE [master]
GO
/****** Object:  Database [dbStoreWeb]    Script Date: 11/30/2020 5:34:25 PM ******/
CREATE DATABASE [dbStoreWeb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bdTiendaWeb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\bdTiendaWeb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'bdTiendaWeb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\bdTiendaWeb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [dbStoreWeb] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbStoreWeb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbStoreWeb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbStoreWeb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbStoreWeb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbStoreWeb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbStoreWeb] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbStoreWeb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbStoreWeb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbStoreWeb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbStoreWeb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbStoreWeb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbStoreWeb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbStoreWeb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbStoreWeb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbStoreWeb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbStoreWeb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbStoreWeb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbStoreWeb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbStoreWeb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbStoreWeb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbStoreWeb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbStoreWeb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbStoreWeb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbStoreWeb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [dbStoreWeb] SET  MULTI_USER 
GO
ALTER DATABASE [dbStoreWeb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbStoreWeb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbStoreWeb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbStoreWeb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [dbStoreWeb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [dbStoreWeb] SET QUERY_STORE = OFF
GO
USE [dbStoreWeb]
GO
/****** Object:  User [admin2]    Script Date: 11/30/2020 5:34:26 PM ******/
CREATE USER [admin2] FOR LOGIN [admin2] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [admin]    Script Date: 11/30/2020 5:34:26 PM ******/
CREATE USER [admin] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [admin2]
GO
ALTER ROLE [db_datareader] ADD MEMBER [admin2]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [admin2]
GO
/****** Object:  Table [dbo].[tbBrands]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbBrands](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[State] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbBrands] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbCategories]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[State] [tinyint] NOT NULL,
	[Description] [varchar](200) NULL,
 CONSTRAINT [PK_tbSubCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbCities]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCities](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[State] [tinyint] NOT NULL,
	[IdRegion] [int] NOT NULL,
 CONSTRAINT [PK_tbCities] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbCountries]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCountries](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[State] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbCountries] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbCustomers]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbCustomers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DocumentNumber] [varchar](20) NOT NULL,
	[BirthDate] [date] NULL,
	[Adress] [varchar](100) NULL,
	[CellPhone] [varchar](20) NULL,
	[Email] [varchar](50) NOT NULL,
	[Password] [varbinary](100) NOT NULL,
	[IdDocument] [int] NOT NULL,
	[IdGender] [int] NOT NULL,
	[IdCity] [int] NOT NULL,
 CONSTRAINT [PK_tbCustomers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbDocuments]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbDocuments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[State] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbDocuments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbEmployees]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbEmployees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LastName] [varchar](50) NOT NULL,
	[DocumentNumber] [varchar](20) NOT NULL,
	[BirthDate] [date] NULL,
	[CellPhone] [varchar](20) NULL,
	[Email] [varchar](20) NULL,
	[IdDocument] [int] NOT NULL,
	[IdGender] [int] NOT NULL,
	[IdCity] [int] NOT NULL,
 CONSTRAINT [PK_tbEmployees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbGenders]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbGenders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[State] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbGenders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbOrders]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RecipientAdress] [varchar](100) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[SentDate] [datetime] NULL,
	[DeliveryDate] [datetime] NULL,
	[PostalCode] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[SpecialInstruction] [varchar](200) NULL,
	[IdStateOrder] [int] NOT NULL,
	[IdCustomer] [int] NOT NULL,
	[IdEmployee] [int] NOT NULL,
	[IdCity] [int] NOT NULL,
	[IdShippingCompany] [int] NOT NULL,
 CONSTRAINT [PK_tbOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbPositions]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbPositions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[State] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbPositions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbProductOrders]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProductOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Quantity] [int] NOT NULL,
	[IdProduct] [int] NOT NULL,
	[IdOrder] [int] NOT NULL,
 CONSTRAINT [PK_tbProductOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbProducts]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[State] [tinyint] NOT NULL,
	[Stock] [int] NOT NULL,
	[Discount] [int] NOT NULL,
	[InternalPrice] [money] NOT NULL,
	[PublicPrice] [money] NOT NULL,
	[Description] [varchar](200) NULL,
	[ProductDetail] [varchar](200) NULL,
	[IdBrand] [int] NOT NULL,
	[IdProvider] [int] NOT NULL,
 CONSTRAINT [PK_tbProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbProviders]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbProviders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[State] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbProviders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbRegions]    Script Date: 11/30/2020 5:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbRegions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[State] [tinyint] NOT NULL,
	[IdCountry] [int] NOT NULL,
 CONSTRAINT [PK_tbRegions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbShippingCompanies]    Script Date: 11/30/2020 5:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbShippingCompanies](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[State] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbShippingCompanies] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbStateOrders]    Script Date: 11/30/2020 5:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbStateOrders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [varchar](200) NULL,
	[State] [tinyint] NOT NULL,
 CONSTRAINT [PK_tbStateOrders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbSubCategoryProducts]    Script Date: 11/30/2020 5:34:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbSubCategoryProducts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdProduct] [int] NOT NULL,
	[IdSubCategory] [int] NOT NULL,
 CONSTRAINT [PK_tbSubCategoryProducts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbBrands] ON 

INSERT [dbo].[tbBrands] ([Id], [Name], [Description], [State]) VALUES (1, N'Amazon', NULL, 0)
INSERT [dbo].[tbBrands] ([Id], [Name], [Description], [State]) VALUES (2, N'Apple', NULL, 0)
INSERT [dbo].[tbBrands] ([Id], [Name], [Description], [State]) VALUES (3, N'Google', NULL, 1)
INSERT [dbo].[tbBrands] ([Id], [Name], [Description], [State]) VALUES (4, N'Microsoft', NULL, 1)
INSERT [dbo].[tbBrands] ([Id], [Name], [Description], [State]) VALUES (5, N'Facebook', NULL, 1)
INSERT [dbo].[tbBrands] ([Id], [Name], [Description], [State]) VALUES (6, N'Samsung', NULL, 1)
INSERT [dbo].[tbBrands] ([Id], [Name], [Description], [State]) VALUES (7, N'LG', NULL, 1)
INSERT [dbo].[tbBrands] ([Id], [Name], [Description], [State]) VALUES (8, N'Sony', NULL, 0)
SET IDENTITY_INSERT [dbo].[tbBrands] OFF
SET IDENTITY_INSERT [dbo].[tbCategories] ON 

INSERT [dbo].[tbCategories] ([Id], [Name], [State], [Description]) VALUES (1, N'fragrances', 1, NULL)
INSERT [dbo].[tbCategories] ([Id], [Name], [State], [Description]) VALUES (2, N'Makeup', 1, NULL)
INSERT [dbo].[tbCategories] ([Id], [Name], [State], [Description]) VALUES (3, N'watche', 1, NULL)
INSERT [dbo].[tbCategories] ([Id], [Name], [State], [Description]) VALUES (7, N'smartwatch', 1, NULL)
INSERT [dbo].[tbCategories] ([Id], [Name], [State], [Description]) VALUES (8, N'smartphone', 1, NULL)
INSERT [dbo].[tbCategories] ([Id], [Name], [State], [Description]) VALUES (9, N'furniture', 1, NULL)
INSERT [dbo].[tbCategories] ([Id], [Name], [State], [Description]) VALUES (10, N'Bicycle', 1, NULL)
INSERT [dbo].[tbCategories] ([Id], [Name], [State], [Description]) VALUES (12, N'soccer', 1, NULL)
INSERT [dbo].[tbCategories] ([Id], [Name], [State], [Description]) VALUES (13, N'SmartTV', 1, NULL)
SET IDENTITY_INSERT [dbo].[tbCategories] OFF
SET IDENTITY_INSERT [dbo].[tbProducts] ON 

INSERT [dbo].[tbProducts] ([Id], [Code], [Name], [State], [Stock], [Discount], [InternalPrice], [PublicPrice], [Description], [ProductDetail], [IdBrand], [IdProvider]) VALUES (3, N'0000001', N'Samsung Galaxy A10s DS - Black', 1, 10, 5, 200000.0000, 468000.0000, N'A 6.2 inch HD+ TFT screen that you will love to watch. Whether you like to watch series or enjoy online games, the Galaxy A10s Infinity-V screen', N'{"SKU": "SA015EL1K5KWWLCO",
"Model": "gold",
"Origin":"Korea, Republic of",
"weight": 1}', 6, 1)
INSERT [dbo].[tbProducts] ([Id], [Code], [Name], [State], [Stock], [Discount], [InternalPrice], [PublicPrice], [Description], [ProductDetail], [IdBrand], [IdProvider]) VALUES (6, N'0000002', N'65 Inch Lg 4K Ultra Hd Smart Tv', 1, 20, 0, 2800000.0000, 5499000.0000, N'This TV has a DVB-T2 Digital Terrestrial Tuner. If you want to know more about Digital Television', N'{"SKU": "LG082EL1EN927LCO",
"Model": "65UN7100PDAAWC",
"Origin":"",
"weight": 0}', 7, 2)
INSERT [dbo].[tbProducts] ([Id], [Code], [Name], [State], [Stock], [Discount], [InternalPrice], [PublicPrice], [Description], [ProductDetail], [IdBrand], [IdProvider]) VALUES (14, N'0000003', N'smartwatch serie 5 T500', 1, 5, 50, 69900.0000, 169900.0000, N'Interchangeable Straps, HQ Display, Multiple Dial Screens (8), Phonebook Synchronization, Incoming Calls, Bluetooth, Text Messages, Remote Notifications and Display.', N'{"SKU": "GE062EL01HZ03LCO",
"Model": "T500",
"Origin":"China",
"weight": 1}', 2, 3)
INSERT [dbo].[tbProducts] ([Id], [Code], [Name], [State], [Stock], [Discount], [InternalPrice], [PublicPrice], [Description], [ProductDetail], [IdBrand], [IdProvider]) VALUES (21, N'0000004', N'Tv Samsung', 1, 20, 5, 200000.0000, 600000.0000, N'New Product', N'{''SKU'': ''SA015EL1K5KWWLCO'', ''Model'': ''gold'', ''Origin'':''Korea, Republic of'', ''weight'': 1}', 6, 2)
SET IDENTITY_INSERT [dbo].[tbProducts] OFF
SET IDENTITY_INSERT [dbo].[tbProviders] ON 

INSERT [dbo].[tbProviders] ([Id], [Name], [Description], [State]) VALUES (1, N'Tecnobits', NULL, 1)
INSERT [dbo].[tbProviders] ([Id], [Name], [Description], [State]) VALUES (2, N'TvProviders', NULL, 1)
INSERT [dbo].[tbProviders] ([Id], [Name], [Description], [State]) VALUES (3, N'Inteco', NULL, 0)
INSERT [dbo].[tbProviders] ([Id], [Name], [Description], [State]) VALUES (5, N'Merakit', NULL, 1)
SET IDENTITY_INSERT [dbo].[tbProviders] OFF
SET IDENTITY_INSERT [dbo].[tbSubCategoryProducts] ON 

INSERT [dbo].[tbSubCategoryProducts] ([Id], [IdProduct], [IdSubCategory]) VALUES (1, 3, 8)
INSERT [dbo].[tbSubCategoryProducts] ([Id], [IdProduct], [IdSubCategory]) VALUES (2, 6, 13)
INSERT [dbo].[tbSubCategoryProducts] ([Id], [IdProduct], [IdSubCategory]) VALUES (3, 14, 3)
INSERT [dbo].[tbSubCategoryProducts] ([Id], [IdProduct], [IdSubCategory]) VALUES (4, 14, 7)
INSERT [dbo].[tbSubCategoryProducts] ([Id], [IdProduct], [IdSubCategory]) VALUES (10, 21, 7)
INSERT [dbo].[tbSubCategoryProducts] ([Id], [IdProduct], [IdSubCategory]) VALUES (11, 21, 8)
INSERT [dbo].[tbSubCategoryProducts] ([Id], [IdProduct], [IdSubCategory]) VALUES (12, 21, 13)
SET IDENTITY_INSERT [dbo].[tbSubCategoryProducts] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_CUSTOMERS_DOCUMENT_NUMBER]    Script Date: 11/30/2020 5:34:27 PM ******/
CREATE NONCLUSTERED INDEX [IDX_CUSTOMERS_DOCUMENT_NUMBER] ON [dbo].[tbCustomers]
(
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_EMPLOYEES_DOCUMENT_NUMBER]    Script Date: 11/30/2020 5:34:27 PM ******/
CREATE NONCLUSTERED INDEX [IDX_EMPLOYEES_DOCUMENT_NUMBER] ON [dbo].[tbEmployees]
(
	[DocumentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_PRODUCTS_CODE]    Script Date: 11/30/2020 5:34:27 PM ******/
CREATE NONCLUSTERED INDEX [IDX_PRODUCTS_CODE] ON [dbo].[tbProducts]
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[tbCities]  WITH CHECK ADD  CONSTRAINT [FK_tbCities_tbRegions] FOREIGN KEY([IdRegion])
REFERENCES [dbo].[tbRegions] ([Id])
GO
ALTER TABLE [dbo].[tbCities] CHECK CONSTRAINT [FK_tbCities_tbRegions]
GO
ALTER TABLE [dbo].[tbCustomers]  WITH CHECK ADD  CONSTRAINT [FK_tbCustomers_tbCities] FOREIGN KEY([IdCity])
REFERENCES [dbo].[tbCities] ([Id])
GO
ALTER TABLE [dbo].[tbCustomers] CHECK CONSTRAINT [FK_tbCustomers_tbCities]
GO
ALTER TABLE [dbo].[tbCustomers]  WITH CHECK ADD  CONSTRAINT [FK_tbCustomers_tbDocuments] FOREIGN KEY([IdDocument])
REFERENCES [dbo].[tbDocuments] ([Id])
GO
ALTER TABLE [dbo].[tbCustomers] CHECK CONSTRAINT [FK_tbCustomers_tbDocuments]
GO
ALTER TABLE [dbo].[tbCustomers]  WITH CHECK ADD  CONSTRAINT [FK_tbCustomers_tbGenders] FOREIGN KEY([IdGender])
REFERENCES [dbo].[tbGenders] ([Id])
GO
ALTER TABLE [dbo].[tbCustomers] CHECK CONSTRAINT [FK_tbCustomers_tbGenders]
GO
ALTER TABLE [dbo].[tbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tbEmployees_tbCities] FOREIGN KEY([IdCity])
REFERENCES [dbo].[tbCities] ([Id])
GO
ALTER TABLE [dbo].[tbEmployees] CHECK CONSTRAINT [FK_tbEmployees_tbCities]
GO
ALTER TABLE [dbo].[tbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tbEmployees_tbDocuments] FOREIGN KEY([IdDocument])
REFERENCES [dbo].[tbDocuments] ([Id])
GO
ALTER TABLE [dbo].[tbEmployees] CHECK CONSTRAINT [FK_tbEmployees_tbDocuments]
GO
ALTER TABLE [dbo].[tbEmployees]  WITH CHECK ADD  CONSTRAINT [FK_tbEmployees_tbGenders] FOREIGN KEY([IdGender])
REFERENCES [dbo].[tbGenders] ([Id])
GO
ALTER TABLE [dbo].[tbEmployees] CHECK CONSTRAINT [FK_tbEmployees_tbGenders]
GO
ALTER TABLE [dbo].[tbOrders]  WITH CHECK ADD  CONSTRAINT [FK_tbOrders_tbCities] FOREIGN KEY([IdCity])
REFERENCES [dbo].[tbCities] ([Id])
GO
ALTER TABLE [dbo].[tbOrders] CHECK CONSTRAINT [FK_tbOrders_tbCities]
GO
ALTER TABLE [dbo].[tbOrders]  WITH CHECK ADD  CONSTRAINT [FK_tbOrders_tbCustomers] FOREIGN KEY([IdCustomer])
REFERENCES [dbo].[tbCustomers] ([Id])
GO
ALTER TABLE [dbo].[tbOrders] CHECK CONSTRAINT [FK_tbOrders_tbCustomers]
GO
ALTER TABLE [dbo].[tbOrders]  WITH CHECK ADD  CONSTRAINT [FK_tbOrders_tbEmployees] FOREIGN KEY([IdEmployee])
REFERENCES [dbo].[tbEmployees] ([Id])
GO
ALTER TABLE [dbo].[tbOrders] CHECK CONSTRAINT [FK_tbOrders_tbEmployees]
GO
ALTER TABLE [dbo].[tbOrders]  WITH CHECK ADD  CONSTRAINT [FK_tbOrders_tbShippingCompanies] FOREIGN KEY([IdShippingCompany])
REFERENCES [dbo].[tbShippingCompanies] ([Id])
GO
ALTER TABLE [dbo].[tbOrders] CHECK CONSTRAINT [FK_tbOrders_tbShippingCompanies]
GO
ALTER TABLE [dbo].[tbOrders]  WITH CHECK ADD  CONSTRAINT [FK_tbOrders_tbStateOrders] FOREIGN KEY([IdStateOrder])
REFERENCES [dbo].[tbStateOrders] ([Id])
GO
ALTER TABLE [dbo].[tbOrders] CHECK CONSTRAINT [FK_tbOrders_tbStateOrders]
GO
ALTER TABLE [dbo].[tbProductOrders]  WITH CHECK ADD  CONSTRAINT [FK_tbProductOrders_tbOrders] FOREIGN KEY([IdOrder])
REFERENCES [dbo].[tbOrders] ([Id])
GO
ALTER TABLE [dbo].[tbProductOrders] CHECK CONSTRAINT [FK_tbProductOrders_tbOrders]
GO
ALTER TABLE [dbo].[tbProductOrders]  WITH CHECK ADD  CONSTRAINT [FK_tbProductOrders_tbProducts] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[tbProducts] ([Id])
GO
ALTER TABLE [dbo].[tbProductOrders] CHECK CONSTRAINT [FK_tbProductOrders_tbProducts]
GO
ALTER TABLE [dbo].[tbProducts]  WITH CHECK ADD  CONSTRAINT [FK_tbProducts_tbBrands] FOREIGN KEY([IdBrand])
REFERENCES [dbo].[tbBrands] ([Id])
GO
ALTER TABLE [dbo].[tbProducts] CHECK CONSTRAINT [FK_tbProducts_tbBrands]
GO
ALTER TABLE [dbo].[tbProducts]  WITH CHECK ADD  CONSTRAINT [FK_tbProducts_tbProviders] FOREIGN KEY([IdProvider])
REFERENCES [dbo].[tbProviders] ([Id])
GO
ALTER TABLE [dbo].[tbProducts] CHECK CONSTRAINT [FK_tbProducts_tbProviders]
GO
ALTER TABLE [dbo].[tbRegions]  WITH CHECK ADD  CONSTRAINT [FK_tbRegions_tbCountries] FOREIGN KEY([IdCountry])
REFERENCES [dbo].[tbCountries] ([Id])
GO
ALTER TABLE [dbo].[tbRegions] CHECK CONSTRAINT [FK_tbRegions_tbCountries]
GO
ALTER TABLE [dbo].[tbSubCategoryProducts]  WITH CHECK ADD  CONSTRAINT [FK_tbSubCategoryProducts_tbProducts] FOREIGN KEY([IdProduct])
REFERENCES [dbo].[tbProducts] ([Id])
GO
ALTER TABLE [dbo].[tbSubCategoryProducts] CHECK CONSTRAINT [FK_tbSubCategoryProducts_tbProducts]
GO
ALTER TABLE [dbo].[tbSubCategoryProducts]  WITH CHECK ADD  CONSTRAINT [FK_tbSubCategoryProducts_tbSubCategories] FOREIGN KEY([IdSubCategory])
REFERENCES [dbo].[tbCategories] ([Id])
GO
ALTER TABLE [dbo].[tbSubCategoryProducts] CHECK CONSTRAINT [FK_tbSubCategoryProducts_tbSubCategories]
GO
USE [master]
GO
ALTER DATABASE [dbStoreWeb] SET  READ_WRITE 
GO
