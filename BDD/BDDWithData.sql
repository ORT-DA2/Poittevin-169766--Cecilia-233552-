USE [BetterCalmDB]
GO
/****** Object:  Table [dbo].[Administrators]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[ContentCategoryDto]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[Contents]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[Meeting]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[Patients]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[PlaylistCategoryDto]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[PlaylistContentDto]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[Playlists]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[Problematics]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[PsychologistProblematic]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[Psychologists]    Script Date: 17/6/2021 19:58:02 ******/
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
/****** Object:  Table [dbo].[Vouchers]    Script Date: 17/6/2021 19:58:02 ******/
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
INSERT [dbo].[Administrators] ([AdministratorDtoId], [Email], [Password], [Token], [UserDtoId], [Name], [LastName]) VALUES (2, N'admin@admin.com', N'admin', N'1e2763a3-13dd-42a9-a5b8-e5eb614d75b4', 1, N'Jose', N'Pedro')
INSERT [dbo].[Administrators] ([AdministratorDtoId], [Email], [Password], [Token], [UserDtoId], [Name], [LastName]) VALUES (3, N'admin2@admin.com', N'hola1234', N'43a43529-6615-4ccf-82a2-93aae3ed438b', 0, N'Pedro', N'Gonzalez')
INSERT [dbo].[Administrators] ([AdministratorDtoId], [Email], [Password], [Token], [UserDtoId], [Name], [LastName]) VALUES (4, N'jjj@sdsd.ls', N'hola123', N'', 0, N'Consuela', N'Tellez')
SET IDENTITY_INSERT [dbo].[Administrators] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([CategoryDtoId], [Name]) VALUES (1, N'Musica')
INSERT [dbo].[Categories] ([CategoryDtoId], [Name]) VALUES (2, N'Dormir')
INSERT [dbo].[Categories] ([CategoryDtoId], [Name]) VALUES (3, N'Cuerpo')
INSERT [dbo].[Categories] ([CategoryDtoId], [Name]) VALUES (4, N'Meditar')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
INSERT [dbo].[ContentCategoryDto] ([ContentId], [CategoryId]) VALUES (31, 1)
INSERT [dbo].[ContentCategoryDto] ([ContentId], [CategoryId]) VALUES (34, 1)
INSERT [dbo].[ContentCategoryDto] ([ContentId], [CategoryId]) VALUES (32, 2)
INSERT [dbo].[ContentCategoryDto] ([ContentId], [CategoryId]) VALUES (33, 3)
INSERT [dbo].[ContentCategoryDto] ([ContentId], [CategoryId]) VALUES (34, 3)
INSERT [dbo].[ContentCategoryDto] ([ContentId], [CategoryId]) VALUES (35, 3)
INSERT [dbo].[ContentCategoryDto] ([ContentId], [CategoryId]) VALUES (36, 3)
INSERT [dbo].[ContentCategoryDto] ([ContentId], [CategoryId]) VALUES (36, 4)
INSERT [dbo].[ContentCategoryDto] ([ContentId], [CategoryId]) VALUES (37, 4)
GO
SET IDENTITY_INSERT [dbo].[Contents] ON 

