use Empresasinformaticas
go

--Procedimiento almacenado
--Procedimiento almacenado al que le pasemos como parámetro el nombre
--de un día de la semana, que valide si es correcto y que devuelva en
--un parámetro de salida el nº de facturas del día de la semana indicado
-- y un -1 si el nombre del día de la semana es incorrecto.
--Dar tres ejemplos de prueba.
if object_id ('p_facturasdia') is not null
  drop procedure p_facturasdia;
go

create procedure p_facturasdia
	@diasemana varchar(20),
	@nfacturas int output
as
if @diasemana not in ('Lunes','Martes','Miércoles','Jueves',
						'Viernes','Sábado','Domingo')
	begin
	set @nfacturas=-1
	end
else
	begin
	select @nfacturas=count(*) from Factura
		where datename(dw,Factura.Fecha)=@diasemana
	end	
go

declare @valor int
exec p_facturasdia 'Martes',@valor output
print @valor
go

declare @valor int
exec p_facturasdia 'Miércoles',@valor output
print @valor
go

declare @valor int
exec p_facturasdia 'Martessss',@valor output
print @valor
go

-- Hacer un procedimiento almacenado que muestre el día de los N 
-- próximos meses a partir de la fecha de hoy, con N entrado 
-- como parámetro, con valor por defecto 10
--Si hoy es 8/6/2013, para N=8 deberá salir en formato fecha:
--Jul  8 2013 11:10AM
--Ago  8 2013 11:10AM
--Sep  8 2013 11:10AM
--Oct  8 2013 11:10AM
--Nov  8 2013 11:10AM
--Dic  8 2013 11:10AM
--Ene  8 2014 11:10AM
--Feb  8 2014 11:10AM

if object_id ('P_verproximosdias') is not null
  drop procedure P_verproximosdias;
go

create procedure P_verproximosdias
	@n int =10
as
	declare @contador int=1
	while @contador <=@n
		begin
		
		print dateadd(month,@contador,getdate())
		
		set @contador=@contador+1
		end
go		

exec p_verproximosdias 3
go
exec p_verproximosdias
go

