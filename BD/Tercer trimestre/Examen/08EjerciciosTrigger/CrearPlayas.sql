set nocount on
go
use master
go
  drop database playas
  go

create database playas
go

USE [playas]
GO
/****** Object:  Table [dbo].[aspnet_Users]    Script Date: 13/06/2015 19:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[aspnet_Users](
	[ApplicationId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier]  NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[LoweredUserName] [nvarchar](256) NOT NULL,
	[MobileAlias] [nvarchar](16) NULL,
	[IsAnonymous] [bit] NOT NULL,
	[LastActivityDate] [datetime] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 13/06/2015 19:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
	[Descripcion] [nvarchar](60) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoriasPlayas]    Script Date: 13/06/2015 19:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriasPlayas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PlayaId] [int] NOT NULL,
	[CategoriaId] [int] NOT NULL,
 CONSTRAINT [PK_CategoriasPlayas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comentarios]    Script Date: 13/06/2015 19:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comentarios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[coment] [nvarchar](max) NOT NULL,
	[fecha] [datetime] NOT NULL,
	[PlayaId] [int] NOT NULL,
 CONSTRAINT [PK_Comentarios_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Imagenes]    Script Date: 13/06/2015 19:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Imagenes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdPlaya] [int] NULL,
	[Imagen] [image] NULL,
	[Descripcion] [nvarchar](255) NULL,
 CONSTRAINT [PK_Imagenes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Municipios]    Script Date: 13/06/2015 19:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Municipios](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Playas]    Script Date: 13/06/2015 19:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Playas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](255) NOT NULL,
	[ZonaId] [int] NOT NULL,
	[MunicipioId] [int] NOT NULL,
	[Direccion] [nvarchar](255) NULL,
	[Telefono] [nvarchar](30) NULL,
	[DescripcionEsp] [nvarchar](max) NULL,
	[DescripcionIng] [nvarchar](max) NULL,
	[Longitud] [int] NULL,
	[Ancho] [int] NULL,
	[ComoLlegar] [nvarchar](max) NULL,
	[Georeferencia] [nvarchar](255) NULL,
 CONSTRAINT [PK_Playas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Puntuaciones]    Script Date: 13/06/2015 19:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Puntuaciones](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[nota] [int] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[PlayaId] [int] NOT NULL,
 CONSTRAINT [PK_Puntuaciones] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Zonas]    Script Date: 13/06/2015 19:38:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zonas](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](30) NOT NULL,
 CONSTRAINT [PK_Zonas] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'9b0277b1-277b-4290-8505-bdd3fed49ecb', N'5b938e8e-69cc-4ae8-88d8-4e3e40adf9b8', N'admin', N'admin', NULL, 0, CAST(0x0000A3FC011F749F AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'9b0277b1-277b-4290-8505-bdd3fed49ecb', N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', N'usuario1', N'usuario1', NULL, 0, CAST(0x0000A3FC00B7CB91 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'9b0277b1-277b-4290-8505-bdd3fed49ecb', N'e4b17c93-2743-4bfc-84d6-82a6515869e8', N'usuario2', N'usuario2', NULL, 0, CAST(0x0000A3EB001165A5 AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'9b0277b1-277b-4290-8505-bdd3fed49ecb', N'49d7eb4b-b1b3-49ae-bd0b-e68e9d9a08bd', N'usuario3', N'usuario3', NULL, 0, CAST(0x0000A3E301463ECE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'9b0277b1-277b-4290-8505-bdd3fed49ecb', N'6d86de97-62e3-4af2-b1d6-798d38cdc733', N'usuario4', N'usuario4', NULL, 0, CAST(0x0000A3FB00BA08EE AS DateTime))
INSERT [dbo].[aspnet_Users] ([ApplicationId], [UserId], [UserName], [LoweredUserName], [MobileAlias], [IsAnonymous], [LastActivityDate]) VALUES (N'9b0277b1-277b-4290-8505-bdd3fed49ecb', N'adb132ab-fcdb-49a2-b90e-dd81e4b61576', N'usuario5', N'usuario5', NULL, 0, CAST(0x0000A3FC011FAF83 AS DateTime))
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([Id], [Nombre], [Descripcion]) VALUES (1, N'Arena', N'playa de arena')
INSERT [dbo].[Categorias] ([Id], [Nombre], [Descripcion]) VALUES (2, N'Arena Negra', N'playa de arena negra')
INSERT [dbo].[Categorias] ([Id], [Nombre], [Descripcion]) VALUES (3, N'Callaos', N'playa de callaos')
INSERT [dbo].[Categorias] ([Id], [Nombre], [Descripcion]) VALUES (4, N'Nudista', N'playa nudista')
INSERT [dbo].[Categorias] ([Id], [Nombre], [Descripcion]) VALUES (5, N'Surfera', N'Se practifa Surf')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
SET IDENTITY_INSERT [dbo].[CategoriasPlayas] ON 

INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (1, 7, 5)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (2, 7, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (3, 7, 4)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (4, 9, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (5, 10, 5)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (6, 10, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (7, 11, 4)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (8, 12, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (9, 13, 5)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (10, 13, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (11, 14, 4)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (12, 14, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (13, 15, 5)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (14, 16, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (15, 17, 4)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (16, 18, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (17, 20, 5)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (18, 20, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (19, 21, 4)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (20, 22, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (21, 25, 5)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (22, 26, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (23, 28, 4)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (24, 28, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (25, 29, 5)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (26, 30, 2)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (27, 51, 4)
INSERT [dbo].[CategoriasPlayas] ([Id], [PlayaId], [CategoriaId]) VALUES (28, 51, 2)

SET IDENTITY_INSERT [dbo].[CategoriasPlayas] OFF
SET IDENTITY_INSERT [dbo].[Comentarios] ON 

INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (2, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', N'Una de las mejores playas de surf de Tenerife.', CAST(0x0000A3E301285805 AS DateTime), 7)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (3, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', N'Una playa de mucho oleaje.', CAST(0x0000A3E301285805 AS DateTime), 7)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (4, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', N'La playa se encuentra actualmente cerrada por desprendimientos.', CAST(0x0000A3E301285805 AS DateTime), 9)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (5, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', N'Buena playa', CAST(0x0000A3E301296E19 AS DateTime), 9)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (6, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', N'prueba comentario', CAST(0x0000A3E30129C066 AS DateTime), 7)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (8, N'6d86de97-62e3-4af2-b1d6-798d38cdc733', N'comentario desde web', CAST(0x0000A3F9016FFC46 AS DateTime), 7)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (9, N'6d86de97-62e3-4af2-b1d6-798d38cdc733', N'una playa estupenda', CAST(0x0000A3F9017089F0 AS DateTime), 15)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (10, N'6d86de97-62e3-4af2-b1d6-798d38cdc733', N'perfecta', CAST(0x0000A3F901733345 AS DateTime), 9)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (11, N'6d86de97-62e3-4af2-b1d6-798d38cdc733', N'más comentarios', CAST(0x0000A3F901742813 AS DateTime), 7)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (12, N'6d86de97-62e3-4af2-b1d6-798d38cdc733', N'de calidad', CAST(0x0000A3F901742F57 AS DateTime), 7)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (13, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', N'buena', CAST(0x0000A3F90175B48D AS DateTime), 7)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (14, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', N'no me gusta', CAST(0x0000A3FA0108AC5E AS DateTime), 9)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (15, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', N'no opino', CAST(0x0000A3FA0161989B AS DateTime), 7)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (16, N'adb132ab-fcdb-49a2-b90e-dd81e4b61576', N'perfecta', CAST(0x0000A3F901733345 AS DateTime), 9)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (17, N'adb132ab-fcdb-49a2-b90e-dd81e4b61576', N'más comentarios', CAST(0x0000A3F901742813 AS DateTime), 7)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (18, N'adb132ab-fcdb-49a2-b90e-dd81e4b61576', N'de calidad', CAST(0x0000A3F901742F57 AS DateTime), 7)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (19, N'adb132ab-fcdb-49a2-b90e-dd81e4b61576', N'buena', CAST(0x0000A3F90175B48D AS DateTime), 7)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (20, N'adb132ab-fcdb-49a2-b90e-dd81e4b61576', N'no me gusta', CAST(0x0000A3FA0108AC5E AS DateTime), 9)
INSERT [dbo].[Comentarios] ([Id], [UserId], [coment], [fecha], [PlayaId]) VALUES (21, N'adb132ab-fcdb-49a2-b90e-dd81e4b61576', N'no opino', CAST(0x0000A3FA0161989B AS DateTime), 7)
SET IDENTITY_INSERT [dbo].[Comentarios] OFF
SET IDENTITY_INSERT [dbo].[Imagenes] ON 

INSERT [dbo].[Imagenes] ([Id], [IdPlaya], [Imagen], [Descripcion]) VALUES (1, 10, null, N'el pris')
INSERT [dbo].[Imagenes] ([Id], [IdPlaya], [Imagen], [Descripcion]) VALUES (2, 7, null, N'los patos')
INSERT [dbo].[Imagenes] ([Id], [IdPlaya], [Imagen], [Descripcion]) VALUES (3, 9, null, N'mesa del mar')
INSERT [dbo].[Imagenes] ([Id], [IdPlaya], [Imagen], [Descripcion]) VALUES (5, 18, null, N'Playa del Camisón')
INSERT [dbo].[Imagenes] ([Id], [IdPlaya], [Imagen], [Descripcion]) VALUES (6, 20, null, N'Playa de Las Vistas')
INSERT [dbo].[Imagenes] ([Id], [IdPlaya], [Imagen], [Descripcion]) VALUES (7, 23, null, N'Playa de los Cristianos ')
INSERT [dbo].[Imagenes] ([Id], [IdPlaya], [Imagen], [Descripcion]) VALUES (8, 22, null, N'Playa Jardín')
INSERT [dbo].[Imagenes] ([Id], [IdPlaya], [Imagen], [Descripcion]) VALUES (9, 20, null, N'Playa de Las Vistas 2')
SET IDENTITY_INSERT [dbo].[Imagenes] OFF
SET IDENTITY_INSERT [dbo].[Municipios] ON 

INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (1, N'Arona')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (2, N'Candelaria')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (3, N'Guía de Isora')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (4, N'Puerto de la Cruz (El)')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (5, N'Santa Cruz de Tenerife')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (6, N'Santiago del Teide')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (7, N'Tacoronte')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (8, N'Tegueste')
INSERT [dbo].[Municipios] ([Id], [Nombre]) VALUES (9, N'El Sauzal')
SET IDENTITY_INSERT [dbo].[Municipios] OFF
SET IDENTITY_INSERT [dbo].[Playas] ON 

INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (7, N'Playa de los Patos', 1, 4, N'Puerto de la Cruz / La Orotava', N'', N'Playa de los Patos está situada al lado de la Playa del Bollullo. Se trata de una playa muy visitada por surfistas', N'', 980, 45, N'Línea 376 que pasa cada 2 horas.', N'(28.4184693,-16.5131066)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (9, N'Playa Mesa del Mar-Tacoronte', 2, 7, N'Mesa del Mar', N'922 57 00 15', NULL, N'', 100, 5, N'Linea TITSA 021. Salida desde la estación de guaguas de Tacoronte.', N'(28.505165965471978, -16.422886848449707)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (10, N'Barrio pesquero El Pris - Tacoronte', 2, 7, N'El Pris', N'922 57 00 15', N'Barrio pesquero con playa indicada para el baño y piscina natural.', N'',104, 45, N'Línea TITSA 023. Salida desde Estación de guaguas de Tacoronte.', N'(28.51012509426835, -16.421384811401367)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (11, N'Playa de La Arena', 3, 2, N'Avenida de la Constitución', N'922 50 08 00', N'Playa que se extiende de forma longitudinal 800 metros aproximadamente. Tiene arena negra fina que alterna en algunas zonas con grava o callaos de granulometría pequeña. Presenta un pequeño charco artificial realizado con piedras de la zona en su parte septentrional.  Otros: La zona más septentrional a diferencia del resto, tiene papeleras, cartel de prohibido perros, bandera de señalización y flotadores de salvamento. Está próxima a aparcamientos y zonas comerciales de ocio y restauración. ', N'', 800,80, N'En guagua desde Santa Cruz las líneas 122, 123,124, 131, 120, 121', N'(28.35394230526438, -16.369667172257323)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (12, N'Playa El Pozo', 3, 2, N'Avda. la Constitución', N'922 50 08 00', N'Descripción: Playa de callaos de granulometría pequeña. De unos 12 metros de longitud, se encuentra inserta en el refugio pesquero.  Otros: Próxima a un puesto de salvamento marítimo de la Cruz Roja. Hay contenedores, un cartel de prohibidos perros y barcos varados. Existe una hornacina para la Virgen del Carmen. Se encuentra próxima a zonas de ocio y restauración. ', 350, 12, N'', N'', N'(28.357643388829587, -16.368768274696777)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (13, N'Playa La Hornilla', 3, 2, N'C/ La PIscina, Candelaria', N'922 50 08 00', N'Descripción: Pequeño paseo marítimo con zonas aptas para el baño. Cuando hay bajamar aparece una pequeña playa de fina arena negra en la parte superior. Cuenta con varios puntos de acceso al agua.  Otros: Dispone de papeleras y contenedores de basura, así como de zonas ajardinadas ', N'', 80, 20, N'', N'(28.360117000291282, -16.36694437256665)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (14, N'Playa de El Alcalde', 3, 2, N'Avda. de la Constitución', N'922 50 08 00', N'Descripción: Pequeña playa en forma de herradura, con escolleras en ambos extremos. La parte superior es de tierra, en la zona media presenta callaos de granulometría pequeña y, en la parte inferior, arena. Su longitud está en torno a los 30 metros. Cuenta con jardines en la parte superior. Dispone de papeleras. Está próxima a aparcamientos y a zonas comerciales, de ocio y restauración.  ', 150, 30, N'', N'En Bus desde Santa Cruz líneas 122, 120, 121, 123, 124, 131. Desde el sur las guaguas paran en la autopista (111, 115, 116)', N'(28.355906161591705, -16.36947637787671)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (15, N'Playa de Punta Larga', 3, 2, N'Avda. Marítima, Punta Larga', N'922 50 08 00', N'La nueva zona de baño de Punta Larga tiene rampas de entrada y una pasarela de madera que discurre en paralelo al paseo marítimo.', N'', N'', 104, 25, N'(28.368387129941308, -16.362084209831664)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (16, N'Playa la Arena', 3, 6, N'Av marítima, playa la arena', N'', N'Playa natural de arena negra volcánica, situada en la costa de Puerto Santiago, ha sido galardonada consecutivamente con la bandera azul de los mares limpios de Europa desde 1988 hasta hoy, por la calidad de sus aguas, , accessibilidad y servicios que ofrece al bañista.', N'A black sand beach situated on the coast of Puerto Santiago, awarded an european blue flag for 24 consecutive years(1988)', 178, 100, N'', N'')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (17, N'Playa de los Guios o Argel', 3, 6, N'C/ los Guios, los Gigantes', N'922 86 03 48', N'Playa junto al acantilado y al muelle de los Gigantes.', N'', 140, 40, N'', N'')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (18, N'Playa del Camisón', 3, 1, N'Playa de Las Américas', N'', N' Ubicada en una de las zonas más transitadas de Playa de Las Américas, la Playa del Camisón brinda a sus bañistas sol y relax.  Localizada frente a complejos hoteleros de primer orden, esta playa se ha consolidado como una de las más importantes del municipio.  Bordeada por el paseo marítimo, dispone de todo tipo de servicios y comodidades para los turistas. El especial cuidado que se ha llevado a cabo en esta playa ha hecho que en 2010 la Fundación Europea de Educación Ambiental le concediese la Bandera Azul por la calidad de sus aguas, gestión medioambiental y cuidado del entorno, así como los servicios prestados para todo tipo de bañistas. En las cercanías se encuentra una agradable terraza donde se puede disfrutar relajadamente de cualquier aperitivo junto al mar. Por las inmediaciones del paseo marítimo se puede contemplar una panorámica inmejorable de la vecina isla de La Gomera. Longitud: 350 metros. Anchura: 40 metros. Grado de ocupación: Alto Ubicación física: En el centro de Playa de Las Américas, frente al paseo marítimo y complejos hoteleros de exclusividad.  Accesos a la playa: para peatones. Parking cercanos para vehículos. Proximidad al núcleo turístico: Sí. Tipo de playa: Artificial Condiciones de baño: Aguas tranquilas Morfología: Arena   Servicios prestados:   - Alquiler de Hamacas y sombrillas - Duchas / Lavapiés - Papeleras - Baños - Servicio de limpieza - Actividades acuáticas (Jetsky, motos acuáticas,  parascending, pedales, banana) -     Seguridad policial Galardones:  2010: Bandera Azul otorgada por la FEEE (Fundación Europea para la Educación ambiental) Datos históricos:    De sus llanuras se extrajo la arena y el callao con que fabricar viviendas, acequias, charcas, etc., y de su litoral la piedra caliza que después se transformaría en cal en los hornos de la zona. En la Punta de El Camisón, a los pies de El Cabezo Grande existieron unas salinas hasta mediados de los años 80: las Salinas de El Gincho. Importante entorno donde recababan, para descansar, muchas aves migratorias y de las que se abastecían los pescadores para el salado y jareado del pescado. En este paraje, casi desértico, se llegó a plantar cereales, tomates y algodón y existieron salones para guardar las herramientas y la sal que se extraía de las salinas, y dos hornos de cal. Esta zona reunía las condiciones perfectas, según numerosas autoridades e instituciones, para la construcción del aeropuerto de Tenerife, pero, lo lejos que estaba Los Cristianos de la capital, la falta de carretera en condiciones y otras carencias hicieron que se frustrara el proyecto.   Oficina de Información Turística más cercana:  Oficina de Información Turística Playa de Las Américas Tel: 922 797 668  Oficina de Información Turística Playa de Las Vistas Tel: 922 787 011 ', N'', 350, 40, N'Autopista TF 1 en dirección Playa de Las Américas frente al paseo marítimo Francisco Andrade Fumero y cercanías de la zona comercial por excelencia conocida como ‘La Milla de Oro’.  Líneas 473, 416, 467, 417, 477.', N'(28.0639452, -16.730575600000065)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (19, N'Playa Honda: Las Palmeras', 3, 1, N'Playa de Las Américas', N'', N'En un enclave natural incomparable Arona brinda una amplia gama de playas para la práctica de surf, donde expertos y principiantes podrán descubrir la particularidad de este deporte. Más de un kilómetro y medio de playas para  surfear se despliegan ante el visitante, sin duda un espectáculo durante todo el año.    En estas playas deportivas el amante del surf encontrará distintos tipo de olas, aptas para todos. Escuelas especializadas en este deporte brindan clases para distintos niveles, así como alquiler de equipos y tablas.    Durante años consecutivos se han realizado campeonatos de renombre en las playas para la práctica de surf que Arona oferta en este litoral de Playa de Las Américas, siendo este lugar el más óptimo para surfear en el sur de la isla de Tenerife.                  Es usual que los asiduos a este deporte se desplacen hasta este punto de la isla para la práctica de surf en busca del tipo de olas que el  municipio de Arona ofrece. Para muchos, es idílico poder zambullirse sobre la tabla bajo el sol de invierno que caracteriza este municipio.    Con la isla de la Gomera como telón de fondo, un paseo por esta zona del litoral puede resultar realmente placentero. Desde este lugar, donde existen terrazas  ‘chill out’ pensadas para el disfrute del buen tiempo todo el año, se pueden admirar los mejores atardeceres del sur de Tenerife.     Divagando entre las esculturas ubicadas en esta zona del paseo marítimo, el visitante encontrará un rincón  de la isla, donde el Atlántico, olas e incomparables atardeceres, convierten este lugar en un paraje singular en el municipio de Arona Longitud: 1,6 Kilómetros de extensión Grado de Ocupación: Medio Ubicación Física: Playa de Las Américas Proximidad al núcleo turístico: Sí Accesos a la playa: para peatones y vehículos. Parking Público en las cercanías. Tipo de playa: Natural Condiciones de baño: Oleaje fuerte Morfología: Rocas   Servicios Prestados:  -Papeleras -Seguridad Policial -Servicio de Limpieza   Olas y Picos en las Playas Deportivas:  Playa Honda: ‘Las Palmeras’, ‘La Izquierda’ ‘El Medio’ La Montañeta ‘El Conquistador’ o ‘La Derecha’ El Guincho: ‘La Piscina’ El Dedo El Cabezo Grande: ‘Salinas’ Charco del Marqués: ‘Fitenia’     El litoral costero de Playa de Las Américas es perfecto para los amantes de surf y bodyboard. Aquí se encuentran picos bien definidos en la zona de Palmeras, El Medio, Playa Honda, La Derecha, El Conquistador, La Piscina, El Dedo y Fitenia.    Todas presentan unas condiciones perfectas lo cual permite la práctica de este deporte tanto para principiantes como deportistas con un nivel más avanzado.    Las olas de este enclave se caracterizan por ser de ‘reef’ rocoso (comúnmente denominadas como bajas). Esto hace que se pueda formar una ola con características únicas, formando una ola con largo recorrido e incluso tubos. Éstas son muy valoradas por surfistas, pues nada tienen que envidiar a las de otros lugares del mundo.     En los años 90 la ola de ‘Palmeras’ quedó entre las diez mejores olas de Europa, dándole un merecido reconocimiento a nivel nacional e internacional, sumado a la sucesión de múltiples campeonatos de Surf de distintas categorías llevados a cabo en este lugar.    Las condiciones en invierno son de olas perfectas que rondan el metro de altura constante, con fuerza noroeste, llegando a rachas de temporal superando los dos metros de altura.     En Playa de Las Américas se puede presumir de un clima perfecto en nuestras playas, con temperaturas agradables durante todo el año. No en vano la temperatura del agua ronda los 19º. Un lujo que permite a los amantes de este deporte surfear con una licra de neopreno o para los más frioleros un 3/2 mm de traje de neopreno. Todo ello permite el baño prolongado durante más de dos horas sin sentir frío, considerándose impensable en Europa durante los meses de invierno.     En verano en las playas se disfruta del sol estival, con un mínimo de medio metro de olas ‘glassi’, con fuerza sur constante. No se requiere traje de neopreno, pues la temperatura del agua supera los 20º.    Las escuelas para la práctica de surf ofrecen clases de iniciación para el disfrute de las olas de Playa de Las Américas. En una sucesión de más de 1.5 kilómetros de costa encontrarás  olas consideradas de las mejores del mundo. Oficina de Información Turística más cercana:  Oficina de Información Turística Playa de Las Américas Tel: 922 797 668 ', N'', 1600 , 70, N'Ubicación en Playa de Las Américas, Paseo Marítimo Francisco Andrade Fumero. Frente a Hotel Villa Cortés y Hotel Conquistador. En transporte público regular: Líneas 473, 416, 467, 417, 477.', N'(28.0639452, -16.730575600000065)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (20, N'Playa de Las Vistas', 3, 1, N'Playa de Los Cristianos', N'', N'Sin duda alguna la más extensa del municipio de Arona, la Playa de Las Vistas se prolonga a lo largo de casi 1 kilómetro de longitud como nexo entre Playa de Las Américas y Los Cristianos.  Considerada como uno de los puntos de interés de la isla de Tenerife, esta playa se caracteriza por su variedad, animación y accesibilidad para todo tipo de bañistas.    La Playa de las Vistas se despliega ante el visitante, teniendo cabida para el relax, un clima incomparable,  actividades acuáticas de distinta índole, así como un baño en aguas limpias y tranquilas.    No en vano, se considera una playa para todos, donde turistas y residentes disfrutan del sol y el mar durante las cuatro estaciones.  Jóvenes y mayores, familias y parejas, encontrarán en la Playa de Las Vistas la playa perfecta para sus vacaciones.      Considerada como una de las de mayor renombre de Tenerife no sólo por sus características, sino por ser pionera en accesibilidad en Canarias, la Playa de las Vistas es una de las dos playas más visitadas de España por personas con movilidad reducida y ha sido galardonada con la distinción temática “Accesibilidad en Playas”.    Esta playa totalmente accesible es un lugar ideal para turistas con movilidad reducida gracias a sus  instalaciones sin barreras, todo tipo de servicios adaptados y la tranquilidad de sus aguas. Todo ello vinculado al excelente clima del municipio a lo largo de todo el año.    Durante varios años ha sido galardonada con la Bandera Azul de la Unión Europea por sus excelentes características y servicios prestados.   Longitud: 925 metros Anchura: 80 metros. Grado de ocupación: alto. Ubicación Física: Paseo Marítimo Playa de Las Vistas. Limita con Playa de Las Américas por el paseo marítimo. Cercana a la Estación Marítima de Los Cristianos. Proximidad al núcleo turístico: Sí Accesos a la playa: para peatones. Aparcamiento gratuito. Parking privados en las inmediaciones. Localización acceso para vehículos de emergencias: Sí. Tipo de playa: artificial Condiciones de baño: aguas tranquilas Morfología: arena  Servicios prestados:  -Alquiler de hamacas y sombrillas -Pasarelas -Duchas / Lavapiés -Papeleras -Baños -Servicio de limpieza -Contenedores para reciclaje de residuos -Socorrismo, vigilancia y equipos de salvamento - Área accesible para turistas con movilidad reducida. -Actividades acuáticas (Jetsky, motos acuáticas, parascending,  pedales, banana) -Seguridad Policial  -Webcam de la Playa de Las Vistas  en www.arona.travel   Área accesible en la Playa de Las Vistas:  Arona es uno de los destinos vacacionales con mayor número de turistas con movilidad reducida del mundo. La Playa de Las Vistas ofrece al visitante un área accesible donde podrá disfrutar de los siguientes servicios:   - Estacionamiento próximo a la playa con plazas reservadas. -Señalización de itinerario accesible, playa accesible y servicios. -Itinerario Accesible. -Rampas de acceso –6%. -Sillas anfibias -Muletas anfibias -Grúa hidráulica  -Pasarelas fijas de madera -Pasarelas enrollables -Zona de descanso con sombrillas -Área de vigilancia -Aseos adaptados -Duchas adaptadas  Servicio de la Silla Acuática: La empresa de Salvamento Marítimo ubicada en la playa realiza el servicio de baño adaptado de forma gratuita   • Servicio diario (todo el año). • Horario de 10 a 17h.                      10 a 18 h. de Julio a Septiembre  • Reservas: Directamente (el mismo día) en el puesto de vigilancia de la Zona Accesible.  Los grupos deben reservar el servicio de la silla acuática por vía telefónica: 608 843 561  Información útil: Es obligatorio que niños o personas con discapacidad psíquica estén acompañados por un adulto.  Galardones:   Desde el año 1999  Bandera Azul otorgada por la FEEE (Fundación Europea para la Educación ambiental)    Distinción Temática “Accesibilidad en Playas” por la Asociación de Educación Ambiental y del Consumidor (ADEAC).   Distinción Temática en Información y Educación Ambiental concedido en el 2010 gracias al desarrollo de diferentes campañas de concienciación y de limpieza del litoral  todo el municipio. Playa de Las Vistas, fruto de las recientes obras de remodelación y ampliación tomó su nombre de la pequeña playa más próxima a San Telmo y que los vecinos llamaban “Vistas del Camisón”, uniéndose a la “Playa de la Carnada” situada delante de Vintersol  Oficina de Información Turística más cercana:  Oficina de Información Turística Playa de Las Vistas Tel: 922 787 011 ', N'', 925, 80, N'Desde autopista TF1 en dirección Los Cristianos hasta la estación marítima. Seguir señalización viaria. En transporte público: líneas 110, 111, 473. 416, 467, 477, 417, 472, 418.', N'(28.050039, -16.717233999999962)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (21, N'Playa del Callao ', 3, 1, N'Playa del Callao. Playa de Los Cristianos', N'', N'La Playa del Callao ofrece al bañista tranquilidad y relax. En un enclave sin aglomeraciones el visitante podrá disfrutar del mar en su estado más puro. En esta playa, alejada del bullicio, el turista encontrará un paraje en el que el Espacio Natural Protegido de Guaza tiene sus faldas.     Una de las principales características de la Playa del Callao es que dispone de un área nudista. La combinación de arena y piedras le confieren un aspecto natural, y sus aguas limpias a mar abierto hacen de la Playa del Callao un espacio donde el disfrute del sol y el mar está garantizado. Longitud: 420 m. Anchura: 30 m.  Grado de ocupación: bajo Ubicación física: Final de la Avenida Juan Carlos I, dejando atrás el paseo marítimo. Proximidad al núcleo turístico: Semiurbana. Accesos a la playa: Para peatones. Aparcamiento público en los alrededores. Tipo de Playa: Natural Vegetación: Sí Condiciones de Baño: Aguas tranquilas Morfología: ‘Callaos’ (Piedras redondas semiplanas) Zona nudista: Si Servicios prestados:   -Papeleras -Seguridad policial -Servicio de limpieza  Esta playa está tradicionalmente vinculada a la pesca y el marisqueo de burgados y lapas  ', N'', 420, 30, N'Salida de la autopista TF1 en dirección Los Cristianos. Seguir siempre recto hasta el final de la Avenida Juan Carlos I. Junto al Arona Gran Hotel.  En transporte público: líneas 110, 111, 473. 416, 467.', N'(28.0396244, -16.708548599999972)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (22, N'Playa Jardín', 2, 4, N'Avenida Francisco Afonso Carrillo, Puerto de la Cruz', N'', N'Playa artificial, construida en 1993. Diseñada por César Manrique. Cuenta con  jardines con palmeras, cocoteros, plataneras y otros árboles, la superficie ajardinada de la playa supera los 17.000 metros cuadrados.   ', N'', 700, 50, N'', N'(28.4110894, -16.560798400000067)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (23, N'Playa de los Cristianos ', 3, 1, N'Playa de Los Cristianos', N'', N'La Playa de los Cristianos se considera una de las playas históricas del municipio de Arona. Ubicada en pleno centro neurálgico de Los Cristianos conserva aún la esencia del que antaño fue un pequeño poblado marinero, dando  paso posteriormente a uno de los núcleos turísticos más conocidos de Tenerife. Distintas embarcaciones pesqueras hacen hoy en día que permanezca la esencia del pueblo de pescadores que aún en la actualidad se funde con el enclave turístico de Los Cristianos, lo que le confiere cierta particularidad donde se mezclan pasado y presente.  Longitud: 400 metros Anchura: 82 metros Grado de ocupación: Alto Ubicación Física: Junto a la zona peatonal comercial de Los Cristianos, frente al paseo marítimo. En las cercanías de la explanada de la estación marítima. Proximidad al núcleo turístico: Sí Accesos a la playa: para peatones. Parking privado para vehículos en las inmediaciones. Tipo de playa: Natural Condiciones de baño: aguas tranquilas Morfología: Arena.    Servicios prestados:  -Alquiler de hamacas y sombrillas -Duchas / Lavapiés -Papeleras -Baños -Servicio de limpieza -Contenedores para reciclaje de residuos -Socorrismo, vigilancia y equipos de salvamento -Escuela de Vela Datos históricos:     La Playa de Los Cristianos está en gran manera unida al comienzo del turismo en el sur de Tenerife. En el año 1957 un grupo de jóvenes suecos con movilidad reducida, originada por problemas reumáticos, llegó al poblado marinero de Los Cristianos después de haber recorrido medio mundo. En este lugar, gracias a su agradable clima y a su playa, mejoró notablemente su estado de salud. La llegada de estos visitantes escandinavos dio lugar al nacimiento del turismo en el municipio de Arona. Desde entonces hasta la actualidad, Los Cristianos se ha convertido en un reclamo turístico para visitantes de distintas nacionalidades a lo largo del año. Gracias a su clima benéfico y las óptimas condiciones de su costa, miles de turistas  buscan en Playa de Los Cristianos y Playa de Las Américas el sol de invierno tan anhelado en sus países en los meses de frío. Oficina de Información Turística más cercana:  Oficina de Información Turística Playa de Las Vistas Tel: 922 787 011 ', N'',400, 82, N'Desde autopista TF1 en dirección Los Cristianos hasta la estación marítima. Seguir señalización viaria. En transporte público: líneas 110, 111, 473. 416, 467. 477, 417, 472, 418, 343.', N'(28.050039, -16.717233999999962)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (24, N'Playa de Playa San Juan', 3, 3, N'Playa San Juan', N'', N'', N'', 100, 25, N'', N'(28.181263, -16.817625700000008)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (25, N'Playa Abama', 3, 3, N'Crta. General Tf 47, Playa San Juan (Hotel Abama)', N'', N'', N'', 100, 25, N'', N'(28.1709783, -16.796781399999986)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (26, N'Playa de Las Galletas', 3, 1, N'Playa de Las Galletas', N'', N'A 15 km de los núcleos turísticos de Playa de Las Américas y Los Cristianos se encuentra el enclave costero de Las Galletas. Su costa, abastecimiento de pescadores ayer y hoy, es transitada por gente del lugar convirtiendo la Playa de Las Galletas en una de las de mayor ambiente local del municipio de Arona.     El mercado de pescado, y la Marina del Sur, le confieren un peculiar aspecto marinero. Es  frecuente encontrar pescadores realizando su actividad diaria, tejiendo redes o habilitando sus barcas para el ejercicio cotidiano de la pesca.     Sin duda alguna la Playa de Las Galletas muestra al visitante un claro ejemplo del más puro ambiente local, donde el turismo se mezcla con los lugareños durante todo el año. Longitud: 420 metros Anchura: 25 metros Grado de ocupación: medio Zona de fondeo: dispone de pantalanes y zona de fondeo para barcos. Ubicación física: En una de las principales vías de entrada al núcleo costero de Las Galletas. Proximidad al núcleo turístico: Sí. Accesos a la playa: para peatones. Aparcamiento público en las inmediaciones. Tipo de playa: natural Condiciones de baño: Aguas tranquilas Morfología: Playa mixta de grava y arena.   Servicios prestados:  -Alquiler de hamacas -Lavapiés -Papeleras -Baños -Servicio de limpieza -Torre de vigilancia -Webcam de la Playa de Las Galletas  en www.arona.travel  Datos históricos:   Las Galletas nace como núcleo vinculado a la pesca y al marisqueo en sus bellos  bahíos. La Playa de Las Galletas es aquella en la que los pescadores varaban sus barcos y sobre los negros ‘callaos’, sus mujeres clasificaban el pescado, dispuestos en cajas o cestas  para su venta.    En la orilla de la Playa de Las Galletas se levantaba “El Salón”, hoy desaparecido pero aún presente en la memoria de sus vecinos. El Salón, era una construcción de principios del siglo XX, y está relacionado al cultivo del tomate. En el Salón se almacenaban los tomates a la espera de ser trasladados en barcos de cabotaje a Santa Cruz, capital de la isla,  para su posterior exportación.  Oficina de Información Turística más cercana:  Oficina de Información Turística Playa de Las Galletas Tel: 922 730 133 ', N'', 420, 25, N'Salida 25 de la autopista TF1 en dirección Las Galletas.  En transporte público: Líneas 115 desde Santa Cruz, 467 y 470 desde Los Cristianos-Playa de Las Américas y Golf del Sur.', N'(28.0086864, -16.659929000000033)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (27, N'Playa de Alcalá', 3, 3, N'Alcalá', N'', N'', N'', 100, 25, N'', N'(28.2026563, -16.828296799999976)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (28, N'Playa de Martiánez', 2, 4, N'Avda. de Colón', N'', N'Es la zona más tradicional de baño del Puerto de la Cruz y centro del boom turístico que experimentó la ciudad en la década de los 60 del siglo XX. También llamada La Barranquera, por ser la desembocadura del barranco de Martiánez, es una playa natural de arena negra volcánica, protegida en parte por una escollera artificial. La denominación de este lugar emblemático de la ciudad es una derivación popular del nombre del propietario original de estos terrenos costeros: Martín Yanes.', N'', 100, 25, N'', N'(28.41778677597734, -16.54163360595703)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (29, N'Playa Charco del baño ', 3, 1, N'Playa de Las Galletas', N'', N'Esta pequeña playa se encuentra a continuación de la Playa de Las Galletas, separadas por el muelle embarcadero de esta localidad.     Charco del baño se caracteriza por ser una playa con carácter acogedor, frecuentada mayormente por lugareños, donde se respira aún el olor a sal y tiempos pasados. El  descanso está garantizado en este pequeño enclave bordeado por un pequeño paseo marítimo donde variedad de restaurantes ofrecen productos de la tierra y el mar. Terrazas para el disfrute del buen tiempo y la comodidad se encuentran en primera línea de esta singular playa.   Longitud: 240 metros Anchura: 16 metros Grado de ocupación: Bajo Ubicación física: en el paseo marítimo de Las Galletas. Junto al muelle y la rambla. Proximidad al núcleo turístico: Sí Accesos a la playa: para peatones. Aparcamiento público en vías de acceso al pueblo. Tipo de playa: Natural Condiciones de baño: Oleaje moderado Morfología: Mixta (Arena y rocas)    Servicios Prestados:  Alquiler de hamacas Duchas Papeleras Baños Servicio de limpieza Rampas de acceso  Datos Históricos:  El Charco del Baño ha acogido tradicionalmente el trasiego de vecinos y visitantes. La vinculación de los pescadores del lugar y sus familias con sus bahíos es intensa pues de ellos obtienen  sustento y como no, momentos  de ocio.    Oficina de Información Turística más cercana:  Oficina de Información Turística Playa de Las Galletas Tel: 922 730 133 ', N'', 240, 16, N'Salida 25 de la autopista TF1 en dirección Las Galletas.  En transporte público: Líneas 115 desde Santa Cruz, 467 y 470 desde Los Cristianos-Playa de Las Américas y Golf del Sur.', N'(28.0086864, -16.659929000000033)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (30, N'Playa de las Teresitas', 1, 5, N'San Andrés', N'', N'Situada en el pueblo de San Andrés. Hasta su transformación estaba dividida en tres partes bien diferenciadas que poseían nombres distintos: Tras la Arena que era la parte inicial, Los Moros, en el medio y por último la zona comprendida por el barranco de Las Teresas. Sobre la playa de arena negra, se echó arena blanca traída del desierto del Sáhara, y se construyó un dique rompeolas para evitar el oleaje.', N'', 1300, 80, N'', N'(28.508522359508084, -16.187152862548828)')
INSERT [dbo].[Playas] ([Id], [Nombre], [ZonaId], [MunicipioId], [Direccion], [Telefono], [DescripcionEsp], [DescripcionIng], [Longitud], [Ancho], [ComoLlegar], [Georeferencia]) VALUES (51, N'playa de los bichos', 1, 1, N'', N'22222fff', N'', NULL, 350, 30, N'', N'')
SET IDENTITY_INSERT [dbo].[Playas] OFF
SET IDENTITY_INSERT [dbo].[Puntuaciones] ON 

INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (9, 9, N'e4b17c93-2743-4bfc-84d6-82a6515869e8', 7)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (12, 5, N'e4b17c93-2743-4bfc-84d6-82a6515869e8', 9)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (13, 5, N'e4b17c93-2743-4bfc-84d6-82a6515869e8', 10)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (14, 10, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', 51)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (15, 2, N'6d86de97-62e3-4af2-b1d6-798d38cdc733', 51)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (17, 4, N'6d86de97-62e3-4af2-b1d6-798d38cdc733', 30)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (18, 2, N'6d86de97-62e3-4af2-b1d6-798d38cdc733', 29)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (19, 5, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', 22)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (20, 1, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', 26)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (21, 4, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', 30)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (22, 5, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', 20)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (23, 3, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', 28)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (24, 5, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', 11)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (25, 5, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', 9)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (26, 7, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', 14)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (27, 3, N'8cb66d34-bc08-47df-b8ab-e4e8c0f89e7f', 9)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (28, 5, N'adb132ab-fcdb-49a2-b90e-dd81e4b61576', 18)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (29, 5, N'adb132ab-fcdb-49a2-b90e-dd81e4b61576', 18)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (30, 7, N'adb132ab-fcdb-49a2-b90e-dd81e4b61576', 14)
INSERT [dbo].[Puntuaciones] ([Id], [nota], [UserId], [PlayaId]) VALUES (31, 9, N'adb132ab-fcdb-49a2-b90e-dd81e4b61576', 7)
SET IDENTITY_INSERT [dbo].[Puntuaciones] OFF
SET IDENTITY_INSERT [dbo].[Zonas] ON 

INSERT [dbo].[Zonas] ([Id], [Nombre]) VALUES (1, N'Metropolitana')
INSERT [dbo].[Zonas] ([Id], [Nombre]) VALUES (2, N'Norte')
INSERT [dbo].[Zonas] ([Id], [Nombre]) VALUES (3, N'Sur')
SET IDENTITY_INSERT [dbo].[Zonas] OFF
/****** Object:  Index [PK__aspnet_U__1788CC4DC67376D1]    Script Date: 13/06/2015 19:38:08 ******/
ALTER TABLE [dbo].[aspnet_Users] ADD PRIMARY KEY NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (newid()) FOR [UserId]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT (NULL) FOR [MobileAlias]
GO
ALTER TABLE [dbo].[aspnet_Users] ADD  DEFAULT ((0)) FOR [IsAnonymous]
GO
ALTER TABLE [dbo].[Comentarios] ADD  CONSTRAINT [DF_Comentarios_fecha]  DEFAULT (getdate()) FOR [fecha]
GO

