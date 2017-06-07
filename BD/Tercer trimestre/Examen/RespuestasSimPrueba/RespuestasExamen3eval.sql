use DatosSCTFE
go

-- 1.- Procedimiento almacenado al que le pasemos como parámetro 
-- el nombre de un Distrito y devuelva en un parámetro de salida 
-- la suma del Area de los barrios de ese distrito 
-- o un -1 si el distrito no existe.
-- Hacer un ejemplo de ejecución del procedimiento.
IF object_id('p_AreaDistrito') IS NOT NULL 
	DROP procedure [p_AreaDistrito]
go
create procedure p_AreaDistrito
	@distrito varchar(100),
	@salida float output
as
	if (select count(*) from distrito
		where distrito=@distrito)=0
		set @salida=-1
	else
		select @salida=sum(area)
		from barrio as b
		inner join distrito as d
			on b.cod_distrito=d.coddistrito
		where distrito=@distrito
go

select distrito from distrito;
go
declare @dato float
exec p_AreaDistrito 'CENTRO - IFARA',@dato output
print @dato
go

-- 2.- Procedimiento almacenado que le pasemos como dato 
-- de entrada una cantidad de paradas (mayor que 0)
-- y nos muestre los nombres de
-- los barrios que tengan esa cantidad de paradas.
-- Hacer un ejemplo de ejecución del procedimiento.
IF object_id('p_NumeroParadas') IS NOT NULL 
	DROP procedure [p_NumeroParadas]
go
create procedure p_NumeroParadas
	@nparadas int
as
	select barrio,count(*) as nparadas
	from barrio as b
	inner join paradas_taxi as p
		on p.cod_barrio=b.COD_BARRIO
	group by barrio
	having count(*)=@nparadas
go

exec p_NumeroParadas 5
go

-- 3.- Queremos crear un procedimiento almacenado
-- mediante cursor que recorra una tabla auxiliar que contendrá
-- para cada registro un select válido dividido en dos campos
-- (uno con el select y los campos y otro desde el from) y una tabla de
-- destino. Se trata de que el programa borre
-- la tabla de destino si existe y mediante la sentencia
-- select la cree y cargue de datos.
-- Ejemplo de datos:
-- TablaDestino: NombreBarrio
-- Seleccion1: select barrio 
-- Seleccion2: from barrio;
-- TablaDestino: NumParadas
-- Seleccion1: select Barrio,count(*) as Nparadas
-- Seleccion2: from barrio inner join paradas_taxi
--			on barrio.cod_barrio=paradas_taxi.cod_barrio
--			group by barrio;
-- Hacer ejemplo de ejecución.
IF object_id('tablaauxiliar') IS NOT NULL 
	DROP table [tablaauxiliar]
go
create table tablaauxiliar
( tabladestino varchar(100),
  seleccion1 varchar(max),
  seleccion2 varchar(max)
)
go
insert into tablaauxiliar
	values
('NombreBarrio',
	'select barrio',' from barrio;'),
