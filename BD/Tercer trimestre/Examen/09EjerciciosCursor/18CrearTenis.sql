-- Dump File
--
-- Database is ported from MS Access
----------------------------------------------------------
-- Program Version 3.0.148

--CREATE DATABASE [tenis]
go

USE [tenis]
go

--
-- Table structure for table 'EdicionTorneo'
--

IF object_id('EdicionTorneo', 'U') IS NOT NULL DROP TABLE [EdicionTorneo]

CREATE TABLE [EdicionTorneo] (
  [id] INT NOT NULL primary key IDENTITY, 
  [IdTorneo] INT, 
  [Fecha] DATETIME, 
  [Njugadores] INT, 
  [premios] FLOAT, 
  [Ganador] INT
)


--
-- Table structure for table 'Torneo'
--

IF object_id('Torneo', 'U') IS NOT NULL DROP TABLE [Torneo]

CREATE TABLE [Torneo] (
  [IdTorneo] INT NOT NULL primary key, 
  [Torneo] VARCHAR(255), 
  [IdPais] INT, 
  [IdTipo] INT, 
  [IdSuperficie] INT, 
  [IdEstadio] INT
)
--
-- Table structure for table 'Jugador'
--

IF object_id('Jugador', 'U') IS NOT NULL DROP TABLE [Jugador]

CREATE TABLE [Jugador] (
  [IdJugador] INT NOT NULL primary key, 
  [Jugador] VARCHAR(255)
)

--
-- Table structure for table 'Superficie'
--

IF object_id('Superficie', 'U') IS NOT NULL DROP TABLE [Superficie]

CREATE TABLE [Superficie] (
  [Id] INT NOT NULL primary key, 
  [Superficie] VARCHAR(255)
)

--
-- Table structure for table 'TipoTorneo'
--

IF object_id('TipoTorneo', 'U') IS NOT NULL DROP TABLE [TipoTorneo]

CREATE TABLE [TipoTorneo] (
  [IdTipo] INT NOT NULL primary key, 
  [TipoTorneo] VARCHAR(255)
)



--
-- Table structure for table 'Pais'
--

IF object_id('Pais', 'U') IS NOT NULL DROP TABLE [Pais]

CREATE TABLE [Pais] (
  [Id] INT NOT NULL primary key, 
  [Pais] VARCHAR(255)
)



--
-- Table structure for table 'Estadio'
--

IF object_id('Estadio', 'U') IS NOT NULL DROP TABLE [Estadio]

CREATE TABLE [Estadio] (
  [IdEstadio] INT NOT NULL primary key, 
  [Estadio] VARCHAR(255)
)

go




SET IDENTITY_INSERT [EdicionTorneo] ON
GO

