
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 02/02/2016 03:51:00
-- Generated from EDMX file: B:\C#\prac\WebApplication5\WebApplication5\Models\Model.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Database1];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Article_ToTable]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Article] DROP CONSTRAINT [FK_Article_ToTable];
GO
IF OBJECT_ID(N'[dbo].[FK_Pic_ToTable]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Pic] DROP CONSTRAINT [FK_Pic_ToTable];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Article]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Article];
GO
IF OBJECT_ID(N'[dbo].[Member]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Member];
GO
IF OBJECT_ID(N'[dbo].[Pic]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Pic];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Articles'
CREATE TABLE [dbo].[Articles] (
    [Id] int  NOT NULL,
    [Content] varchar(max)  NULL,
    [Likes] int  NULL,
    [Dislikes] int  NULL,
    [publisher] int  NOT NULL,
    [blocked] bit  NULL
);
GO

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [Id] int  NOT NULL,
    [Name] varchar(50)  NULL,
    [Password] varchar(50)  NULL,
    [Email] varchar(50)  NULL,
    [IsAdmin] bit  NULL
);
GO

-- Creating table 'Pics'
CREATE TABLE [dbo].[Pics] (
    [Id] int  NOT NULL,
    [Article_id] int  NOT NULL,
    [Link] varchar(max)  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [PK_Articles]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Pics'
ALTER TABLE [dbo].[Pics]
ADD CONSTRAINT [PK_Pics]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [publisher] in table 'Articles'
ALTER TABLE [dbo].[Articles]
ADD CONSTRAINT [FK_Article_ToTable]
    FOREIGN KEY ([publisher])
    REFERENCES [dbo].[Members]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Article_ToTable'
CREATE INDEX [IX_FK_Article_ToTable]
ON [dbo].[Articles]
    ([publisher]);
GO

-- Creating foreign key on [Article_id] in table 'Pics'
ALTER TABLE [dbo].[Pics]
ADD CONSTRAINT [FK_ArticlePic]
    FOREIGN KEY ([Article_id])
    REFERENCES [dbo].[Articles]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ArticlePic'
CREATE INDEX [IX_FK_ArticlePic]
ON [dbo].[Pics]
    ([Article_id]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------