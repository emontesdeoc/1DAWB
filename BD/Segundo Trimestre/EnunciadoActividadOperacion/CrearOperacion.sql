--create database operacionesquirurgicas
--go
use operacionesquirurgicas
go

if object_id('IntervencionOperacion') is not null
	drop table IntervencionOperacion;
go
if object_id('MaterialIntervencion') is not null
	drop table MaterialIntervencion;
go
if object_id('Operacion') is not null
	drop table Operacion;
go
if object_id('Paciente') is not null
	drop table Paciente;
go
if object_id('Intervencion') is not null
	drop table Intervencion;
go
if object_id('Material') is not null
	drop table Material;
go

create table Paciente
(DNIPaciente varchar(9) primary key,
 Nombre varchar(50),
 DatosCliente varchar(100),
 FechaNacimiento datetime,
 Telefono char(9));
 go

 create table operacion
 (idoperacion integer identity primary key,
 fechaoperacion datetime,
 DNIPaciente varchar(9)
 );
 go

 create table intervencion
 (idintervencion integer identity primary key,
 denominaciontipo varchar(100)
 );
 go

 create table material
 (idmaterial integer identity primary key,
 nombrematerial varchar(100)
 );

 create table intervencionoperacion
 (idoperacion integer,
 idintervencion integer,
 observacion varchar(100),
 primary key(idoperacion,idintervencion)
 );

 create table materialintervencion
 (idintervencion integer,
 idmaterial integer,
 cantidad integer,
 primary key (idintervencion,idmaterial)
 );
 go





insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '05679340L','david pérez','c/galicia nº 32','Ene 30 1985 12:00AM','922304050' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '07865988B','pedro hernández','Rambla nº 7','Oct 10 1990 12:00AM','822090876' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '13455656N','maría ruiz','c/fuerteventura nº 9','Mar 21 1980 12:00AM','659030304' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '23432988J','maría ramos','c/lanzarote nº 99','Mar 22 1980 12:00AM','822364656' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '23446456A','josé gonzález','c/cinco de mayo nº 7','Oct 14 1990 12:00AM','922989876' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '43005006C','juan rodríguez','C/x nº 6','Ene  2 1960 12:00AM','656959595' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '43554430C','samuel gonzález','c/principal nº 54','Ene 30 1985 12:00AM','659030303' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '43566789M','jesús fernández','c/la mancha nº 8','Ene 28 1985 12:00AM','922656565' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '45567678D','juana rodríguez','C/seis nº 8','Oct 12 1990 12:00AM','633090909' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '45667443T','alberto gonzález','c/alborada nº 7','Mar 17 1980 12:00AM','922989898' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '45678901G','ana pérez','C/una nº 5','Ene  1 1960 12:00AM','699898989' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '54377890W','maría pérez','Avenida Primera nº 6','Oct 11 1990 12:00AM','677090909' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '56008986F','juana pérez','c/el hierro nº 6','Mar 18 1980 12:00AM','621090909' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '56321789X','pedro fernández','c/la gomera nº 8','Mar 19 1980 12:00AM','645090909' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '56999678C','josefa hernández','c/primero de junio nº 7','Oct 13 1990 12:00AM','657090909' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '65783450T','carmen ramos','c/madrid nº 75','Ene 27 1985 12:00AM','678090909' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '67544345S','ana rojas','c/la palma nº 77','Ene 25 1985 12:00AM','683080808' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '67655432N','fernando rojas','c/gran canaria nº 9','Mar 20 1980 12:00AM','922030303' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '75655499N','fernando pérez','c/ofra nº 3','Ene 29 1985 12:00AM','822030303' )
insert Paciente ( DNIPaciente,Nombre,DatosCliente,FechaNacimiento,Telefono )  values ( '76523986L','marta ruiz','c/la graciosa nº 66','Ene 26 1985 12:00AM','611098787' )
go

SET IDENTITY_INSERT [dbo].[intervencion] ON 

GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (1, N'Adenoidectomía. Operación de Vegetaciones')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (2, N'Amigdalectomía')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (3, N'Aneurisma de Aorta')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (4, N'Angioplastia Coronaria')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (5, N'Angioplastia Coronaria y Stents')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (6, N'Apendicectomía')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (7, N'Artroscopia. Cirugía de la Rodilla')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (8, N'Autocontrol de la Glucosa')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (9, N'By-Pass (derivación) de las Coronarias')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (10, N'Cateterismo Cardíaco. Coronariografía')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (11, N'Cesárea')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (12, N'Cirugía de Hemorroides')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (13, N'Cirugía de la Obesidad')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (14, N'Cirugía de la Refracción (Operación Miopía)')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (15, N'Cirugía para el Cáncer de Mama')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (16, N'Cirugía Plástica de Mama')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (17, N'Defecto Congénito del Corazón')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (18, N'Dermoabrasión. Lifting Facial Físico')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (19, N'Drenaje Timpánico. Drenaje de Oídos')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (20, N'El Registro Holter')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (21, N'Endarterectomía de la arteria carótida')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (22, N'Estudio Isotópico')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (23, N'Fimosis y Circuncisión')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (24, N'Gastroscopia')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (25, N'Hernia Discal')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (26, N'Hernia Inguinal')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (27, N'Hernia Umbilical')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (28, N'Histerectomía. Operación de Matriz')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (29, N'Intervención de Cataratas')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (30, N'Legrado Uterino')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (31, N'Lifting Facial por Cirugía')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (32, N'Ligadura de trompas')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (33, N'Liposucción')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (34, N'Lumpectomía. Extirpación Parcial de Mama')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (35, N'Mamografía. Rayos-X de Mama')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (36, N'Papanicolau. Citología')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (37, N'Prostatectomía')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (38, N'Pruebas Básicas de Diagnóstico. Cardiología')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (39, N'Rinoplastia. Intervención de la Nariz')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (40, N'Test de Esfuerzo. Tolerancia al Ejercicio')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (41, N'Trasplante de Corazón')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (42, N'Tratamiento de la Arteriosclerosis de Extremidades')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (43, N'Vacuna contra la varicela')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (44, N'Vasectomía')
GO
INSERT [dbo].[intervencion] ([idintervencion], [denominaciontipo]) VALUES (45, N'Vesícula, Intervención (Colecistectomía)')
GO
SET IDENTITY_INSERT [dbo].[intervencion] OFF
GO
SET IDENTITY_INSERT [dbo].[material] ON 

GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (1, N'Agujas Quirúrgicas.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (2, N'Material de Corte Quirúrgico.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (3, N'Separadores Quirúrgicos.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (4, N'Set de Traqueostomía.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (5, N'Set General de Cirugía.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (6, N'Set de Tiroides.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (7, N'Set de Estómago.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (8, N'Set de Vesícula.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (9, N'Set General de Vascular.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (10, N'Set de Amputación.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (11, N'Set General de Tórax.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (12, N'Set de Arco-Barra.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (13, N'Set de Osteosíntesis.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (14, N'Set de Oxodoncia.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (15, N'Set de Plastia.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (16, N'Set de Tabique.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (17, N'Set de Tejido Blando Oral.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (18, N'Set de Tejido Duro Oral.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (19, N'Abre Boca.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (20, N'Desimpactador de Maxilar Superior.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (21, N'Elevador de Malar.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (22, N'Elevadores Rectos.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (23, N'Forceps.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (24, N'Ponchador.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (25, N'Rouger o Guvia.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (26, N'Barry.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (27, N'Winter.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (28, N'Set de Craneo.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (29, N'Set de Columna Cervical.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (30, N'Set de Fijación Toracolumbar.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (31, N'Set de Hipófisis.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (32, N'Set de Microcirugía.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (33, N'Set de Microtecnia de Caspar.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (34, N'Set de Tumores.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (35, N'Set de Tunel Carpiano.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (36, N'Set de Cánulas Estereotácticas.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (37, N'Cabezal de Sugita.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (38, N'Cánulas de Aspiración.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (39, N'Mandriles.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (40, N'Marco EstereoFlex.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (41, N'Pinzas Bipolares.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (42, N'Retractores de Leyla.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (43, N'Trócares.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (44, N'Set de Histerectomía.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (45, N'Set de Legrado.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (46, N'Valvas Ginecológicas.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (47, N'Set de Catarata.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (48, N'Set de Estrabismo.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (49, N'Set de Párpados.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (50, N'Set de Retina.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (51, N'Set de transplante de Cornea.')
GO
INSERT [dbo].[material] ([idmaterial], [nombrematerial]) VALUES (52, N'Set de cirugía refractiva')
GO
SET IDENTITY_INSERT [dbo].[material] OFF
GO

INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (1, 2, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (1, 28, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (1, 38, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (2, 13, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (2, 31, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (2, 49, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (3, 12, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (3, 27, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (3, 39, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (4, 10, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (4, 36, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (4, 45, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (4, 49, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (4, 52, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (5, 9, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (5, 42, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (5, 47, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 4, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 6, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 15, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 33, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 39, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (6, 51, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (7, 32, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (7, 37, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (7, 40, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (8, 1, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (8, 12, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (8, 13, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (8, 26, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (8, 30, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (9, 11, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (9, 18, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (9, 27, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (9, 29, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (9, 31, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 1, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 20, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 41, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 43, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 46, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (10, 51, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (11, 16, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (12, 11, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (12, 28, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (12, 43, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 2, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 5, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 6, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 21, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 27, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (13, 49, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (14, 6, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (14, 9, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (14, 11, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (14, 13, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 13, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 26, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 28, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 36, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 37, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 43, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (15, 50, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (16, 15, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (16, 41, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (16, 47, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 2, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 3, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 4, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 19, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 22, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 28, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 36, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (17, 38, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (18, 1, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (18, 5, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (19, 5, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (19, 7, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (20, 18, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (20, 25, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (20, 31, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (20, 40, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (21, 2, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (21, 16, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (22, 30, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (22, 51, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 4, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 13, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 36, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 41, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 51, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (23, 52, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (24, 8, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (24, 15, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (24, 23, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (25, 18, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (25, 19, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (25, 30, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (26, 29, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (26, 31, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (27, 15, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (28, 5, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (28, 10, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (28, 16, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (29, 47, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (30, 8, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (30, 20, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (30, 36, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (31, 28, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (31, 44, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (31, 49, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 3, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 11, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 22, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 25, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 32, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 46, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 47, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (32, 52, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (33, 20, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (33, 35, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (33, 36, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (34, 5, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (34, 6, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (34, 23, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (34, 37, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (34, 41, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 3, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 4, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 5, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 9, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 11, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (35, 21, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (36, 27, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (36, 44, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (36, 50, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (37, 21, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (37, 33, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (37, 49, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (38, 4, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (38, 5, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (38, 25, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (38, 34, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (39, 47, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (39, 51, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (40, 21, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (40, 43, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (41, 7, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (41, 27, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (41, 28, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (41, 36, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (41, 41, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (42, 22, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (43, 22, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (43, 25, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (43, 43, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (43, 46, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 17, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 21, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 23, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 28, 4)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 32, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (44, 49, 2)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (45, 5, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (45, 7, 5)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (45, 29, 1)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (45, 48, 3)
GO
INSERT [dbo].[materialintervencion] ([idintervencion], [idmaterial], [cantidad]) VALUES (45, 51, 3)
GO
SET IDENTITY_INSERT [dbo].[operacion] ON 

INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (1, CAST(0x0000A47900000000 AS DateTime), N'05679340L')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (2, CAST(0x0000A45D00000000 AS DateTime), N'13455656N')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (3, CAST(0x0000A45F00000000 AS DateTime), N'43554430C')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (4, CAST(0x0000A48200000000 AS DateTime), N'56321789X')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (5, CAST(0x0000A47A00000000 AS DateTime), N'67655432N')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (6, CAST(0x0000A47C00000000 AS DateTime), N'54377890W')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (7, CAST(0x0000A47C00000000 AS DateTime), N'43566789M')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (8, CAST(0x0000A47C00000000 AS DateTime), N'56999678C')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (9, CAST(0x0000A46D00000000 AS DateTime), N'76523986L')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (10, CAST(0x0000A46D00000000 AS DateTime), N'76523986L')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (11, CAST(0x0000A46E00000000 AS DateTime), N'67544345S')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (12, CAST(0x0000A46E00000000 AS DateTime), N'75655499N')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (13, CAST(0x0000A46E00000000 AS DateTime), N'45678901G')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (14, CAST(0x0000A46E00000000 AS DateTime), N'67655432N')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (15, CAST(0x0000A47700000000 AS DateTime), N'23432988J')
INSERT [dbo].[operacion] ([idoperacion], [fechaoperacion], [DNIPaciente]) VALUES (16, CAST(0x0000A47700000000 AS DateTime), N'45567678D')
SET IDENTITY_INSERT [dbo].[operacion] OFF
go
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (1, 3, N'observ 2')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (1, 9, N'observ 3')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (1, 10, N'observ 1')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (2, 9, N'observ 3')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (2, 12, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (3, 13, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (4, 40, N'esfuerzo 4')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (4, 43, N'esfuerzo 4')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (5, 32, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (7, 18, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (7, 20, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (7, 21, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (8, 2, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (10, 15, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (11, 14, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (11, 19, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (12, 2, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (13, 2, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (14, 2, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (15, 13, N'')
INSERT [dbo].[intervencionoperacion] ([idoperacion], [idintervencion], [observacion]) VALUES (16, 10, N'')





go
alter table operacion
add constraint FK_operacionpaciente
foreign key (DNIpaciente)
references paciente (DNIpaciente);
go

alter table intervencionoperacion
add constraint FK_operacionintervencion1
foreign key (idoperacion)
references operacion (idoperacion);
go

alter table intervencionoperacion
add constraint FK_operacionintervencion2
foreign key (idintervencion)
references intervencion (idintervencion);
go


alter table materialintervencion
add constraint FK_materialintervencion1
foreign key (idintervencion)
references intervencion (idintervencion);
go

alter table materialintervencion
add constraint FK_materialintervencion2
foreign key (idmaterial)
references material (idmaterial);
go