USE [master]
GO
/****** Object:  Database [StreamingWebsite]    Script Date: 9/28/2019 12:58:57 AM ******/
CREATE DATABASE [StreamingWebsite]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'StreamingWebsite', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StreamingWebsite.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'StreamingWebsite_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\StreamingWebsite_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [StreamingWebsite] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StreamingWebsite].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StreamingWebsite] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StreamingWebsite] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StreamingWebsite] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StreamingWebsite] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StreamingWebsite] SET ARITHABORT OFF 
GO
ALTER DATABASE [StreamingWebsite] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StreamingWebsite] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StreamingWebsite] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StreamingWebsite] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StreamingWebsite] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StreamingWebsite] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StreamingWebsite] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StreamingWebsite] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StreamingWebsite] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StreamingWebsite] SET  DISABLE_BROKER 
GO
ALTER DATABASE [StreamingWebsite] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StreamingWebsite] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StreamingWebsite] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StreamingWebsite] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StreamingWebsite] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StreamingWebsite] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StreamingWebsite] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StreamingWebsite] SET RECOVERY FULL 
GO
ALTER DATABASE [StreamingWebsite] SET  MULTI_USER 
GO
ALTER DATABASE [StreamingWebsite] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StreamingWebsite] SET DB_CHAINING OFF 
GO
ALTER DATABASE [StreamingWebsite] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [StreamingWebsite] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [StreamingWebsite] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'StreamingWebsite', N'ON'
GO
ALTER DATABASE [StreamingWebsite] SET QUERY_STORE = OFF
GO
USE [StreamingWebsite]
GO
/****** Object:  Table [dbo].[Clips]    Script Date: 9/28/2019 12:58:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clips](
	[ClipId] [int] IDENTITY(10001,1) NOT NULL,
	[VodId] [int] NOT NULL,
	[CreationDate] [smalldatetime] NOT NULL,
	[TotalViews] [int] NOT NULL,
	[Length] [time](7) NOT NULL,
 CONSTRAINT [PK_Clips] PRIMARY KEY CLUSTERED 
(
	[ClipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follows]    Script Date: 9/28/2019 12:58:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follows](
	[FollowId] [int] IDENTITY(11,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[Following_UserId] [int] NOT NULL,
	[FollowingSince] [date] NOT NULL,
 CONSTRAINT [PK_Follow] PRIMARY KEY CLUSTERED 
(
	[FollowId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moderators]    Script Date: 9/28/2019 12:58:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moderators](
	[ModId] [int] IDENTITY(11,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ModFor_UserId] [int] NOT NULL,
	[DateModed] [date] NOT NULL,
 CONSTRAINT [PK_ConnectionsTable] PRIMARY KEY CLUSTERED 
(
	[ModId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Substriptions]    Script Date: 9/28/2019 12:58:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Substriptions](
	[SubId] [int] IDENTITY(101,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[SubbedTo_UserId] [int] NOT NULL,
	[SubbedSince] [date] NOT NULL,
 CONSTRAINT [PK_Substriptions] PRIMARY KEY CLUSTERED 
(
	[SubId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/28/2019 12:58:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](25) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [varchar](15) NOT NULL,
 CONSTRAINT [PK_UserTable] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vods]    Script Date: 9/28/2019 12:58:57 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vods](
	[VodId] [int] IDENTITY(1001,1) NOT NULL,
	[CreationDate] [smalldatetime] NOT NULL,
	[TotalViews] [int] NOT NULL,
	[SubOnly] [nchar](3) NOT NULL,
	[UserId] [int] NOT NULL,
	[VodLength] [time](7) NOT NULL,
 CONSTRAINT [PK_Vods] PRIMARY KEY CLUSTERED 
(
	[VodId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clips] ON 

INSERT [dbo].[Clips] ([ClipId], [VodId], [CreationDate], [TotalViews], [Length]) VALUES (10001, 1001, CAST(N'2019-09-24T00:00:00' AS SmallDateTime), 50000, CAST(N'00:00:30' AS Time))
INSERT [dbo].[Clips] ([ClipId], [VodId], [CreationDate], [TotalViews], [Length]) VALUES (10002, 1001, CAST(N'2019-09-24T00:00:00' AS SmallDateTime), 75000, CAST(N'00:00:15' AS Time))
INSERT [dbo].[Clips] ([ClipId], [VodId], [CreationDate], [TotalViews], [Length]) VALUES (10003, 1003, CAST(N'2019-09-26T00:00:00' AS SmallDateTime), 40000, CAST(N'00:00:12' AS Time))
INSERT [dbo].[Clips] ([ClipId], [VodId], [CreationDate], [TotalViews], [Length]) VALUES (10004, 1002, CAST(N'2019-09-25T00:00:00' AS SmallDateTime), 100000, CAST(N'00:00:22' AS Time))
INSERT [dbo].[Clips] ([ClipId], [VodId], [CreationDate], [TotalViews], [Length]) VALUES (10005, 1005, CAST(N'2019-09-27T00:00:00' AS SmallDateTime), 20000, CAST(N'00:00:09' AS Time))
SET IDENTITY_INSERT [dbo].[Clips] OFF
SET IDENTITY_INSERT [dbo].[Follows] ON 

INSERT [dbo].[Follows] ([FollowId], [UserId], [Following_UserId], [FollowingSince]) VALUES (11, 1, 5, CAST(N'2019-09-25' AS Date))
INSERT [dbo].[Follows] ([FollowId], [UserId], [Following_UserId], [FollowingSince]) VALUES (12, 2, 4, CAST(N'2019-09-25' AS Date))
INSERT [dbo].[Follows] ([FollowId], [UserId], [Following_UserId], [FollowingSince]) VALUES (13, 3, 2, CAST(N'2019-09-25' AS Date))
INSERT [dbo].[Follows] ([FollowId], [UserId], [Following_UserId], [FollowingSince]) VALUES (14, 4, 3, CAST(N'2019-09-25' AS Date))
INSERT [dbo].[Follows] ([FollowId], [UserId], [Following_UserId], [FollowingSince]) VALUES (15, 5, 1, CAST(N'2019-09-25' AS Date))
SET IDENTITY_INSERT [dbo].[Follows] OFF
SET IDENTITY_INSERT [dbo].[Moderators] ON 

INSERT [dbo].[Moderators] ([ModId], [UserId], [ModFor_UserId], [DateModed]) VALUES (11, 1, 2, CAST(N'2019-09-27' AS Date))
INSERT [dbo].[Moderators] ([ModId], [UserId], [ModFor_UserId], [DateModed]) VALUES (12, 1, 3, CAST(N'2019-09-27' AS Date))
INSERT [dbo].[Moderators] ([ModId], [UserId], [ModFor_UserId], [DateModed]) VALUES (13, 1, 4, CAST(N'2019-09-27' AS Date))
INSERT [dbo].[Moderators] ([ModId], [UserId], [ModFor_UserId], [DateModed]) VALUES (14, 2, 1, CAST(N'2019-09-27' AS Date))
INSERT [dbo].[Moderators] ([ModId], [UserId], [ModFor_UserId], [DateModed]) VALUES (15, 2, 3, CAST(N'2019-09-27' AS Date))
INSERT [dbo].[Moderators] ([ModId], [UserId], [ModFor_UserId], [DateModed]) VALUES (16, 4, 5, CAST(N'2019-09-27' AS Date))
INSERT [dbo].[Moderators] ([ModId], [UserId], [ModFor_UserId], [DateModed]) VALUES (17, 4, 2, CAST(N'2019-09-27' AS Date))
SET IDENTITY_INSERT [dbo].[Moderators] OFF
SET IDENTITY_INSERT [dbo].[Substriptions] ON 

INSERT [dbo].[Substriptions] ([SubId], [UserId], [SubbedTo_UserId], [SubbedSince]) VALUES (101, 1, 5, CAST(N'2019-09-26' AS Date))
INSERT [dbo].[Substriptions] ([SubId], [UserId], [SubbedTo_UserId], [SubbedSince]) VALUES (102, 2, 4, CAST(N'2019-09-26' AS Date))
INSERT [dbo].[Substriptions] ([SubId], [UserId], [SubbedTo_UserId], [SubbedSince]) VALUES (103, 3, 2, CAST(N'2019-09-26' AS Date))
INSERT [dbo].[Substriptions] ([SubId], [UserId], [SubbedTo_UserId], [SubbedSince]) VALUES (104, 4, 3, CAST(N'2019-09-26' AS Date))
INSERT [dbo].[Substriptions] ([SubId], [UserId], [SubbedTo_UserId], [SubbedSince]) VALUES (105, 5, 1, CAST(N'2019-09-26' AS Date))
SET IDENTITY_INSERT [dbo].[Substriptions] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([UserId], [Username], [Password], [FirstName], [LastName], [Email], [Phone]) VALUES (1, N'NicholasRees', N'hunter1', N'Nicholas', N'Rees', N'nicholas.rees@email.com', N'111-111-1111')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [FirstName], [LastName], [Email], [Phone]) VALUES (2, N'AlexanderJones', N'hunter2', N'Alexander', N'Jones', N'alexander.jones@email.com', N'111-111-1112')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [FirstName], [LastName], [Email], [Phone]) VALUES (3, N'JasonRoberts', N'hunter3', N'Jason', N'Roberts', N'jason.roberts@email.com', N'111-111-1113')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [FirstName], [LastName], [Email], [Phone]) VALUES (4, N'SophieMcLean', N'hunter4', N'Sophie', N'McLean', N'sophie.mclean@gmail.com', N'111-111-1114')
INSERT [dbo].[Users] ([UserId], [Username], [Password], [FirstName], [LastName], [Email], [Phone]) VALUES (5, N'BrianBall', N'hunter5', N'Brian', N'Ball', N'brian.ball@email.com', N'111-111-1115')
SET IDENTITY_INSERT [dbo].[Users] OFF
SET IDENTITY_INSERT [dbo].[Vods] ON 

INSERT [dbo].[Vods] ([VodId], [CreationDate], [TotalViews], [SubOnly], [UserId], [VodLength]) VALUES (1001, CAST(N'2019-09-24T00:00:00' AS SmallDateTime), 5000, N'No ', 5, CAST(N'02:30:05' AS Time))
INSERT [dbo].[Vods] ([VodId], [CreationDate], [TotalViews], [SubOnly], [UserId], [VodLength]) VALUES (1002, CAST(N'2019-09-25T00:00:00' AS SmallDateTime), 10000, N'No ', 5, CAST(N'03:15:10' AS Time))
INSERT [dbo].[Vods] ([VodId], [CreationDate], [TotalViews], [SubOnly], [UserId], [VodLength]) VALUES (1003, CAST(N'2019-09-26T00:00:00' AS SmallDateTime), 8000, N'No ', 3, CAST(N'01:45:50' AS Time))
INSERT [dbo].[Vods] ([VodId], [CreationDate], [TotalViews], [SubOnly], [UserId], [VodLength]) VALUES (1004, CAST(N'2019-09-27T00:00:00' AS SmallDateTime), 2000, N'Yes', 1, CAST(N'05:10:00' AS Time))
INSERT [dbo].[Vods] ([VodId], [CreationDate], [TotalViews], [SubOnly], [UserId], [VodLength]) VALUES (1005, CAST(N'2019-09-27T00:00:00' AS SmallDateTime), 3500, N'No ', 2, CAST(N'00:50:55' AS Time))
SET IDENTITY_INSERT [dbo].[Vods] OFF
USE [master]
GO
ALTER DATABASE [StreamingWebsite] SET  READ_WRITE 
GO
