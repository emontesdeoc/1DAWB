--Emiliano Montesdeoca
--02ConsultasBasicasSQL02

/* Ejercicio pagina 9 */

use MoviesBasicas;

drop table Peliculas

create table Peliculas
(
Id int primary key,
Titulo nvarchar(100) null,
Director nvarchar(100) null,
Agno int null,
FechaCompra datetime,
precio numeric(6,2)
);

insert Peliculas (Id, Titulo) values (1,'Mi pelicula 1');
insert Peliculas (Id, Titulo) values (1,'Mi pelicula 2');

drop table Socios

create table Socios
(
NIFNIE char(9) primary key,
Apellidos varchar(50),
Nombre varchar(100),
Direccion varchar(100),
Telefono char(9),
FechaDeAlta datetime
);

insert Socios (NIFNIE, Apellidos) values ('123456789', 'Apellido 1');
insert Socios (NIFNIE, Apellidos) values ('123456789', 'Apellido 2');

create table Socios2
(
NIFNIE char(9),
Apellidos varchar(50),
Nombre varchar(100),
Direccion varchar(100),
Telefono char(9),
FechaDeAlta datetime,
primary key (Apellidos, Nombre)
);

go

/* Fin ejercicio pagina 9 */

/* Ejercicio pagina 23 */

use MoviesBasicas
go

create table Peliculas2
(
Id int identity primary key,
Titulo nvarchar(100) null,
Director nvarchar(100) null,
Agno int null,
FechaCompra datetime,
precio numeric(6,2)
);

insert Peliculas2 (Titulo, Director, Agno, FechaCompra, precio) values ('Mi peli', 'Emiliano', 2016, '1/02/1995', 500)
insert Peliculas2 (Titulo, Director, Agno, FechaCompra, precio) values ('Mi peli 2', 'Emiliano', 2016, '1/02/1995', 500)
insert Peliculas2 (Titulo, Director, Agno, FechaCompra, precio) values ('Mi peli 3', 'Emiliano', 2016, '1/02/1995', 500)

--Intentar insertar un registro especificando el Id, ¿qué ocurre?
--Es autoincremental, no se le puede dar un valor

delete from Peliculas2 where Titulo = 'Mi peli 2';

--Desactivar el generado automático campo identity

set identity_insert Peliculas2 off;

--Insertar nuevo registro sin el Id ¿qué ocurre?
--Se agrega un campo sin valor ID

insert Peliculas(Titulo) values ('Mi pelicula')
select * from Peliculas where Titulo='Mi pelicula';

--Insertar nuevo registro con el id ¿qué ocurre?
--Se agrega un campo con valor ID introducio

insert Peliculas(Id,Titulo) values (200,'Mi pelicula')
select * from Peliculas where Titulo='Mi pelicula';

--Mostrar el valor del último identity generado

select @@identity

--Mirar el contenido de la tabla (id y Titulo) ¿qué ocurre y por qué?
--El campo con el autoincremetar se borra pero no se reutiliza el valor

go

/* Fin ejercicio pagina 23 */

/* Ejercicio pagina 27  */

if object_id('FAC_T_Prueba') is not null
 drop table FAC_T_Prueba;
 go
create table FAC_T_Prueba
(
id integer identity primary key,
dato varchar(100)
);
go
declare @contador integer =0;
while @contador<=10000
begin
insert into FAC_T_Prueba
values ('Dato'+convert(char,@contador));
set @contador=@contador+1
end
go


declare @tiempoini datetime=getdate();
truncate table FAC_T_Prueba;
declare @tiempofin datetime=getdate();
select DATEDIFF(millisecond,@tiempoini,@tiempofin)
go

/* Fin ejercicio pagina 27 */