INSERT [dbo].[Contents] ([ContentDtoId], [Name], [Duration], [UrlImage], [UrlArchive], [AuthorName], [Type]) VALUES (31, N'Shape of you', 180, N'https://upload.wikimedia.org/wikipedia/en/b/b4/Shape_Of_You_%28Official_Single_Cover%29_by_Ed_Sheeran.png', N'https://mp3.filmisongs.com/Shape%20of%20You%20Mp3%20Ed%20Sheeran.mp3', N'', N'audio')
INSERT [dbo].[Contents] ([ContentDtoId], [Name], [Duration], [UrlImage], [UrlArchive], [AuthorName], [Type]) VALUES (32, N'Uptown Funk', 300, N'https://upload.wikimedia.org/wikipedia/en/a/a7/Mark_Ronson_-_Uptown_Funk_%28feat._Bruno_Mars%29_%28Official_Single_Cover%29.png', N'https://mp3.filmisongs.com/Shape%20of%20You%20Mp3%20Ed%20Sheeran.mp3', N'', N'audio')
INSERT [dbo].[Contents] ([ContentDtoId], [Name], [Duration], [UrlImage], [UrlArchive], [AuthorName], [Type]) VALUES (33, N'Uptown Funk - No Audio', 300, N'https://upload.wikimedia.org/wikipedia/en/a/a7/Mark_Ronson_-_Uptown_Funk_%28feat._Bruno_Mars%29_%28Official_Single_Cover%29.png', N'', N'', N'audio')
INSERT [dbo].[Contents] ([ContentDtoId], [Name], [Duration], [UrlImage], [UrlArchive], [AuthorName], [Type]) VALUES (34, N'Let it be', 7200, N'https://cdn.culturagenial.com/es/imagenes/let-it-be-0-cke.jpg', N'https://www.youtube.com/watch?v=QDYfEBY9NM4', N'The beatles', N'video')
INSERT [dbo].[Contents] ([ContentDtoId], [Name], [Duration], [UrlImage], [UrlArchive], [AuthorName], [Type]) VALUES (35, N'Help', 7200, N'', N'', N'The beatles', N'audio')
INSERT [dbo].[Contents] ([ContentDtoId], [Name], [Duration], [UrlImage], [UrlArchive], [AuthorName], [Type]) VALUES (36, N'Mienteme', 180, N'', N'', N'', N'audio')
INSERT [dbo].[Contents] ([ContentDtoId], [Name], [Duration], [UrlImage], [UrlArchive], [AuthorName], [Type]) VALUES (37, N'Cancion Sin playlist', 14400, N'', N'', N'', N'audio')
SET IDENTITY_INSERT [dbo].[Contents] OFF
GO
INSERT [dbo].[Meeting] ([PsychologistId], [PatientId], [DateTime], [Address], [Duration], [Cost]) VALUES (1, 1, CAST(N'2021-06-14T00:00:00.0000000' AS DateTime2), N'Test', 2, 750)
INSERT [dbo].[Meeting] ([PsychologistId], [PatientId], [DateTime], [Address], [Duration], [Cost]) VALUES (1, 2, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), N'Calle falsa 123', 2, 1500)
INSERT [dbo].[Meeting] ([PsychologistId], [PatientId], [DateTime], [Address], [Duration], [Cost]) VALUES (1, 3, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), N'Calle falsa 123', 1, 750)
INSERT [dbo].[Meeting] ([PsychologistId], [PatientId], [DateTime], [Address], [Duration], [Cost]) VALUES (2, 1, CAST(N'2021-06-14T00:00:00.0000000' AS DateTime2), N'Tu casa', 2, 1000)
INSERT [dbo].[Meeting] ([PsychologistId], [PatientId], [DateTime], [Address], [Duration], [Cost]) VALUES (2, 1, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), N'https://bettercalm.com.uy/2_1/8e534457-2155-45ac-881b-b55118355442', 2, 0)
INSERT [dbo].[Meeting] ([PsychologistId], [PatientId], [DateTime], [Address], [Duration], [Cost]) VALUES (2, 1, CAST(N'2021-06-18T00:00:00.0000000' AS DateTime2), N'https://bettercalm.com.uy/2_1006/68c79564-a669-440c-99d1-c405230c8049', 1, 2000)
INSERT [dbo].[Meeting] ([PsychologistId], [PatientId], [DateTime], [Address], [Duration], [Cost]) VALUES (2, 2, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), N'https://bettercalm.com.uy/2_2002/fca3d016-361b-4264-b23e-4ebf4855bb26', 2, 0)
INSERT [dbo].[Meeting] ([PsychologistId], [PatientId], [DateTime], [Address], [Duration], [Cost]) VALUES (2, 3, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), N'https://bettercalm.com.uy/2_2003/62508496-e8cb-4a89-91eb-d8b791edc6ea', 2, 4000)
INSERT [dbo].[Meeting] ([PsychologistId], [PatientId], [DateTime], [Address], [Duration], [Cost]) VALUES (2, 4, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), N'https://bettercalm.com.uy/2_1005/4c252d15-f7bc-4ed6-8c61-7bdb47827e5e', 2, 0)
INSERT [dbo].[Meeting] ([PsychologistId], [PatientId], [DateTime], [Address], [Duration], [Cost]) VALUES (3, 2, CAST(N'2021-06-17T00:00:00.0000000' AS DateTime2), N'Rivera 1453', 2, 750)
GO
SET IDENTITY_INSERT [dbo].[Patients] ON 

