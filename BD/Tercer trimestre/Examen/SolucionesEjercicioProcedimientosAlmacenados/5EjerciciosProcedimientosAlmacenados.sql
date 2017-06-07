use videojuegos
go

-- 1.- Crear un procedimiento almacenado que le pasemos como par�metro
-- un texto y que devuelva en un par�metro de salida los s�mbolos
-- que no sean las vocales (con o sin acento).
-- Hacer un ejemplo de ejecuci�n.
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
			('a','e','i','o','u','�','�','�','�','�')
			set @salida=@salida + SUBSTRING(@texto,@contador,1)
		set @contador=@contador+1
		end
go

declare @sal varchar(255)
exec P_iniciales 'hola que tal est�s', @sal output
print @sal
go

