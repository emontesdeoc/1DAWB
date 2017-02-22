--Emiliano Montesdeoca
--01ElementosFundamentales01


/*

Ejercicio pagina 16

Usar la base de datos RestauranteBasicas.
Crear la Base de Datos, sus tablas y añadir los registros que contiene
el archivo sql.
Ajustar el lenguaje a inglés.
Entrar dos comidas con los id 22 y 23, con fecha 13 de marzo de 2013
y 26 de diciembre de 2013.
Validar que ha entrado la fecha correctamente.
Ajustar el lenguaje a español.
Entrar dos comidas con los id 24 y 25, con fecha 18 de marzo de 2013
y 25 de julio de 2013.
Validar que ha entrado la fecha correctamente.
Hacer un select con filtro a través del campo fecha. Ajustarlo para
que filtre correctamente.
Mostrar la fecha de la tabla en un formato más claro. 

*/

use RestauranteBasicas
go

--Ajustar el lenguaje a inglés.

set language us_english
go

--Entrar dos comidas con los id 22 y 23, con fecha 13 de marzo de 2013 y 26 de diciembre de 2013.

insert into Comida (IdComida,Fecha) values (22,'13-03-2013') set dateformat dmy
insert into Comida (IdComida,Fecha) values (23,'26-12-2013') set dateformat dmy

--Validar que ha entrado la fecha correctamente.

select IdComida,Fecha from Comida where IdComida >=22

--Ajustar el lenguaje a español.

set language español

--Entrar dos comidas con los id 24 y 25, con fecha 18 de marzo de 2013y 25 de julio de 2013.

insert into Comida (IdComida,Fecha) values (24,'18-03-2013') set dateformat dmy
insert into Comida (IdComida,Fecha) values (25,'25-07-2013') set dateformat dmy

--Hacer un select con filtro a través del campo fecha. Ajustarlo para que filtre correctamente.

select Fecha from Comida 

--Mostrar la fecha de la tabla en un formato más claro. 

select convert(varchar,Fecha,100) from Comida 

/*

Ejercicio pagina 23

Usar la base de datos RestauranteBasicas.
Crear la Base de Datos, sus tablas y añadir los registros que contiene el
archivo sql.
Crear una tabla TipoPlato2 igual que la TipoPlato, dando como valor por
defecto del campo TipoPlato a Bebidas básicas y en el campo Agrupa a
Bebida.
Probar insertando varios registros a TipoPlato que obliguen a usar los 2
valores por defecto y cada uno por separado.
Añadiendo otro registro usando la cláusula default en la lista de valores.
Mostar los datos para comprobar que la tabla actuó como se definió.


*/

--Usar la base de datos RestauranteBasicas.

use RestauranteBasicas
go


--Crear una tabla TipoPlato2 igual que la TipoPlato, dando como valor por
--defecto del campo TipoPlato a Bebidas básicas y en el campo Agrupa a
--Bebida.

create table TipoPlato2(
CodTipoPlato int,
TipoPlato varchar(100) default 'Bebidas basicas',
Agrupa varchar(10) default 'Bebidas'
);

--Probar insertando varios registros a TipoPlato que obliguen a usar los 2
--valores por defecto y cada uno por separado.

insert into TipoPlato2 (CodTipoPlato) values (1)
insert into TipoPlato2 (CodTipoPlato) values (2)
insert into TipoPlato2 (CodTipoPlato, TipoPlato) values (3,'Test')
insert into TipoPlato2 (CodTipoPlato, Agrupa) values (4, 'Test')

--Añadiendo otro registro usando la cláusula default en la lista de valores.

insert into TipoPlato2 (CodTipoPlato) values (5)

--Mostar los datos para comprobar que la tabla actuó como se definió.

select CodTipoPlato,TipoPlato,Agrupa from TipoPlato2

/*

Usar la base de datos RestauranteBasicas.
Crear la Base de Datos, sus tablas y añadir los registros que contiene el
archivo sql.
Mostrar los precios de cinco platos de cada comida. Ponerle nombre a la
columna calculada.
Mostrar los precios de cada comida con el 5% de descuento. Ponerle nombre
a la columna calculada.
Modificar el precio del plato 4 sumándole 3 euros.
Calcular y explicar las siguientes operaciones matemáticas, poniéndole
nombre al cálculo:
• (4+5)*6
• 3+4*2
• -4*5+2
• 22%5
De todos los tipos de plato, mostrar el campo Agrupa seguido por dos puntos
y un blanco y el campo TipoPlato. Darle el nombre "Su plato" a la columna.

*/

--Usar la base de datos RestauranteBasicas.

use RestauranteBasicas
go

--Crear la Base de Datos, sus tablas y añadir los registros que contiene el
--archivo sql.


--Mostrar los precios de cinco platos de cada comida. Ponerle nombre a la
--columna calculada.

select Precio as 'Precio test' from Plato where CodPlato < 5


--Mostrar los precios de cada comida con el 5% de descuento. Ponerle nombre
--a la columna calculada.


select Precio-Precio*5/100 as 'Precio con descuento de 5%' from Plato 


