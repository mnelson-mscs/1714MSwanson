USE [master]
GO
/****** Object:  Database [StreamingWebsite]    Script Date: 11/15/2019 5:22:32 AM ******/
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
/****** Object:  Table [dbo].[Clips]    Script Date: 11/15/2019 5:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clips](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[TotalViews] [int] NOT NULL,
	[Length] [time](7) NOT NULL,
	[Vod_Id] [int] NOT NULL,
 CONSTRAINT [PK_Clips] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Follows]    Script Date: 11/15/2019 5:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Follows](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FollowingSince] [datetime] NOT NULL,
	[Following_PersonId] [nvarchar](max) NOT NULL,
	[Person_Id] [int] NOT NULL,
 CONSTRAINT [PK_Follows] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Moderators]    Script Date: 11/15/2019 5:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Moderators](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateModded] [datetime] NOT NULL,
	[ModFor_PersonId] [int] NOT NULL,
	[Person_Id] [int] NOT NULL,
 CONSTRAINT [PK_Moderators] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[People]    Script Date: 11/15/2019 5:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[People](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Username] [nvarchar](max) NOT NULL,
	[Password] [nvarchar](max) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Phone] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions1]    Script Date: 11/15/2019 5:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions1](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SubbedSince] [datetime] NOT NULL,
	[Subbedto_PersonId] [nvarchar](max) NOT NULL,
	[Person_Id] [int] NOT NULL,
 CONSTRAINT [PK_Subscriptions1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vods]    Script Date: 11/15/2019 5:22:33 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vods](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TotalViews] [int] NOT NULL,
	[SubOnly] [bit] NOT NULL,
	[VodLength] [time](7) NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[Person_Id] [int] NOT NULL,
 CONSTRAINT [PK_Vods] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Clips] ON 
GO
INSERT [dbo].[Clips] ([Id], [CreationDate], [TotalViews], [Length], [Vod_Id]) VALUES (1, CAST(N'2019-09-24T00:00:00.000' AS DateTime), 50000, CAST(N'00:00:30' AS Time), 1)
GO
INSERT [dbo].[Clips] ([Id], [CreationDate], [TotalViews], [Length], [Vod_Id]) VALUES (2, CAST(N'2019-09-24T00:00:00.000' AS DateTime), 75000, CAST(N'00:00:15' AS Time), 1)
GO
INSERT [dbo].[Clips] ([Id], [CreationDate], [TotalViews], [Length], [Vod_Id]) VALUES (3, CAST(N'2019-09-26T00:00:00.000' AS DateTime), 40000, CAST(N'00:00:12' AS Time), 3)
GO
INSERT [dbo].[Clips] ([Id], [CreationDate], [TotalViews], [Length], [Vod_Id]) VALUES (4, CAST(N'2019-09-25T00:00:00.000' AS DateTime), 100000, CAST(N'00:00:22' AS Time), 2)
GO
INSERT [dbo].[Clips] ([Id], [CreationDate], [TotalViews], [Length], [Vod_Id]) VALUES (5, CAST(N'2019-09-27T00:00:00.000' AS DateTime), 20000, CAST(N'00:00:09' AS Time), 5)
GO
SET IDENTITY_INSERT [dbo].[Clips] OFF
GO
SET IDENTITY_INSERT [dbo].[Follows] ON 
GO
INSERT [dbo].[Follows] ([Id], [FollowingSince], [Following_PersonId], [Person_Id]) VALUES (1, CAST(N'2019-09-25T00:00:00.000' AS DateTime), N'5', 1)
GO
INSERT [dbo].[Follows] ([Id], [FollowingSince], [Following_PersonId], [Person_Id]) VALUES (2, CAST(N'2019-09-25T00:00:00.000' AS DateTime), N'4', 2)
GO
INSERT [dbo].[Follows] ([Id], [FollowingSince], [Following_PersonId], [Person_Id]) VALUES (3, CAST(N'2019-09-25T00:00:00.000' AS DateTime), N'2', 3)
GO
INSERT [dbo].[Follows] ([Id], [FollowingSince], [Following_PersonId], [Person_Id]) VALUES (4, CAST(N'2019-09-25T00:00:00.000' AS DateTime), N'3', 4)
GO
INSERT [dbo].[Follows] ([Id], [FollowingSince], [Following_PersonId], [Person_Id]) VALUES (5, CAST(N'2019-09-25T00:00:00.000' AS DateTime), N'1', 5)
GO
SET IDENTITY_INSERT [dbo].[Follows] OFF
GO
SET IDENTITY_INSERT [dbo].[Moderators] ON 
GO
INSERT [dbo].[Moderators] ([Id], [DateModded], [ModFor_PersonId], [Person_Id]) VALUES (1, CAST(N'2019-09-27T00:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[Moderators] ([Id], [DateModded], [ModFor_PersonId], [Person_Id]) VALUES (2, CAST(N'2019-09-27T00:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[Moderators] ([Id], [DateModded], [ModFor_PersonId], [Person_Id]) VALUES (3, CAST(N'2019-09-27T00:00:00.000' AS DateTime), 4, 1)
GO
INSERT [dbo].[Moderators] ([Id], [DateModded], [ModFor_PersonId], [Person_Id]) VALUES (4, CAST(N'2019-09-27T00:00:00.000' AS DateTime), 1, 2)
GO
INSERT [dbo].[Moderators] ([Id], [DateModded], [ModFor_PersonId], [Person_Id]) VALUES (5, CAST(N'2019-09-27T00:00:00.000' AS DateTime), 3, 2)
GO
INSERT [dbo].[Moderators] ([Id], [DateModded], [ModFor_PersonId], [Person_Id]) VALUES (6, CAST(N'2019-09-27T00:00:00.000' AS DateTime), 5, 4)
GO
INSERT [dbo].[Moderators] ([Id], [DateModded], [ModFor_PersonId], [Person_Id]) VALUES (7, CAST(N'2019-09-27T00:00:00.000' AS DateTime), 2, 4)
GO
SET IDENTITY_INSERT [dbo].[Moderators] OFF
GO
SET IDENTITY_INSERT [dbo].[People] ON 
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [Phone]) VALUES (1, N'Nicholas', N'Rees', N'NicholasRees', N'hunter1', N'nicholas.rees@email.com', N'111-111-1111')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [Phone]) VALUES (2, N'Alexander', N'Jones', N'AlexanderJones', N'hunter2', N'alexander.jones@email.com', N'111-111-1112')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [Phone]) VALUES (3, N'Jason', N'Roberts', N'JasonRoberts', N'hunter3', N'jason.roberts@email.com', N'111-111-1113')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [Phone]) VALUES (4, N'Sophie', N'McLean', N'SophieMcLean', N'hunter4', N'sophie.mclean@gmail.com', N'111-111-1114')
GO
INSERT [dbo].[People] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [Phone]) VALUES (5, N'Brian', N'Ball', N'BrianBall', N'hunter5', N'brian.ball@email.com', N'111-111-1115')
GO
SET IDENTITY_INSERT [dbo].[People] OFF
GO
SET IDENTITY_INSERT [dbo].[Subscriptions1] ON 
GO
INSERT [dbo].[Subscriptions1] ([Id], [SubbedSince], [Subbedto_PersonId], [Person_Id]) VALUES (1, CAST(N'2019-09-26T00:00:00.000' AS DateTime), N'5', 1)
GO
INSERT [dbo].[Subscriptions1] ([Id], [SubbedSince], [Subbedto_PersonId], [Person_Id]) VALUES (2, CAST(N'2019-09-26T00:00:00.000' AS DateTime), N'4', 2)
GO
INSERT [dbo].[Subscriptions1] ([Id], [SubbedSince], [Subbedto_PersonId], [Person_Id]) VALUES (3, CAST(N'2019-09-26T00:00:00.000' AS DateTime), N'2', 3)
GO
INSERT [dbo].[Subscriptions1] ([Id], [SubbedSince], [Subbedto_PersonId], [Person_Id]) VALUES (4, CAST(N'2019-09-26T00:00:00.000' AS DateTime), N'3', 4)
GO
INSERT [dbo].[Subscriptions1] ([Id], [SubbedSince], [Subbedto_PersonId], [Person_Id]) VALUES (5, CAST(N'2019-09-26T00:00:00.000' AS DateTime), N'1', 5)
GO
SET IDENTITY_INSERT [dbo].[Subscriptions1] OFF
GO
SET IDENTITY_INSERT [dbo].[Vods] ON 
GO
INSERT [dbo].[Vods] ([Id], [TotalViews], [SubOnly], [VodLength], [CreationDate], [Person_Id]) VALUES (1, 5000, 0, CAST(N'02:30:05' AS Time), CAST(N'2019-09-24T00:00:00.000' AS DateTime), 5)
GO
INSERT [dbo].[Vods] ([Id], [TotalViews], [SubOnly], [VodLength], [CreationDate], [Person_Id]) VALUES (2, 10000, 0, CAST(N'03:15:10' AS Time), CAST(N'2019-09-25T00:00:00.000' AS DateTime), 5)
GO
INSERT [dbo].[Vods] ([Id], [TotalViews], [SubOnly], [VodLength], [CreationDate], [Person_Id]) VALUES (3, 8000, 0, CAST(N'01:45:50' AS Time), CAST(N'2019-09-26T00:00:00.000' AS DateTime), 3)
GO
INSERT [dbo].[Vods] ([Id], [TotalViews], [SubOnly], [VodLength], [CreationDate], [Person_Id]) VALUES (4, 2000, 1, CAST(N'05:10:00' AS Time), CAST(N'2019-09-27T00:00:00.000' AS DateTime), 1)
GO
INSERT [dbo].[Vods] ([Id], [TotalViews], [SubOnly], [VodLength], [CreationDate], [Person_Id]) VALUES (5, 3500, 0, CAST(N'00:50:55' AS Time), CAST(N'2019-09-27T00:00:00.000' AS DateTime), 2)
GO
SET IDENTITY_INSERT [dbo].[Vods] OFF
GO
/****** Object:  Index [IX_FK_VodsClips]    Script Date: 11/15/2019 5:22:33 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_VodsClips] ON [dbo].[Clips]
(
	[Vod_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonFollows]    Script Date: 11/15/2019 5:22:33 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonFollows] ON [dbo].[Follows]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonModerators]    Script Date: 11/15/2019 5:22:33 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonModerators] ON [dbo].[Moderators]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonSubscription]    Script Date: 11/15/2019 5:22:33 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonSubscription] ON [dbo].[Subscriptions1]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FK_PersonVods]    Script Date: 11/15/2019 5:22:33 AM ******/
