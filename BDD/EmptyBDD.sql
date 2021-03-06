USE [BetterCalmDB]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Administrators](
	[AdministratorDtoId] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Token] [nvarchar](max) NULL,
	[UserDtoId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Administrators] PRIMARY KEY CLUSTERED 
(
	[AdministratorDtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryDtoId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryDtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContentCategoryDto]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContentCategoryDto](
	[ContentId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_ContentCategoryDto] PRIMARY KEY CLUSTERED 
(
	[ContentId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contents]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contents](
	[ContentDtoId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Duration] [float] NOT NULL,
	[UrlImage] [nvarchar](max) NULL,
	[UrlArchive] [nvarchar](max) NULL,
	[AuthorName] [nvarchar](max) NULL,
	[Type] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contents] PRIMARY KEY CLUSTERED 
(
	[ContentDtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meeting]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meeting](
	[PsychologistId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[Duration] [float] NOT NULL,
	[Cost] [float] NOT NULL,
 CONSTRAINT [PK_Meeting] PRIMARY KEY CLUSTERED 
(
	[PsychologistId] ASC,
	[PatientId] ASC,
	[DateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Patients](
	[PatientDtoId] [int] IDENTITY(1,1) NOT NULL,
	[Cellphone] [nvarchar](max) NULL,
	[BirthDay] [datetime2](7) NOT NULL,
	[UserDtoId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Patients] PRIMARY KEY CLUSTERED 
(
	[PatientDtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistCategoryDto]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistCategoryDto](
	[CategoryId] [int] NOT NULL,
	[PlaylistId] [int] NOT NULL,
 CONSTRAINT [PK_PlaylistCategoryDto] PRIMARY KEY CLUSTERED 
(
	[PlaylistId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistContentDto]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistContentDto](
	[ContentId] [int] NOT NULL,
	[PlaylistId] [int] NOT NULL,
 CONSTRAINT [PK_PlaylistContentDto] PRIMARY KEY CLUSTERED 
(
	[PlaylistId] ASC,
	[ContentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlists]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlists](
	[PlaylistDtoId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UrlImage] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Playlists] PRIMARY KEY CLUSTERED 
(
	[PlaylistDtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Problematics]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problematics](
	[ProblematicDtoId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Problematics] PRIMARY KEY CLUSTERED 
(
	[ProblematicDtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PsychologistProblematic]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PsychologistProblematic](
	[PsychologistId] [int] NOT NULL,
	[ProblematicId] [int] NOT NULL,
 CONSTRAINT [PK_PsychologistProblematic] PRIMARY KEY CLUSTERED 
(
	[PsychologistId] ASC,
	[ProblematicId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Psychologists]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Psychologists](
	[PsychologistDtoId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[WorksOnline] [bit] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[Rate] [int] NOT NULL,
	[UserDtoId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Psychologists] PRIMARY KEY CLUSTERED 
(
	[PsychologistDtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Vouchers]    Script Date: 17/6/2021 18:50:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vouchers](
	[VoucherDtoId] [int] IDENTITY(1,1) NOT NULL,
	[PatientDtoId] [int] NULL,
	[MeetingsAmount] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[Discount] [int] NOT NULL,
 CONSTRAINT [PK_Vouchers] PRIMARY KEY CLUSTERED 
(
	[VoucherDtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrators] ON 

INSERT [dbo].[Administrators] ([AdministratorDtoId], [Email], [Password], [Token], [UserDtoId], [Name], [LastName]) VALUES (1, N'admin@admin.com', N'admin', N'token', 0, N'administrador', N'adminsitrador')
SET IDENTITY_INSERT [dbo].[Administrators] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryDtoId], [Name]) VALUES (1, N'Musica')
INSERT [dbo].[Categories] ([CategoryDtoId], [Name]) VALUES (2, N'Dormir')
INSERT [dbo].[Categories] ([CategoryDtoId], [Name]) VALUES (3, N'Cuerpo')
INSERT [dbo].[Categories] ([CategoryDtoId], [Name]) VALUES (4, N'Meditar')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Problematics] ON 

INSERT [dbo].[Problematics] ([ProblematicDtoId], [Name]) VALUES (1, N'Depresion')
INSERT [dbo].[Problematics] ([ProblematicDtoId], [Name]) VALUES (2, N'Estres')
INSERT [dbo].[Problematics] ([ProblematicDtoId], [Name]) VALUES (3, N'Ansiedad')
INSERT [dbo].[Problematics] ([ProblematicDtoId], [Name]) VALUES (4, N'Autoestima')
INSERT [dbo].[Problematics] ([ProblematicDtoId], [Name]) VALUES (5, N'Enojo')
INSERT [dbo].[Problematics] ([ProblematicDtoId], [Name]) VALUES (6, N'Relaciones')
INSERT [dbo].[Problematics] ([ProblematicDtoId], [Name]) VALUES (7, N'Duelo')
SET IDENTITY_INSERT [dbo].[Problematics] OFF
GO
ALTER TABLE [dbo].[ContentCategoryDto]  WITH CHECK ADD  CONSTRAINT [FK_ContentCategoryDto_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryDtoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContentCategoryDto] CHECK CONSTRAINT [FK_ContentCategoryDto_Categories_CategoryId]
GO
ALTER TABLE [dbo].[ContentCategoryDto]  WITH CHECK ADD  CONSTRAINT [FK_ContentCategoryDto_Contents_ContentId] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Contents] ([ContentDtoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ContentCategoryDto] CHECK CONSTRAINT [FK_ContentCategoryDto_Contents_ContentId]
GO
ALTER TABLE [dbo].[Meeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_Patients_PatientId] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patients] ([PatientDtoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Meeting] CHECK CONSTRAINT [FK_Meeting_Patients_PatientId]
GO
ALTER TABLE [dbo].[Meeting]  WITH CHECK ADD  CONSTRAINT [FK_Meeting_Psychologists_PsychologistId] FOREIGN KEY([PsychologistId])
REFERENCES [dbo].[Psychologists] ([PsychologistDtoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Meeting] CHECK CONSTRAINT [FK_Meeting_Psychologists_PsychologistId]
GO
ALTER TABLE [dbo].[PlaylistCategoryDto]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistCategoryDto_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([CategoryDtoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistCategoryDto] CHECK CONSTRAINT [FK_PlaylistCategoryDto_Categories_CategoryId]
GO
ALTER TABLE [dbo].[PlaylistCategoryDto]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistCategoryDto_Playlists_PlaylistId] FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[Playlists] ([PlaylistDtoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistCategoryDto] CHECK CONSTRAINT [FK_PlaylistCategoryDto_Playlists_PlaylistId]
GO
ALTER TABLE [dbo].[PlaylistContentDto]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistContentDto_Contents_ContentId] FOREIGN KEY([ContentId])
REFERENCES [dbo].[Contents] ([ContentDtoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistContentDto] CHECK CONSTRAINT [FK_PlaylistContentDto_Contents_ContentId]
GO
ALTER TABLE [dbo].[PlaylistContentDto]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistContentDto_Playlists_PlaylistId] FOREIGN KEY([PlaylistId])
REFERENCES [dbo].[Playlists] ([PlaylistDtoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistContentDto] CHECK CONSTRAINT [FK_PlaylistContentDto_Playlists_PlaylistId]
GO
ALTER TABLE [dbo].[PsychologistProblematic]  WITH CHECK ADD  CONSTRAINT [FK_PsychologistProblematic_Problematics_ProblematicId] FOREIGN KEY([ProblematicId])
REFERENCES [dbo].[Problematics] ([ProblematicDtoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PsychologistProblematic] CHECK CONSTRAINT [FK_PsychologistProblematic_Problematics_ProblematicId]
GO
ALTER TABLE [dbo].[PsychologistProblematic]  WITH CHECK ADD  CONSTRAINT [FK_PsychologistProblematic_Psychologists_PsychologistId] FOREIGN KEY([PsychologistId])
REFERENCES [dbo].[Psychologists] ([PsychologistDtoId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PsychologistProblematic] CHECK CONSTRAINT [FK_PsychologistProblematic_Psychologists_PsychologistId]
GO
ALTER TABLE [dbo].[Vouchers]  WITH CHECK ADD  CONSTRAINT [FK_Vouchers_Patients_PatientDtoId] FOREIGN KEY([PatientDtoId])
REFERENCES [dbo].[Patients] ([PatientDtoId])
GO
ALTER TABLE [dbo].[Vouchers] CHECK CONSTRAINT [FK_Vouchers_Patients_PatientDtoId]
GO
