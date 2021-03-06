/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 4/1/2017 11:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Stops]    Script Date: 4/1/2017 11:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stops](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Arrival] [datetime2](7) NOT NULL,
	[Latitude] [float] NOT NULL,
	[Longitude] [float] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Order] [int] NOT NULL,
	[TripId] [int] NULL,
 CONSTRAINT [PK_Stops] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
/****** Object:  Table [dbo].[Trips]    Script Date: 4/1/2017 11:15:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Trips](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DateCreated] [datetime2](7) NOT NULL,
	[NAME] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Trips] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF)
)

GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20170401055516_IntialDatabase', N'1.1.1')
/****** Object:  Index [IX_Stops_TripId]    Script Date: 4/1/2017 11:15:39 AM ******/
CREATE NONCLUSTERED INDEX [IX_Stops_TripId] ON [dbo].[Stops]
(
	[TripId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
ALTER TABLE [dbo].[Stops]  WITH CHECK ADD  CONSTRAINT [FK_Stops_Trips_TripId] FOREIGN KEY([TripId])
REFERENCES [dbo].[Trips] ([Id])
GO
ALTER TABLE [dbo].[Stops] CHECK CONSTRAINT [FK_Stops_Trips_TripId]
GO
