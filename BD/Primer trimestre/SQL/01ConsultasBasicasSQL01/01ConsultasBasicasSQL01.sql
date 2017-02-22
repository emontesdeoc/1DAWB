--Emiliano Montesdeoca
--01ConsultasBasicasSQL01

/* Ejercicio pagina 21 */

create database MoviesBasicas

use MoviesBasicas


create table Peliculas
(
id integer,
Titulo varchar(100),
Directo varchar(100),
Agno integer,
FechaCompras datetime,
precio numeric (6,2)
);

create table Socios
(
NIFNIE char(9),
Apellidos varchar(50),
Nombre varchar(100),
Direccion varchar(100),
Telefono char(9),
FechaDeAlta datetime
);
go

/* Fin ejercicio pagina 21 */

/* Ejercicio pagina 27 */

create database facturasbasicas

use facturasbasicas


if OBJECT_ID('FAC_T_Cliente') is not null
drop table FAC_T_Cliente;


if OBJECT_ID('FAC_T_Articulo') is not null
drop table FAC_T_Articulo;


create table FAC_T_Articulo
(
id integer,
nombreArticulo varchar,
Precio numeric(10,2)
);

create table FAC_T_Cliente
(
id integer,
Nombre varchar,
Apellido varchar
);
go

sp_tables @table_owner='dbo';
go

/* Fin ejercicio pagina 27 */

/* Fin ejercicio pagina 32 */

use MoviesBasicas


insert Peliculas (id,Titulo,Directo,Agno,FechaCompras,precio) values (1,'Rashomon','Akira Kurosawa', 1951,'01/01/2012',20);
insert Peliculas (id,Titulo,Directo,Agno,FechaCompras,precio) values (2,'Forest Gump','Robert Zemeckis', 1994,'01/01/2012',10);
insert Peliculas (id,Titulo,Directo,Agno,FechaCompras,precio) values (3,'La Fiera de mi Niña','Howard Hawks', 1938,'01/01/2012',4);

insert Peliculas (id, Agno, Titulo, Directo) values (33,1956,'Moby dick','John Huston');

select * from Peliculas;
go

/* Fin ejercicio pagina 32 */

/* Ejercicio pagina 36 */

use MoviesBasicas

select * from Peliculas;

select Titulo,Director from Peliculas;

select Apellidos,Nombre from Socios;
go

/* Fin ejercicio pagina 36 */

/* Ejercicio pagina 40 */

use MoviesBasicas

select * from Peliculas where Director='Francis Ford Coppola';

select Apellidos, Nombre from Socios where Nombre='Juan';

select Titulo, Director from Peliculas where Agno=1960;

go

/* Fin ejercicio pagina  40 */

/* Ejercicio pagina  46 */

select * from Peliculas where Director!='Francis Ford Coppola';

select Titulo, Director from Peliculas where Agno>=1960;


/* Fin ejercicio pagina 46 */
go
/* Ejercicio pagina 51 */

use MoviesBasicas

delete from Peliculas where Agno=1975;

delete from Peliculas where Titulo='Gandhi';

delete from Socios where FechaDeAlta>='31/12/2088';
go

/* Fin ejercicio pagina 51 */

/* Ejercicio pagina 55*/

select * from Peliculas where Agno=1980;

update Peliculas set precio=precio+((precio*10)/100) where Agno=1980;

select Titulo, FechaCompra from Peliculas where Titulo='La Fiera de mi Niña';

update Peliculas set FechaCompra='15/03/2013' where Titulo='La Fiera de mi Niña';

select Titulo, Director from Peliculas where Director='Joseph Leo Mankiewicz';

update Peliculas set Director='Joseph Leo Mankiewicz' where Director='Joseph L. Mankiewicz';

select Titulo, precio from Peliculas where precio<=4;

update Peliculas set Precio=precio+1 where precio<4;
go

/* Fin ejercicio pagina 55*/

/* Ejercicio pagina 62 */

select Titulo from Peliculas where Director is null;

select Titulo from Peliculas where Director='';

create table peliculas2
(
Id int null,
Titulo nvarchar(100) not null,
Director nvarchar(100) not null,
Agno int null,
FechaCompra datetime null,
precio numeric(6,2) null
);

insert peliculas2 (Id, Titulo, Director,Agno,FechaCompra,precio) values (20,null,null,1900,19/12/2012,5);

/* Fin ejercicio pagina 62  */