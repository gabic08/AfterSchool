USE [master]
GO
/****** Object:  Database [AfterSchool]    Script Date: 30.05.2022 08:28:54 ******/
CREATE DATABASE [AfterSchool]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AfterSchool', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AfterSchool.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AfterSchool_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\AfterSchool_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [AfterSchool] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AfterSchool].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AfterSchool] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AfterSchool] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AfterSchool] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AfterSchool] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AfterSchool] SET ARITHABORT OFF 
GO
ALTER DATABASE [AfterSchool] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AfterSchool] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AfterSchool] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AfterSchool] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AfterSchool] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AfterSchool] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AfterSchool] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AfterSchool] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AfterSchool] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AfterSchool] SET  ENABLE_BROKER 
GO
ALTER DATABASE [AfterSchool] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AfterSchool] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AfterSchool] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AfterSchool] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AfterSchool] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AfterSchool] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AfterSchool] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AfterSchool] SET RECOVERY FULL 
GO
ALTER DATABASE [AfterSchool] SET  MULTI_USER 
GO
ALTER DATABASE [AfterSchool] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AfterSchool] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AfterSchool] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AfterSchool] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AfterSchool] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AfterSchool] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'AfterSchool', N'ON'
GO
ALTER DATABASE [AfterSchool] SET QUERY_STORE = OFF
GO
USE [AfterSchool]
GO
/****** Object:  Table [dbo].[GRUPA]    Script Date: 30.05.2022 08:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GRUPA](
	[ID] [int] NOT NULL,
	[AnScolar] [int] NOT NULL,
	[DenumireGrupa] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ELEV]    Script Date: 30.05.2022 08:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ELEV](
	[ID] [int] NOT NULL,
	[IdAfterS] [int] NOT NULL,
	[IdGrupa] [int] NULL,
	[Nume] [nvarchar](50) NOT NULL,
	[Prenume] [nvarchar](50) NOT NULL,
	[DataNastere] [date] NOT NULL,
	[Varsta] [int] NOT NULL,
	[DataInmatriculare] [date] NOT NULL,
	[NumeParinte] [nvarchar](50) NULL,
	[NrTelefon] [nvarchar](10) NULL,
	[Activ] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROFESOR]    Script Date: 30.05.2022 08:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROFESOR](
	[ID] [int] NOT NULL,
	[IdAfterS] [int] NOT NULL,
	[Nume] [nvarchar](50) NOT NULL,
	[Prenume] [nvarchar](50) NOT NULL,
	[Materie] [nvarchar](50) NULL,
	[Salariu] [int] NOT NULL,
	[Vechime] [int] NOT NULL,
	[Activ] [bit] NOT NULL,
	[Bonus] [int] NULL,
	[BonusProcentaj] [nvarchar](5) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PROFESORGRUPA]    Script Date: 30.05.2022 08:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PROFESORGRUPA](
	[ID] [int] NOT NULL,
	[IdGrupa] [int] NOT NULL,
	[IdProfesor] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Raport]    Script Date: 30.05.2022 08:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Raport] as
SELECT P.Nume AS [Nume Profesor],COUNT(E.ID) as [Numar Elevi],
G.DenumireGrupa AS[Denumire Grupa], G.AnScolar AS [An Scolar]
from PROFESOR as P JOIN PROFESORGRUPA as PG ON P.ID = PG.IdProfesor
JOIN GRUPA as G on PG.IdGrupa = G.ID
JOIN ELEV as E on G.ID = E.IdGrupa
GROUP BY P.Nume, G.DenumireGrupa, G.AnScolar
GO
/****** Object:  Table [dbo].[AFTERSCHOOL]    Script Date: 30.05.2022 08:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AFTERSCHOOL](
	[ID] [int] NOT NULL,
	[Denumire] [nvarchar](40) NOT NULL,
	[NrClase] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CLIENT]    Script Date: 30.05.2022 08:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CLIENT](
	[ID] [int] NOT NULL,
	[Nume] [nvarchar](20) NOT NULL,
	[Adresa] [nvarchar](60) NULL,
	[DataNasterii] [date] NOT NULL,
	[Email] [nvarchar](40) NOT NULL,
	[DataAbonare] [date] NOT NULL,
	[Activ] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMANDA]    Script Date: 30.05.2022 08:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMANDA](
	[ID] [int] NOT NULL,
	[IdClient] [int] NOT NULL,
	[DataComanda] [date] NOT NULL,
	[NrClienti] [int] NOT NULL,
	[PretTotal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INGHETATA]    Script Date: 30.05.2022 08:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGHETATA](
	[ID] [int] NOT NULL,
	[Denumire] [nvarchar](40) NOT NULL,
	[Descriere] [nvarchar](200) NOT NULL,
	[Pret] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[INGHETATACOMANDA]    Script Date: 30.05.2022 08:28:54 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[INGHETATACOMANDA](
	[ID] [int] NOT NULL,
	[IdComanda] [int] NOT NULL,
	[IdInghetata] [int] NOT NULL,
	[Cantitate] [int] NOT NULL,
	[PretTotat] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AFTERSCHOOL] ([ID], [Denumire], [NrClase]) VALUES (1, N'Raza de soare', 9)
INSERT [dbo].[AFTERSCHOOL] ([ID], [Denumire], [NrClase]) VALUES (2, N'Aurora', 2)
INSERT [dbo].[AFTERSCHOOL] ([ID], [Denumire], [NrClase]) VALUES (3, N'Happy Kids Academy', 5)
INSERT [dbo].[AFTERSCHOOL] ([ID], [Denumire], [NrClase]) VALUES (4, N'Butterfly', 4)
INSERT [dbo].[AFTERSCHOOL] ([ID], [Denumire], [NrClase]) VALUES (5, N'Clubul Jucausilor', 3)
INSERT [dbo].[AFTERSCHOOL] ([ID], [Denumire], [NrClase]) VALUES (6, N'Curcubeul Copilariei', 6)
GO
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (1, 1, NULL, N'Varza', N'Gabriel Catalin', CAST(N'2016-07-17' AS Date), 6, CAST(N'2021-10-11' AS Date), N'Grigore', N'0789424155', 0)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (2, 1, NULL, N'Dumitrescu', N'Cristina Ionela', CAST(N'2017-07-20' AS Date), 5, CAST(N'2019-05-14' AS Date), N'Adrian', N'0721343777', 0)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (3, 1, 1, N'Liliac', N'Adelin', CAST(N'2017-08-13' AS Date), 5, CAST(N'2019-10-22' AS Date), N'Robert', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (4, 1, 1, N'Tolea', N'Edward', CAST(N'2016-11-09' AS Date), 6, CAST(N'2022-01-10' AS Date), N'Mirel', N'0746545323', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (5, 1, 1, N'Pendea', N'Carmen', CAST(N'2017-07-12' AS Date), 5, CAST(N'2022-01-22' AS Date), N'Cosmin', N'0733121680', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (6, 1, 1, N'Sucleanta', N'Madalina Luciana', CAST(N'2017-07-06' AS Date), 6, CAST(N'2018-09-19' AS Date), N'Valentin', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (7, 1, 1, N'Bran', N'Florin Vlad', CAST(N'2016-02-21' AS Date), 6, CAST(N'2021-12-13' AS Date), N'Marius', N'0768491756', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (8, 1, 2, N'Cioran', N'Valentin Stefan', CAST(N'2016-03-11' AS Date), 6, CAST(N'2019-07-18' AS Date), N'Iuliana', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (9, 1, 2, N'Nicolae', N'Mario', CAST(N'2015-06-10' AS Date), 7, CAST(N'2021-10-02' AS Date), N'Aurel', N'0712101222', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (10, 1, 2, N'Titescu', N'Ioana', CAST(N'2015-05-10' AS Date), 7, CAST(N'2021-09-12' AS Date), N'Mirel', N'0726161568', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (11, 1, 2, N'Bogdanescu', N'Minodora', CAST(N'2016-01-01' AS Date), 6, CAST(N'2021-09-24' AS Date), N'Mircea', N'0771898256', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (12, 1, 2, N'Curteanu', N'Gabriel', CAST(N'2016-11-08' AS Date), 6, CAST(N'2021-06-18' AS Date), N'Mihaela', N'0726797284', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (13, 1, 2, N'Alecse', N'Iulia Elena', CAST(N'2016-10-23' AS Date), 6, CAST(N'2021-11-03' AS Date), N'Ileana', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (14, 1, 2, N'Diaconescu', N'Valentin', CAST(N'2015-11-11' AS Date), 7, CAST(N'2020-12-15' AS Date), N'Petre', N'0732156790', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (15, 1, 2, N'Petrescu', N'Maia Ionela', CAST(N'2015-08-26' AS Date), 7, CAST(N'2022-03-18' AS Date), N'Valeria', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (16, 1, 2, N'Catrina', N'Gabriela', CAST(N'2015-04-01' AS Date), 7, CAST(N'2021-08-02' AS Date), N'Petruta', N'0213445089', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (17, 1, 2, N'Pristanda', N'Ionel Marian', CAST(N'2016-07-14' AS Date), 6, CAST(N'2022-01-03' AS Date), N'Floricica', N'0726868324', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (18, 1, 2, N'Americanu', N'Ionut Willson', CAST(N'2015-08-09' AS Date), 7, CAST(N'2021-09-02' AS Date), N'John', N'9159969739', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (19, 1, 2, N'Calinescu', N'Ionut Cristian', CAST(N'2016-06-01' AS Date), 6, CAST(N'2020-03-03' AS Date), N'Mihai', N'0766512345', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (20, 1, 2, N'Bogdana', N'Flavia', CAST(N'2015-12-09' AS Date), 7, CAST(N'2021-12-12' AS Date), N'Georgel', N'0789858444', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (21, 1, 2, N'Tarb', N'Achim', CAST(N'2016-11-07' AS Date), 6, CAST(N'2019-09-18' AS Date), N'Sabin', N'0790321454', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (22, 1, 2, N'Taciu', N'Gabriel Justin', CAST(N'2015-05-08' AS Date), 7, CAST(N'2021-10-10' AS Date), N'Tudor', N'0722123434', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (23, 1, 2, N'Hebean', N'Sebastian', CAST(N'2016-10-08' AS Date), 6, CAST(N'2020-08-07' AS Date), N'Calin', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (24, 1, 2, N'Pedica', N'Patricia', CAST(N'2016-12-28' AS Date), 6, CAST(N'2020-08-27' AS Date), N'Cristian', N'0755121334', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (25, 1, 2, N'Petrescu', N'Lucian', CAST(N'2015-08-09' AS Date), 7, CAST(N'2022-03-09' AS Date), N'Mirela', N'0798757464', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (26, 1, 2, N'Nebru', N'Adelina', CAST(N'2016-09-10' AS Date), 6, CAST(N'2020-10-12' AS Date), N'Emil', N'0764656887', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (27, 1, 2, N'Constantinescu', N'Alexandru', CAST(N'2016-08-11' AS Date), 6, CAST(N'2019-10-12' AS Date), N'Petrisor', N'0753122665', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (28, 1, 2, N'Sava', N'Sergiu Mihai', CAST(N'2015-03-07' AS Date), 7, CAST(N'2019-11-01' AS Date), N'Serban', N'0769343112', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (29, 1, 2, N'Zaharia', N'Elena', CAST(N'2016-06-23' AS Date), 6, CAST(N'2021-09-15' AS Date), N'Aurelia', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (30, 1, 2, N'Fifere', N'Valentina', CAST(N'2016-11-09' AS Date), 6, CAST(N'2020-02-22' AS Date), N'Monica', N'0743565877', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (31, 1, 2, N'Barbu', N'Ionut Alexandru', CAST(N'2016-05-19' AS Date), 6, CAST(N'2021-05-27' AS Date), N'Emanuel', N'0743995897', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (32, 1, 2, N'Ispas', N'Florin', CAST(N'2015-06-21' AS Date), 7, CAST(N'2019-10-27' AS Date), N'Victor', N'0712343555', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (33, 1, 2, N'Sima', N'Andreea', CAST(N'2015-04-12' AS Date), 7, CAST(N'2020-01-03' AS Date), N'Octavian', N'0788654890', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (34, 1, 3, N'Popescu', N'William', CAST(N'2013-07-14' AS Date), 8, CAST(N'2019-06-27' AS Date), N'Monica', N'4148929343', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (35, 1, 3, N'Miculete', N'Mihai Adrian', CAST(N'2014-07-23' AS Date), 8, CAST(N'2022-04-19' AS Date), N'Iuliana', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (36, 1, 3, N'Aluminiu', N'Alexandru', CAST(N'2014-03-11' AS Date), 8, CAST(N'2019-12-13' AS Date), N'Mihai', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (37, 1, 3, N'Olteanu', N'Dacian', CAST(N'2015-06-07' AS Date), 7, CAST(N'2021-04-05' AS Date), N'Ovidiu', N'0768424126', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (38, 1, 3, N'Tirdei', N'Cristina Elena', CAST(N'2014-05-03' AS Date), 7, CAST(N'2019-11-11' AS Date), N'Bogdan', N'0779833901', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (39, 1, 3, N'Popescu', N'Roxana', CAST(N'2015-11-08' AS Date), 7, CAST(N'2019-08-03' AS Date), N'Mioara', N'0790123767', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (40, 1, 3, N'Grigore', N'Teodor', CAST(N'2014-08-23' AS Date), 8, CAST(N'2022-01-10' AS Date), N'Marcel', N'0771565788', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (41, 1, 3, N'Ghebaur', N'Theodor Gabriel', CAST(N'2014-09-24' AS Date), 8, CAST(N'2020-08-11' AS Date), N'Toma', N'0726979428', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (42, 1, 3, N'Brutaru', N'Daniela Cristina', CAST(N'2015-01-04' AS Date), 7, CAST(N'2012-03-29' AS Date), N'Ionel', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (43, 1, 4, N'Victor', N'Valeria Maria', CAST(N'2014-05-18' AS Date), 8, CAST(N'2020-04-04' AS Date), N'Oana', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (44, 1, 4, N'Bob', N'Alina Gabriela', CAST(N'2014-12-12' AS Date), 8, CAST(N'2019-08-01' AS Date), N'Petru', N'0768482884', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (45, 1, 4, N'Protopopescu', N'Adrian Madalin', CAST(N'2014-05-29' AS Date), 8, CAST(N'2019-06-04' AS Date), N'Stefania', N'0749010321', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (46, 1, 4, N'Filip', N'Petru', CAST(N'2014-08-01' AS Date), 8, CAST(N'2020-07-07' AS Date), N'Ion', N'0751474747', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (47, 1, 4, N'Mihai', N'Teodora', CAST(N'2014-02-05' AS Date), 8, CAST(N'2021-09-08' AS Date), N'Cornel', N'0771455633', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (48, 1, 4, N'Bordincel', N'Corina', CAST(N'2013-07-19' AS Date), 9, CAST(N'2022-02-07' AS Date), N'Titel', N'0788567455', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (49, 1, 4, N'Moatar', N'Eugen', CAST(N'2013-08-18' AS Date), 9, CAST(N'2020-05-12' AS Date), N'Mircea', N'0213556732', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (50, 1, 4, N'Ciolpan', N'Ana-Maria', CAST(N'2013-04-24' AS Date), 9, CAST(N'2022-03-21' AS Date), N'Adriana', N'0712555424', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (51, 1, 4, N'Popescu', N'Eduard', CAST(N'2013-05-07' AS Date), 9, CAST(N'2021-03-22' AS Date), N'Adrian', N'0798981332', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (52, 1, 5, N'Rait', N'Ivona', CAST(N'2014-01-09' AS Date), 9, CAST(N'2020-04-09' AS Date), N'Toma', N'0756424133', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (53, 1, 5, N'Iepure', N'Carla Simina', CAST(N'2014-09-13' AS Date), 9, CAST(N'2019-06-22' AS Date), N'Elena', N'0799878616', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (54, 1, 5, N'Tanasie', N'Ecaterina Teodora', CAST(N'2013-02-27' AS Date), 10, CAST(N'2020-01-30' AS Date), N'Denisa', N'0725666898', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (55, 1, 5, N'Barbuta', N'Ioana', CAST(N'2012-12-12' AS Date), 10, CAST(N'2019-10-01' AS Date), N'Ilie', N'0732114112', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (56, 1, 5, N'Tanasoiu', N'Toma Mircea', CAST(N'2014-01-04' AS Date), 9, CAST(N'2019-03-05' AS Date), N'Mihaela', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (57, 1, 5, N'Diaconescu', N'Dan Ionel', CAST(N'2013-07-06' AS Date), 9, CAST(N'2022-03-17' AS Date), N'Raul', N'0778909878', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (58, 1, 5, N'Oache', N'Christopher Mike', CAST(N'2013-06-09' AS Date), 9, CAST(N'2021-04-29' AS Date), N'Georgel', N'7864206154', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (59, 1, 5, N'Ciolpan', N'Ioana Mihaela', CAST(N'2013-08-26' AS Date), 9, CAST(N'2021-09-05' AS Date), N'Ilie', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (60, 1, 6, N'Ianau', N'Narcis', CAST(N'2012-08-19' AS Date), 10, CAST(N'2018-09-27' AS Date), N'Maria Elena', N'0789765443', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (61, 1, 6, N'Brutaru', N'Catalin', CAST(N'2012-10-09' AS Date), 10, CAST(N'2019-10-05' AS Date), N'Bogdan', N'0767515229', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (62, 1, 6, N'Saftoiu', N'Andi Daniel', CAST(N'2012-01-11' AS Date), 11, CAST(N'2021-09-25' AS Date), N'Costel', N'0776090816', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (63, 1, 6, N'Albuica', N'Catalina Ionela', CAST(N'2012-05-03' AS Date), 11, CAST(N'2022-02-06' AS Date), N'Florin', N'0742848268', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (64, 1, 6, N'Biaga', N'Florin', CAST(N'2012-02-20' AS Date), 11, CAST(N'2020-09-13' AS Date), N'Diana', N'0741320550', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (65, 1, 6, N'Olaru', N'Stefania Mihaela', CAST(N'2012-10-30' AS Date), 10, CAST(N'2021-10-22' AS Date), N'Gabriel', N'0746787009', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (66, 1, 6, N'Tudorache', N'Catalin', CAST(N'2011-09-29' AS Date), 11, CAST(N'2019-08-16' AS Date), N'Claudiu', N'0722555421', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (67, 1, 6, N'Suiu', N'Ana-Maria', CAST(N'2012-06-18' AS Date), 10, CAST(N'2020-01-17' AS Date), N'Minodora', N'0766777888', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (68, 1, 7, N'Skywalker', N'Luke', CAST(N'2010-10-02' AS Date), 12, CAST(N'2020-10-02' AS Date), N'Anakin', N'0712678909', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (69, 1, 7, N'Moldovan', N'Andrei Ilie', CAST(N'2011-09-08' AS Date), 11, CAST(N'2019-10-22' AS Date), N'Nicolae', N'0747888121', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (70, 1, 7, N'Cuza', N'Bianca Georgiana', CAST(N'2010-07-02' AS Date), 12, CAST(N'2022-07-26' AS Date), N'Mioara', N'0768909111', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (71, 1, 7, N'Georgescu', N'Alexandru Gabriel', CAST(N'2011-08-10' AS Date), 11, CAST(N'2019-04-18' AS Date), N'Tudor', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (72, 1, 7, N'Istrat', N'Alexandra', CAST(N'2010-01-28' AS Date), 12, CAST(N'2018-04-01' AS Date), N'Cristian', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (73, 1, 7, N'Lipan', N'Cristiano', CAST(N'2010-05-07' AS Date), 12, CAST(N'2020-10-22' AS Date), N'Victor', N'0782123456', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (74, 1, 7, N'Iliescu', N'Andreea Bianca', CAST(N'2011-08-26' AS Date), 11, CAST(N'2021-09-28' AS Date), N'Eugen', N'074543677', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (75, 1, 7, N'Buzescu', N'Radu Andrei', CAST(N'2011-06-14' AS Date), 11, CAST(N'2021-03-12' AS Date), N'Stefan', N'0776554223', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (76, 1, 8, N'Preda', N'Stefan', CAST(N'2010-07-23' AS Date), 12, CAST(N'2022-03-10' AS Date), N'Gheorghita', N'0799999101', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (77, 1, 8, N'Stroia', N'Melania', CAST(N'2010-10-22' AS Date), 12, CAST(N'2021-10-09' AS Date), N'Simona', N'0729665429', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (78, 1, 8, N'Stanisor', N'Angelica Elena', CAST(N'2009-04-17' AS Date), 13, CAST(N'2021-08-09' AS Date), N'Vasile', N'0742676588', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (79, 1, 8, N'Brutaru', N'Catalin', CAST(N'2009-08-10' AS Date), 13, CAST(N'2019-10-15' AS Date), N'Marian', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (80, 1, 8, N'Barbu', N'Victor', CAST(N'2010-04-03' AS Date), 12, CAST(N'2020-10-10' AS Date), N'Iulian', N'0744766898', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (81, 1, 8, N'Achim', N'Emilia', CAST(N'2008-07-19' AS Date), 14, CAST(N'2021-05-14' AS Date), N'Falvia', N'0721776534', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (82, 1, 8, N'Forda', N'Geanina', CAST(N'2009-05-05' AS Date), 13, CAST(N'2020-12-28' AS Date), N'Liviu', N'073212444', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (83, 1, 9, N'Oltianu', N'Flavius', CAST(N'2008-06-14' AS Date), 14, CAST(N'2019-08-06' AS Date), N'Dacian', N'0756434121', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (84, 1, 9, N'Emil', N'Sabina Sanziana', CAST(N'2008-04-21' AS Date), 14, CAST(N'2021-09-08' AS Date), N'Radu', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (85, 1, 9, N'Perian', N'Petrut', CAST(N'2008-07-22' AS Date), 14, CAST(N'2020-08-18' AS Date), N'Traian', N'0768919221', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (86, 1, 9, N'Kivu', N'Eusebia', CAST(N'2007-02-21' AS Date), 15, CAST(N'2021-09-15' AS Date), N'Camil', N'0764565811', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (87, 1, 9, N'Fetoiu', N'Marian', CAST(N'2008-01-08' AS Date), 14, CAST(N'2021-10-20' AS Date), N'Cornel', N'0747457534', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (88, 1, 9, N'Zoia', N'Bianca Maria', CAST(N'2007-06-07' AS Date), 15, CAST(N'2019-04-28' AS Date), N'Crina', N'0790120102', 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (89, 1, 9, N'Simionescu', N'Nicoleta', CAST(N'2007-09-11' AS Date), 15, CAST(N'2022-03-26' AS Date), N'Bucur', NULL, 1)
INSERT [dbo].[ELEV] ([ID], [IdAfterS], [IdGrupa], [Nume], [Prenume], [DataNastere], [Varsta], [DataInmatriculare], [NumeParinte], [NrTelefon], [Activ]) VALUES (90, 1, 9, N'Bizu', N'Leontin Mihai', CAST(N'2007-08-21' AS Date), 15, CAST(N'2021-07-13' AS Date), N'Tiberiu', N'0724343655', 1)
GO
INSERT [dbo].[GRUPA] ([ID], [AnScolar], [DenumireGrupa]) VALUES (1, 0, N'Floricele Colorate')
INSERT [dbo].[GRUPA] ([ID], [AnScolar], [DenumireGrupa]) VALUES (2, 1, N'Cercetasii')
INSERT [dbo].[GRUPA] ([ID], [AnScolar], [DenumireGrupa]) VALUES (3, 2, N'Fluturasii')
INSERT [dbo].[GRUPA] ([ID], [AnScolar], [DenumireGrupa]) VALUES (4, 3, N'Albinutele')
INSERT [dbo].[GRUPA] ([ID], [AnScolar], [DenumireGrupa]) VALUES (5, 4, N'Bucurosii')
INSERT [dbo].[GRUPA] ([ID], [AnScolar], [DenumireGrupa]) VALUES (6, 5, N'Piticii')
INSERT [dbo].[GRUPA] ([ID], [AnScolar], [DenumireGrupa]) VALUES (7, 6, N'Voinicii')
INSERT [dbo].[GRUPA] ([ID], [AnScolar], [DenumireGrupa]) VALUES (8, 7, N'Visatorii')
INSERT [dbo].[GRUPA] ([ID], [AnScolar], [DenumireGrupa]) VALUES (9, 8, N'Printii si printesele')
GO
INSERT [dbo].[PROFESOR] ([ID], [IdAfterS], [Nume], [Prenume], [Materie], [Salariu], [Vechime], [Activ], [Bonus], [BonusProcentaj]) VALUES (1, 1, N'Nicolae', N'Alin', N'Matematica', 7000, 28, 1, 840, N'12%')
INSERT [dbo].[PROFESOR] ([ID], [IdAfterS], [Nume], [Prenume], [Materie], [Salariu], [Vechime], [Activ], [Bonus], [BonusProcentaj]) VALUES (2, 1, N'Obada', N'Constantin', N'Istorie', 3800, 6, 1, 190, N'5%')
INSERT [dbo].[PROFESOR] ([ID], [IdAfterS], [Nume], [Prenume], [Materie], [Salariu], [Vechime], [Activ], [Bonus], [BonusProcentaj]) VALUES (3, 1, N'Tudor', N'Raluca', N'Literatura', 4500, 12, 1, 225, N'5%')
INSERT [dbo].[PROFESOR] ([ID], [IdAfterS], [Nume], [Prenume], [Materie], [Salariu], [Vechime], [Activ], [Bonus], [BonusProcentaj]) VALUES (4, 1, N'Ghinea', N'Maria', N'Geografie', 3000, 5, 1, 60, N'2%')
INSERT [dbo].[PROFESOR] ([ID], [IdAfterS], [Nume], [Prenume], [Materie], [Salariu], [Vechime], [Activ], [Bonus], [BonusProcentaj]) VALUES (5, 1, N'Albuica', N'Lucian', N'Informatica', 5500, 20, 1, 550, N'10%')
INSERT [dbo].[PROFESOR] ([ID], [IdAfterS], [Nume], [Prenume], [Materie], [Salariu], [Vechime], [Activ], [Bonus], [BonusProcentaj]) VALUES (6, 1, N'Copacelu', N'Mioara', N'Matematica', 4200, 10, 1, 210, N'5%')
INSERT [dbo].[PROFESOR] ([ID], [IdAfterS], [Nume], [Prenume], [Materie], [Salariu], [Vechime], [Activ], [Bonus], [BonusProcentaj]) VALUES (7, 2, N'Tudor', N'Alexandru', N'Istorie', 2900, 4, 1, 58, N'2%')
INSERT [dbo].[PROFESOR] ([ID], [IdAfterS], [Nume], [Prenume], [Materie], [Salariu], [Vechime], [Activ], [Bonus], [BonusProcentaj]) VALUES (8, 3, N'Mann', N'Adelina', N'Desen', 3000, 6, 1, 240, N'8%')
INSERT [dbo].[PROFESOR] ([ID], [IdAfterS], [Nume], [Prenume], [Materie], [Salariu], [Vechime], [Activ], [Bonus], [BonusProcentaj]) VALUES (9, 5, N'Motoci', N'Elena', N'Muzica', 4500, 23, 1, 450, N'10%')
GO
INSERT [dbo].[PROFESORGRUPA] ([ID], [IdGrupa], [IdProfesor]) VALUES (1, 1, 4)
INSERT [dbo].[PROFESORGRUPA] ([ID], [IdGrupa], [IdProfesor]) VALUES (2, 2, 8)
INSERT [dbo].[PROFESORGRUPA] ([ID], [IdGrupa], [IdProfesor]) VALUES (3, 3, 6)
INSERT [dbo].[PROFESORGRUPA] ([ID], [IdGrupa], [IdProfesor]) VALUES (4, 4, 2)
INSERT [dbo].[PROFESORGRUPA] ([ID], [IdGrupa], [IdProfesor]) VALUES (5, 5, 5)
INSERT [dbo].[PROFESORGRUPA] ([ID], [IdGrupa], [IdProfesor]) VALUES (6, 6, 3)
INSERT [dbo].[PROFESORGRUPA] ([ID], [IdGrupa], [IdProfesor]) VALUES (7, 7, 7)
INSERT [dbo].[PROFESORGRUPA] ([ID], [IdGrupa], [IdProfesor]) VALUES (8, 8, 9)
INSERT [dbo].[PROFESORGRUPA] ([ID], [IdGrupa], [IdProfesor]) VALUES (9, 9, 1)
GO
ALTER TABLE [dbo].[COMANDA]  WITH CHECK ADD FOREIGN KEY([IdClient])
REFERENCES [dbo].[CLIENT] ([ID])
GO
ALTER TABLE [dbo].[ELEV]  WITH CHECK ADD FOREIGN KEY([IdAfterS])
REFERENCES [dbo].[AFTERSCHOOL] ([ID])
GO
ALTER TABLE [dbo].[INGHETATACOMANDA]  WITH CHECK ADD FOREIGN KEY([IdComanda])
REFERENCES [dbo].[COMANDA] ([ID])
GO
ALTER TABLE [dbo].[INGHETATACOMANDA]  WITH CHECK ADD FOREIGN KEY([IdInghetata])
REFERENCES [dbo].[INGHETATA] ([ID])
GO
ALTER TABLE [dbo].[PROFESOR]  WITH CHECK ADD FOREIGN KEY([IdAfterS])
REFERENCES [dbo].[AFTERSCHOOL] ([ID])
GO
ALTER TABLE [dbo].[PROFESORGRUPA]  WITH CHECK ADD FOREIGN KEY([IdGrupa])
REFERENCES [dbo].[GRUPA] ([ID])
GO
ALTER TABLE [dbo].[PROFESORGRUPA]  WITH CHECK ADD FOREIGN KEY([IdProfesor])
REFERENCES [dbo].[PROFESOR] ([ID])
GO
ALTER TABLE [dbo].[ELEV]  WITH CHECK ADD CHECK  (([IdGrupa]=(9) OR [IdGrupa]=(8) OR [IdGrupa]=(7) OR [IdGrupa]=(6) OR [IdGrupa]=(5) OR [IdGrupa]=(4) OR [IdGrupa]=(3) OR [IdGrupa]=(2) OR [IdGrupa]=(1) OR [IdGrupa]=NULL))
GO
ALTER TABLE [dbo].[PROFESORGRUPA]  WITH CHECK ADD CHECK  (([IdGrupa]=(9) OR [IdGrupa]=(8) OR [IdGrupa]=(7) OR [IdGrupa]=(6) OR [IdGrupa]=(5) OR [IdGrupa]=(4) OR [IdGrupa]=(3) OR [IdGrupa]=(2) OR [IdGrupa]=(1)))
GO
ALTER TABLE [dbo].[PROFESORGRUPA]  WITH CHECK ADD CHECK  (([IdProfesor]=(9) OR [IdProfesor]=(8) OR [IdProfesor]=(7) OR [IdProfesor]=(6) OR [IdProfesor]=(5) OR [IdProfesor]=(4) OR [IdProfesor]=(3) OR [IdProfesor]=(2) OR [IdProfesor]=(1)))
GO
/****** Object:  StoredProcedure [dbo].[BonusProfesori]    Script Date: 30.05.2022 08:28:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BonusProfesori]
AS 
BEGIN 
DECLARE
@IdProfesor int = 1,
@NrProfesori int,
@Bonus float,
@BonusProcentaj nvarchar(10),
@Procent float = 0,
@Vechime int,
@Salariu int,
@NrElevi int;

SET NOCOUNT ON
SET @NrProfesori = (SELECT TOP(1) ID FROM PROFESOR ORDER BY ID DESC)

WHILE @IdProfesor <= @NrProfesori
BEGIN
IF EXISTS (SELECT P.VECHIME FROM PROFESOR as P WHERE ID = @IdProfesor)
BEGIN
	SET @Procent = 0
	SELECT @Vechime = P.VECHIME FROM PROFESOR as P WHERE ID = @IdProfesor
	IF (@Vechime <= 5)
		BEGIN
		SET @Procent = @Procent + 2
		END

	IF (@Vechime >= 6 AND @Vechime < 15)
		BEGIN
		SET @Procent = @Procent + 5
		END

	IF (@Vechime >= 15 AND @Vechime <= 25)
		BEGIN
		SET @Procent = @Procent + 10
		END

	IF (@Vechime >= 26) 
		BEGIN
		SET @Procent = @Procent + 12
		END
			

	SELECT @NrElevi = COUNT(E.ID) FROM PROFESOR as P JOIN PROFESORGRUPA as PG ON P.ID = PG.IdProfesor
	JOIN GRUPA as G on PG.IdGrupa = G.ID JOIN ELEV as E on G.ID = E.IdGrupa
	WHERE P.ID = @IdProfesor
			
	IF (@NrElevi < 20)
	BEGIN
		SET @Procent = @Procent + 0
	END

	IF (@NrElevi >= 21)
	BEGIN
		SET @Procent = @Procent + 3
	END
			
	SET @Salariu = (SELECT top(1) Salariu FROM PROFESOR WHERE ID = @IdProfesor);
	SET @Bonus = (@Procent/100)  * @Salariu
	SET @BonusProcentaj = CAST(@Procent as nvarchar(10)) + '%'
			
	UPDATE PROFESOR
	SET Bonus = @Bonus
	WHERE ID = @IdProfesor
			
	UPDATE PROFESOR
	SET BonusProcentaj = @BonusProcentaj
	WHERE ID = @IdProfesor

	SET @IdProfesor += 1
END
		
	ELSE 
	BEGIN
		SET @IdProfesor += 1
	END
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Elimina_Elev]    Script Date: 30.05.2022 08:28:55 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Elimina_Elev]
@IdElev INT 
AS
SET NOCOUNT ON

UPDATE ELEV SET
IdGrupa = NULL, Activ = 0
WHERE ID = @IdElev
GO
USE [master]
GO
ALTER DATABASE [AfterSchool] SET  READ_WRITE 
GO
