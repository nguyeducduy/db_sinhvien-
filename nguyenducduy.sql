USE [master]
GO
/****** Object:  Database [sinhvien]    Script Date: 10/3/2022 11:33:54 AM ******/
CREATE DATABASE [sinhvien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'sinhvien', FILENAME = N'D:\công việc\nguyenducduy\sinhvien.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'sinhvien_log', FILENAME = N'D:\công việc\nguyenducduy\sinhvien_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [sinhvien] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [sinhvien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [sinhvien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [sinhvien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [sinhvien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [sinhvien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [sinhvien] SET ARITHABORT OFF 
GO
ALTER DATABASE [sinhvien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [sinhvien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [sinhvien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [sinhvien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [sinhvien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [sinhvien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [sinhvien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [sinhvien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [sinhvien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [sinhvien] SET  DISABLE_BROKER 
GO
ALTER DATABASE [sinhvien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [sinhvien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [sinhvien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [sinhvien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [sinhvien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [sinhvien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [sinhvien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [sinhvien] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [sinhvien] SET  MULTI_USER 
GO
ALTER DATABASE [sinhvien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [sinhvien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [sinhvien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [sinhvien] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [sinhvien] SET DELAYED_DURABILITY = DISABLED 
GO
USE [sinhvien]
GO
/****** Object:  Table [dbo].[hocvien]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[hocvien](
	[id_hocvien] [int] NOT NULL,
	[ten] [nvarchar](50) NULL,
	[tuoi] [int] NULL,
	[id_lop] [float] NULL,
 CONSTRAINT [PK_hocvien] PRIMARY KEY CLUSTERED 
(
	[id_hocvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[lop]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[lop](
	[id_lop] [int] NOT NULL,
	[id_nganh] [int] NULL,
	[ma_lop] [nvarchar](50) NULL,
	[nam_hoc] [int] NULL,
 CONSTRAINT [PK_lop] PRIMARY KEY CLUSTERED 
(
	[id_lop] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[nganh]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nganh](
	[id_nganh] [int] IDENTITY(1,1) NOT NULL,
	[ma_nganh] [nvarchar](50) NULL,
	[ten_nganh] [nvarchar](100) NULL,
 CONSTRAINT [PK_nganh] PRIMARY KEY CLUSTERED 
(
	[id_nganh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[lop]  WITH CHECK ADD  CONSTRAINT [FK_lop_hocvien] FOREIGN KEY([id_lop])
REFERENCES [dbo].[hocvien] ([id_hocvien])
GO
ALTER TABLE [dbo].[lop] CHECK CONSTRAINT [FK_lop_hocvien]
GO
ALTER TABLE [dbo].[lop]  WITH CHECK ADD  CONSTRAINT [FK_lop_nganh] FOREIGN KEY([id_nganh])
REFERENCES [dbo].[nganh] ([id_nganh])
GO
ALTER TABLE [dbo].[lop] CHECK CONSTRAINT [FK_lop_nganh]
GO
/****** Object:  StoredProcedure [dbo].[capnhat_hocvien]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[capnhat_hocvien] 
(@id_hocvien int , @ten nvarchar(50) , @tuoi int , @id_lop float )

AS
BEGIN

UPDATE [dbo].[hocvien]
   SET [id_hocvien] = @id_hocvien
      ,[ten] = @ten
      ,[tuoi] = @tuoi
      ,[id_lop] = @id_lop
 WHERE @id_hocvien  = id_hocvien
END

GO
/****** Object:  StoredProcedure [dbo].[sua_lop]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sua_lop]
(@id_lop int , @id_nganh int , @ma_lop nvarchar(50) , @nam_hoc int )
AS
BEGIN
	UPDATE [dbo].[lop]
   SET [id_lop] = @id_lop
      ,[id_nganh] = @id_nganh
      ,[ma_lop] = @ma_lop
      ,[nam_hoc] = @nam_hoc
 WHERE @id_lop = id_lop 
END

GO
/****** Object:  StoredProcedure [dbo].[sua_nganhhoc]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[sua_nganhhoc]
(@id_nganh int , @ma_nganh nvarchar(50), @ten_nganh nvarchar(100))
AS
BEGIN
	
UPDATE [dbo].[nganh]
   SET [id_nganh] = @id_nganh
      ,[ma_nganh] = @ma_nganh
      ,[ten_nganh] = @ten_nganh
 WHERE @id_nganh = id_nganh

END

GO
/****** Object:  StoredProcedure [dbo].[them_hocvien]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[them_hocvien] 
(@id_hocvien int , @ten nvarchar(50) , @tuoi int , @id_lop float )

AS
BEGIN
INSERT INTO [dbo].[hocvien]
           ([id_hocvien]
           ,[ten]
           ,[tuoi]
           ,[id_lop])
     VALUES
           (@id_hocvien , @ten , @tuoi , @id_lop)
	
END

GO
/****** Object:  StoredProcedure [dbo].[them_lop]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[them_lop]
(@id_lop int , @id_nganh int , @ma_lop nvarchar(50) , @nam_hoc int )
AS
BEGIN
	INSERT INTO [dbo].[lop]
           ([id_lop]
           ,[id_nganh]
           ,[ma_lop]
           ,[nam_hoc])
     VALUES
           (@id_lop , @id_nganh ,@ma_lop ,@nam_hoc )
END

GO
/****** Object:  StoredProcedure [dbo].[them_nganhhoc]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[them_nganhhoc]
(@id_nganh int , @ma_nganh nvarchar(50), @ten_nganh nvarchar(100))
AS
BEGIN
	
INSERT INTO [dbo].[nganh]
           ([id_nganh]
           ,[ma_nganh]
           ,[ten_nganh])
     VALUES
           (@id_nganh, @ma_nganh , @ten_nganh )
END

GO
/****** Object:  StoredProcedure [dbo].[xoa_hocvien]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xoa_hocvien] 
(@id_hocvien int )

AS
BEGIN
DELETE FROM [dbo].[hocvien]
      WHERE @id_hocvien = id_hocvien
END

GO
/****** Object:  StoredProcedure [dbo].[xoa_lop]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xoa_lop]
(@id_lop int )
AS
BEGIN

DELETE FROM [dbo].[lop]
      WHERE @id_lop = id_lop
END

GO
/****** Object:  StoredProcedure [dbo].[xoa_nganhhoc]    Script Date: 10/3/2022 11:33:54 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[xoa_nganhhoc]
(@id_nganh int)
AS
BEGIN
	

DELETE FROM [dbo].[nganh]
      WHERE @id_nganh = id_nganh
END

GO
USE [master]
GO
ALTER DATABASE [sinhvien] SET  READ_WRITE 
GO
