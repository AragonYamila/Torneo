USE [master]
GO
/****** Object:  Database [TorneoDatabase]    Script Date: 16/11/2023 11:34:23 ******/
CREATE DATABASE [TorneoDatabase]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TorneoDatabase', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TorneoDatabase.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TorneoDatabase_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\TorneoDatabase_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [TorneoDatabase] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TorneoDatabase].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TorneoDatabase] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TorneoDatabase] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TorneoDatabase] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TorneoDatabase] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TorneoDatabase] SET ARITHABORT OFF 
GO
ALTER DATABASE [TorneoDatabase] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TorneoDatabase] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TorneoDatabase] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TorneoDatabase] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TorneoDatabase] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TorneoDatabase] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TorneoDatabase] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TorneoDatabase] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TorneoDatabase] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TorneoDatabase] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TorneoDatabase] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TorneoDatabase] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TorneoDatabase] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TorneoDatabase] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TorneoDatabase] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TorneoDatabase] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TorneoDatabase] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TorneoDatabase] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TorneoDatabase] SET  MULTI_USER 
GO
ALTER DATABASE [TorneoDatabase] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TorneoDatabase] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TorneoDatabase] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TorneoDatabase] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TorneoDatabase] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TorneoDatabase] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TorneoDatabase] SET QUERY_STORE = ON
GO
ALTER DATABASE [TorneoDatabase] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [TorneoDatabase]
GO
/****** Object:  Table [dbo].[Torneo]    Script Date: 16/11/2023 11:34:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Torneo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](20) NULL,
	[CantidadParticipantes] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Habilitado] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Torneo] ON 

INSERT [dbo].[Torneo] ([Id], [Nombre], [CantidadParticipantes], [Fecha], [Habilitado]) VALUES (1, N'Copa de la Liga', 28, CAST(N'2023-11-17' AS Date), 0)
INSERT [dbo].[Torneo] ([Id], [Nombre], [CantidadParticipantes], [Fecha], [Habilitado]) VALUES (2, N'Torneo prueba', 13, CAST(N'2023-10-30' AS Date), 1)
INSERT [dbo].[Torneo] ([Id], [Nombre], [CantidadParticipantes], [Fecha], [Habilitado]) VALUES (3, N'Copa Piston', 18, CAST(N'2023-12-12' AS Date), 1)
INSERT [dbo].[Torneo] ([Id], [Nombre], [CantidadParticipantes], [Fecha], [Habilitado]) VALUES (4, N'Copa Sudamericana', 19, CAST(N'2023-11-27' AS Date), 1)
INSERT [dbo].[Torneo] ([Id], [Nombre], [CantidadParticipantes], [Fecha], [Habilitado]) VALUES (5, N'Copa Us Open', 30, CAST(N'2023-12-30' AS Date), 1)
INSERT [dbo].[Torneo] ([Id], [Nombre], [CantidadParticipantes], [Fecha], [Habilitado]) VALUES (6, N'Torneo Conurbano', 28, CAST(N'2023-12-22' AS Date), 0)
INSERT [dbo].[Torneo] ([Id], [Nombre], [CantidadParticipantes], [Fecha], [Habilitado]) VALUES (7, N'Wembley', 25, CAST(N'2023-11-30' AS Date), 1)
SET IDENTITY_INSERT [dbo].[Torneo] OFF
GO
USE [master]
GO
ALTER DATABASE [TorneoDatabase] SET  READ_WRITE 
GO
