USE [master]
GO
/****** Object:  Database [DBPavelBread]    Script Date: 21.12.2023 23:13:25 ******/
CREATE DATABASE [DBPavelBread]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBPavelBread', FILENAME = N'C:\Users\FEDPo\Documents\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBPavelBread.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBPavelBread_log', FILENAME = N'C:\Users\FEDPo\Documents\MSSQL15.SQLEXPRESS\MSSQL\DATA\DBPavelBread_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DBPavelBread] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBPavelBread].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBPavelBread] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBPavelBread] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBPavelBread] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBPavelBread] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBPavelBread] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBPavelBread] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBPavelBread] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBPavelBread] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBPavelBread] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBPavelBread] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBPavelBread] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBPavelBread] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBPavelBread] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBPavelBread] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBPavelBread] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBPavelBread] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBPavelBread] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBPavelBread] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBPavelBread] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBPavelBread] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBPavelBread] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBPavelBread] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBPavelBread] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBPavelBread] SET  MULTI_USER 
GO
ALTER DATABASE [DBPavelBread] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBPavelBread] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBPavelBread] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBPavelBread] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBPavelBread] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBPavelBread] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [DBPavelBread] SET QUERY_STORE = OFF
GO
USE [DBPavelBread]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 21.12.2023 23:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 21.12.2023 23:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ManufacturerID] [int] IDENTITY(1,1) NOT NULL,
	[ManufacturerName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 21.12.2023 23:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[OrderDelivery] [datetime] NOT NULL,
	[OrderPoint] [int] NOT NULL,
	[OrderClient] [nvarchar](150) NULL,
	[OrderCode] [int] NOT NULL,
	[OrderStatus] [int] NOT NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 21.12.2023 23:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticle] [nvarchar](50) NOT NULL,
	[ProductCount] [int] NOT NULL,
 CONSTRAINT [PK_OrderProduct] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Point]    Script Date: 21.12.2023 23:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Point](
	[PointID] [int] IDENTITY(1,1) NOT NULL,
	[PointAddress] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Point] PRIMARY KEY CLUSTERED 
(
	[PointID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 21.12.2023 23:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticle] [nvarchar](50) NOT NULL,
	[ProductName] [nvarchar](150) NOT NULL,
	[ProductUnit] [int] NOT NULL,
	[ProductCost] [decimal](18, 2) NOT NULL,
	[ProductDiscountMax] [int] NOT NULL,
	[ProductManufacturer] [int] NOT NULL,
	[ProductProvider] [int] NOT NULL,
	[ProductCategory] [int] NOT NULL,
	[ProductDiscount] [int] NOT NULL,
	[ProductCount] [int] NOT NULL,
	[ProductDiscription] [nvarchar](max) NULL,
	[ProductPhoto] [nvarchar](50) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductArticle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Provider]    Script Date: 21.12.2023 23:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provider](
	[ProviderID] [int] IDENTITY(1,1) NOT NULL,
	[ProviderName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Provider] PRIMARY KEY CLUSTERED 
(
	[ProviderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 21.12.2023 23:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 21.12.2023 23:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Unit]    Script Date: 21.12.2023 23:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[UnitID] [int] IDENTITY(1,1) NOT NULL,
	[UnitName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[UnitID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 21.12.2023 23:13:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserRole] [int] NOT NULL,
	[UserFullName] [nvarchar](150) NOT NULL,
	[UserLogin] [nvarchar](50) NOT NULL,
	[UserPassword] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Выпечка')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Десерты')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (1, N'Хлебный дом')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (2, N'Хлебушек')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (3, N'Мир хлеба')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDelivery], [OrderPoint], [OrderClient], [OrderCode], [OrderStatus]) VALUES (11, CAST(N'2023-11-28T18:50:09.830' AS DateTime), CAST(N'2023-12-09T00:00:00.000' AS DateTime), 1, N'Федулова Полина Андреевна', 779, 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDelivery], [OrderPoint], [OrderClient], [OrderCode], [OrderStatus]) VALUES (1011, CAST(N'2023-11-30T14:17:43.070' AS DateTime), CAST(N'2023-12-06T14:17:43.070' AS DateTime), 3, N'Быстро А И', 872, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticle], [ProductCount]) VALUES (11, N'F746E6', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticle], [ProductCount]) VALUES (11, N'G598Y6', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticle], [ProductCount]) VALUES (1011, N'ID9458', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticle], [ProductCount]) VALUES (1011, N'SD0458', 2)