INSERT [dbo].[Patients] ([PatientDtoId], [Cellphone], [BirthDay], [UserDtoId], [Name], [LastName]) VALUES (1, N'092123432', CAST(N'1993-07-15T03:00:00.0000000' AS DateTime2), 0, N'Jose', N'Pedro')
INSERT [dbo].[Patients] ([PatientDtoId], [Cellphone], [BirthDay], [UserDtoId], [Name], [LastName]) VALUES (2, N'09321415', CAST(N'1990-06-15T03:00:00.0000000' AS DateTime2), 0, N'Raul', N'Gonzalez')
INSERT [dbo].[Patients] ([PatientDtoId], [Cellphone], [BirthDay], [UserDtoId], [Name], [LastName]) VALUES (3, N'093212314', CAST(N'1984-05-11T03:00:00.0000000' AS DateTime2), 0, N'Yoselin', N'Martinez')
INSERT [dbo].[Patients] ([PatientDtoId], [Cellphone], [BirthDay], [UserDtoId], [Name], [LastName]) VALUES (4, N'094213012', CAST(N'1980-06-17T03:00:00.0000000' AS DateTime2), 0, N'Micaela', N'Cecilia')
INSERT [dbo].[Patients] ([PatientDtoId], [Cellphone], [BirthDay], [UserDtoId], [Name], [LastName]) VALUES (5, N'094321412', CAST(N'1993-07-15T03:00:00.0000000' AS DateTime2), 0, N'Juan', N'Poittevin')
INSERT [dbo].[Patients] ([PatientDtoId], [Cellphone], [BirthDay], [UserDtoId], [Name], [LastName]) VALUES (6, N'092192932', CAST(N'1981-06-17T03:00:00.0000000' AS DateTime2), 0, N'Joselen', N'Cecilia')
SET IDENTITY_INSERT [dbo].[Patients] OFF
GO
INSERT [dbo].[PlaylistCategoryDto] ([CategoryId], [PlaylistId]) VALUES (1, 43)
INSERT [dbo].[PlaylistCategoryDto] ([CategoryId], [PlaylistId]) VALUES (1, 44)
INSERT [dbo].[PlaylistCategoryDto] ([CategoryId], [PlaylistId]) VALUES (2, 44)
INSERT [dbo].[PlaylistCategoryDto] ([CategoryId], [PlaylistId]) VALUES (3, 45)
INSERT [dbo].[PlaylistCategoryDto] ([CategoryId], [PlaylistId]) VALUES (3, 46)
GO
INSERT [dbo].[PlaylistContentDto] ([ContentId], [PlaylistId]) VALUES (31, 43)
INSERT [dbo].[PlaylistContentDto] ([ContentId], [PlaylistId]) VALUES (31, 46)
INSERT [dbo].[PlaylistContentDto] ([ContentId], [PlaylistId]) VALUES (32, 43)
INSERT [dbo].[PlaylistContentDto] ([ContentId], [PlaylistId]) VALUES (32, 45)
INSERT [dbo].[PlaylistContentDto] ([ContentId], [PlaylistId]) VALUES (33, 44)
INSERT [dbo].[PlaylistContentDto] ([ContentId], [PlaylistId]) VALUES (34, 45)
INSERT [dbo].[PlaylistContentDto] ([ContentId], [PlaylistId]) VALUES (35, 46)
GO
SET IDENTITY_INSERT [dbo].[Playlists] ON 

