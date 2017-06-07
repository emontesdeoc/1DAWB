use pruebasql
go


--1 cuántos libros hay de precio mayor que el que 
--suministremos como parámetro.
use PruebaSQL
go
 if object_id('libros') is not null
  drop table libros;

 create table libros(
  codigo int identity,
  titulo varchar(40),
  autor varchar(30),
  editorial varchar(20),
  precio decimal(5,2)
 );
go

 insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',20.00);
 insert into libros values('Alicia en el pais de las maravillas','Lewis Carroll','Plaza',35.00);
 insert into libros values('Aprenda PHP','Mario Molina','Siglo XXI',40.00);
 insert into libros values('El aleph','Borges','Emece',10.00);
 insert into libros values('Ilusiones','Richard Bach','Planeta',15.00);
 insert into libros values('Java en 10 minutos','Mario Molina','Siglo XXI',50.00);
 insert into libros values('Martin Fierro','Jose Hernandez','Planeta',20.00);
 insert into libros values('Martin Fierro','Jose Hernandez','Emece',30.00);
 insert into libros values('Uno','Richard Bach','Planeta',10.00);
go


if object_id ('f_librospreciomayor') is not null
  drop function f_librospreciomayor;
go

create function f_librospreciomayor
	(@limite integer)
	returns integer
as
	begin
	declare @resultado integer
	select @resultado=COUNT(*) from libros
				WHERE precio>@limite
	return @resultado
	end
go

select titulo,precio from libros
print dbo.f_librospreciomayor(20)
print dbo.f_librospreciomayor(30)

--2 validar NIF
use PruebaSQL
go
if object_id ('f_validarletraNIF') is not null
  drop function f_validarletraNIF;
go

create function f_validarletraNIF(@dni varchar(8),@letra char)
returns char(4)
as
begin
declare @salida char(4)
if SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE', @dni % 23 + 1, 1)=@letra
	begin
	set @salida='bien'
	end
else
	begin
	set @salida='mal'
	end
return @salida
end;
go

print dbo.f_validarletraNIF('56789443','L')
print dbo.f_validarletraNIF('56789443','M')
go
--probamos ahora con la tabla
if object_id ('personas') is not null
  drop table personas;
go
create table personas
( nombre varchar(100),
  apellidos varchar(100),
  fechanacimiento datetime,
  dni char(8),
  letra char(1))

set dateformat dmy
insert into personas values
	('Juan','Pérez','01/01/1970','56789443','M'),
	('María','Hernández','05/06/1985','45678432','L'),
	('Ana','Rodríguez','25/10/1991','42001982','A')
go

select nombre, apellidos, dni+letra as 'Nif',dbo.f_validarletraNIF(dni,letra)
	from personas
	--where  dbo.f_validarletraNIF(dni,letra)='mal'
go

--3 años de diferencia respecto año actual
use PruebaSQL
go
if object_id ('f_calcularEdad') is not null
  drop function f_calcularEdad;
go

create function f_calcularEdad(@fecha datetime)
returns integer
as
begin
	return datediff(year,@fecha,getdate())
end;
go

set dateformat dmy
print dbo.f_calcularEdad('01/05/1985')

select nombre, apellidos, 
	dbo.f_calcularEdad(fechanacimiento) as edad
	from personas
go

--4 validar fecha devolviendo el nombre del mes si es correcta
use PruebaSQL
go
if object_id ('f_validaFecha') is not null
  drop function f_validaFecha;
go

create function f_validaFecha(@posiblefecha varchar(100))
returns char(20)
as
begin
	declare @resultado char(20)
	if ISDATE(@posiblefecha)=1
		begin
		set @resultado=
			datename(month,cast(@posiblefecha as datetime))
		end
	else
		begin
		set @resultado='fecha mal'
		end
	return @resultado
end;
go

set dateformat dmy
PRINT dbo.f_validaFecha('hola')
PRINT dbo.f_validaFecha('01/05/2010')
PRINT dbo.f_validaFecha('2010/01/05')
PRINT dbo.f_validaFecha('01/23/2010')
GO

--5 función de tabla que devuelva los libros de precio mayor que el 
--que suministremos como parámetro.
use PruebaSQL
go
if object_id ('f_verLibrosPrecioMayor') is not null
  drop function f_verLibrosPrecioMayor;
