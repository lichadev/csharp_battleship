USE [master]
GO
/****** Object:  Database [trabajo_practico]    Script Date: 9/11/2023 17:28:20 ******/
CREATE DATABASE [trabajo_practico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'trabajo_practico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\trabajo_practico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'trabajo_practico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\trabajo_practico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [trabajo_practico] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [trabajo_practico].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [trabajo_practico] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [trabajo_practico] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [trabajo_practico] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [trabajo_practico] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [trabajo_practico] SET ARITHABORT OFF 
GO
ALTER DATABASE [trabajo_practico] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [trabajo_practico] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [trabajo_practico] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [trabajo_practico] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [trabajo_practico] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [trabajo_practico] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [trabajo_practico] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [trabajo_practico] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [trabajo_practico] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [trabajo_practico] SET  DISABLE_BROKER 
GO
ALTER DATABASE [trabajo_practico] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [trabajo_practico] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [trabajo_practico] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [trabajo_practico] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [trabajo_practico] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [trabajo_practico] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [trabajo_practico] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [trabajo_practico] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [trabajo_practico] SET  MULTI_USER 
GO
ALTER DATABASE [trabajo_practico] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [trabajo_practico] SET DB_CHAINING OFF 
GO
ALTER DATABASE [trabajo_practico] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [trabajo_practico] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [trabajo_practico] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [trabajo_practico] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [trabajo_practico] SET QUERY_STORE = ON
GO
ALTER DATABASE [trabajo_practico] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [trabajo_practico]
GO
/****** Object:  Table [dbo].[usergame]    Script Date: 9/11/2023 17:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usergame](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ID_USER_ONE] [int] NOT NULL,
	[ID_USER_TWO] [int] NOT NULL,
	[FINISH_COND] [int] NOT NULL,
 CONSTRAINT [PK_usergame] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userinfo]    Script Date: 9/11/2023 17:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userinfo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[username] [varchar](50) NOT NULL,
	[passwrd] [varchar](12) NOT NULL,
 CONSTRAINT [PK_userinfo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[usergame]  WITH CHECK ADD  CONSTRAINT [FK_usergame_userinfo] FOREIGN KEY([ID_USER_ONE])
REFERENCES [dbo].[userinfo] ([ID])
GO
ALTER TABLE [dbo].[usergame] CHECK CONSTRAINT [FK_usergame_userinfo]
GO
ALTER TABLE [dbo].[usergame]  WITH CHECK ADD  CONSTRAINT [FK_usergame_userinfo1] FOREIGN KEY([ID_USER_TWO])
REFERENCES [dbo].[userinfo] ([ID])
GO
ALTER TABLE [dbo].[usergame] CHECK CONSTRAINT [FK_usergame_userinfo1]
GO
/****** Object:  StoredProcedure [dbo].[BuscarUsuarioI]    Script Date: 9/11/2023 17:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[BuscarUsuarioI]
    @Email VARCHAR(255),
    @Password VARCHAR(255)
AS
BEGIN
    SELECT u.email, u.username, ug.*
    FROM userinfo u
    LEFT JOIN usergame ug
    ON u.ID = ug.ID_USER_ONE or u.ID = ug.ID_USER_TWO
    WHERE u.email = @Email AND u.passwrd = @Password;
END;
GO
/****** Object:  StoredProcedure [dbo].[RegistrarUsuario]    Script Date: 9/11/2023 17:28:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[RegistrarUsuario]
	@Email varchar,
	@Password varchar,
	@Username varchar
AS
BEGIN
	SET NOCOUNT ON;
	INSERT into userinfo values(@Email, @Username, @Password)
END
GO
USE [master]
GO
ALTER DATABASE [trabajo_practico] SET  READ_WRITE 
GO
