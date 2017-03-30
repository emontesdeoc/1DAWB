--Emiliano Montesdeoca del Puerto
--1DAWB
--CIFP Cesar Manrique

--1. Crear la Base de datos en la carpeta C:\SQLDatos con tamaño inicial 5M, tamaño mayor
--20 M e incrementos 4M.
CREATE DATABASE SQLbasic ON (
	NAME = AdmBD2_dat
	,FILENAME = 'C:\SQLDatos\SQLbasic.mdf'
	,SIZE = 5 MB
	,MAXSIZE = 20 MB
	,FILEGROWTH = 4 MB
	) LOG ON (
	NAME = AdmBD2_log
	,FILENAME = 'C:\SQLDatos\SQLbasic.ldf'
	,SIZE = 5 MB
	,MAXSIZE = 20 MB
	,FILEGROWTH = 4 MB
	);

--2. Crear una tabla con la estructura siguiente:
--create table empleados (
--DNI varchar(8),
--nombre varchar(30),
--apellidos varchar(30),
--fechanacimiento datetime,
--cantidadhijos tinyint,
--seccion varchar(20),
--sueldo decimal(6,2)
--);
USE SQLbasic

CREATE TABLE empleados (
	DNI VARCHAR(8)
	,nombre VARCHAR(30)
	,apellidos VARCHAR(30)
	,fechanacimiento DATETIME
	,cantidadhijos TINYINT
	,seccion VARCHAR(20)
	,sueldo DECIMAL(6, 2)
	);

--3. Crear las sentencias para que valide lo siguiente:
--a. clave primaria DNI
ALTER TABLE empleados

ALTER COLUMN DNI VARCHAR(8) NOT NULL;
GO

ALTER TABLE empleados ADD CONSTRAINT pk_empleados PRIMARY KEY (DNI);
GO

--b. no nulo apellidos
ALTER TABLE empleados

ALTER COLUMN apellidos VARCHAR(30) NOT NULL;
GO

--c. no nulo nombre
ALTER TABLE empleados

ALTER COLUMN nombre VARCHAR(30) NOT NULL;
GO

--d. valor único apellidos y nombre
ALTER TABLE empleados ADD CONSTRAINT uq_apellidonombre UNIQUE (
	apellidos
	,nombre
	);
GO

--e. validar que fechanacimiento sea menor que la fecha actual
ALTER TABLE empleados ADD CONSTRAINT ck_fechanaimiento CHECK (datepart(year, fechanacimiento) < datepart(year, getdate()))

--f. validar que cantidad de hijos no sea negativa ni mayor que 20
ALTER TABLE empleados ADD CONSTRAINT ck_cantidadhijos CHECK (
	cantidadhijos >= 0
	AND cantidadhijos <= 20
	)

--g. validar que sección no esté vacío
ALTER TABLE empleados ADD CONSTRAINT ck_seccion CHECK (
	seccion IS NOT NULL
	AND seccion != ''
	)

--4. Ver los índices que tiene.
EXEC sp_helpindex empleados;
GO

--5. Añadir índice por fecha de nacimiento
CREATE NONCLUSTERED INDEX nc_fechanacimiento ON empleados (fechanacimiento);

--6. Añadir índice por sueldo
CREATE NONCLUSTERED INDEX nc_sueldo ON empleados (sueldo);

--7. Modificar lo siguiente en la tabla
--a. Añadir campo dirección varchar(100)
ALTER TABLE empleados ADD direccion VARCHAR(100);GO;

--b. Cambiar a no nulo seccion
ALTER TABLE empleados

ALTER COLUMN seccion VARCHAR(20) NOT NULL;GO;

--c. Validar que sueldo sean >0 y <10000
ALTER TABLE empleados ADD CONSTRAINT ck_sueldo CHECK (
	sueldo > 0
	AND sueldo < 10000
	) GO;
