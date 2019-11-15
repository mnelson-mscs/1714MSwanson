
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/14/2019 03:02:11
-- Generated from EDMX file: C:\Users\Malachi\Documents\SQL Server Management Studio\1714MSwanson\1714MSwanson\1714mswanson2h\StreamingModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [StreamingWebsite];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_PersonModerators]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Moderators] DROP CONSTRAINT [FK_PersonModerators];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonSubscription]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Subscriptions1] DROP CONSTRAINT [FK_PersonSubscription];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonFollows]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Follows] DROP CONSTRAINT [FK_PersonFollows];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonVods]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Vods] DROP CONSTRAINT [FK_PersonVods];
GO
IF OBJECT_ID(N'[dbo].[FK_VodsClips]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Clips] DROP CONSTRAINT [FK_VodsClips];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[Subscriptions1]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Subscriptions1];
GO
IF OBJECT_ID(N'[dbo].[Moderators]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Moderators];
GO
IF OBJECT_ID(N'[dbo].[Follows]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Follows];
GO
IF OBJECT_ID(N'[dbo].[Clips]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Clips];
GO
IF OBJECT_ID(N'[dbo].[Vods]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Vods];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Username] nvarchar(max)  NOT NULL,
    [Password] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Subscriptions1'
CREATE TABLE [dbo].[Subscriptions1] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [SubbedSince] datetime  NOT NULL,
    [Subbedto_PersonId] nvarchar(max)  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'Moderators'
CREATE TABLE [dbo].[Moderators] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [DateModded] datetime  NOT NULL,
    [ModFor_PersonId] int  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'Follows'
CREATE TABLE [dbo].[Follows] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FollowingSince] datetime  NOT NULL,
    [Following_PersonId] nvarchar(max)  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- Creating table 'Clips'
CREATE TABLE [dbo].[Clips] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [CreationDate] datetime  NOT NULL,
    [TotalViews] int  NOT NULL,
    [Length] time  NOT NULL,
    [Vod_Id] int  NOT NULL
);
GO

-- Creating table 'Vods'
CREATE TABLE [dbo].[Vods] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [TotalViews] int  NOT NULL,
    [SubOnly] bit  NOT NULL,
    [VodLength] time  NOT NULL,
    [CreationDate] datetime  NOT NULL,
    [Person_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Subscriptions1'
ALTER TABLE [dbo].[Subscriptions1]
ADD CONSTRAINT [PK_Subscriptions1]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Moderators'
ALTER TABLE [dbo].[Moderators]
ADD CONSTRAINT [PK_Moderators]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Follows'
ALTER TABLE [dbo].[Follows]
ADD CONSTRAINT [PK_Follows]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Clips'
ALTER TABLE [dbo].[Clips]
ADD CONSTRAINT [PK_Clips]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Vods'
ALTER TABLE [dbo].[Vods]
ADD CONSTRAINT [PK_Vods]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Person_Id] in table 'Moderators'
ALTER TABLE [dbo].[Moderators]
ADD CONSTRAINT [FK_PersonModerators]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonModerators'
CREATE INDEX [IX_FK_PersonModerators]
ON [dbo].[Moderators]
    ([Person_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'Subscriptions1'
ALTER TABLE [dbo].[Subscriptions1]
ADD CONSTRAINT [FK_PersonSubscription]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonSubscription'
CREATE INDEX [IX_FK_PersonSubscription]
ON [dbo].[Subscriptions1]
    ([Person_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'Follows'
ALTER TABLE [dbo].[Follows]
ADD CONSTRAINT [FK_PersonFollows]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonFollows'
CREATE INDEX [IX_FK_PersonFollows]
ON [dbo].[Follows]
    ([Person_Id]);
GO

-- Creating foreign key on [Person_Id] in table 'Vods'
ALTER TABLE [dbo].[Vods]
ADD CONSTRAINT [FK_PersonVods]
    FOREIGN KEY ([Person_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonVods'
CREATE INDEX [IX_FK_PersonVods]
ON [dbo].[Vods]
    ([Person_Id]);
GO

-- Creating foreign key on [Vod_Id] in table 'Clips'
ALTER TABLE [dbo].[Clips]
ADD CONSTRAINT [FK_VodsClips]
    FOREIGN KEY ([Vod_Id])
    REFERENCES [dbo].[Vods]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_VodsClips'
CREATE INDEX [IX_FK_VodsClips]
ON [dbo].[Clips]
    ([Vod_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------