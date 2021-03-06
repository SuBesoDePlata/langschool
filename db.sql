USE [master]
GO
/****** Object:  Database [LangSchool]    Script Date: 18.12.2021 19:03:41 ******/
CREATE DATABASE [LangSchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LangSchool', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LangSchool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LangSchool_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\LangSchool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [LangSchool] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LangSchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LangSchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LangSchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LangSchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LangSchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LangSchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [LangSchool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LangSchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LangSchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LangSchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LangSchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LangSchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LangSchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LangSchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LangSchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LangSchool] SET  DISABLE_BROKER 
GO
ALTER DATABASE [LangSchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LangSchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LangSchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LangSchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LangSchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LangSchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LangSchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LangSchool] SET RECOVERY FULL 
GO
ALTER DATABASE [LangSchool] SET  MULTI_USER 
GO
ALTER DATABASE [LangSchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LangSchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LangSchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LangSchool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LangSchool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [LangSchool] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'LangSchool', N'ON'
GO
ALTER DATABASE [LangSchool] SET QUERY_STORE = OFF
GO
USE [LangSchool]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[Birthday] [date] NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[Email] [nvarchar](255) NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rolls]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rolls](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Rolls] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[DurationInSeconds] [int] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Discount] [float] NULL,
	[MainImagePath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [varbinary](max) NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 18.12.2021 19:03:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RollId] [int] NOT NULL,
	[Login] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (51, N'Оскар', N'Васильев', N'Богданович', CAST(N'1971-01-30' AS Date), CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'miturria@verizon.net', N'7(585)801-94-29 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (52, N'Алексей', N'Лазарев', N'Богданович', CAST(N'1977-03-10' AS Date), CAST(N'2017-01-02T00:00:00.000' AS DateTime), N'claesjac@me.com', N'7(0055)737-37-48 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (53, N'Дмитрий', N'Казаков', N'Русланович', CAST(N'1978-12-15' AS Date), CAST(N'2016-05-21T00:00:00.000' AS DateTime), N'ozawa@verizon.net', N'7(51)682-19-40 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (54, N'Харита', N'Попова', N'Якуновна', CAST(N'1997-12-16' AS Date), CAST(N'2016-07-05T00:00:00.000' AS DateTime), N'firstpr@verizon.net', N'7(335)386-81-06 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (55, N'Георгина', N'Турова', N'Семёновна', CAST(N'1974-05-28' AS Date), CAST(N'2018-02-22T00:00:00.000' AS DateTime), N'yruan@optonline.net', N'7(555)321-42-99 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (56, N'Станислав', N'Андреев', N'Максович', CAST(N'1975-10-10' AS Date), CAST(N'2017-12-26T00:00:00.000' AS DateTime), N'budinger@mac.com', N'7(02)993-91-28 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (57, N'Влада', N'Орлова', N'Мартыновна', CAST(N'1990-06-26' AS Date), CAST(N'2016-03-21T00:00:00.000' AS DateTime), N'rnelson@yahoo.ca', N'7(2506)433-38-35 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (58, N'Любава', N'Костина', N'Авксентьевна', CAST(N'1972-07-13' AS Date), CAST(N'2016-02-26T00:00:00.000' AS DateTime), N'gordonjcp@hotmail.com', N'7(6419)959-21-87 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (59, N'Станислав', N'Александров', N'Эдуардович', CAST(N'1981-07-04' AS Date), CAST(N'2018-11-08T00:00:00.000' AS DateTime), N'bigmauler@aol.com', N'7(18)164-05-12 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (60, N'Анэля', N'Корнилова', N'Михайловна', CAST(N'1973-04-02' AS Date), CAST(N'2016-05-22T00:00:00.000' AS DateTime), N'jonathan@aol.com', N'7(20)980-01-60 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (61, N'Наум', N'Морозов', N'Валерьянович', CAST(N'1985-07-04' AS Date), CAST(N'2016-05-02T00:00:00.000' AS DateTime), N'salesgeek@mac.com', N'7(636)050-96-13 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (62, N'Эльмира', N'Баранова', N'Дмитриевна', CAST(N'1977-01-15' AS Date), CAST(N'2016-07-08T00:00:00.000' AS DateTime), N'jgmyers@comcast.net', N'7(9240)643-15-50 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (63, N'Амелия', N'Степанова', N'Робертовна', CAST(N'1970-06-06' AS Date), CAST(N'2017-09-27T00:00:00.000' AS DateTime), N'rasca@hotmail.com', N'7(1217)441-28-42 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (64, N'Давид', N'Горбачёв', N'Тимурович', CAST(N'1983-05-22' AS Date), CAST(N'2018-12-17T00:00:00.000' AS DateTime), N'hedwig@att.net', N'7(53)602-85-41 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (65, N'Людвиг', N'Волков', N'Витальевич', CAST(N'1977-12-27' AS Date), CAST(N'2016-04-27T00:00:00.000' AS DateTime), N'jrkorson@msn.com', N'7(8459)592-05-58 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (66, N'Амалия', N'Комиссарова', N'Робертовна', CAST(N'1971-08-18' AS Date), CAST(N'2017-08-04T00:00:00.000' AS DateTime), N'jorgb@msn.com', N'7(22)647-46-32 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (67, N'Вадим', N'Большаков', N'Данилович', CAST(N'1970-05-15' AS Date), CAST(N'2018-08-04T00:00:00.000' AS DateTime), N'uncle@gmail.com', N'7(386)641-13-37 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (68, N'Станислав', N'Абрамов', N'Филатович', CAST(N'1989-05-18' AS Date), CAST(N'2016-12-08T00:00:00.000' AS DateTime), N'solomon@att.net', N'7(6545)478-87-79 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (69, N'Леонтий', N'Журавлёв', N'Яковлевич', CAST(N'2000-03-02' AS Date), CAST(N'2018-01-15T00:00:00.000' AS DateTime), N'cmdrgravy@me.com', N'7(4403)308-56-96 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (70, N'Глеб', N'Селиверстов', N'Максимович', CAST(N'1999-06-20' AS Date), CAST(N'2016-01-07T00:00:00.000' AS DateTime), N'jigsaw@sbcglobal.net', N'7(20)554-28-68 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (71, N'Устин', N'Киселёв', N'Яковлевич', CAST(N'1985-01-08' AS Date), CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'dalamb@verizon.net', N'7(83)334-52-76 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (72, N'Матвей', N'Зуев', N'Иванович', CAST(N'1981-03-28' AS Date), CAST(N'2018-12-18T00:00:00.000' AS DateTime), N'brickbat@verizon.net', N'7(5383)893-04-66 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (73, N'Глеб', N'Ершов', N'Федорович', CAST(N'1970-06-14' AS Date), CAST(N'2016-09-14T00:00:00.000' AS DateTime), N'sjava@aol.com', N'7(2608)298-40-82 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (74, N'Георгий', N'Бобылёв', N'Витальевич', CAST(N'1983-12-19' AS Date), CAST(N'2018-04-06T00:00:00.000' AS DateTime), N'csilvers@mac.com', N'7(88)685-13-51 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (75, N'Витольд', N'Ефремов', N'Авксентьевич', CAST(N'1975-12-02' AS Date), CAST(N'2018-04-09T00:00:00.000' AS DateTime), N'kwilliams@yahoo.ca', N'7(93)922-14-03 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (76, N'Патрисия', N'Андреева', N'Валерьевна', CAST(N'1993-11-18' AS Date), CAST(N'2016-07-17T00:00:00.000' AS DateTime), N'jigsaw@aol.com', N'7(9648)953-81-26 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (77, N'Магда', N'Ефимова', N'Платоновна', CAST(N'1995-08-16' AS Date), CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'rbarreira@me.com', N'7(9261)386-15-92 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (78, N'Иосиф', N'Голубев', N'Тимофеевич', CAST(N'1982-05-06' AS Date), CAST(N'2018-08-18T00:00:00.000' AS DateTime), N'smcnabb@att.net', N'7(78)972-73-11 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (79, N'Макар', N'Евсеев', N'Васильевич', CAST(N'1977-09-13' AS Date), CAST(N'2018-12-05T00:00:00.000' AS DateTime), N'parsimony@sbcglobal.net', N'7(2141)077-85-70 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (80, N'Агафон', N'Бобров', N'Лаврентьевич', CAST(N'1995-07-29' AS Date), CAST(N'2017-05-09T00:00:00.000' AS DateTime), N'petersen@comcast.net', N'7(2159)507-39-57 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (81, N'Захар', N'Игнатов', N'Павлович', CAST(N'1998-10-07' AS Date), CAST(N'2017-11-10T00:00:00.000' AS DateTime), N'dieman@icloud.com', N'7(578)574-73-36 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (82, N'Янита', N'Гущина', N'Федоровна', CAST(N'1999-03-02' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'lishoy@att.net', N'7(4544)716-68-96 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (83, N'Артур', N'Калашников', N'Юрьевич', CAST(N'1972-12-13' AS Date), CAST(N'2017-08-20T00:00:00.000' AS DateTime), N'oevans@aol.com', N'7(147)947-47-21 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (84, N'Элина', N'Дмитриева', N'Даниловна', CAST(N'1988-12-10' AS Date), CAST(N'2017-02-11T00:00:00.000' AS DateTime), N'vmalik@live.com', N'7(787)140-48-84 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (85, N'Сандра', N'Федотова', N'Владленовна', CAST(N'1985-03-29' AS Date), CAST(N'2016-11-08T00:00:00.000' AS DateTime), N'penna@verizon.net', N'7(126)195-25-86 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (86, N'Дэнна', N'Кузьмина', N'Витальевна', CAST(N'1993-08-24' AS Date), CAST(N'2016-03-27T00:00:00.000' AS DateTime), N'nichoj@mac.com', N'7(9940)977-45-73 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (87, N'Злата', N'Колобова', N'Романовна', CAST(N'1994-08-25' AS Date), CAST(N'2016-12-03T00:00:00.000' AS DateTime), N'sinkou@aol.com', N'7(50)884-07-35 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (88, N'Варлам', N'Некрасов', N'Михайлович', CAST(N'2000-11-12' AS Date), CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'dogdude@verizon.net', N'7(019)258-06-35 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (89, N'Орест', N'Колобов', N'Юлианович', CAST(N'2001-07-14' AS Date), CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'parkes@verizon.net', N'7(1680)508-58-26 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (90, N'Пантелеймон', N'Блохин', N'Феликсович', CAST(N'1978-03-06' AS Date), CAST(N'2018-02-14T00:00:00.000' AS DateTime), N'balchen@comcast.net', N'7(9524)556-48-98 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (91, N'Петр', N'Калинин', N'Иванович', CAST(N'1993-09-08' AS Date), CAST(N'2016-05-26T00:00:00.000' AS DateTime), N'aschmitz@hotmail.com', N'7(90)316-07-17 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (92, N'Сабрина', N'Беляева', N'Федосеевна', CAST(N'1972-07-26' AS Date), CAST(N'2017-06-14T00:00:00.000' AS DateTime), N'agapow@gmail.com', N'7(6580)534-32-58 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (93, N'Юстиниан', N'Агафонов', N'Олегович', CAST(N'1997-02-02' AS Date), CAST(N'2016-06-08T00:00:00.000' AS DateTime), N'staffelb@sbcglobal.net', N'7(303)810-28-78 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (94, N'Марфа', N'Мамонтова', N'Мироновна', CAST(N'1984-10-19' AS Date), CAST(N'2018-02-27T00:00:00.000' AS DateTime), N'rfoley@verizon.net', N'7(38)095-64-18 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (95, N'Евгений', N'Блинов', N'Мэлсович', CAST(N'1994-01-05' AS Date), CAST(N'2017-05-07T00:00:00.000' AS DateTime), N'moxfulder@outlook.com', N'7(0852)321-82-64 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (96, N'Изабелла', N'Воронова', N'Вячеславовна', CAST(N'1999-09-24' AS Date), CAST(N'2017-12-21T00:00:00.000' AS DateTime), N'kildjean@sbcglobal.net', N'7(17)433-44-98 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (97, N'Святослав', N'Медведев', N'Юлианович', CAST(N'1972-10-04' AS Date), CAST(N'2018-10-13T00:00:00.000' AS DateTime), N'hllam@comcast.net', N'7(3520)435-21-20 ', N'1', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (98, N'Эвелина', N'Куликова', N'Вячеславовна', CAST(N'1997-11-14' AS Date), CAST(N'2018-02-01T00:00:00.000' AS DateTime), N'ilikered@hotmail.com', N'7(0236)682-42-78 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (99, N'Божена', N'Суворова', N'Анатольевна', CAST(N'1981-03-09' AS Date), CAST(N'2016-01-28T00:00:00.000' AS DateTime), N'attwood@aol.com', N'7(347)895-86-57 ', N'2', NULL)
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [Birthday], [RegistrationDate], [Email], [Phone], [GenderCode], [PhotoPath]) VALUES (100, N'Амалия', N'Егорова', N'Дамировна', CAST(N'1999-09-28' AS Date), CAST(N'2016-06-30T00:00:00.000' AS DateTime), N'drezet@yahoo.com', N'7(7486)408-12-26 ', N'2', NULL)
SET IDENTITY_INSERT [dbo].[Client] OFF
GO
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 100, 87, CAST(N'2019-11-16T11:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 67, 51, CAST(N'2019-01-11T18:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 75, 21, CAST(N'2019-12-01T14:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 81, 95, CAST(N'2019-02-11T13:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 97, 87, CAST(N'2019-09-10T18:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 88, 100, CAST(N'2019-02-12T19:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 54, 61, CAST(N'2019-04-04T09:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 67, 100, CAST(N'2019-05-15T09:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 100, 100, CAST(N'2019-01-16T14:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 60, 100, CAST(N'2019-01-16T09:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 67, 100, CAST(N'2019-03-15T10:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 69, 61, CAST(N'2019-01-31T12:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 63, 14, CAST(N'2019-11-19T15:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 88, 87, CAST(N'2019-01-10T08:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 97, 100, CAST(N'2019-04-29T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 77, 41, CAST(N'2019-10-12T08:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 81, 100, CAST(N'2019-02-13T18:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 75, 21, CAST(N'2019-02-01T18:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 83, 21, CAST(N'2019-11-12T18:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 85, 58, CAST(N'2019-01-11T12:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 69, 95, CAST(N'2019-03-23T19:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 84, 79, CAST(N'2019-06-23T08:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 81, 75, CAST(N'2019-05-25T17:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 97, 58, CAST(N'2019-02-18T18:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 100, 100, CAST(N'2019-07-17T08:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 100, 61, CAST(N'2019-08-06T16:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 88, 87, CAST(N'2019-12-14T08:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 88, 100, CAST(N'2019-06-28T14:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 81, 40, CAST(N'2019-06-06T19:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 80, 100, CAST(N'2019-06-07T17:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 83, 91, CAST(N'2019-04-30T18:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 62, 100, CAST(N'2019-08-30T11:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 88, 100, CAST(N'2019-05-08T14:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 54, 72, CAST(N'2019-10-27T16:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 58, 41, CAST(N'2019-01-05T08:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 88, 87, CAST(N'2019-03-04T17:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 78, 87, CAST(N'2019-09-29T13:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 100, 100, CAST(N'2019-01-22T10:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 100, 78, CAST(N'2019-12-19T19:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 89, 87, CAST(N'2019-11-15T17:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 69, 25, CAST(N'2019-07-04T17:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 54, 48, CAST(N'2019-08-06T11:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 97, 58, CAST(N'2019-11-09T13:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 69, 86, CAST(N'2019-02-16T18:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 100, 95, CAST(N'2019-03-03T17:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 97, 100, CAST(N'2019-05-22T16:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 100, 100, CAST(N'2019-07-31T18:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 100, 75, CAST(N'2019-08-29T19:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 100, 58, CAST(N'2019-10-02T10:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 100, 99, CAST(N'2019-03-16T11:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 77, 100, CAST(N'2019-08-27T11:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 87, 54, CAST(N'2019-06-13T11:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 68, 79, CAST(N'2019-08-18T16:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 56, 87, CAST(N'2019-12-26T16:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 89, 100, CAST(N'2019-11-27T18:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 69, 64, CAST(N'2019-09-06T19:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 75, 99, CAST(N'2019-09-24T13:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 97, 100, CAST(N'2019-03-01T11:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 65, 100, CAST(N'2019-09-28T10:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 74, 61, CAST(N'2019-03-20T10:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 56, 95, CAST(N'2019-11-27T11:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 59, 85, CAST(N'2019-01-23T18:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 77, 99, CAST(N'2019-10-21T10:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 82, 61, CAST(N'2019-08-11T12:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 93, 87, CAST(N'2019-01-03T14:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 75, 95, CAST(N'2019-12-31T08:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 71, 100, CAST(N'2019-08-29T10:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 85, 72, CAST(N'2019-01-03T18:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 71, 100, CAST(N'2019-04-09T11:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 97, 100, CAST(N'2019-12-31T19:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 61, 95, CAST(N'2019-10-17T13:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 65, 72, CAST(N'2019-05-17T13:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 77, 100, CAST(N'2019-11-23T18:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 70, 95, CAST(N'2019-07-10T15:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 64, 99, CAST(N'2019-06-09T13:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 98, 95, CAST(N'2019-01-09T10:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 69, 85, CAST(N'2019-08-15T18:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 82, 79, CAST(N'2019-07-15T14:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 77, 100, CAST(N'2019-12-31T18:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 95, 100, CAST(N'2019-12-22T09:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 52, 87, CAST(N'2019-12-28T16:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 62, 99, CAST(N'2019-06-26T10:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 78, 100, CAST(N'2019-04-29T12:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 87, 100, CAST(N'2019-04-13T09:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 77, 100, CAST(N'2019-01-05T16:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 91, 28, CAST(N'2019-03-25T18:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 95, 87, CAST(N'2019-11-09T18:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 66, 99, CAST(N'2019-04-07T10:40:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 99, 100, CAST(N'2019-11-11T18:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 100, 95, CAST(N'2019-01-06T15:00:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 87, 100, CAST(N'2019-08-20T19:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 89, 100, CAST(N'2019-04-16T13:20:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 57, 100, CAST(N'2019-12-22T15:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 65, 100, CAST(N'2019-01-22T16:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 94, 95, CAST(N'2019-09-04T08:10:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 93, 81, CAST(N'2019-01-01T14:50:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 98, 100, CAST(N'2019-01-29T16:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 60, 100, CAST(N'2019-07-06T11:30:00.000' AS DateTime), N'')
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 76, 99, CAST(N'2019-12-05T10:20:00.000' AS DateTime), N'')
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 95, 100, CAST(N'2019-04-05T13:20:00.000' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[ClientService] OFF
GO
SET IDENTITY_INSERT [dbo].[DocumentByService] ON 

INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (1, 69, NULL)
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (2, 84, NULL)
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (3, 61, NULL)
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (4, 77, NULL)
INSERT [dbo].[DocumentByService] ([ID], [ClientServiceID], [DocumentPath]) VALUES (5, 85, NULL)
SET IDENTITY_INSERT [dbo].[DocumentByService] OFF
GO
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'1', N'Мужской')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'2', N'Женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'3', N'Нейтрал')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'4', N'Бисексуал')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'5', N'Пансексуал')
GO
SET IDENTITY_INSERT [dbo].[Manufacturer] ON 

INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (1, N'EGS', NULL)
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (2, N'Ubisoft', NULL)
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (3, N'Ea', NULL)
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (4, N'RockStar', NULL)
INSERT [dbo].[Manufacturer] ([ID], [Name], [StartDate]) VALUES (5, N'11bit', NULL)
SET IDENTITY_INSERT [dbo].[Manufacturer] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (1, N'English Grammar in Use. Book with Answers', 699.0000, NULL, NULL, 1, 1)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (2, N'Use your Girl Power!', 749.0000, NULL, NULL, 0, 3)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (4, N'Essential Grammar in Use', 899.0000, NULL, NULL, 1, 5)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (5, N'English Grammar: Reference & Practice', 299.0000, NULL, NULL, 0, 4)
INSERT [dbo].[Product] ([ID], [Title], [Cost], [Description], [MainImagePath], [IsActive], [ManufacturerID]) VALUES (7, N'English Vocabulary in Use Pre-intermediate', 449.0000, NULL, NULL, 1, 4)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductPhoto] ON 

INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (1, 1, NULL)
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (3, 2, NULL)
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (4, 4, NULL)
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (5, 7, NULL)
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (6, 5, NULL)
INSERT [dbo].[ProductPhoto] ([ID], [ProductID], [PhotoPath]) VALUES (7, 1, NULL)
SET IDENTITY_INSERT [dbo].[ProductPhoto] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSale] ON 

INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (2, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 2, 1, 68)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (3, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 5, 45, 77)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (5, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 7, 666, 89)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (7, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 4, 987, 66)
INSERT [dbo].[ProductSale] ([ID], [SaleDate], [ProductID], [Quantity], [ClientServiceID]) VALUES (8, CAST(N'2021-12-18T00:00:00.000' AS DateTime), 1, 6999, 84)
SET IDENTITY_INSERT [dbo].[ProductSale] OFF
GO
SET IDENTITY_INSERT [dbo].[Rolls] ON 

INSERT [dbo].[Rolls] ([ID], [Name]) VALUES (1, N'Admin')
INSERT [dbo].[Rolls] ([ID], [Name]) VALUES (2, N'User')
SET IDENTITY_INSERT [dbo].[Rolls] OFF
GO
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (1, N'Киноклуб китайского языка для студентов', 1990.0000, 6000, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (2, N'Киноклуб немецкого языка для взрослых', 1560.0000, 6000, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (3, N'Урок в группе испанского языка для студентов', 1310.0000, 6000, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (4, N'Киноклуб китайского языка для детей', 1120.0000, 6000, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (5, N'Индивидуальный урок немецкого языка с преподавателем-носителем языка', 1340.0000, 6600, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (6, N'Интенсивный курс с преподавателем-носителем английского языка для компаний', 1670.0000, 6600, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (7, N'Урок в группе итальянского языка для студентов', 1020.0000, 6600, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (8, N'Киноклуб итальянского языка для взрослых', 1760.0000, 6600, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (9, N'Интенсивный курс итальянского языка с русскоязычным преподавателем для компаний', 900.0000, 6600, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (10, N'Занятие с репетитором-носителем китайского языка', 1950.0000, 7200, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (11, N'Интенсивный онлайн-курс испанского языка для компаний по Skype', 1510.0000, 7200, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (12, N'Индивидуальный урок китайского языка с русскоязычным преподавателем', 1860.0000, 7200, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (13, N'Интенсивный курс с преподавателем-носителем немецкого языка для компаний', 1180.0000, 7200, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (14, N'Интенсивный онлайн-курс китайского языка для компаний по Skype', 1760.0000, 7200, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (15, N'Урок в группе французского языка для взрослых', 960.0000, 7200, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (16, N'Киноклуб немецкого языка для детей', 1670.0000, 7200, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (17, N'Урок в группе испанского языка для взрослых', 1730.0000, 1800, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (18, N'Киноклуб португальского языка для студентов', 1170.0000, 1800, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (19, N'Урок в группе немецкого языка для школьников', 1570.0000, 1800, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (20, N'Занятие с русскоязычным репетитором немецкого языка', 1420.0000, 1800, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (21, N'Индивидуальный урок немецкого языка с русскоязычным преподавателем', 990.0000, 1800, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (22, N'Киноклуб португальского языка для взрослых', 950.0000, 1800, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (23, N'Урок в группе французского языка для студентов', 1910.0000, 1800, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (24, N'Интенсивный онлайн-курс французского языка для компаний по Skype', 1180.0000, 2400, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (25, N'Индивидуальный урок французского языка с преподавателем-носителем языка', 1410.0000, 2400, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (26, N'Интенсивный курс с преподавателем-носителем итальянского языка для компаний', 1190.0000, 2400, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (27, N'Урок в группе китайского языка для студентов', 2000.0000, 2400, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (28, N'Занятие с русскоязычным репетитором японского языка', 1260.0000, 2400, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (29, N'Киноклуб английского языка для детей', 1280.0000, 2400, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (30, N'Киноклуб итальянского языка для студентов', 1760.0000, 1800, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (31, N'Индивидуальный урок итальянского языка с русскоязычным преподавателем', 1330.0000, 1800, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (32, N'Индивидуальный урок английского языка с русскоязычным преподавателем', 1910.0000, 1800, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (33, N'Интенсивный курс с преподавателем-носителем португальского языка для компаний', 1580.0000, 1800, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (34, N'Урок в группе японского языка для студентов', 1860.0000, 3000, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (35, N'Занятие с репетитором-носителем испанского языка', 1090.0000, 3000, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (36, N'Интенсивный онлайн-курс английского языка для компаний по Skype', 1160.0000, 3000, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (37, N'Урок в группе английского языка для взрослых', 1010.0000, 3000, N'0,25', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (38, N'Урок в группе китайского языка для школьников', 1180.0000, 3000, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (39, N'Занятие с русскоязычным репетитором португальского языка', 1970.0000, 3000, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (40, N'Занятие с репетитором-носителем японского языка', 1100.0000, 3000, N'0,25', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (41, N'Киноклуб испанского языка для студентов', 1050.0000, 2400, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (42, N'Урок в группе итальянского языка для взрослых', 1290.0000, 2400, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (43, N'Подготовка к экзамену SAT', 1560.0000, 2400, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (44, N'Интенсивный курс французского языка с русскоязычным преподавателем для компаний', 1940.0000, 2400, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (45, N'Интенсивный онлайн-курс итальянского языка для компаний по Skype', 1230.0000, 4200, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (46, N'Урок в группе китайского языка для взрослых', 1730.0000, 4200, N'0,25', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (47, N'Индивидуальный онлайн-урок испанского языка по Skype', 1780.0000, 4200, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (48, N'Индивидуальный онлайн-урок китайского языка по Skype', 1410.0000, 4200, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (49, N'Интенсивный онлайн-курс немецкого языка для компаний по Skype', 1840.0000, 4200, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (50, N'Индивидуальный урок французского языка с русскоязычным преподавателем', 1390.0000, 4200, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (51, N'Занятие с русскоязычным репетитором итальянского языка', 1620.0000, 4200, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (52, N'Урок в группе немецкого языка для студентов', 1240.0000, 4200, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (53, N'Интенсивный курс с преподавателем-носителем японского языка для компаний', 1380.0000, 4200, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (54, N'Индивидуальный онлайн-урок японского языка по Skype', 1000.0000, 4800, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (55, N'Урок в группе английского языка для студентов', 960.0000, 4800, N'0,25', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (56, N'Киноклуб английского языка для студентов', 980.0000, 4800, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (57, N'Интенсивный курс английского языка с русскоязычным преподавателем для компаний', 1210.0000, 4800, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (58, N'Занятие с русскоязычным репетитором испанского языка', 1450.0000, 3000, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (59, N'Подготовка к экзамену ACT', 1440.0000, 3000, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (60, N'Киноклуб немецкого языка для студентов', 1140.0000, 3000, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (61, N'Занятие с репетитором-носителем французского языка', 2040.0000, 3000, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (62, N'Киноклуб французского языка для взрослых', 1770.0000, 5400, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (63, N'Интенсивный курс испанского языка с русскоязычным преподавателем для компаний', 1000.0000, 5400, N'0,25', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (64, N'Индивидуальный урок испанского языка с русскоязычным преподавателем', 1790.0000, 3600, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (65, N'Урок в группе немецкого языка для взрослых', 930.0000, 3600, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (66, N'Интенсивный курс португальского языка с русскоязычным преподавателем для компаний', 2010.0000, 3600, N'0,25', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (67, N'Урок в группе французского языка для школьников', 1970.0000, 6000, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (68, N'Подготовка к экзамену TOEFL', 1070.0000, 6000, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (69, N'Урок в группе итальянского языка для школьников', 1410.0000, 6000, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (70, N'Занятие с русскоязычным репетитором французского языка', 1870.0000, 6000, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (71, N'Индивидуальный онлайн-урок английского языка по Skype', 1880.0000, 6000, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (72, N'Занятие с репетитором-носителем английского языка', 910.0000, 6600, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (73, N'Урок в группе английского языка для школьников', 900.0000, 6600, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (74, N'Интенсивный курс китайского языка с русскоязычным преподавателем для компаний', 1470.0000, 6600, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (75, N'Занятие с русскоязычным репетитором китайского языка', 940.0000, 6600, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (76, N'Интенсивный онлайн-курс португальского языка для компаний по Skype', 1610.0000, 4200, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (77, N'Киноклуб английского языка для взрослых', 1250.0000, 4200, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (78, N'Интенсивный курс с преподавателем-носителем французского языка для компаний', 1630.0000, 4200, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (79, N'Киноклуб китайского языка для взрослых', 1800.0000, 4200, N'0,25', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (80, N'Подготовка к экзамену GMAT', 1150.0000, 4200, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (81, N'Киноклуб итальянского языка для детей', 1480.0000, 4200, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (82, N'Занятие с репетитором-носителем итальянского языка', 1370.0000, 7200, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (83, N'Урок в группе испанского языка для школьников', 1910.0000, 7200, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (84, N'Подготовка к экзамену IELTS', 1730.0000, 7200, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (85, N'Занятие с репетитором-носителем немецкого языка', 1120.0000, 7200, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (86, N'Индивидуальный урок английского языка с преподавателем-носителем языка', 1300.0000, 7200, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (87, N'Индивидуальный онлайн-урок французского языка по Skype', 2010.0000, 7200, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (88, N'Урок в группе японского языка для школьников', 1300.0000, 4800, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (89, N'Подготовка к экзамену GRE', 1300.0000, 4800, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (90, N'Интенсивный курс японского языка с русскоязычным преподавателем для компаний', 1500.0000, 4800, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (91, N'Индивидуальный урок итальянского языка с преподавателем-носителем языка', 1690.0000, 4800, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (92, N'Урок в группе японского языка для взрослых', 1420.0000, 4800, N'0,05', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (93, N'Индивидуальный урок испанского языка с преподавателем-носителем языка', 1200.0000, 5400, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (94, N'Индивидуальный онлайн-урок немецкого языка по Skype', 970.0000, 5400, N'0', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (95, N'Индивидуальный урок китайского языка с преподавателем-носителем языка', 1480.0000, 5400, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (96, N'Подготовка к экзамену IELTS Speaking Club', 1430.0000, 5400, N'0,2', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (97, N'Киноклуб португальского языка для детей', 1710.0000, 5400, N'0,15', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (98, N'Киноклуб французского языка для детей', 1600.0000, 5400, N'0,1', NULL, NULL)
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (99, N'Занятие с русскоязычным репетитором английского языка', 1950.0000, 5400, N'0,15', NULL, NULL)
GO
INSERT [dbo].[Service] ([ID], [Title], [Cost], [DurationInSeconds], [Description], [Discount], [MainImagePath]) VALUES (100, N'Интенсивный курс с преподавателем-носителем испанского языка для компаний', 1660.0000, 5400, N'0', NULL, NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
GO
SET IDENTITY_INSERT [dbo].[ServicePhoto] ON 

INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (1, 5, NULL)
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (2, 26, NULL)
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (3, 34, NULL)
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (4, 98, NULL)
INSERT [dbo].[ServicePhoto] ([ID], [ServiceID], [PhotoPath]) VALUES (5, 76, NULL)
SET IDENTITY_INSERT [dbo].[ServicePhoto] OFF
GO
SET IDENTITY_INSERT [dbo].[Tag] ON 

INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (2, N'A1', N'Red   ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (3, N'A2', N'Pink  ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (4, N'B1', N'Blue  ')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (5, N'B2', N'Yellow')
INSERT [dbo].[Tag] ([ID], [Title], [Color]) VALUES (7, N'C1', N'Black ')
SET IDENTITY_INSERT [dbo].[Tag] OFF
GO
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (52, 2)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (53, 4)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (54, 7)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (55, 5)
INSERT [dbo].[TagOfClient] ([ClientID], [TagID]) VALUES (69, 3)
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [RollId], [Login], [Password]) VALUES (1, N'admin', 1, N'admin', N'admin')
INSERT [dbo].[User] ([ID], [Name], [RollId], [Login], [Password]) VALUES (2, N'user', 2, N'user', N'0000')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Rolls] FOREIGN KEY([RollId])
REFERENCES [dbo].[Rolls] ([ID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Rolls]
GO
USE [master]
GO
ALTER DATABASE [LangSchool] SET  READ_WRITE 
GO
