use Adm88
go
--1
if object_id ('CrearTabla') is not null
  drop procedure CrearTabla;
go
create procedure CrearTabla
	@tabla nvarchar(100)
	as
	set nocount on
	if object_id(@tabla) is not null
		begin
		print N'La tabla ' + @tabla + N' ya existe'
		end
	else
		begin
		declare @sentencia nvarchar(1000)
		set @sentencia=N'create table ' + @tabla + ' (DNI varchar(9), Nombre varchar(40));'
		--print @sentencia
		exec(@sentencia)
		--exec sp_executesql @sentencia
		end	
 go

 exec CrearTabla 'alum48'	
 exec CrearTabla 'alum2'

--2
if object_id ('VerTabla') is not null
  drop procedure VerTabla;
go
create procedure VerTabla
	@tabla nvarchar(100)
	as
	set nocount on
	if object_id(@tabla) is not null
		begin
		print N'La tabla ' + @tabla + N' existe'
		exec('select * from ' + @tabla)
		end
	else
		begin
		print N'La tabla ' + @tabla + N' no existe'
		end	
 go

 exec VerTabla 'PrestamoLibro'	
 exec VerTabla 'alum2'
