--Emiliano Montesdeoca
--02ElementosFundamentales02

/*

Ejercicio pagina 10

Usar la base de datos RestauranteBasicas.
Crear la Base de Datos, sus tablas y añadir los registros que
contiene el archivo sql.
Sacar los platos ordenados por su nombre.
Sacar los platos ordenados por su precio de mayor a menor.
Sacar los platos ordenados por codtipoplato y precio
Sacar las comidas con pagado a S y ordenadas por el número del
mes

*/

use RestauranteBasicas
go

--Sacar los platos ordenados por su nombre.

select Plato from Plato order by Plato

--Sacar los platos ordenados por su precio de mayor a menor.

select Plato from Plato order by Precio desc

--Sacar los platos ordenados por codtipoplato y precio

select Plato from Plato order by Precio,CodPlato

--Sacar las comidas con pagado a S y ordenadas por el número del mes

select IdComida,Pagado from Comida where Pagado = 'S' order by datename(m,Fecha)

/*

Ejercicio pagina 20

Usar la base de datos RestauranteBasicas.
Crear la Base de Datos, sus tablas y añadir los registros que
contiene el archivo sql.
Sacar los platos con nombre comenzando por A o C.
Sacar los platos con nombre que no comiencen ni por A ni por C.
Sacar los platos con precio entre 10 y 20 (incluyendo ambos
valores)
Sacar los platos con codtipoplato menor que 3 o con precio
menor que 60
Sacar las comidas con pagado a S y del mes de septiembre.

*/

--Usar la base de datos RestauranteBasicas.
use RestauranteBasicas
go

--Crear la Base de Datos, sus tablas y añadir los registros que contiene el archivo sql.
--Sacar los platos con nombre comenzando por A o C.

select Plato from Plato where (SUBSTRING(Plato,1,1)='A') or (SUBSTRING(Plato,1,1)='C')

--Sacar los platos con nombre que no comiencen ni por A ni por C.

select Plato from Plato where not (SUBSTRING(Plato,1,1)='A') or not (SUBSTRING(Plato,1,1)='C')

--Sacar los platos con precio entre 10 y 20 (incluyendo ambos valores)

select Plato,Precio from Plato where Precio>=10 and Precio<=20

--Sacar los platos con codtipoplato menor que 3 o con precio menor que 60

select CodPlato, Plato,Precio from Plato where CodPlato<3 or Precio<60

--Sacar las comidas con pagado a S y del mes de septiembre.

select IdComida,Fecha from Comida where (Pagado='S') and DATENAME(m,Fecha)='Septiembre'

/* 

Ejercico pagina 26

Usar la base de datos RestauranteBasicas.
Crear la Base de Datos, sus tablas y añadir los registros que
contiene el archivo sql.
Sacar los platos con nombre comenzando por las letras entre A y
C.
Sacar los platos con precio entre 10 y 20 (incluyendo ambos
valores)
Sacar las comidas entre los meses de marzo y diciembre.

*/

--Usar la base de datos RestauranteBasicas.

use RestauranteBasicas
go

--Crear la Base de Datos, sus tablas y añadir los registros que contiene el archivo sql.
--Sacar los platos con nombre comenzando por las letras entre A y C.

select Plato from Plato where SUBSTRING(Plato,1,1) between 'A' and 'C'

--Sacar los platos con precio entre 10 y 20 (incluyendo ambos valores)

select Plato, Precio from Plato where Precio between 10 and 20

--Sacar las comidas entre los meses de marzo y diciembre.

select IdComida, Fecha from Comida where (DATENAME(m,Fecha)) between 'Marzo' and 'Diciembre'

/*

Ejercicio pagina 33

Usar la base de datos RestauranteBasicas.
Crear la Base de Datos, sus tablas y añadir los registros que
contiene el archivo sql.
Sacar los platos con nombre comenzando por las vocales.
Sacar los platos con precio 6, 9 ,11 o 16.
Sacar los tipo plato que comienzan con A, B o C
Sacar las comidas con día de la semana en su fecha Lunes, Jueves
o sábado


*/

--Usar la base de datos RestauranteBasicas.

use RestauranteBasicas
go

--Crear la Base de Datos, sus tablas y añadir los registros que contiene el archivo sql.
--Sacar los platos con nombre comenzando por las vocales.

select Plato from Plato where SUBSTRING(Plato,1,1) in ('A','E','I','U','O')

--Sacar los platos con precio 6, 9 ,11 o 16.

select Plato,Precio from Plato where Precio in (6,9,11,16)

--Sacar los tipo plato que comienzan con A, B o C

select Plato from Plato where SUBSTRING(Plato,1,1) in ('A','B','C')

--Sacar las comidas con día de la semana en su fecha Lunes, Jueves o sábado

select IdComida, Fecha from Comida where DATENAME(dw,Fecha) in ('Lunes','Jueves','Sabado')



/*

Ejercicio pagina 46

Usar la base de datos RestauranteBasicas.
Crear la Base de Datos, sus tablas y añadir los registros que
contiene el archivo sql.
Sacar los platos con nombre comenzando por A hasta F.
Sacar los tipo de plato con Carnes en el campo TipoPlato.
Sacar los platos que contengan "ca" en el campo Plato.
Sacar las comidas en las mesas que tengan un 1 o un 2 en el
tercer carácter.
Sacar los platos que contengan Lenguado o Salmón en el campo
Plato.
Sacar los platos que no tengan mínimo en el campo plato.
Sacar los platos cuyo campo plato terminen con César.

*/

--Usar la base de datos RestauranteBasicas.

use	RestauranteBasicas
go

--Crear la Base de Datos, sus tablas y añadir los registros que
--contiene el archivo sql.
--Sacar los platos con nombre comenzando por A hasta F.

select Plato from Plato where Plato between 'A%' and 'F%'

--Sacar los tipo de plato con Carnes en el campo TipoPlato.

select TipoPlato from TipoPlato where TipoPlato like 'Carnes'
select TipoPlato from TipoPlato where TipoPlato = 'Carnes'

--Sacar los platos que contengan "ca" en el campo Plato.

select Plato from Plato where Plato like '%ca%'

--Sacar las comidas en las mesas que tengan un 1 o un 2 en el tercer carácter.

select IdComida, CodMesa from Comida where CodMesa like '__[1-2]%'

--Sacar los platos que contengan Lenguado o Salmón en el campo Plato.

insert into Plato(CodPlato, Plato) values (500,'Lenguado')
insert into Plato(CodPlato, Plato) values (501,'Salmon')

select Plato from Plato where Plato like '%Lenguado%' or Plato like '%Salmon%'

--Sacar los platos que no tengan mínimo en el campo plato.

select Plato from Plato where Plato not like 'mínimo'

--Sacar los platos cuyo campo plato terminen con César.

select Plato from Plato where plato like '%César'