GO
SET IDENTITY_INSERT [dbo].[Point] ON 

INSERT [dbo].[Point] ([PointID], [PointAddress]) VALUES (1, N'344288, г. Дубна, ул. Чехова, 1')
INSERT [dbo].[Point] ([PointID], [PointAddress]) VALUES (2, N'614164, г.Дубна,  ул. Степная, 30')
INSERT [dbo].[Point] ([PointID], [PointAddress]) VALUES (3, N'394242, г. Дубна, ул. Коммунистическая, 43')
INSERT [dbo].[Point] ([PointID], [PointAddress]) VALUES (4, N'660540, г. Дубна, ул. Солнечная, 25')
INSERT [dbo].[Point] ([PointID], [PointAddress]) VALUES (5, N'125837, г. Дубна, ул. Шоссейная, 40')
INSERT [dbo].[Point] ([PointID], [PointAddress]) VALUES (6, N'125703, г. Дубна, ул. Партизанская, 49')
INSERT [dbo].[Point] ([PointID], [PointAddress]) VALUES (7, N'625283, г. Дубна, ул. Победы, 46')
SET IDENTITY_INSERT [dbo].[Point] OFF
GO
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'F746E6', N'Пирожок', 1, CAST(50.00 AS Decimal(18, 2)), 5, 3, 2, 1, 3, 20, N'Пирожок с яблоком', N'applePie.png')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'G598Y6', N'Торт', 2, CAST(1500.00 AS Decimal(18, 2)), 15, 2, 2, 2, 2, 16, N'Торт шоколадный', N'bigCake.png')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'ID9458', N'Торт фруктовый', 2, CAST(2000.00 AS Decimal(18, 2)), 10, 2, 1, 2, 5, 14, N'Торт с фруктами и шоколадом', N'bigCake2.png')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SD0458', N'Хлеб', 1, CAST(40.00 AS Decimal(18, 2)), 5, 3, 2, 1, 3, 10, N'Буханка белого хлеба', N'bread.png')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SD9458', N'Капкейк', 1, CAST(55.00 AS Decimal(18, 2)), 5, 1, 2, 2, 3, 10, N'Капкейк с черникой', N'cake.png')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SF9458', N'Капкейк', 1, CAST(55.00 AS Decimal(18, 2)), 15, 2, 2, 2, 7, 15, N'Капкейк с клубникой', N'cake1.png')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SFR458', N'Печенье', 1, CAST(10.00 AS Decimal(18, 2)), 10, 3, 1, 1, 4, 15, N'Печенье шоколадное', N'cookie.png')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SSS457', N'Пончик', 1, CAST(75.00 AS Decimal(18, 2)), 10, 1, 2, 2, 2, 13, N'Пончик с глазурью', N'donats.png')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SSS458', N'Круассан', 1, CAST(60.00 AS Decimal(18, 2)), 25, 3, 1, 1, 4, 7, N'Круассан без начинки', N'kruasan.png')
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([ProviderID], [ProviderName]) VALUES (1, N'Хлебник')
INSERT [dbo].[Provider] ([ProviderID], [ProviderName]) VALUES (2, N'Цех78')
SET IDENTITY_INSERT [dbo].[Provider] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Клиент')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Администратор')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (1, N'Новый')
INSERT [dbo].[Status] ([StatusID], [StatusName]) VALUES (2, N'Завершен')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[Unit] ON 

