use videojuegos
go

-- 1.- Crear un procedimiento almacenado que le pasemos como parámetro
-- un texto y que devuelva en un parámetro de salida los símbolos
-- que no sean las vocales (con o sin acento).
-- Hacer un ejemplo de ejecución.
drop procedure P_iniciales
go
create procedure P_iniciales
	@texto varchar(255), @salida varchar(255) output
as
	declare @contador int=1
	set @salida=''
	while @contador<=len(@texto)
		begin
		if SUBSTRING(@texto,@contador,1) not in
			('a','e','i','o','u','á','é','í','ó','ú')
			set @salida=@salida + SUBSTRING(@texto,@contador,1)
		set @contador=@contador+1
		end
go

declare @sal varchar(255)
exec P_iniciales 'hola que tal estás', @sal output
print @sal
go

