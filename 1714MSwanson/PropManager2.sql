﻿
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/05/2019 18:48:04
-- Generated from EDMX file: C:\Users\Malachi\Documents\SQL Server Management Studio\1714MSwanson\1714MSwanson\1714mswanson2g\PropertyManager2Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [PropertyManager2];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_BuildingApartment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Apartments] DROP CONSTRAINT [FK_BuildingApartment];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonApartment]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Apartments] DROP CONSTRAINT [FK_PersonApartment];
GO
IF OBJECT_ID(N'[dbo].[FK_PersonApartment1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Apartments] DROP CONSTRAINT [FK_PersonApartment1];
GO
IF OBJECT_ID(N'[dbo].[FK_ApartmentInvoice]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Invoices] DROP CONSTRAINT [FK_ApartmentInvoice];
GO
IF OBJECT_ID(N'[dbo].[FK_InvoiceLineItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[LineItems] DROP CONSTRAINT [FK_InvoiceLineItem];
GO
IF OBJECT_ID(N'[dbo].[FK_InvoiceReceipt]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Receipts] DROP CONSTRAINT [FK_InvoiceReceipt];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Buildings]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Buildings];
GO
IF OBJECT_ID(N'[dbo].[Apartments]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Apartments];
GO
IF OBJECT_ID(N'[dbo].[People]', 'U') IS NOT NULL
    DROP TABLE [dbo].[People];
GO
IF OBJECT_ID(N'[dbo].[LineItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[LineItems];
GO
IF OBJECT_ID(N'[dbo].[Invoices]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Invoices];
GO
IF OBJECT_ID(N'[dbo].[Receipts]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Receipts];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Buildings'
CREATE TABLE [dbo].[Buildings] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [BuildingName] nvarchar(max)  NOT NULL,
    [Address] nvarchar(max)  NOT NULL,
    [City] nvarchar(max)  NOT NULL,
    [State] nvarchar(max)  NOT NULL,
    [Zip] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Apartments'
CREATE TABLE [dbo].[Apartments] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ApartmentNum] nvarchar(max) NOT NULL,
    [SquareFeet] int  NOT NULL,
    [Bathrooms] int  NOT NULL,
    [Rent] decimal(18,0)  NOT NULL,
    [Building_Id] int  NOT NULL,
    [Tenant_Id] int  NULL,
    [Admin_Id] int  NOT NULL
);
GO

-- Creating table 'People'
CREATE TABLE [dbo].[People] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NOT NULL,
    [LastName] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'LineItems'
CREATE TABLE [dbo].[LineItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Description] nvarchar(max)  NOT NULL,
    [Amount] decimal(18,0)  NOT NULL,
    [Invoice_Id] int  NOT NULL
);
GO

-- Creating table 'Invoices'
CREATE TABLE [dbo].[Invoices] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [InvoiceDate] datetime  NOT NULL,
    [DueDate] datetime  NOT NULL,
    [Apartment_Id] int  NOT NULL
);
GO

-- Creating table 'Receipts'
CREATE TABLE [dbo].[Receipts] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [ReceiptDate] datetime  NOT NULL,
    [Amount] decimal(18,0)  NOT NULL,
    [Invoice_Id] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Buildings'
ALTER TABLE [dbo].[Buildings]
ADD CONSTRAINT [PK_Buildings]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Apartments'
ALTER TABLE [dbo].[Apartments]
ADD CONSTRAINT [PK_Apartments]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'People'
ALTER TABLE [dbo].[People]
ADD CONSTRAINT [PK_People]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'LineItems'
ALTER TABLE [dbo].[LineItems]
ADD CONSTRAINT [PK_LineItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [PK_Invoices]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Receipts'
ALTER TABLE [dbo].[Receipts]
ADD CONSTRAINT [PK_Receipts]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Building_Id] in table 'Apartments'
ALTER TABLE [dbo].[Apartments]
ADD CONSTRAINT [FK_BuildingApartment]
    FOREIGN KEY ([Building_Id])
    REFERENCES [dbo].[Buildings]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_BuildingApartment'
CREATE INDEX [IX_FK_BuildingApartment]
ON [dbo].[Apartments]
    ([Building_Id]);
GO

-- Creating foreign key on [Tenant_Id] in table 'Apartments'
ALTER TABLE [dbo].[Apartments]
ADD CONSTRAINT [FK_PersonApartment]
    FOREIGN KEY ([Tenant_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonApartment'
CREATE INDEX [IX_FK_PersonApartment]
ON [dbo].[Apartments]
    ([Tenant_Id]);
GO

-- Creating foreign key on [Admin_Id] in table 'Apartments'
ALTER TABLE [dbo].[Apartments]
ADD CONSTRAINT [FK_PersonApartment1]
    FOREIGN KEY ([Admin_Id])
    REFERENCES [dbo].[People]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_PersonApartment1'
CREATE INDEX [IX_FK_PersonApartment1]
ON [dbo].[Apartments]
    ([Admin_Id]);
GO

-- Creating foreign key on [Apartment_Id] in table 'Invoices'
ALTER TABLE [dbo].[Invoices]
ADD CONSTRAINT [FK_ApartmentInvoice]
    FOREIGN KEY ([Apartment_Id])
    REFERENCES [dbo].[Apartments]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ApartmentInvoice'
CREATE INDEX [IX_FK_ApartmentInvoice]
ON [dbo].[Invoices]
    ([Apartment_Id]);
GO

-- Creating foreign key on [Invoice_Id] in table 'LineItems'
ALTER TABLE [dbo].[LineItems]
ADD CONSTRAINT [FK_InvoiceLineItem]
    FOREIGN KEY ([Invoice_Id])
    REFERENCES [dbo].[Invoices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceLineItem'
CREATE INDEX [IX_FK_InvoiceLineItem]
ON [dbo].[LineItems]
    ([Invoice_Id]);
GO

-- Creating foreign key on [Invoice_Id] in table 'Receipts'
ALTER TABLE [dbo].[Receipts]
ADD CONSTRAINT [FK_InvoiceReceipt]
    FOREIGN KEY ([Invoice_Id])
    REFERENCES [dbo].[Invoices]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_InvoiceReceipt'
CREATE INDEX [IX_FK_InvoiceReceipt]
ON [dbo].[Receipts]
    ([Invoice_Id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------