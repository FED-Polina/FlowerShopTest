USE [master]
GO
/****** Object:  Database [DBFlowerPolina]    Script Date: 29.12.2023 0:51:03 ******/
CREATE DATABASE [DBFlowerPolina]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBFlowerPolina', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBFlowerPolina.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBFlowerPolina_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\DBFlowerPolina_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [DBFlowerPolina] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBFlowerPolina].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBFlowerPolina] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBFlowerPolina] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBFlowerPolina] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBFlowerPolina] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBFlowerPolina] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DBFlowerPolina] SET  MULTI_USER 
GO
ALTER DATABASE [DBFlowerPolina] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBFlowerPolina] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBFlowerPolina] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBFlowerPolina] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DBFlowerPolina] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DBFlowerPolina] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBFlowerPolina', N'ON'
GO
ALTER DATABASE [DBFlowerPolina] SET QUERY_STORE = OFF
GO
USE [DBFlowerPolina]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 29.12.2023 0:51:03 ******/
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
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 29.12.2023 0:51:03 ******/
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
/****** Object:  Table [dbo].[Order]    Script Date: 29.12.2023 0:51:03 ******/
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
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 29.12.2023 0:51:03 ******/
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
/****** Object:  Table [dbo].[Point]    Script Date: 29.12.2023 0:51:03 ******/
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
/****** Object:  Table [dbo].[Product]    Script Date: 29.12.2023 0:51:03 ******/
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
/****** Object:  Table [dbo].[Provider]    Script Date: 29.12.2023 0:51:03 ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 29.12.2023 0:51:03 ******/
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
/****** Object:  Table [dbo].[Status]    Script Date: 29.12.2023 0:51:03 ******/
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
/****** Object:  Table [dbo].[Unit]    Script Date: 29.12.2023 0:51:03 ******/
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
/****** Object:  Table [dbo].[User]    Script Date: 29.12.2023 0:51:03 ******/
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

INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (1, N'Букет цветов')
INSERT [dbo].[Category] ([CategoryID], [CategoryName]) VALUES (2, N'Комнатные растения')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (1, N'Цветопторг')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (2, N'Цветовик')
INSERT [dbo].[Manufacturer] ([ManufacturerID], [ManufacturerName]) VALUES (3, N'Флора')
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDelivery], [OrderPoint], [OrderClient], [OrderCode], [OrderStatus]) VALUES (11, CAST(N'2023-11-28T18:50:09.830' AS DateTime), CAST(N'2023-12-09T00:00:00.000' AS DateTime), 1, N'Федулова Полина Андреевна', 779, 2)
INSERT [dbo].[Order] ([OrderID], [OrderDate], [OrderDelivery], [OrderPoint], [OrderClient], [OrderCode], [OrderStatus]) VALUES (1011, CAST(N'2023-11-30T14:17:43.070' AS DateTime), CAST(N'2023-12-06T14:17:43.070' AS DateTime), 3, N'Быстро А И', 872, 1)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticle], [ProductCount]) VALUES (11, N'F746E6', 1)
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
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'F746E6', N'Антриум Дакота', 1, CAST(2770.00 AS Decimal(18, 2)), 5, 3, 2, 2, 3, 20, N'Антуриум Дакота, это кустарник среднего размера. С крупными листьями и заметно разделенным, сердцевидным основанием, слегка удлиненной формы.
Особое внимание привлекает форма соцветия. Глянцевое покрывало, с глубоко разделенными долями в основании. Очень крупное по размеру 14-23 см.', N'antrium_dakota.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'NHS458', N'Букет лилий', 1, CAST(6400.00 AS Decimal(18, 2)), 25, 3, 1, 1, 4, 7, N'Лилия — род многолетних луковичных растений семейства Лилейные. Всего в роду чуть более сотни видов, родом из Азии и Северной Америки.
Лилии – растения травянистые, с прямостоячими стеблями, высотой от 60 до 180 см.', N'lilii.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SD0458', N'Спатифиллум', 1, CAST(1200.00 AS Decimal(18, 2)), 5, 3, 1, 2, 3, 10, N'Спатифиллум – многолетнее растение, имеющее небольшое корневище. Именно в нем сохраняются питательные вещества и влага. Особенностью растения является отсутствие стебля.
В зависимости от сорта, высота цветка варьируется от 15 см до полутора метров. ', N'spatifillum.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SD9458', N'Букет хризантем', 1, CAST(3500.00 AS Decimal(18, 2)), 5, 1, 2, 1, 3, 10, N'Хризантема – это многолетнее цветочное растение высотой от 25–60 см (горшочные формы) до 1,0–1,5 м. Всем ее частям присущ характерный терпкий аромат. Стебли у хризантем прямостоячие, голые или опушенные. Листья очередные, лопастные, зубчатые или цельнокрайные, окрашены в серо-зеленый, зеленый или темно-зеленый цвет. ', N'hrizantemi.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SF9458', N'Букет пионов', 1, CAST(7900.00 AS Decimal(18, 2)), 15, 2, 2, 1, 7, 15, N'Пионы (Paeonia) – цветущие растения из семейства пионовые. Это популярные декоративные растения, известные своими крупными, эффектными цветами. В природе встречаются пионы практически всех цветов, кроме голубых и синих. Аромат есть не у всех пионов и не очень сильный, но есть сорта, от запаха которых в буквальном смысле захватывает дух.', N'pioni.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SFR458', N'Букет тюльпанов', 1, CAST(3600.00 AS Decimal(18, 2)), 10, 3, 1, 1, 4, 15, N'Тюльпан — многолетнее травянистое растение луковичной формы, относится к семейству лилейных. Листья продолговатые, начинают расти из нижней части стебля. На одном стебле расположен один цветок. Цветовая гамма цветков тюльпана разнообразна. Период цветения приходится на конец апреля - май.', N'tulpani.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SHS458', N'Букет калл', 1, CAST(4800.00 AS Decimal(18, 2)), 25, 2, 1, 1, 4, 7, N'Калла, или зантедеския, это многолетнее травянистое растение высотой до 2,5 метров. Листья широкие, прикорневые, темно-зеленые. У некоторых сортов листья покрыты белыми пятнышками. Соцветие – початок желтого цвета на длинном цветоносе. Покрывало цветка крупное, воронкообразное, белое, розовое или желтое.', N'kalli.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SSS457', N'Букет роз', 1, CAST(7900.00 AS Decimal(18, 2)), 10, 1, 2, 1, 2, 13, N'Роза (лат. Rosa) — это кустарниковое растение, которое принадлежит семейству розовых (Rosaceae). Розы известны своей красотой и ароматом и широко используются для декоративных целей. В зависимости от сорта розы могут иметь разные оттенки цветков. Высота куста может варьироваться от 30 сантиметров до нескольких метров. Листья обычно с зазубренным или гладким краем. Они отличаются интенсивной зеленой окраской.', N'rozi.jpg')
INSERT [dbo].[Product] ([ProductArticle], [ProductName], [ProductUnit], [ProductCost], [ProductDiscountMax], [ProductManufacturer], [ProductProvider], [ProductCategory], [ProductDiscount], [ProductCount], [ProductDiscription], [ProductPhoto]) VALUES (N'SSS458', N'Замиокулькас', 1, CAST(2300.00 AS Decimal(18, 2)), 25, 3, 1, 2, 4, 7, N'амиокулькас входит в группу растений-суккулентов, которые в специальных клетках удерживают влагу. Долларовое дерево вырастает высотой до 1 м, формирует на мясистых стеблях темно-зеленые глянцевые листья, которые размещены попарно и напоминают большое перо. Клубнеобразный корень накапливает достаточно влаги для роста и развития растения в жаркое время года.', N'zamiokulkas.jpg')
GO
SET IDENTITY_INSERT [dbo].[Provider] ON 

INSERT [dbo].[Provider] ([ProviderID], [ProviderName]) VALUES (1, N'Цветочный рай')
INSERT [dbo].[Provider] ([ProviderID], [ProviderName]) VALUES (2, N'Цветик-семицветик')
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
ALTER DATABASE [DBFlowerPolina] SET  READ_WRITE 
GO
