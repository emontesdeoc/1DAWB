-- BD playas

-- 1.- Añadir un trigger a la tabla zonas que 
-- cuando hagamos un update no lo permita si 
-- el nombre modificado no contiene al nombre anterior.
-- Hacer ejemplo de uso. (1,5 puntos)
IF object_id('tri_up_zonas') IS NOT NULL 
	drop trigger tri_up_zonas;
go
create trigger tri_up_zonas
  on dbo.Zonas
  for update
as
declare @nombrenuevo varchar(100);
declare @nombreviejo varchar(100);
select @nombrenuevo=nombre
from inserted;
select @nombreviejo=nombre
from deleted;
if @nombrenuevo not like '%'+@nombreviejo+'%'
	rollback transaction
go

select id,nombre
from zonas;

update zonas
set nombre='Nor profundo'
where id=2;

-- BD Facturas
-- 2 crear un trigger de inserción que impida dar de alta una factura de 
-- fecha diferente a la actual

create trigger T_FacturaInsertar2
  on factura
  for insert 
 as
   if exists(select fecha from inserted where 
	(month(fecha) <> month(GETDATE()))
	or
	(day(fecha) <> day(GETDATE()))
	or
	(year(fecha) <> year(GETDATE()))
	)
	begin
	print 'No se puede insertar'
	rollback
	end
	go
insert into Factura values (1002,getdate()-1,'Juana',1)
insert into Factura values (1002,getdate(),'Juana',1)
go

-- 3.- BD videojuegos. 
-- Crear la tabla log_cliente.
create table log_cliente
(idcliente int, fechaalta datetime)
go
-- Hacer un trigger sobre la tabla cliente que no permita dar de alta en 
-- una fecha menor que la fecha de nacimiento y que para los válidos
-- guarde en la tabla log_cliente el id insertado en idcliente y la fecha 
-- actual en fechaalta
 create trigger TR_altacliente
  on cliente
  for insert
  as
	if (select count(*) from inserted
		where inserted.fechanacimiento>getdate()) >0
		begin
		raiserror('error de fecha de nacimiento al insertar cliente',16,1)
		rollback
		end
	else
		begin
		insert into log_cliente
			select id,getdate() from inserted
		end
go

insert into Cliente
values(9999,'Nombre nuevo','prueba@gmail.com',GETDATE()+1,GETDATE())
go
set dateformat dmy
insert into Cliente
values(9999,'Nombre nuevo','prueba@gmail.com','24/3/1965',GETDATE())
go
select idcliente,fechaalta from log_cliente
go






