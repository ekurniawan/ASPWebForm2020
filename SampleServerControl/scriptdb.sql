USE [master]
GO
/****** Object:  Database [SampleDb]    Script Date: 1/21/2020 10:49:30 AM ******/
CREATE DATABASE [SampleDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SampleDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SampleDb.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SampleDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\SampleDb_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SampleDb] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SampleDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SampleDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SampleDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SampleDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SampleDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SampleDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [SampleDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SampleDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SampleDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SampleDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SampleDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SampleDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SampleDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SampleDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SampleDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SampleDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SampleDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SampleDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SampleDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SampleDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SampleDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SampleDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SampleDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SampleDb] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SampleDb] SET  MULTI_USER 
GO
ALTER DATABASE [SampleDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SampleDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SampleDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SampleDb] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SampleDb] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SampleDb] SET QUERY_STORE = OFF
GO
USE [SampleDb]
GO
/****** Object:  Table [dbo].[Berita]    Script Date: 1/21/2020 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Berita](
	[id_berita] [int] IDENTITY(1,1) NOT NULL,
	[id_kat] [int] NOT NULL,
	[judul_berita] [varchar](50) NULL,
	[detail_berita] [varchar](50) NULL,
	[tanggal] [datetime] NOT NULL,
 CONSTRAINT [PK_Berita] PRIMARY KEY CLUSTERED 
(
	[id_berita] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kategori]    Script Date: 1/21/2020 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kategori](
	[id_kat] [int] IDENTITY(1,1) NOT NULL,
	[nama_kat] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Kategori] PRIMARY KEY CLUSTERED 
(
	[id_kat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Kota]    Script Date: 1/21/2020 10:49:30 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Kota](
	[KotaId] [int] IDENTITY(1,1) NOT NULL,
	[NamaKota] [varchar](50) NULL,
 CONSTRAINT [PK_Kota] PRIMARY KEY CLUSTERED 
(
	[KotaId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Berita] ON 

INSERT [dbo].[Berita] ([id_berita], [id_kat], [judul_berita], [detail_berita], [tanggal]) VALUES (1, 1, N'Belajar Data Binding', N'Data Binding pada ASP Web Forms', CAST(N'2020-01-21T09:45:07.987' AS DateTime))
INSERT [dbo].[Berita] ([id_berita], [id_kat], [judul_berita], [detail_berita], [tanggal]) VALUES (2, 1, N'Belajar EF 6', N'Entity Framework 6 dengan ASP Web Forms', CAST(N'2020-01-21T09:46:00.537' AS DateTime))
SET IDENTITY_INSERT [dbo].[Berita] OFF
SET IDENTITY_INSERT [dbo].[Kategori] ON 

INSERT [dbo].[Kategori] ([id_kat], [nama_kat]) VALUES (1, N'CSharp')
INSERT [dbo].[Kategori] ([id_kat], [nama_kat]) VALUES (2, N'ASP Web Form')
INSERT [dbo].[Kategori] ([id_kat], [nama_kat]) VALUES (3, N'ASP MVC')
INSERT [dbo].[Kategori] ([id_kat], [nama_kat]) VALUES (4, N'ASP Core 3.1')
INSERT [dbo].[Kategori] ([id_kat], [nama_kat]) VALUES (5, N'Java')
INSERT [dbo].[Kategori] ([id_kat], [nama_kat]) VALUES (6, N'Python')
SET IDENTITY_INSERT [dbo].[Kategori] OFF
SET IDENTITY_INSERT [dbo].[Kota] ON 

INSERT [dbo].[Kota] ([KotaId], [NamaKota]) VALUES (1, N'Jakarta')
INSERT [dbo].[Kota] ([KotaId], [NamaKota]) VALUES (2, N'Yogyakarta')
INSERT [dbo].[Kota] ([KotaId], [NamaKota]) VALUES (3, N'Semarang')
INSERT [dbo].[Kota] ([KotaId], [NamaKota]) VALUES (4, N'Malang')
INSERT [dbo].[Kota] ([KotaId], [NamaKota]) VALUES (5, N'Surabaya')
SET IDENTITY_INSERT [dbo].[Kota] OFF
ALTER TABLE [dbo].[Berita] ADD  CONSTRAINT [DF_Berita_tanggal]  DEFAULT (getdate()) FOR [tanggal]
GO
ALTER TABLE [dbo].[Berita]  WITH CHECK ADD  CONSTRAINT [FK_Berita_Kategori] FOREIGN KEY([id_kat])
REFERENCES [dbo].[Kategori] ([id_kat])
GO
ALTER TABLE [dbo].[Berita] CHECK CONSTRAINT [FK_Berita_Kategori]
GO
USE [master]
GO
ALTER DATABASE [SampleDb] SET  READ_WRITE 
GO
