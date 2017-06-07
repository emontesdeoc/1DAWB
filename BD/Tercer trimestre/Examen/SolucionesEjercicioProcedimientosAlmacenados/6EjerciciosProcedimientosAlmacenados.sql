use EmpresasInformaticas
go

--Procedimientos almacenados
--Procedimiento almacenado al que le pasemos como parámetro el nombre
--del Mes, que valide si es correcto y que devuelva en
--un parámetro de salida el nº de facturas del mes indicado
-- y un -1 si el nombre del mes es incorrecto.
--Dar tres ejemplos de prueba.
drop procedure p_facturasmes
go
create procedure p_facturasmes
	@mes varchar(20),
	@nfacturas int output
as
if @mes not in ('Enero','Febrero','Marzo','Abril',
						'Mayo','Junio','Julio',
						'Agosto','Septiembre','Octubre'
						,'Noviembre','Diciembre')
	begin
	set @nfacturas=-1
	end
else
	begin
	select @nfacturas=count(*) from Factura
		where datename(month,Factura.Fecha)=@mes
	end	
go

declare @valor int
exec p_facturasmes 'Enero',@valor output
print @valor
go

declare @valor int
exec p_facturasmes 'Febrero',@valor output
print @valor
go

declare @valor int
exec p_facturasmes 'Agostossss',@valor output
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

drop procedure P_verproximosdias
go
create procedure P_verproximosdias
	@n int =10
as
	declare @contador int=0
	while @contador <@n
		begin
		print dateadd(month,@contador+1,getdate())
		set @contador=@contador+1
		end
go		

exec p_verproximosdias 3
go
exec p_verproximosdias
go
--Procedimiento almacenado que actualice la tabla componente,
--aplicándole un 5% de incremento a los precios de los componentes
--de un CodTipo pasado como parámetro.
--Validará que hay componentes del tipo pasado, mostrando un error en
--el caso de que no existan y en número de componentes modificados en 
--el caso de que sí existan.

drop procedure p_componentesactualiza5
go
create procedure p_componentesactualiza5
	@tip int
as
	set nocount on
	if exists ( select clave from componente 
					where CodTipo=@tip)
		begin
		update Componente
			set precio=precio*1.05
			where CodTipo=@tip
		print 'Se han actualizado ' +
				convert(varchar,@@rowcount) +
				' registros'
		end
	else
		print 'No hay componentes de ese tipo'
go	

exec p_componentesactualiza5 100
go

exec p_componentesactualiza5 5
go			
		
