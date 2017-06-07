use discos
go

--1.- Crear procedimiento almacenado que le pasemos un texto como
-- par�metro y devuelva en un par�metro de salida el n� de clientes 
-- cuyos nombres contengan el texto suministrado. 
-- Hacer un ejemplo de ejecuci�n.
drop procedure p_buscarcliente
go
create procedure p_buscarcliente
	@texto varchar(255), @nclientes int output
as
	select @nclientes=count(*) from Cliente
	where Nombre like '%'+@texto+'%'
go

declare @sal int
exec p_buscarcliente 'sa', @sal output
print @sal
go
--2.- Hacer un procedimiento almacenado al que le pasemos un texto
-- y muestre cuantos clientes empiezan por cada letra del texto.
-- Por ejemplo, si el texto es 'axbm' nos sumar�a en n� de clientes 
-- que comiencen por a m�s el de los que comiencen por x, 
-- los que comiencen por b y los que comiencen por m.

drop procedure P_contar_clientes_letra
go
create procedure P_contar_clientes_letra
	@texto varchar(100)
as
	declare @contador int =1
	declare @resultado int=0
	declare @cuenta int
	while @contador <=len(@texto)
		begin
		select @cuenta=COUNT(*) from cliente
			where substring(Nombre,1,1)=SUBSTRING(@texto,@contador,1)
		set @resultado=@resultado+@cuenta
		set @contador=@contador+1
		end
	print @resultado
go

exec P_contar_clientes_letra 'abc'
go

--3.- Hacer un procedimiento almacenado al que le pasemos como
-- par�metros id, Nombre, email y fechanacimiento que componen 
-- el registro de la tabla cliente y valide que el a�o de la
-- fecha de nacimiento sea anterior al a�o actual menos 18 antes
-- de hacer el alta, sacando un mensaje de error.
-- A�adir el registro tomando como fecharegistro la fecha actual.
create procedure p_insert_cliente
	@id int,@nombre varchar(255),@email varchar(255),
	@fechanacimiento datetime
as
	if YEAR(@fechanacimiento)>(year(getdate())-18)
		print 'Error de fecha de nacimiento'
	else
		insert into Cliente
			values (@id,@nombre,@email,@fechanacimiento,GETDATE())
go

set dateformat dmy
exec p_insert_cliente 999,'Juan P�rez','prueba@gmail.com','10/10/2000'
exec p_insert_cliente 999,'Juan P�rez','prueba@gmail.com','10/10/1967'
go
print year(getdate())-18
