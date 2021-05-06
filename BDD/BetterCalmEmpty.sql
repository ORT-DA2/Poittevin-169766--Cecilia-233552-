USE [BetterCalmDB]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 6/5/2021 16:45:31 ******/
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
/****** Object:  Table [dbo].[AudioCategoryDto]    Script Date: 6/5/2021 16:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AudioCategoryDto](
	[AudioID] [int] NOT NULL,
	[CategoryID] [int] NOT NULL,
 CONSTRAINT [PK_AudioCategoryDto] PRIMARY KEY CLUSTERED 
(
	[AudioID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Audios]    Script Date: 6/5/2021 16:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Audios](
	[AudioDtoID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Duration] [float] NOT NULL,
	[AuthorName] [nvarchar](max) NULL,
	[UrlImage] [nvarchar](max) NULL,
	[UrlAudio] [nvarchar](max) NULL,
 CONSTRAINT [PK_Audios] PRIMARY KEY CLUSTERED 
(
	[AudioDtoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 6/5/2021 16:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CategoryDtoID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CategoryDtoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Meeting]    Script Date: 6/5/2021 16:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Meeting](
	[PsychologistId] [int] NOT NULL,
	[PatientId] [int] NOT NULL,
	[DateTime] [datetime2](7) NOT NULL,
	[Address] [nvarchar](max) NULL,
 CONSTRAINT [PK_Meeting] PRIMARY KEY CLUSTERED 
(
	[PsychologistId] ASC,
	[PatientId] ASC,
	[DateTime] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Patients]    Script Date: 6/5/2021 16:45:31 ******/
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
/****** Object:  Table [dbo].[PlaylistAudioDto]    Script Date: 6/5/2021 16:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistAudioDto](
	[AudioID] [int] NOT NULL,
	[PlaylistID] [int] NOT NULL,
 CONSTRAINT [PK_PlaylistAudioDto] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC,
	[AudioID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PlaylistCategoryDto]    Script Date: 6/5/2021 16:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PlaylistCategoryDto](
	[CategoryID] [int] NOT NULL,
	[PlaylistID] [int] NOT NULL,
 CONSTRAINT [PK_PlaylistCategoryDto] PRIMARY KEY CLUSTERED 
(
	[PlaylistID] ASC,
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Playlists]    Script Date: 6/5/2021 16:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playlists](
	[PlaylistDtoID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[UrlImage] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Playlists] PRIMARY KEY CLUSTERED 
(
	[PlaylistDtoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Problematics]    Script Date: 6/5/2021 16:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Problematics](
	[ProblematicDtoID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Problematics] PRIMARY KEY CLUSTERED 
(
	[ProblematicDtoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PsychologistProblematic]    Script Date: 6/5/2021 16:45:31 ******/
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
/****** Object:  Table [dbo].[Psychologists]    Script Date: 6/5/2021 16:45:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Psychologists](
	[PsychologistDtoId] [int] IDENTITY(1,1) NOT NULL,
	[Address] [nvarchar](max) NULL,
	[WorksOnline] [bit] NOT NULL,
	[CreationDate] [datetime2](7) NOT NULL,
	[UserDtoId] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Psychologists] PRIMARY KEY CLUSTERED 
(
	[PsychologistDtoId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Administrators] ON 

INSERT [dbo].[Administrators] ([AdministratorDtoId], [Email], [Password], [Token], [UserDtoId], [Name], [LastName]) VALUES (1, N'admin@admin.com', N'pass', N'token', 1, N'Joselen', N'Cecilia')
SET IDENTITY_INSERT [dbo].[Administrators] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryDtoID], [Name]) VALUES (1, N'Dormir')
INSERT [dbo].[Categories] ([CategoryDtoID], [Name]) VALUES (2, N'Meditar')
INSERT [dbo].[Categories] ([CategoryDtoID], [Name]) VALUES (3, N'Musica')
INSERT [dbo].[Categories] ([CategoryDtoID], [Name]) VALUES (4, N'Cuerpo')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Problematics] ON 

INSERT [dbo].[Problematics] ([ProblematicDtoID], [Name]) VALUES (1, N'Depresión')
INSERT [dbo].[Problematics] ([ProblematicDtoID], [Name]) VALUES (2, N'Estrés')
INSERT [dbo].[Problematics] ([ProblematicDtoID], [Name]) VALUES (3, N'Ansiedad')
INSERT [dbo].[Problematics] ([ProblematicDtoID], [Name]) VALUES (4, N'Autoestima')
INSERT [dbo].[Problematics] ([ProblematicDtoID], [Name]) VALUES (5, N'Enojo')
INSERT [dbo].[Problematics] ([ProblematicDtoID], [Name]) VALUES (6, N'Relaciones')
INSERT [dbo].[Problematics] ([ProblematicDtoID], [Name]) VALUES (7, N'Duelo')
INSERT [dbo].[Problematics] ([ProblematicDtoID], [Name]) VALUES (8, N'Otros')
SET IDENTITY_INSERT [dbo].[Problematics] OFF
GO
ALTER TABLE [dbo].[AudioCategoryDto]  WITH CHECK ADD  CONSTRAINT [FK_AudioCategoryDto_Audios_AudioID] FOREIGN KEY([AudioID])
REFERENCES [dbo].[Audios] ([AudioDtoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AudioCategoryDto] CHECK CONSTRAINT [FK_AudioCategoryDto_Audios_AudioID]
GO
ALTER TABLE [dbo].[AudioCategoryDto]  WITH CHECK ADD  CONSTRAINT [FK_AudioCategoryDto_Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryDtoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AudioCategoryDto] CHECK CONSTRAINT [FK_AudioCategoryDto_Categories_CategoryID]
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
ALTER TABLE [dbo].[PlaylistAudioDto]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistAudioDto_Audios_AudioID] FOREIGN KEY([AudioID])
REFERENCES [dbo].[Audios] ([AudioDtoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistAudioDto] CHECK CONSTRAINT [FK_PlaylistAudioDto_Audios_AudioID]
GO
ALTER TABLE [dbo].[PlaylistAudioDto]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistAudioDto_Playlists_PlaylistID] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[Playlists] ([PlaylistDtoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistAudioDto] CHECK CONSTRAINT [FK_PlaylistAudioDto_Playlists_PlaylistID]
GO
ALTER TABLE [dbo].[PlaylistCategoryDto]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistCategoryDto_Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([CategoryDtoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistCategoryDto] CHECK CONSTRAINT [FK_PlaylistCategoryDto_Categories_CategoryID]
GO
ALTER TABLE [dbo].[PlaylistCategoryDto]  WITH CHECK ADD  CONSTRAINT [FK_PlaylistCategoryDto_Playlists_PlaylistID] FOREIGN KEY([PlaylistID])
REFERENCES [dbo].[Playlists] ([PlaylistDtoID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PlaylistCategoryDto] CHECK CONSTRAINT [FK_PlaylistCategoryDto_Playlists_PlaylistID]
GO
ALTER TABLE [dbo].[PsychologistProblematic]  WITH CHECK ADD  CONSTRAINT [FK_PsychologistProblematic_Problematics_ProblematicId] FOREIGN KEY([ProblematicId])
REFERENCES [dbo].[Problematics] ([ProblematicDtoID])
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
