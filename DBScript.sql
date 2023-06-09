USE [master]
GO
/****** Object:  Database [test]    Script Date: 06-05-2023 17:12:10 ******/
CREATE DATABASE [test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\test.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\test_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [test] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [test] SET ARITHABORT OFF 
GO
ALTER DATABASE [test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [test] SET  DISABLE_BROKER 
GO
ALTER DATABASE [test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [test] SET RECOVERY FULL 
GO
ALTER DATABASE [test] SET  MULTI_USER 
GO
ALTER DATABASE [test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [test] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [test] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [test] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [test] SET QUERY_STORE = OFF
GO
USE [test]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 06-05-2023 17:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NULL,
	[Address1] [nvarchar](50) NULL,
	[Address2] [nvarchar](50) NULL,
	[ContactNo] [nvarchar](10) NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblCustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[District]    Script Date: 06-05-2023 17:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[StateId] [nchar](10) NOT NULL,
	[DistrictId] [int] IDENTITY(1,1) NOT NULL,
	[DistrictName] [nvarchar](50) NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[DistrictId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 06-05-2023 17:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] NOT NULL,
	[ProductID] [int] NULL,
	[CustomerId] [int] NULL,
	[OrderDate] [date] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblOrder] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 06-05-2023 17:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductId] [int] NOT NULL,
	[ProductName] [nvarchar](50) NULL,
	[ProductPrice] [decimal](7, 2) NULL,
	[Quatitty] [int] NULL,
 CONSTRAINT [PK_tblProduct] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShippingDetails]    Script Date: 06-05-2023 17:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShippingDetails](
	[ShipingID] [int] IDENTITY(1,1) NOT NULL,
	[ShipingRefNo] [nvarchar](50) NULL,
	[CustomerId] [int] NULL,
	[Shiping_Origin] [nvarchar](50) NULL,
	[Shipping_origin_Address] [nvarchar](50) NULL,
	[Shipping_origin_Address2] [nvarchar](100) NULL,
	[origin_StateID] [int] NULL,
	[origin_DistrictId] [int] NULL,
	[origin_pincode] [numeric](6, 0) NULL,
	[Shiping_Destination] [nvarchar](50) NULL,
	[Shiping_Dest_Address] [nvarchar](50) NULL,
	[Shiping_Dest_Address2] [nvarchar](100) NULL,
	[Dest_StateId] [int] NULL,
	[Dest_District_ID] [int] NULL,
	[Dest_pincode] [numeric](6, 0) NULL,
	[shippingBy] [int] NULL,
	[shipingStatus] [nvarchar](50) NULL,
	[CreatedOn] [datetime] NULL,
	[DeliveredOn] [datetime] NULL,
 CONSTRAINT [PK_ShippingDetails_1] PRIMARY KEY CLUSTERED 
(
	[ShipingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[State]    Script Date: 06-05-2023 17:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[State](
	[StateID] [int] NOT NULL,
	[StateName] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblState] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tracking]    Script Date: 06-05-2023 17:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tracking](
	[TrackingID] [int] NOT NULL,
	[ShipmentID] [int] NULL,
	[pickupDate] [datetime] NULL,
	[currentStatus] [nvarchar](50) NULL,
	[DeliveredDate] [datetime] NULL,
	[CreatedOn] [datetime] NULL,
 CONSTRAINT [PK_tblTracking] PRIMARY KEY CLUSTERED 
(
	[TrackingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingDetails_Customer1] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[ShippingDetails] CHECK CONSTRAINT [FK_ShippingDetails_Customer1]
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingDetails_District] FOREIGN KEY([origin_DistrictId])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[ShippingDetails] CHECK CONSTRAINT [FK_ShippingDetails_District]
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingDetails_District1] FOREIGN KEY([Dest_District_ID])
REFERENCES [dbo].[District] ([DistrictId])
GO
ALTER TABLE [dbo].[ShippingDetails] CHECK CONSTRAINT [FK_ShippingDetails_District1]
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingDetails_ShippingDetails] FOREIGN KEY([ShipingID])
REFERENCES [dbo].[ShippingDetails] ([ShipingID])
GO
ALTER TABLE [dbo].[ShippingDetails] CHECK CONSTRAINT [FK_ShippingDetails_ShippingDetails]
GO
ALTER TABLE [dbo].[ShippingDetails]  WITH CHECK ADD  CONSTRAINT [FK_ShippingDetails_State] FOREIGN KEY([Dest_StateId])
REFERENCES [dbo].[State] ([StateID])
GO
ALTER TABLE [dbo].[ShippingDetails] CHECK CONSTRAINT [FK_ShippingDetails_State]
GO
ALTER TABLE [dbo].[Tracking]  WITH CHECK ADD  CONSTRAINT [FK_Tracking_ShippingDetails] FOREIGN KEY([ShipmentID])
REFERENCES [dbo].[ShippingDetails] ([ShipingID])
GO
ALTER TABLE [dbo].[Tracking] CHECK CONSTRAINT [FK_Tracking_ShippingDetails]
GO
USE [master]
GO
ALTER DATABASE [test] SET  READ_WRITE 
GO
