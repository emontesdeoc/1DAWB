
use EmpresasInformaticas
go

--Funci�n de validaci�n de campo
--Funci�n a la que le pasemos un valor datetime y 
--calcule el n�mero de d�as entre
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
--Funci�n de acceso a tabla
--Funci�n al que le pasemos como par�metro un n�mero
--si es uno devolver� la descripci�n de la tabla componente
--si es dos devolver� el campo tipo de la tabla tipocomponente
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

--Funci�n de validaci�n de campo
--Funci�n a la que le pasemos un valor datetimey calcule el n�mero de d�as entre
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
--Funci�n de acceso a tabla
--Funci�n al que le pasemos como par�metro un n�mero
--si es uno devolver� la descripci�n de la tabla componente
--si es dos devolver� el campo tipo de la tabla tipocomponente
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

