use ciclismo;
go
-- 1.- Mostrar Nombre de equipos y número de ciclistas de cada equipo. Resolver mediante cursor.
declare @nombre varchar(255)
declare @nciclistas int
declare CUR cursor for
	select  nombre,nciclistas
	from  ciclismo.dbo.equipo;
open CUR
fetch next from CUR
	into  @nombre,@nciclistas
while @@FETCH_STATUS=0
	begin
	-- procesar
	print @nombre + ' Nciclistas:'+
		cast(@nciclistas as varchar(200))
	-- siguiente
	fetch next from CUR
		into  @nombre,@nciclistas
	end
close cur
deallocate cur 
go




--1.- Crear una tabla que contenga lo siguiente:
--Tabla
--	Federacion
--	Club
--	Organizador
IF object_id('datostablas') IS NOT NULL 
	DROP table [datostablas]
go
create table datostablas
( tabla varchar(100))
go
insert into datostablas
	values
	('Federacion'),
	('Club'),
	('Organizador');
go
select taBLA from datostablas;
--Crear un procedimiento almacenado que 
--recorra la tabla mediante 
--un cursor que permita crear una 
--restricción unique en cada tabla
--para el campo que se llama como la 
--tabla y con denominación de la
--restricción U_ y el nombre de la tabla. 
--Eliminarla previamente 
--si existe.
-- Hacer ejemplo de ejecución. (2 puntos)

IF object_id('CrearRestriccion') IS NOT NULL 
	DROP procedure [CrearRestriccion]
go

create procedure CrearRestriccion
	as
	declare @sentencia varchar(1000)
	declare @Tabla varchar(100)
	declare CUR cursor for
		select  Tabla
		from  ciclismo.dbo.datostablas;
	open CUR
	fetch next from CUR
		into  @Tabla
	while @@FETCH_STATUS=0
		begin
		set @sentencia='alter table '+@tabla+
			' drop CONSTRAINT U_'+@tabla
		-- print @sentencia
		begin try
			exec(@sentencia)
		end try
		begin catch
			print 'Índice no existe: U_'+@tabla
		end catch
		set @sentencia='alter table '+@tabla+
			' add CONSTRAINT U_'+@tabla
		set @sentencia+=' unique(' + @Tabla +'); '
		exec (@sentencia)
		-- print @sentencia
		fetch next from CUR
			into  @Tabla
		end
	close cur
	deallocate cur
	print'OK'
 go
 
 
 exec CrearRestriccion;
--3.- Crear una tabla con un único campo llamado 
-- t de tipo varchar(100).
--Insertar en la tabla creada los valores 
-- 'Cliente', 'Puntuacion', 'Disco' e Interprete'
--Hacer un procedimiento almacenado que 
-- contenga un cursor que recorra la
--tabla creada y nos muestre el número 
-- de registros de la tabla con el 
--nombre leído.
--Hacer una prueba de ejecución.
use discos;
go
IF object_id('contenido') IS NOT NULL 
	DROP table [contenido]
go
create table contenido
( t varchar(100))
go
insert into contenido
values ('Cliente'),('Puntuacion'),
('Disco'),('Interprete'),('Tipo'),('contenido')
go

IF object_id('MostrarRegistros') IS NOT NULL 
	DROP procedure [MostrarRegistros]
go

create procedure MostrarRegistros
	as
	declare @sentencia varchar(1000)
	declare @Tabla varchar(100)
	declare CUR cursor for
		select  t
		from  discos.dbo.contenido;
	open CUR
	fetch next from CUR
		into  @Tabla
	while @@FETCH_STATUS=0
		begin
		set @sentencia='select count(*) as '+
			@tabla+' from '+@tabla
		-- print @sentencia
		exec(@sentencia)
		fetch next from CUR
			into  @Tabla
		end
	close cur
	deallocate cur 
 go
 

 exec MostrarRegistros;

-- 4.- Crear una tabla con un único campo llamado t de tipo varchar(100). 
-- Insertar en la tabla creada los valores 'Cliente', 'Puntuacion', 'Disco' e Interprete'
-- Hacer un procedimiento almacenado que contenga un cursor que 
-- recorra la tabla creada y nos muestre los tres primeros registros 
-- de la tabla con el nombre leído.
Hacer una prueba de ejecución.
IF object_id('contenido2') IS NOT NULL 
	DROP table [contenido2]
go
create table contenido2
( t nvarchar(100))
go
insert into contenido2
values (N'Cliente'),(N'Puntuacion'),
(N'Disco'),(N'Interprete'),(N'Tipo')
go

