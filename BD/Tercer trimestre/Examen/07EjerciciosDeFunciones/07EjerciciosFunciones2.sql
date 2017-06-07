
use EmpresasInformaticas
go

--Función de validación de campo
--Función a la que le pasemos un valor datetime y 
--calcule el número de días entre
--la fecha indicada y la fecha actual.

create function Ndias(@fecha datetime)
returns int
as
begin
return datediff(DAY,@fecha,getdate())
end
go

--probarlo en la tabla factura
select dbo.Ndias(fecha),fecha from factura
go
--Función de acceso a tabla
--Función al que le pasemos como parámetro un número
--si es uno devolverá la descripción de la tabla componente
--si es dos devolverá el campo tipo de la tabla tipocomponente
create function f_verinformacion
 (@dato int)
 returns @datos table
  (valor varchar(255)
 )
 as
 begin
 if @dato=1
    begin
	insert @datos
		select descripcion
		from componente
	end
 else
    begin
	insert @datos
		select tipo
		from tipocomponente
	end  
 return   
 end;
 go

select valor from f_verinformacion(1);
select valor from f_verinformacion(2);
go



use EmpresasInformaticas
go

--Función de validación de campo
--Función a la que le pasemos un valor datetimey calcule el número de días entre
--la fecha indicada y la fecha actual.

create function Ndias(@fecha datetime)
returns int
as
begin
return datediff(DAY,@fecha,getdate())
end
go

--probarlo en la tabla factura
select dbo.Ndias(fecha),fecha from factura
go
--Función de acceso a tabla
--Función al que le pasemos como parámetro un número
--si es uno devolverá la descripción de la tabla componente
--si es dos devolverá el campo tipo de la tabla tipocomponente
create function f_verinformacion
 (@dato int)
 returns @datos table
  (valor varchar(255)
 )
 as
 begin
 if @dato=1
    begin
	insert @datos
		select descripcion
		from componente
	end
 else
    begin
	insert @datos
		select tipo
		from tipocomponente
	end  
 return   
 end;
 go

select valor from f_verinformacion(1);
select valor from f_verinformacion(2);
go