INSERT [dbo].[Playlists] ([PlaylistDtoId], [Name], [UrlImage], [Description]) VALUES (43, N'Pop music', N'https://scontent.fmvd3-1.fna.fbcdn.net/v/t1.6435-9/37906004_195194698008453_411816359287062528_n.png?_nc_cat=102&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=0mBE6n8JyFMAX_sqsBZ&_nc_ht=scontent.fmvd3-1.fna&oh=cd917640c7d76ebf2c4e9ac0ee3e0812&oe=60D0FFC8', N'Popular music')
INSERT [dbo].[Playlists] ([PlaylistDtoId], [Name], [UrlImage], [Description]) VALUES (44, N'Old songs', N'', N'old songs')
INSERT [dbo].[Playlists] ([PlaylistDtoId], [Name], [UrlImage], [Description]) VALUES (45, N'Beatles''s songs', N'https://cdn.culturagenial.com/es/imagenes/let-it-be-0-cke.jpg', N'beatles''s songs')
INSERT [dbo].[Playlists] ([PlaylistDtoId], [Name], [UrlImage], [Description]) VALUES (46, N'Top 2021', N'', N'Canciones que la gente escucha')
SET IDENTITY_INSERT [dbo].[Playlists] OFF
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
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (2, 1)
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (2, 2)
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (1, 3)
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (2, 3)
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (3, 3)
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (1, 5)
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (2, 5)
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (3, 5)
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (1, 6)
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (3, 6)
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (1, 7)
INSERT [dbo].[PsychologistProblematic] ([PsychologistId], [ProblematicId]) VALUES (2, 7)
GO
SET IDENTITY_INSERT [dbo].[Psychologists] ON 

INSERT [dbo].[Psychologists] ([PsychologistDtoId], [Address], [WorksOnline], [CreationDate], [Rate], [UserDtoId], [Name], [LastName]) VALUES (1, N'Calle falsa 123', 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 750, 0, N'Raul', N'Perez')
INSERT [dbo].[Psychologists] ([PsychologistDtoId], [Address], [WorksOnline], [CreationDate], [Rate], [UserDtoId], [Name], [LastName]) VALUES (2, N'No Aplica', 1, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 2000, 0, N'Lorena', N'Perez')
INSERT [dbo].[Psychologists] ([PsychologistDtoId], [Address], [WorksOnline], [CreationDate], [Rate], [UserDtoId], [Name], [LastName]) VALUES (3, N'Rivera 1453', 0, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), 750, 0, N'Noelia', N'Cala')
SET IDENTITY_INSERT [dbo].[Psychologists] OFF
GO
SET IDENTITY_INSERT [dbo].[Vouchers] ON 

INSERT [dbo].[Vouchers] ([VoucherDtoId], [PatientDtoId], [MeetingsAmount], [Status], [Discount]) VALUES (1, 1, 7, 3, 25)
INSERT [dbo].[Vouchers] ([VoucherDtoId], [PatientDtoId], [MeetingsAmount], [Status], [Discount]) VALUES (2, 1, 6, 2, 25)
INSERT [dbo].[Vouchers] ([VoucherDtoId], [PatientDtoId], [MeetingsAmount], [Status], [Discount]) VALUES (3, 1, 1, 4, 15)
INSERT [dbo].[Vouchers] ([VoucherDtoId], [PatientDtoId], [MeetingsAmount], [Status], [Discount]) VALUES (4, 2, 1, 4, 15)
INSERT [dbo].[Vouchers] ([VoucherDtoId], [PatientDtoId], [MeetingsAmount], [Status], [Discount]) VALUES (5, 2, 5, 1, 15)
INSERT [dbo].[Vouchers] ([VoucherDtoId], [PatientDtoId], [MeetingsAmount], [Status], [Discount]) VALUES (6, 3, 1, 4, 15)
INSERT [dbo].[Vouchers] ([VoucherDtoId], [PatientDtoId], [MeetingsAmount], [Status], [Discount]) VALUES (7, 3, 12, 2, 50)
INSERT [dbo].[Vouchers] ([VoucherDtoId], [PatientDtoId], [MeetingsAmount], [Status], [Discount]) VALUES (8, 2, 1, 4, 15)
SET IDENTITY_INSERT [dbo].[Vouchers] OFF
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