go

create function f_verLibrosPrecioMayor(@limite decimal(5,2))
returns table
as
return
(
	select titulo, autor, precio from libros
		where precio >@limite
)
go

select titulo, autor, precio from dbo.f_verLibrosPrecioMayor(10)
select titulo, autor, precio 
	from dbo.f_verLibrosPrecioMayor(30)
go

--6 precio máximo
use PruebaSQL
go
if object_id ('f_librosPrecioMaximo') is not null
  drop function f_librosPrecioMaximo;
go

create function f_librosPrecioMaximo ()
	returns decimal(5,2)
as
	begin
	declare @resultado decimal(5,2)
	select @resultado=MAX(precio) from libros
	return @resultado
	end
go

select titulo,precio from libros
go
print dbo.f_librosPrecioMaximo()

--7 datos personal y alumnado
if object_id ('personal') is not null
  drop table personal;
go
if object_id ('alumnado') is not null
  drop table alumnado;
go
create table personal
( nombre varchar(100),
  apellidos varchar(100))
go
create table alumnado
( nom varchar(50),
  apell varchar(50))


insert into personal values
	('Juan','Pérez'),
	('María','Hernández'),
	('Ana','Rodríguez');

insert into alumnado values
	('Juana','García'),
	('María','Fernández'),
	('Pedro','Rodríguez'),
	('Marta','García');
go

if object_id ('f_personal_alumnado') is not null
  drop function f_personal_alumnado;
go

create function f_personal_alumnado
 (@filtro char(15))
 returns @datos table
 --formato de la tabla
 (nombre varchar(100),
  apellido varchar(100))
 as
 begin
 if @filtro='personal' or @filtro='ambos'
   insert @datos
    select nombre,apellidos from personal
 if @filtro='alumnado' or @filtro='ambos'
   insert @datos
 	select nom,apell from alumnado
return
end;

select nombre,apellido from dbo.f_personal_alumnado('personal')
select nombre,apellido from dbo.f_personal_alumnado('alumnado')
select nombre,apellido from dbo.f_personal_alumnado('ambos')
select nombre,apellido from dbo.f_personal_alumnado('a')
go

--8 nº días del mes

use pruebasql
go
if object_id ('f_numeroDiasMes') is not null
  drop function f_numeroDiasMes;
go
CREATE FUNCTION f_numeroDiasMes ( @miFecha DATETIME )
RETURNS INT
AS
BEGIN
DECLARE @Ndias INT
SET @Ndias = 
CASE 
	WHEN MONTH(@miFecha)
		IN (1, 3, 5, 7, 8, 10, 12) THEN 31
	WHEN MONTH(@miFecha) 
		IN (4, 6, 9, 11) THEN 30
	ELSE CASE WHEN 
		(YEAR(@miFecha) % 4 = 0
			AND
		YEAR(@miFecha) % 100 != 0)
			OR
		(YEAR(@miFecha) % 400 = 0)
		THEN 29
	ELSE 28 
	END
END
RETURN @Ndias
END
GO

print dbo.f_numeroDiasMes('01/12/2010')
print dbo.f_numeroDiasMes('01/02/2012')
print dbo.f_numeroDiasMes('01/02/2010')
select nombre, apellidos, fechanacimiento, dbo.f_numeroDiasMes(fechanacimiento) as diasmes
	from personas 
go

--9 Validar DNI
create function f_validarDNI(@dni varchar(9))
returns integer
as
begin
declare @salida integer
set @salida=1
if LEN(@dni) <> 9
	begin
	set @salida=0
	end
else
	begin
	if @dni not like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][TRWAGMYFPDXBNJZSQVHLCKE]'
		begin
		set @salida=0
		end
	else
		begin
		if SUBSTRING('TRWAGMYFPDXBNJZSQVHLCKE', substring(@dni,1,8) % 23 + 1, 1)<>substring(@dni,9,1)
		begin
		set @salida=0
		end
	end
end
return @salida
end;
go

print dbo.f_validarDNI('5678943L')
print dbo.f_validarDNI('5678K443L')
print dbo.f_validarDNI('56789443L')
print dbo.f_validarDNI('56789443M')
go
select nombre, apellidos, dni+letra as 'Nif',dbo.f_validarDNI(dni+letra)
	from personas 
go