CREATE NONCLUSTERED INDEX [IX_FK_PersonVods] ON [dbo].[Vods]
(
	[Person_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Clips]  WITH CHECK ADD  CONSTRAINT [FK_VodsClips] FOREIGN KEY([Vod_Id])
REFERENCES [dbo].[Vods] ([Id])
GO
ALTER TABLE [dbo].[Clips] CHECK CONSTRAINT [FK_VodsClips]
GO
ALTER TABLE [dbo].[Follows]  WITH CHECK ADD  CONSTRAINT [FK_PersonFollows] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Follows] CHECK CONSTRAINT [FK_PersonFollows]
GO
ALTER TABLE [dbo].[Moderators]  WITH CHECK ADD  CONSTRAINT [FK_PersonModerators] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Moderators] CHECK CONSTRAINT [FK_PersonModerators]
GO
ALTER TABLE [dbo].[Subscriptions1]  WITH CHECK ADD  CONSTRAINT [FK_PersonSubscription] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Subscriptions1] CHECK CONSTRAINT [FK_PersonSubscription]
GO
ALTER TABLE [dbo].[Vods]  WITH CHECK ADD  CONSTRAINT [FK_PersonVods] FOREIGN KEY([Person_Id])
REFERENCES [dbo].[People] ([Id])
GO
ALTER TABLE [dbo].[Vods] CHECK CONSTRAINT [FK_PersonVods]
GO
USE [master]
GO
ALTER DATABASE [StreamingWebsite] SET  READ_WRITE 
GO
