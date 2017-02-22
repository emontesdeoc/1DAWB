
use videojuegosbasicas
go

-- 1.- Mostrar los nombres de los clientes (tabla cliente) nacidos 
-- en la década de los 80.
select nombre
from cliente
where year(fechanacimiento) between 1980 and 1989;
go
-- 2.- Mostrar los juegos (tabla juegos) de la plataforma 
-- PS3 del tipo Acción.
select juego
from Juegos
where plataforma='PS3' and tipo='Acción';
go
-- 3.- Mostrar los  clientes (tabla cliente) ordenados 
-- por fecha de nacimiento de más joven a menos joven 
-- que tengan email que finalice con '.ca' y nacidos 
-- en Junio.
select nombre,fechanacimiento,email
from cliente
where (DATEname(month,fechanacimiento)='Junio') 
	and (email like '%.ca')
order by fechanacimiento desc;
go 
-- 4.- Mostrar Juego, plataforma y distribuidor de la 
-- tabla juegos, ordenados por el distribuidor, para 
-- plataformas que comiencen por P.
select juego,plataforma,distribuidor
from juegos
where Plataforma like 'p%'
order by distribuidor;
go
--5.- Nombre del juego, fecha en formato bonito y 
-- puntuaciones divididas por diez de la tabla 
-- puntuacionbasicas, ordenados por el resultado 
-- de la división de mayor a menor.
select juego,convert(varchar, fecha,103),
	puntuacion/10. as decimapuntuacion
from PuntuacionBasicas
order by decimapuntuacion desc;
go


-- 6.- Crear una tabla Paises con la siguiente estructura:
-- idPais entero, clave primaria y autogenerado
-- pais cadena de caracteres de 50 caracteres máximo, 
--				no puede ser nulo
-- codPais cadena de 3 caracteres de longitud fija, 
--				no puede ser nulo, valor por defecto 'ESP'
create table Paises
(
	idpais integer primary key identity,
	pais varchar(50) not null,
	codpais char(3) not null default 'esp'
);
go

-- 7.- Insertar registros en la tabla creada.
-- a) Dar un valor a idpais junto a los otros dos 
-- campos sin que de error.
set identity_insert paises on;
go
insert into paises (idpais,pais,codpais) 
			values (1,'Australia','Aus');
go
set identity_insert paises off;
go
-- b) Dar un alta correcta sin especificar idpais
insert into paises (pais,codpais) 
			values ('USA','USA');
go
-- c) Dar un alta incorrecta respecto a pais.
insert into paises (pais,codpais) 
			values (null,'no');
go
-- d) Dar un alta con el valor por defecto de pais.
insert into paises (pais) 
			values ('España');
go

select idpais,pais,codpais
from paises;
go
--  8.- Actualizar todos los países poniendo el 
-- codPais en mayúsculas.
update paises
	set codpais=upper(codpais);
go
select idpais,pais,codpais
from paises;
go
-- 9.- Borrar los países creados antes, con idpais mayor que 1.
select idpais,pais,codpais
from paises;
go
delete paises
	where idpais>1;
go
select idpais,pais,codpais
from paises;
go

-- 10- Mostrar la diferencia en meses entre la fechanacimiento 
-- y la fecharegistro y el nombre de los clientes (tabla cliente) 
-- que contengan ma en su nombre.
select datediff(month,fechanacimiento,fecharegistro),nombre
from cliente
where nombre like '%ma%';
go

-- 11.- Mostrar todos los datos de las puntuaciones 
-- (tabla puntuacionbasicas) cuya fecha esté entre 
-- marzo y junio.
select id,juego,plataforma,
		nombrecliente,puntuacion,fecha
from puntuacionbasicas
where datepart(month,fecha) between 3 and 6;
go
-- 12.- Mostrar los juegos (tabla Juegos) cuya plataforma 
-- tenga un número en el tercer carácter.
select juego,plataforma
from juegos
where plataforma like '__[0-9]%';
go

-- 13.- Mostrartodos los datos de la tabla puntuacionbasicas
-- con puntuacion o fecha con valor nulo.
select id,juego,plataforma,
		nombrecliente,puntuacion,fecha
from puntuacionbasicas
where (puntuacion is null) or (fecha is null);
go

-- 14.- Mostrar juego, plataforma y distribuidor de la tabla juegos
-- para juegos que no contengan ninguna a en juego ni en
-- el distribuidor ni en la plataforma

select juego,plataforma,distribuidor
from juegos
where (juego not like '%a%') and
		(distribuidor not like '%a%') and
		(plataforma not like '%a%');
go