('NumParadas',
'select Barrio,count(*) as Nparadas',
'from barrio inner join paradas_taxi
		on barrio.cod_barrio=paradas_taxi.cod_barrio
		group by barrio;');
go


IF object_id('p_CrearTablas') IS NOT NULL 
	DROP procedure [p_CrearTablas]
go

create procedure p_CrearTablas
	as
	declare @sentencia varchar(1000)
	declare @TablaDestino varchar(100)
	declare @seleccion1 varchar(max)
	declare @seleccion2 varchar(max)
	declare CUR cursor for
		select  TablaDestino,seleccion1,seleccion2
		from  tablaauxiliar;
	open CUR
	fetch next from CUR
		into  @TablaDestino,@seleccion1,@seleccion2
	while @@FETCH_STATUS=0
		begin
		set @sentencia='drop table '+@tabladestino
		begin try
			-- print @sentencia
			exec(@sentencia)
		end try
		begin catch
		end catch
		set @sentencia=@seleccion1+' into '+@tabladestino+
			' '+@seleccion2;
		exec (@sentencia)
		-- print @sentencia
		fetch next from CUR
			into  @TablaDestino,@seleccion1,@seleccion2
		end
	close cur
	deallocate cur 
go
 
 
exec p_CrearTablas;
go
select barrio from nombrebarrio;
select Barrio,Nparadas
from NumParadas;

-- 4.- Función de tabla en línea que nos muestre la suma
-- del valor de datospadron por barrio para grupos de 
-- edad que contengan una edad pasada como parámetro.
-- Hacer un ejemplo de uso.
IF object_id('f_TotalPadron') IS NOT NULL 
	DROP function [f_TotalPadron]
go
CREATE FUNCTION dbo.f_TotalPadron
	(@edad int)
RETURNS TABLE
AS
RETURN 
(
select barrio,sum(valor) as padron
from barrio as b
inner join datospadron as p
	on b.cod_barrio=p.cod_barrio
inner join grupoedad as g
	on g.clave=p.clavegrupo
where @edad between g.edadinicial and g.edadfinal
group by barrio
)
go
select barrio,padron
from dbo.f_TotalPadron(10)
go

-- 5.- Función de tabla mediante instrucciones que le pasemos 
-- como parámetro una letra (A,X,Y) Para cada barrio dará
-- el nombre y el valor de:
-- Para la A dar Area
-- Para la X dar UTM_X
-- Para la Y dar UTM_Y
-- Hacer ejemplo de uso.
IF object_id('f_VerBarrio') IS NOT NULL 
	DROP function [f_VerBarrio]
go
create function f_VerBarrio
 (@tipo char(1))
 returns @datos table
  (barrio varchar(100),dato float,tipo char(1))
 as
 begin
 if @tipo='A'
 insert @datos
		select barrio,area,'A'
		from barrio
 if @tipo='X'
 insert @datos
		select barrio,utm_x,'X'
		from barrio
 if @tipo='Y'
 insert @datos
		select barrio,utm_y,'Y'
		from barrio
 return   
 end;
 go

select barrio,dato,tipo 
	from dbo.f_VerBarrio('Y');



-- 6.- Crear un índice para la tabla Paradas_Taxi
-- por el campo direccion.
create nonclustered index i_direccion
on Paradas_Taxi(direccion);

-- 7.- Crear una vista que nos muestre edadinicial
-- y edad final de cada grupoedad.
-- Hacer un ejemplo de uso.

IF object_id('v_edades') IS NOT NULL 
	DROP view [v_edades]
go
create view v_edades
as
	select edadinicial,edadfinal
	from grupoedad;
go

select edadinicial,edadfinal from v_edades;
go


--8.- Recuperar copia de seguridad indicando objetos que 
--contiene del tipo indicado en la lista:
--Tablas de usuario y nº de registros:
--		Familia 6
--		Paso	0
--		Planta	15
--Índices
--		i_familia
--		pk_familia
--		uq_familia
--		pk_paso
--		pk_planta
--		uq_planta
--Foreign key
--		fk_planta
--Funciones de usuario:
--		f_datos_planta
--Procedimientos almacenados de usuario:
--		p_prueba

create database prueba3ev_zz
go

use prueba3ev_zz
go

--eliminar tablas

if object_id('Planta') is not null
  drop table Planta;
  go
if object_id('Familia') is not null
  drop table Familia;
  go

if object_id('Paso') is not null
  drop table Paso;
  go

--Crear tabla Familia
create table Familia
(		
	CodFamilia 	integer primary key,
	Familia	varchar(50) not null unique
);

--Crear tabla Planta
create table Planta
(		
	CodPlanta 	integer primary key,
	DescripcionPlanta	varchar(50) not null unique,
	CodFamilia integer,
	Precio decimal(6,2),
	foreign key (CodFamilia)
		references Familia(CodFamilia)
);

Create table paso
( dato int primary key);

--Cargar datos

insert Familia (CodFamilia,Familia)
	values
	(2,'CUCURBITACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (3,'Cucumis melo',2,4);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (4,'Cucurbita pepo',2,12);

insert Familia (CodFamilia,Familia)
	values
	(3,'PINACEAE-ABIETACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (5,'Pinus pinea',3,45);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (6,'Cedrus deodara',3,23.30);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (7,'Cedrus libani',3,10.40);		

insert Familia (CodFamilia,Familia)
	values
	(4,'PLATANACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (8,'Platanus hispánica',4,12.50);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (9,'Platanus orientalis ',4,14.30);

insert Familia (CodFamilia,Familia)
	values
	(5,'ROSACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (10,'Fragaria X ananassa',5,1.05);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (11,'Prunus pérsica',5,2.30);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (12,'Prunus avium',5,6.20);

insert Familia (CodFamilia,Familia)
	values
	(6,'RUTACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (13,'Agave americana',6,20.30);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (14,'Dracaena indivisa',6,3.20);

insert Familia (CodFamilia,Familia)
	values
	(7,'RUBIACEAE');
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (15,'Citrus limón',7,10.20);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (16,'Citrus sinensis',7,12.30);
insert Planta (CodPlanta,DescripcionPlanta,CodFamilia,Precio)	
	values (17,'Skimmia japonica',7,17.35);
go





create nonclustered index i_familia
on familia (Familia);
go



IF object_id('f_datos_planta2') IS NOT NULL 
	DROP function [f_datos_planta2]
go
create function f_datos_planta2(@familia varchar(100))
returns table
as
	return (select DescripcionPlanta,Familia
			from Planta
			inner join Familia
				on planta.codfamilia=familia.codfamilia
			where familia=@familia)
go


-- procedimiento almacenado
create procedure p_prueba
as
select familia from familia;
go


-- 9.- Crear la tabla paso con la estructura siguiente:
-- fechahora datetime
-- coddistrito int
-- usuario varchar(200)
-- Añadir un trigger a la tabla distrito que cuando
-- hagamos un alta de distrito añada un registro
-- a la tabla logdistrito con el coddistrito añadido, el usuario
-- obtenido de SYSTEM_USER y la fechahora de getdate().
-- Hacer ejemplo de uso.
IF object_id('logdistrito') IS NOT NULL 
	DROP table [logdistrito]
go
create table logdistrito
( coddistrito int,
  usuario varchar(200),
  fechahora datetime
)
go

IF object_id('tri_distrito') IS NOT NULL 
	drop trigger tri_distrito;
go
create trigger tri_distrito
  on dbo.Distrito
  for insert
as
insert into logdistrito
	select coddistrito,SYSTEM_USER,getdate()
	from inserted;
go

insert into distrito
	values (999,'Nuevo Distrito');
select cosdistrito,usuario,fechahora from logdistrito;