INSERT [dbo].[Unit] ([UnitID], [UnitName]) VALUES (1, N'шт')
INSERT [dbo].[Unit] ([UnitID], [UnitName]) VALUES (2, N'кг')
SET IDENTITY_INSERT [dbo].[Unit] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (1, 1, N'Ефремов  Сергей Пантелеймонович', N'loginDEppn2018', N'6}i+FD')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (2, 1, N'Родионова  Тамара Валентиновна', N'loginDElqb2018', N'RNynil')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (3, 2, N'Миронова  Галина Глебовна', N'loginDEydn2018', N'34I}X9')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (4, 2, N'Сидоров  Роман Иринеевич', N'loginDEijg2018', N'4QlKJW')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (5, 2, N'Ситников  Парфений Всеволодович', N'loginDEdpy2018', N'MJ0W|f')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (6, 2, N'Никонов  Роман Геласьевич', N'loginDEwdm2018', N'&PynqU')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (7, 1, N'Щербаков  Владимир Матвеевич', N'loginDEdup2018', N'JM+2{s')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (8, 2, N'Кулаков  Мартын Михаилович', N'loginDEhbm2018', N'9aObu4')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (9, 3, N'Сазонова  Оксана Лаврентьевна', N'loginDExvq2018', N'hX0wJz')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (10, 2, N'Архипов  Варлам Мэлорович', N'loginDErks2018', N'LQNSjo')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (11, 3, N'Устинова  Ираида Мэлоровна', N'loginDErvb2018', N'ceAf&R')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (12, 3, N'Лукин  Георгий Альбертович', N'loginDEulo2018', N'#ИМЯ?')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (13, 1, N'Кононов  Эдуард Валентинович', N'loginDEgfw2018', N'3c2Ic1')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (14, 2, N'Орехова  Клавдия Альбертовна', N'loginDEmxb2018', N'ZPXcRS')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (15, 2, N'Яковлев  Яков Эдуардович', N'loginDEgeq2018', N'&&Eim0')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (16, 1, N'Воронов  Мэлс Семёнович', N'loginDEkhj2018', N'Pbc0t{')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (17, 1, N'Вишнякова  Ия Данииловна', N'loginDEliu2018', N'32FyTl')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (18, 1, N'Третьяков  Фёдор Вадимович', N'loginDEsmf2018', N'{{O2QG')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (19, 2, N'Макаров  Максим Ильяович', N'loginDEutd2018', N'GbcJvC')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (20, 2, N'Шубина  Маргарита Анатольевна', N'loginDEpgh2018', N'YV2lvh')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (21, 2, N'Блинова  Ангелина Владленовна', N'loginDEvop2018', N'pBP8rO')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (22, 1, N'Воробьёв  Владлен Фролович', N'loginDEwjo2018', N'EQaD|d')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (23, 2, N'Сорокина  Прасковья Фёдоровна', N'loginDEbur2018', N'aZKGeI')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (24, 1, N'Давыдов  Яков Антонович', N'loginDEszw2018', N'EGU{YE')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (25, 1, N'Рыбакова  Евдокия Анатольевна', N'loginDExsu2018', N'*2RMsp')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (26, 1, N'Маслов  Геннадий Фролович', N'loginDEztn2018', N'nJBZpU')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (27, 1, N'Цветкова  Элеонора Аристарховна', N'loginDEtmn2018', N'UObB}N')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (28, 1, N'Евдокимов  Ростислав Александрович', N'loginDEhep2018', N'SwRicr')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (29, 1, N'Никонова  Венера Станиславовна', N'loginDEevr2018', N'zO5l}l')
INSERT [dbo].[User] ([UserID], [UserRole], [UserFullName], [UserLogin], [UserPassword]) VALUES (30, 1, N'Громов  Егор Антонович', N'loginDEnpa2018', N'M*QLjf')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Point] FOREIGN KEY([OrderPoint])
REFERENCES [dbo].[Point] ([PointID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Point]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([OrderStatus])
REFERENCES [dbo].[Status] ([StatusID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Order] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Order]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK_OrderProduct_Product] FOREIGN KEY([ProductArticle])
REFERENCES [dbo].[Product] ([ProductArticle])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK_OrderProduct_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Category] FOREIGN KEY([ProductCategory])
REFERENCES [dbo].[Category] ([CategoryID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ProductManufacturer])
REFERENCES [dbo].[Manufacturer] ([ManufacturerID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Provider] FOREIGN KEY([ProductProvider])
REFERENCES [dbo].[Provider] ([ProviderID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Provider]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Unit] FOREIGN KEY([ProductUnit])
REFERENCES [dbo].[Unit] ([UnitID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Unit]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([UserRole])
REFERENCES [dbo].[Role] ([RoleID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
USE [master]
GO
ALTER DATABASE [DBPavelBread] SET  READ_WRITE 
GO