--Modificar el precio del plato 4 sumándole 3 euros.

update Plato set Precio=Precio+3 where CodPlato=4

--Calcular y explicar las siguientes operaciones matemáticas, poniéndole
--nombre al cálculo:

--• (4+5)*6

select (4+5)*6 as 'Primero suma luego multiplicacion' 

--• 3+4*2

select 3+4*2 as 'Primero multiplicacion luego suma' 


--• -4*5+2

select -4*5+2 as 'Primero multiplicacion luego suma' 


--• 22%5

select 22%5 as 'Resto de un numero par' 


--De todos los tipos de plato, mostrar el campo Agrupa seguido por dos puntos
--y un blanco y el campo TipoPlato. Darle el nombre "Su plato" a la columna.

select Agrupa+ ': ' + TipoPlato  as 'Su Plato' from TipoPlato

/* 

Ejercicio pagina 46

Crear la base de datos PrestamoLibros.
Crear la tabla y cargarla con datos:
Mostrar las 3 primeras letras de todos los títulos.
Mostrar el precio como cadena de caracteres.
Mostrar la cadena con el titulo, un guión, el autor un guión y el
recio.
Mostrar las seis últimas letras del titulo y del autor.
Mostrar el nombre del autor en mayúscula.
Indicar el número de letras del autor y del título.
Mostrar los caracteres del 4 al 10 del autor
Cambiar arroba por el carácter arroba y punto por el carácter
punto en el texto correoarrobahotmailpuntocom


*/

--Crear la base de datos PrestamoLibros.

create database PrestamoLibros
use PrestamoLibros
go

--Crear la tabla y cargarla con datos:

if object_id ('libros') is not null
 drop table libros;
  create table libros(
 codigo int identity,
 titulo varchar(40) not null,
 autor varchar(20) default 'Desconocido',
 editorial varchar(20),
 precio decimal(6,2),
 cantidad tinyint default 0,
 primary key (codigo)
);

insert into libros (titulo,autor,editorial,precio)
 values('El aleph','Borges','Emece',25);
insert into libros
 values('Java en 10 minutos','Mario Molina','Siglo XXI',50.40,100);
insert into libros (titulo,autor,editorial,precio,cantidad)
 values('Alicia en el pais de las maravillas','Lewis Carroll','Emece',15,50);

--Mostrar las 3 primeras letras de todos los títulos.

select substring(titulo,1,3) from libros

--Mostrar el precio como cadena de caracteres.

select str(precio,5,3) as 'Precio en string' from libros

--Mostrar la cadena con el titulo, un guión, el autor un guión y el
--recio.

select titulo + ' - ' + autor + ' - ' + str(precio,5,2) as Cadena from libros

--Mostrar las seis últimas letras del titulo y del autor.

select right(titulo,6) + ' - ' + RIGHT(autor,6) as 'Menos 6 letras' from libros

--Mostrar el nombre del autor en mayúscula0

select UPPER(autor) from libros

--Indicar el número de letras del autor y del título.

select 'El autor tiene' + str(LEN(autor)) + ' letras y el titulo tiene' + str(LEN(titulo)) + ' letras.'  from libros

--Mostrar los caracteres del 4 al 10 del autor

select SUBSTRING(autor,4,6) from libros

--Cambiar arroba por el carácter arroba y punto por el carácter
--punto en el texto correoarrobahotmailpuntocom

select REPLACE('correoarrobahotmailpuntocom','arroba','@') 
select REPLACE('correoarrobahotmailpuntocom','punto','.') 

/*

Ejercicio pagina 51

Redondear 4567.345 con 2 decimales
Truncar 4567.356 con 1 decimal
Raíz cuadrada de 625
Resultado y resto de dividir 16 entre 3
Cuadrado de 12
Valor absoluto de la diferencia 23-56
Usar la base de datos RestauranteBasicas.
Crear la Base de Datos, sus tablas y añadir los registros que
contiene el archivo sql.
Dar el precio del plato redondeado sin decimales.
Resultado de dividir el precio entre diez, dando el cociente
entero y el resto por separado.


*/

--Redondear 4567.345 con 2 decimales

select ROUND(4567.345,2) as Redondeo;

--Truncar 4567.356 con 1 decimal

select ceiling(4567.345);

--Raíz cuadrada de 625

select SQRT(625) as RaizCuadrada

--Resultado y resto de dividir 16 entre 3

select Resultado=16/3, Resto=16%3

--Cuadrado de 12

select POWER(12,2) as Cuadrado

--Valor absoluto de la diferencia 23-56

select ABS(23-56) as ValorAbsoluto

--Usar la base de datos RestauranteBasicas.

use RestauranteBasicas
go

--Crear la Base de Datos, sus tablas y añadir los registros que
--contiene el archivo sql.
--Dar el precio del plato redondeado sin decimales.

select ROUND(precio,9) as PrecioSinRedondear from Plato 

--Resultado de dividir el precio entre diez, dando el cociente
--entero y el resto por separado.

select ceiling(Precio), Cociente=precio/10, Resultado=precio%10 from Plato