ALTER TABLE [dbo].[CategoriasPlayas]  WITH CHECK ADD  CONSTRAINT [FK_CategoriaPlayaCategoria] FOREIGN KEY([CategoriaId])
REFERENCES [dbo].[Categorias] ([Id])
GO
ALTER TABLE [dbo].[CategoriasPlayas] CHECK CONSTRAINT [FK_CategoriaPlayaCategoria]
GO
ALTER TABLE [dbo].[CategoriasPlayas]  WITH CHECK ADD  CONSTRAINT [FK_PlayaCategoriaPlaya] FOREIGN KEY([PlayaId])
REFERENCES [dbo].[Playas] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CategoriasPlayas] CHECK CONSTRAINT [FK_PlayaCategoriaPlaya]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_ComentarioPlaya] FOREIGN KEY([PlayaId])
REFERENCES [dbo].[Playas] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_ComentarioPlaya]
GO
ALTER TABLE [dbo].[Comentarios]  WITH CHECK ADD  CONSTRAINT [FK_Comentarios_aspnet_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Comentarios] CHECK CONSTRAINT [FK_Comentarios_aspnet_Users]
GO
ALTER TABLE [dbo].[Imagenes]  WITH CHECK ADD  CONSTRAINT [FK_Imagenes_Playas] FOREIGN KEY([IdPlaya])
REFERENCES [dbo].[Playas] ([Id])
GO
ALTER TABLE [dbo].[Imagenes] CHECK CONSTRAINT [FK_Imagenes_Playas]
GO
ALTER TABLE [dbo].[Playas]  WITH CHECK ADD  CONSTRAINT [FK_MunicipioPlaya] FOREIGN KEY([MunicipioId])
REFERENCES [dbo].[Municipios] ([Id])
GO
ALTER TABLE [dbo].[Playas] CHECK CONSTRAINT [FK_MunicipioPlaya]
GO
ALTER TABLE [dbo].[Playas]  WITH CHECK ADD  CONSTRAINT [FK_ZonaPlaya] FOREIGN KEY([ZonaId])
REFERENCES [dbo].[Zonas] ([Id])
GO
ALTER TABLE [dbo].[Playas] CHECK CONSTRAINT [FK_ZonaPlaya]
GO
ALTER TABLE [dbo].[Puntuaciones]  WITH CHECK ADD  CONSTRAINT [FK_Puntuaciones_aspnet_Users] FOREIGN KEY([UserId])
REFERENCES [dbo].[aspnet_Users] ([UserId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Puntuaciones] CHECK CONSTRAINT [FK_Puntuaciones_aspnet_Users]
GO
ALTER TABLE [dbo].[Puntuaciones]  WITH CHECK ADD  CONSTRAINT [FK_PuntuacionPlaya] FOREIGN KEY([PlayaId])
REFERENCES [dbo].[Playas] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Puntuaciones] CHECK CONSTRAINT [FK_PuntuacionPlaya]
GO
