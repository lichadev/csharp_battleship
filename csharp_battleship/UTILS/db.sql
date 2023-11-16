USE [master]
GO

/****** Object:  Database [trabajo_practico]    Script Date: 16/11/2023 17:01:18 ******/
DROP DATABASE [trabajo_practico]
GO

/****** Object:  Database [trabajo_practico]    Script Date: 16/11/2023 17:01:18 ******/
CREATE DATABASE [trabajo_practico]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'trabajo_practico', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\trabajo_practico.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'trabajo_practico_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\trabajo_practico_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
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

ALTER DATABASE [trabajo_practico] SET  READ_WRITE 
GO