--
-- Dumping data for table 'EdicionTorneo'
--
set dateformat ymd
go
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (1, 12, '2010-01-11 00:00:00', 28, 257773, 32)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (2, 53, '2012-07-09 00:00:00', 32, 288771, 32)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (3, 71, '2012-08-19 00:00:00', 48, 401070, 32)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (4, 63, '2011-07-11 00:00:00', 32, 398250, 33)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (5, 27, '2010-02-08 00:00:00', 32, 320856, 33)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (6, 25, '2009-04-06 00:00:00', 32, 398250, 33)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (7, 24, '2010-02-15 00:00:00', 32, 344640, 33)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (8, 66, '2010-07-26 00:00:00', 28, 398250, 33)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (9, 37, '2010-04-05 00:00:00', 28, 320856, 34)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (10, 23, '2010-09-20 00:00:00', 28, 368450, 34)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (11, 65, '2013-09-30 00:00:00', 32, 940454, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (12, 70, '2009-08-02 00:00:00', 48, 845104, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (13, 12, '2009-01-12 00:00:00', 28, 311067, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (14, 68, '2012-10-15 00:00:00', 28, 486750, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (15, 70, '2013-07-29 00:00:00', 48, 939577, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (16, 16, '2013-10-21 00:00:00', 32, 1445835, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (17, 16, '2012-10-22 00:00:00', 32, 1404300, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (18, 56, '2013-02-11 00:00:00', 32, 1267875, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (19, 46, '2012-02-20 00:00:00', 28, 512750, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (20, 33, '2012-04-30 00:00:00', 28, 398250, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (21, 33, '2011-04-25 00:00:00', 28, 398250, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (22, 28, '2011-02-21 00:00:00', 32, 320856, 35)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (23, 31, '2013-05-19 00:00:00', 28, 410200, 36)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (24, 37, '2012-04-09 00:00:00', 28, 320856, 36)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (25, 36, '2012-07-16 00:00:00', 32, 900000, 36)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (26, 69, '2012-01-30 00:00:00', 28, 288771, 36)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (27, 41, '2012-09-24 00:00:00', 28, 616335, 36)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (28, 68, '2009-10-26 00:00:00', 32, 500000, 37)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (29, 71, '2013-08-18 00:00:00', 48, 417113, 37)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (30, 68, '2010-10-25 00:00:00', 28, 575250, 37)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (31, 47, '2012-02-20 00:00:00', 32, 837490, 37)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (32, 47, '2013-02-18 00:00:00', 32, 879365, 38)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (33, 65, '2012-10-01 00:00:00', 32, 928537, 38)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (34, 39, '2011-01-31 00:00:00', 32, 320856, 39)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (35, 28, '2012-02-27 00:00:00', 32, 320856, 39)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (36, 35, '2010-06-07 00:00:00', 32, 663750, 40)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (37, 37, '2009-04-06 00:00:00', 32, 320856, 40)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (38, 23, '2013-04-22 00:00:00', 28, 410200, 41)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (39, 67, '2011-10-31 00:00:00', 32, 1357000, 42)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (40, 34, '2011-07-25 00:00:00', 28, 398250, 42)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (41, 40, '2013-07-28 00:00:00', 28, 410200, 42)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (42, 62, '2009-10-19 00:00:00', 32, 531000, 43)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (43, 64, '2010-01-11 00:00:00', 28, 270099, 43)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (44, 2, '2011-07-18 00:00:00', 28, 385028, 44)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (45, 2, '2010-07-19 00:00:00', 28, 385028, 44)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (46, 28, '2009-02-23 00:00:00', 32, 320856, 44)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (47, 53, '2010-07-05 00:00:00', 32, 320856, 44)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (48, 26, '2009-01-05 00:00:00', 32, 288771, 45)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (49, 72, '2009-02-02 00:00:00', 32, 398250, 45)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (50, 61, '2011-10-24 00:00:00', 32, 481285, 45)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (51, 72, '2013-02-04 00:00:00', 28, 410200, 45)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (52, 42, '2012-06-11 00:00:00', 56, 625300, 45)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (53, 26, '2010-01-04 00:00:00', 32, 288771, 45)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (54, 72, '2010-02-01 00:00:00', 32, 398250, 45)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (55, 66, '2012-07-09 00:00:00', 28, 358425, 45)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (56, 61, '2012-09-17 00:00:00', 32, 297907, 46)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (57, 32, '2010-06-13 00:00:00', 32, 405000, 47)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (58, 46, '2010-02-15 00:00:00', 28, 512750, 47)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (59, 61, '2010-10-25 00:00:00', 32, 481285, 48)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (60, 41, '2010-09-27 00:00:00', 28, 616335, 49)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (61, 67, '2013-10-21 00:00:00', 32, 1496095, 49)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (62, 50, '2009-10-19 00:00:00', 32, 725100, 49)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (63, 72, '2012-01-30 00:00:00', 32, 398250, 49)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (64, 34, '2013-07-22 00:00:00', 28, 410200, 49)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (65, 51, '2010-05-02 00:00:00', 32, 398250, 49)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (66, 57, '2012-02-13 00:00:00', 28, 385028, 50)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (67, 26, '2012-01-02 00:00:00', 28, 288771, 50)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (68, 57, '2013-02-11 00:00:00', 28, 396578, 50)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (69, 57, '2011-02-07 00:00:00', 32, 385028, 50)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (70, 13, '2013-09-23 00:00:00', 28, 411516, 50)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (71, 24, '2011-02-14 00:00:00', 32, 347250, 51)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (72, 27, '2011-02-07 00:00:00', 28, 340942, 51)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (73, 22, '2010-07-12 00:00:00', 28, 398250, 51)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (74, 54, '2012-05-20 00:00:00', 28, 398250, 51)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (75, 1, '2009-02-23 00:00:00', 32, 797610, 51)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (76, 54, '2011-05-15 00:00:00', 28, 398250, 51)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (77, 59, '2012-02-13 00:00:00', 28, 344640, 51)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (78, 34, '2010-07-25 00:00:00', 32, 398250, 51)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (79, 53, '2013-07-08 00:00:00', 32, 330482, 52)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (80, 60, '2013-06-16 00:00:00', 32, 410200, 52)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (81, 51, '2011-04-24 00:00:00', 32, 398250, 53)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (82, 41, '2009-09-28 00:00:00', 28, 616335, 53)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (83, 11, '2009-10-11 00:00:00', 56, 2349324, 53)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (84, 66, '2009-07-27 00:00:00', 32, 398250, 53)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (85, 15, '2009-11-22 00:00:00', 8, 3625500, 53)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (86, 29, '2010-01-04 00:00:00', 32, 742502, 53)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (87, 36, '2009-07-19 00:00:00', 48, 1000000, 53)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (88, 7, '2011-03-23 00:00:00', 96, 2642989, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (89, 11, '2012-10-07 00:00:00', 56, 2560763, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (90, 19, '2009-05-04 00:00:00', 28, 398250, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (91, 19, '2011-04-25 00:00:00', 28, 364900, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (92, 3, '2012-08-06 00:00:00', 48, 1920572, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (93, 18, '2010-10-04 00:00:00', 32, 1522710, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (94, 9, '2013-10-28 00:00:00', 48, 2646495, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (95, 18, '2013-09-30 00:00:00', 32, 1678787, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (96, 18, '2009-10-05 00:00:00', 32, 1523072, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (97, 18, '2012-10-01 00:00:00', 32, 1598845, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (98, 15, '2012-11-05 00:00:00', 8, 3988050, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (99, 8, '2013-04-14 00:00:00', 56, 2646495, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (100, 16, '2009-11-02 00:00:00', 32, 1225000, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (101, 15, '2013-11-04 00:00:00', 8, 4350600, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (102, 11, '2013-10-07 00:00:00', 56, 2791232, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (103, 30, '2010-02-22 00:00:00', 32, 1174299, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (104, 5, '2011-03-10 00:00:00', 96, 2642989, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (105, 30, '2009-02-23 00:00:00', 32, 1174299, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (106, 30, '2011-02-21 00:00:00', 32, 1174299, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (107, 3, '2011-08-08 00:00:00', 56, 1761993, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (108, 10, '2011-05-08 00:00:00', 56, 2227500, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (109, 30, '2013-02-25 00:00:00', 32, 1294666, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (110, 7, '2012-03-21 00:00:00', 96, 2880858, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (111, 6, '2011-05-01 00:00:00', 56, 2835000, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (112, 9, '2009-11-08 00:00:00', 48, 2227500, 54)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (113, 25, '2011-04-04 00:00:00', 28, 398250, 55)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (114, 25, '2012-04-09 00:00:00', 28, 398250, 55)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (115, 51, '2012-04-30 00:00:00', 28, 398250, 56)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (116, 35, '2011-06-06 00:00:00', 32, 663750, 56)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (117, 21, '2009-01-04 00:00:00', 32, 313968, 57)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (118, 57, '2009-02-09 00:00:00', 32, 385028, 57)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (119, 70, '2011-07-31 00:00:00', 48, 845756, 57)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (120, 14, '2011-04-18 00:00:00', 56, 1550000, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (121, 14, '2012-04-23 00:00:00', 56, 1627500, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (122, 10, '2012-05-13 00:00:00', 56, 2427975, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (123, 14, '2013-04-22 00:00:00', 48, 1708875, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (124, 14, '2009-04-20 00:00:00', 56, 1550000, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (125, 5, '2013-03-07 00:00:00', 96, 3764677, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (126, 3, '2013-08-05 00:00:00', 56, 2093425, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (127, 10, '2013-05-12 00:00:00', 56, 2646495, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (128, 8, '2011-04-10 00:00:00', 56, 2227500, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (129, 5, '2009-03-12 00:00:00', 96, 2642989, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (130, 8, '2012-04-15 00:00:00', 56, 2427975, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (131, 10, '2009-04-27 00:00:00', 56, 2227500, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (132, 4, '2013-08-11 00:00:00', 56, 2232985, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (133, 8, '2010-04-11 00:00:00', 56, 2227500, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (134, 10, '2010-04-25 00:00:00', 56, 2227500, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (135, 6, '2013-05-05 00:00:00', 56, 3368265, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (136, 8, '2009-04-12 00:00:00', 56, 2227500, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (137, 65, '2010-10-04 00:00:00', 32, 797610, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (138, 59, '2013-02-11 00:00:00', 28, 330482, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (139, 1, '2013-02-25 00:00:00', 32, 879365, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (140, 6, '2010-05-09 00:00:00', 56, 2835000, 58)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (141, 53, '2009-07-06 00:00:00', 32, 320856, 59)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (142, 49, '2013-02-04 00:00:00', 28, 410200, 60)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (143, 50, '2013-10-14 00:00:00', 28, 541468, 60)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (144, 13, '2012-09-24 00:00:00', 28, 399530, 60)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (145, 54, '2010-05-16 00:00:00', 28, 398250, 60)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (146, 29, '2012-12-31 00:00:00', 32, 764777, 60)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (147, 38, '2009-07-19 00:00:00', 32, 326295, 61)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (148, 40, '2011-07-31 00:00:00', 28, 398250, 62)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (149, 40, '2012-07-22 00:00:00', 28, 358425, 62)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (150, 21, '2011-01-02 00:00:00', 32, 306209, 63)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (151, 22, '2009-07-13 00:00:00', 28, 398250, 63)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (152, 22, '2011-07-11 00:00:00', 28, 398250, 63)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (153, 46, '2011-02-14 00:00:00', 28, 512750, 63)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (154, 56, '2010-02-08 00:00:00', 32, 1150000, 63)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (155, 56, '2011-02-07 00:00:00', 32, 1150000, 63)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (156, 9, '2010-11-07 00:00:00', 48, 2227500, 63)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (157, 6, '2009-05-10 00:00:00', 56, 2835000, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (158, 6, '2012-05-06 00:00:00', 56, 3090150, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (159, 5, '2012-03-08 00:00:00', 96, 3404322, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (160, 4, '2010-08-15 00:00:00', 56, 1761993, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (161, 4, '2009-08-16 00:00:00', 56, 1761993, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (162, 4, '2012-08-12 00:00:00', 56, 2048610, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (163, 15, '2010-11-21 00:00:00', 8, 3676257, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (164, 15, '2011-11-20 00:00:00', 16, 3676257, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (165, 16, '2011-10-31 00:00:00', 32, 1308100, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (166, 16, '2010-11-01 00:00:00', 32, 1225000, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (167, 62, '2010-10-18 00:00:00', 28, 531000, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (168, 56, '2012-02-13 00:00:00', 32, 1207500, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (169, 9, '2011-11-07 00:00:00', 48, 2227500, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (170, 29, '2011-01-03 00:00:00', 32, 742502, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (171, 30, '2012-02-27 00:00:00', 32, 1233014, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (172, 35, '2013-06-10 00:00:00', 28, 683665, 64)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (173, 37, '2011-04-04 00:00:00', 28, 320856, 65)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (174, 42, '2010-06-07 00:00:00', 56, 627700, 66)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (175, 47, '2010-02-15 00:00:00', 32, 797610, 66)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (176, 44, '2012-07-23 00:00:00', 28, 404279, 66)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (177, 44, '2010-07-26 00:00:00', 28, 449199, 66)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (178, 19, '2010-05-03 00:00:00', 28, 373200, 66)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (179, 44, '2009-07-27 00:00:00', 28, 398805, 66)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (180, 52, '2010-08-22 00:00:00', 48, 481285, 67)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (181, 61, '2009-10-25 00:00:00', 32, 481285, 67)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (182, 60, '2010-06-13 00:00:00', 28, 398250, 67)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (183, 26, '2011-01-03 00:00:00', 32, 288771, 68)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (184, 25, '2010-04-05 00:00:00', 28, 398250, 68)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (185, 55, '2013-04-29 00:00:00', 28, 410200, 68)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (186, 34, '2009-07-26 00:00:00', 32, 398250, 69)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (187, 58, '2010-02-01 00:00:00', 32, 288771, 69)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (188, 34, '2012-07-16 00:00:00', 28, 358425, 69)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (189, 62, '2012-10-15 00:00:00', 28, 486750, 70)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (190, 18, '2011-10-03 00:00:00', 32, 1522710, 70)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (191, 51, '2009-05-03 00:00:00', 32, 398250, 70)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (192, 49, '2012-01-30 00:00:00', 28, 398250, 70)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (193, 35, '2009-06-08 00:00:00', 32, 663750, 71)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (194, 35, '2012-06-11 00:00:00', 28, 663750, 71)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (195, 68, '2013-10-14 00:00:00', 28, 501355, 71)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (196, 51, '2013-04-29 00:00:00', 28, 410200, 71)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (197, 58, '2011-01-31 00:00:00', 32, 288771, 72)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (198, 24, '2009-02-16 00:00:00', 32, 385028, 72)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (199, 25, '2013-04-08 00:00:00', 28, 410200, 72)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (200, 27, '2009-02-09 00:00:00', 32, 366175, 72)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (201, 66, '2013-07-22 00:00:00', 28, 410200, 72)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (202, 50, '2010-10-18 00:00:00', 28, 725100, 73)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (203, 54, '2013-05-19 00:00:00', 28, 410200, 1)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (204, 33, '2009-05-03 00:00:00', 32, 398250, 1)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (205, 33, '2010-05-03 00:00:00', 28, 398250, 1)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (206, 63, '2010-07-12 00:00:00', 28, 398250, 1)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (207, 23, '2009-09-21 00:00:00', 32, 398250, 1)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (208, 66, '2011-07-25 00:00:00', 28, 398250, 2)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (209, 70, '2012-07-30 00:00:00', 32, 761180, 2)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (210, 19, '2012-04-30 00:00:00', 28, 366950, 3)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (211, 32, '2011-06-12 00:00:00', 32, 410925, 3)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (212, 50, '2012-10-15 00:00:00', 28, 488101, 3)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (213, 36, '2010-07-19 00:00:00', 48, 1000000, 4)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (214, 13, '2011-09-26 00:00:00', 28, 425633, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (215, 3, '2010-08-09 00:00:00', 56, 1761993, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (216, 7, '2009-03-25 00:00:00', 96, 2642989, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (217, 56, '2009-02-09 00:00:00', 32, 1150000, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (218, 3, '2009-08-10 00:00:00', 56, 1761993, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (219, 65, '2011-10-03 00:00:00', 32, 880633, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (220, 11, '2010-10-10 00:00:00', 56, 2349324, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (221, 4, '2011-08-14 00:00:00', 56, 1879459, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (222, 67, '2009-11-02 00:00:00', 32, 1357000, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (223, 7, '2013-03-20 00:00:00', 96, 3140136, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (224, 42, '2011-06-06 00:00:00', 56, 608000, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (225, 11, '2011-10-09 00:00:00', 56, 2349324, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (226, 21, '2012-12-30 00:00:00', 28, 316600, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (227, 29, '2009-01-05 00:00:00', 32, 742502, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (228, 21, '2012-01-01 00:00:00', 32, 314874, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (229, 42, '2013-06-10 00:00:00', 56, 683665, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (230, 42, '2009-06-08 00:00:00', 56, 663750, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (231, 43, '2012-07-25 00:00:00', 64, 0, 5)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (232, 47, '2009-02-16 00:00:00', 32, 797610, 6)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (233, 7, '2010-03-24 00:00:00', 96, 2642989, 6)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (234, 47, '2011-02-14 00:00:00', 32, 797610, 6)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (235, 21, '2010-01-03 00:00:00', 32, 270099, 6)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (236, 2, '2012-07-16 00:00:00', 28, 346525, 6)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (237, 32, '2012-06-18 00:00:00', 28, 403950, 6)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (238, 60, '2009-06-14 00:00:00', 32, 398250, 7)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (239, 64, '2013-01-07 00:00:00', 28, 316600, 8)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (240, 17, '2013-07-08 00:00:00', 28, 433770, 9)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (241, 12, '2011-01-10 00:00:00', 28, 288771, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (242, 60, '2012-06-17 00:00:00', 32, 398250, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (243, 1, '2011-02-21 00:00:00', 32, 797610, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (244, 12, '2012-01-09 00:00:00', 28, 288771, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (245, 9, '2012-10-29 00:00:00', 48, 2427975, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (246, 24, '2013-02-18 00:00:00', 32, 357960, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (247, 1, '2012-02-27 00:00:00', 32, 837490, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (248, 67, '2010-10-31 00:00:00', 32, 1357000, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (249, 67, '2012-10-21 00:00:00', 32, 1424850, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (250, 12, '2013-01-07 00:00:00', 28, 314258, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (251, 1, '2010-02-22 00:00:00', 32, 692470, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (252, 17, '2012-07-09 00:00:00', 28, 358425, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (253, 24, '2012-02-20 00:00:00', 32, 351020, 10)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (254, 64, '2009-01-12 00:00:00', 28, 313968, 11)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (255, 70, '2010-08-01 00:00:00', 48, 845104, 11)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (256, 32, '2009-06-14 00:00:00', 32, 398250, 12)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (257, 60, '2011-06-12 00:00:00', 32, 398250, 12)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (258, 44, '2011-07-25 00:00:00', 28, 449199, 13)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (259, 28, '2013-02-25 00:00:00', 32, 330482, 13)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (260, 28, '2010-02-22 00:00:00', 32, 320856, 13)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (261, 61, '2013-09-16 00:00:00', 32, 330482, 13)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (262, 63, '2013-07-08 00:00:00', 28, 410200, 14)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (263, 36, '2013-07-15 00:00:00', 48, 1102500, 14)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (264, 39, '2010-02-01 00:00:00', 32, 320856, 15)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (265, 32, '2013-06-17 00:00:00', 28, 468460, 15)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (266, 69, '2009-02-02 00:00:00', 28, 322669, 16)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (267, 14, '2010-04-19 00:00:00', 56, 1550000, 17)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (268, 52, '2009-08-23 00:00:00', 48, 481285, 17)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (269, 57, '2010-02-08 00:00:00', 32, 385028, 17)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (270, 23, '2011-09-19 00:00:00', 28, 371200, 18)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (271, 62, '2011-10-17 00:00:00', 28, 531000, 19)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (272, 48, '2009-09-21 00:00:00', 28, 398250, 19)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (273, 49, '2010-10-25 00:00:00', 28, 575250, 19)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (274, 23, '2012-04-23 00:00:00', 28, 398250, 20)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (275, 64, '2011-01-10 00:00:00', 28, 306209, 20)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (276, 13, '2009-09-28 00:00:00', 28, 399530, 20)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (277, 48, '2013-09-16 00:00:00', 28, 410200, 20)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (278, 48, '2010-09-20 00:00:00', 28, 398250, 20)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (279, 36, '2011-07-18 00:00:00', 48, 1000000, 20)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (280, 62, '2013-10-14 00:00:00', 28, 530165, 21)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (281, 13, '2010-09-27 00:00:00', 28, 399530, 22)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (282, 40, '2009-05-17 00:00:00', 32, 398250, 22)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (283, 69, '2013-02-04 00:00:00', 28, 297436, 23)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (284, 72, '2011-01-31 00:00:00', 28, 398250, 24)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (285, 5, '2010-03-11 00:00:00', 96, 2642989, 25)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (286, 45, '2009-10-26 00:00:00', 32, 575250, 25)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (287, 20, '2013-07-15 00:00:00', 28, 462675, 26)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (288, 26, '2012-12-31 00:00:00', 28, 279272, 27)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (289, 63, '2012-07-09 00:00:00', 28, 358425, 27)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (290, 50, '2011-10-17 00:00:00', 28, 525697, 27)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (291, 41, '2011-09-26 00:00:00', 28, 616335, 27)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (292, 64, '2012-01-09 00:00:00', 28, 314874, 28)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (293, 63, '2009-07-13 00:00:00', 32, 398250, 29)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (294, 48, '2011-09-19 00:00:00', 28, 398250, 30)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (295, 48, '2012-09-17 00:00:00', 28, 398250, 30)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (296, 46, '2009-02-16 00:00:00', 32, 512750, 30)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (297, 29, '2012-01-02 00:00:00', 32, 742502, 30)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (298, 46, '2013-02-18 00:00:00', 28, 528135, 30)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (299, 65, '2009-10-05 00:00:00', 32, 797610, 30)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (300, 68, '2011-10-24 00:00:00', 28, 575250, 30)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (301, 39, '2009-02-02 00:00:00', 32, 320856, 30)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (302, 41, '2013-09-23 00:00:00', 28, 634825, 31)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (303, 71, '2011-08-21 00:00:00', 48, 401070, 32)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (304, 53, '2011-07-04 00:00:00', 32, 320856, 32)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (305, 2, '2013-07-22 00:00:00', 28, 396578, 32)
INSERT INTO [EdicionTorneo] ([id], [IdTorneo], [Fecha], [Njugadores], [premios], [Ganador]) VALUES (306, 37, '2013-04-08 00:00:00', 28, 330482, 32)
-- 306 records

SET IDENTITY_INSERT [EdicionTorneo] OFF
GO



--
-- Dumping data for table 'Estadio'
--

INSERT INTO [Estadio] ([IdEstadio], [Estadio]) VALUES (1, 'Aire Libre')
INSERT INTO [Estadio] ([IdEstadio], [Estadio]) VALUES (2, 'Bajo Techo')
-- 2 records
INSERT INTO [Estadio] ([IdEstadio], [Estadio]) VALUES (3, 'Escondido')


--
-- Dumping data for table 'Jugador'
--

INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (1, 'Albert Montanes')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (2, 'Alexandr Dolgopolov')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (3, 'Andreas Seppi')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (4, 'Andrey Golubev')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (5, 'Andy Murray')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (6, 'Andy Roddick')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (7, 'Benjamin Becker')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (8, 'Bernard Tomic')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (9, 'Carlos Berlocq')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (10, 'David Ferrer')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (11, 'David Nalbandian')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (12, 'Dmitry Tursunov')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (13, 'Ernests Gulbis')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (14, 'Fabio Fognini')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (15, 'Feliciano Lopez')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (16, 'Fernando Gonzalez')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (17, 'Fernando Verdasco')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (18, 'Florian Mayer')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (19, 'Gael Monfils')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (20, 'Gilles Simon')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (21, 'Grigor Dimitrov')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (22, 'Guillermo Garcia Lopez')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (23, 'Horacio Zeballos')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (24, 'Ivan Dodig')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (25, 'Ivan Ljubicic')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (26, 'Ivo Karlovic')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (27, 'Janko Tipsarevic')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (28, 'Jarkko Nieminen')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (29, 'Jeremy Chardy')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (30, 'Jo Wilfried Tsonga')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (31, 'Joao Sousa')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (32, 'John Isner')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (33, 'Juan Carlos Ferrero')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (34, 'Juan Ignacio Chela')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (35, 'Juan Martin Del Potro')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (36, 'Juan Monaco')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (37, 'Jurgen Melzer')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (38, 'Kei Nishikori')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (39, 'Kevin Anderson')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (40, 'Lleyton Hewitt')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (41, 'Lukas Rosol')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (42, 'Marcel Granollers')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (43, 'Marcos Baghdatis')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (44, 'Mardy Fish')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (45, 'Marin Cilic')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (46, 'Martin Klizan')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (47, 'Michael Llodra')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (48, 'Mikhail Kukushkin')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (49, 'Mikhail Youzhny')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (50, 'Milos Raonic')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (51, 'Nicolas Almagro')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (52, 'Nicolas Mahut')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (53, 'Nikolay Davydenko')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (54, 'Novak Djokovic')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (55, 'Pablo Andujar')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (56, 'Philipp Kohlschreiber')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (57, 'Radek Stepanek')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (58, 'Rafael Nadal')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (59, 'Rajeev Ram')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (60, 'Richard Gasquet')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (61, 'Robby Ginepri')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (62, 'Robin Haase')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (63, 'Robin Soderling')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (64, 'Roger Federer')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (65, 'Ryan Sweeting')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (66, 'Sam Querrey')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (67, 'Sergiy Stakhovsky')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (68, 'Stanislas Wawrinka')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (69, 'Thomaz Bellucci')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (70, 'Tomas Berdych')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (71, 'Tommy Haas')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (72, 'Tommy Robredo')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (73, 'Viktor Troicki')
-- 73 records
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (74, 'Tomas Pérez')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (75, 'Tommy Hernández')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (76, 'Antoine Rodríguez')
INSERT INTO [Jugador] ([IdJugador], [Jugador]) VALUES (77, 'Viktor García')


--
-- Dumping data for table 'Pais'
--

INSERT INTO [Pais] ([Id], [Pais]) VALUES (1, 'Argentina')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (2, 'Australia')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (3, 'Austria')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (4, 'Brazil')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (5, 'Canada')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (6, 'Chile')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (7, 'China')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (8, 'Colombia')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (9, 'Croatia')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (10, 'France')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (11, 'Germany')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (12, 'Great Britain')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (13, 'India')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (14, 'Italy')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (15, 'Japan')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (16, 'Malaysia')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (17, 'Mexico')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (18, 'Monaco')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (19, 'Morocco')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (20, 'New Zealand')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (21, 'Portugal')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (22, 'Qatar')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (23, 'Romania')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (24, 'Russia')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (25, 'Serbia')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (26, 'South Africa')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (27, 'Spain')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (28, 'Sweden')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (29, 'Switzerland')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (30, 'Thailand')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (31, 'The Netherlands')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (32, 'UAE')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (33, 'USA')
-- 33 records
INSERT INTO [Pais] ([Id], [Pais]) VALUES (34, 'Senegal')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (35, 'Indonesia')
INSERT INTO [Pais] ([Id], [Pais]) VALUES (36, 'Polonia')


--
-- Dumping data for table 'Superficie'
--

INSERT INTO [Superficie] ([Id], [Superficie]) VALUES (1, 'Arcilla')
INSERT INTO [Superficie] ([Id], [Superficie]) VALUES (2, 'Cemento')
INSERT INTO [Superficie] ([Id], [Superficie]) VALUES (3, 'Hierba')
-- 3 records



--
-- Dumping data for table 'TipoTorneo'
--

INSERT INTO [TipoTorneo] ([IdTipo], [TipoTorneo]) VALUES (1, 'ATP World Tour')
INSERT INTO [TipoTorneo] ([IdTipo], [TipoTorneo]) VALUES (2, 'ATP World Tour 250')
INSERT INTO [TipoTorneo] ([IdTipo], [TipoTorneo]) VALUES (3, 'ATP World Tour 500')
INSERT INTO [TipoTorneo] ([IdTipo], [TipoTorneo]) VALUES (4, 'ATP World Tour Masters 1000')
-- 4 records
INSERT INTO [TipoTorneo] ([IdTipo], [TipoTorneo]) VALUES (5, 'Torneo local')



--
-- Dumping data for table 'Torneo'
--

INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (1, 'Acapulco', 17, 3, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (2, 'Atlanta', 33, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (3, 'ATP World Tour Masters 1000 Canada', 5, 4, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (4, 'ATP World Tour Masters 1000 Cincinnati', 33, 4, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (5, 'ATP World Tour Masters 1000 Indian Wells', 33, 4, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (6, 'ATP World Tour Masters 1000 Madrid', 27, 4, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (7, 'ATP World Tour Masters 1000 Miami', 33, 4, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (8, 'ATP World Tour Masters 1000 Monte Carlo', 18, 4, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (9, 'ATP World Tour Masters 1000 Paris', 10, 4, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (10, 'ATP World Tour Masters 1000 Rome', 14, 4, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (11, 'ATP World Tour Masters 1000 Shanghai', 7, 4, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (12, 'Auckland', 20, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (13, 'Bangkok', 30, 2, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (14, 'Barcelona', 27, 3, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (15, 'Barclays ATP World Tour Finals', 12, 1, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (16, 'Basel', 29, 3, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (17, 'Bastad', 28, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (18, 'Beijing', 7, 3, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (19, 'Belgrade', 25, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (20, 'Bogota', 8, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (21, 'Brisbane', 2, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (22, 'Bsstad', 28, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (23, 'Bucharest', 23, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (24, 'Buenos Aires', 1, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (25, 'Casablanca', 19, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (26, 'Chennai', 13, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (27, 'Costa Do Sauipe', 4, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (28, 'Delray Beach', 33, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (29, 'Doha', 22, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (30, 'Dubai', 32, 3, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (31, 'Dusseldorf', 11, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (32, 'Eastbourne', 12, 2, 3, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (33, 'Estoril', 21, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (34, 'Gstaad', 29, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (35, 'Halle', 11, 2, 3, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (36, 'Hamburg', 11, 3, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (37, 'Houston', 33, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (38, 'Indianapolis', 33, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (39, 'Johannesburg', 26, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (40, 'Kitzbühel', 3, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (41, 'Kuala Lumpur', 16, 2, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (42, 'London . Queen''s Club', 12, 2, 3, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (43, 'London Olympics', 12, 1, 3, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (44, 'Los Angeles', 33, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (45, 'Lyon', 10, 2, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (46, 'Marseille', 10, 2, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (47, 'Memphis', 33, 3, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (48, 'Metz', 10, 2, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (49, 'Montpellier', 10, 2, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (50, 'Moscow', 24, 2, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (51, 'Munich', 11, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (52, 'New Haven', 33, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (53, 'Newport', 33, 2, 3, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (54, 'Nice', 10, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (55, 'Oeiras', 21, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (56, 'Rotterdam', 31, 3, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (57, 'San Jose', 33, 2, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (58, 'Santiago', 6, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (59, 'Sao Paulo', 4, 2, 1, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (60, 's-Hertogenbosch', 31, 2, 3, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (61, 'St. Petersburg', 24, 2, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (62, 'Stockholm', 28, 2, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (63, 'Stuttgart', 11, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (64, 'Sydney', 2, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (65, 'Tokyo', 15, 3, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (66, 'Umag', 9, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (67, 'Valencia', 27, 3, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (68, 'Vienna', 3, 2, 2, 2)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (69, 'Viña del Mar', 6, 2, 1, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (70, 'Washington', 33, 3, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (71, 'Winston-Salem', 33, 2, 2, 1)
INSERT INTO [Torneo] ([IdTorneo], [Torneo], [IdPais], [IdTipo], [IdSuperficie], [IdEstadio]) VALUES (72, 'Zagreb', 9, 2, 2, 2)
-- 72 records

GO


alter table torneo
add constraint FK_torneo_pais
foreign key (idpais)
references pais (id);
go

alter table torneo
add constraint FK_torneo_tipo
foreign key (idtipo)
references tipotorneo (idtipo);
go

alter table torneo
add constraint FK_torneo_superficie
foreign key (idsuperficie)
references superficie (id);
go

alter table torneo
add constraint FK_torneo_estadio
foreign key (idestadio)
references estadio (idestadio);
go

alter table ediciontorneo
add constraint FK_edicion_torneo
foreign key (idtorneo)
references torneo (idtorneo);
go

alter table ediciontorneo
add constraint FK_edicion_ganador
foreign key (ganador)
references jugador (idjugador);
go