IF object_id('MostrarRegistros2') IS NOT NULL 
	DROP procedure [MostrarRegistros2]
go

create procedure MostrarRegistros2
	as
	declare @sentencia nvarchar(1000)
	declare @Tabla nvarchar(100)
	declare CUR cursor for
		select  t
		from  discos.dbo.contenido2;
	open CUR
	fetch next from CUR
		into  @Tabla
	while @@FETCH_STATUS=0
		begin
		set @sentencia=N'select top 3 * from '+@tabla
		-- print @sentencia
		exec sp_executesql @sentencia
		fetch next from CUR
			into  @Tabla
		end
	close cur
	deallocate cur 
 go


 exec MostrarRegistros2;

--5.- Crear una tabla que contenga lo siguiente:
--Tabla
--Jugador
--Pais
--Superficie
--Estadio
--TipoTorneo
use tenis;
go
IF object_id('datostablas') IS NOT NULL 
	DROP table [datostablas]
go
create table datostablas
( tabla varchar(100))
go
insert into datostablas
	values
	('Jugador'),
	('Pais'),
	('Superficie'),
	('Estadio'),
	('TipoTorneo');
go
--Crear un procedimiento almacenado que 
--recorra la tabla mediante 
--un cursor que permita crear un 
--índice para cada tabla dándole 
--el nombre I_ y el nombre de la tabla 
--y para el campo que se 
--llama como la tabla.  El procedimiento 
--debe controlar que 
--si el índice existe lo borre. 
--Hacer ejemplo de ejecución. 

IF object_id('CrearIndice') IS NOT NULL 
	DROP procedure [CrearIndice]
go

create procedure CrearIndice
	as
	declare @sentencia varchar(1000)
	declare @Tabla varchar(100)
	declare CUR cursor for
		select  Tabla
		from  tenis.dbo.datostablas;
	open CUR
	fetch next from CUR
		into  @Tabla
	while @@FETCH_STATUS=0
		begin
		set @sentencia='DROP index [i_'+@tabla+'] on dbo.'+@tabla
		--print @sentencia
		begin try
			exec(@sentencia)
		end try
		begin catch
		end catch
		set @sentencia=' create nonclustered index I_' +@tabla
		set @sentencia+=' on ' + @Tabla + '(' + @tabla +'); '
		--print @sentencia
		exec (@sentencia)
		fetch next from CUR
			into  @Tabla
		end
	close cur
	deallocate cur
	print 'finalizado'
 go



exec CrearIndice;

--6.- Crear una tabla que contenga 
--lo siguiente:
--Tabla,indice
--Jugador
--Pais
--Superficie
--Estadio
--TipoTorneo
use tenis;
go
IF object_id('datostablas2') IS NOT NULL 
	DROP table [datostablas2]
go
create table datostablas2
( tabla varchar(100),
  campo varchAR(100))
go
insert into datostablas2
	values
	('Jugador','jugador'),
	('Pais','pais'),
	('Superficie','superficie'),
	('Estadio','estadio'),
	('Ediciontorneo','fecha'),
	('TipoTorneo','tipotorneo');
go
--Crear un procedimiento almacenado que 
--recorra la tabla mediante 
--un cursor que permita crear un 
--índice para cada tabla dándole 
--el nombre I_ y el nombre de la tabla 
--y para el campo indicado 
-- El procedimiento 
--debe controlar que 
--si el índice existe lo borre. 
--Hacer ejemplo de ejecución. 

IF object_id('CrearIndice2') IS NOT NULL 
	DROP procedure [CrearIndice2]
go

create procedure CrearIndice2
	as
	declare @sentencia varchar(1000)
	declare @Tabla varchar(100)
	declare @CAMPO varchar(100)
	declare CUR cursor for
		select  Tabla,campo
		from  tenis.dbo.datostablas2;
	open CUR
	fetch next from CUR
		into  @Tabla,@campo
	while @@FETCH_STATUS=0
		begin
		set @sentencia='DROP index [i_'+@tabla+'] on dbo.'+@tabla
		-- print @sentencia
		begin try
			exec(@sentencia)
		end try
		begin catch
		end catch
		set @sentencia=' create nonclustered index I_' +@tabla
		set @sentencia+=' on ' + @Tabla + '(' + @campo +'); '
		-- print @sentencia
		exec (@sentencia)
		fetch next from CUR
			into  @Tabla,@campo
		end
	close cur
	deallocate cur
	print 'finalizado'
 go

 
exec CrearIndice2;





