--1.- Mostrar para todos los préstamos, el título, el director, los apellidos y nombre del
--cliente, el tipo de película, y la fecha de préstamo

use peliculas
go

select pel.Titulo, pel.Director, c.Apellidos, c.Nombre, tp.Tipo,p.FechaPrestamo
from Prestamo as p
inner join Clientes as c
on p.idcliente=c.IdCliente
inner join Peliculas as pel
on p.idpelicula=pel.idPelicula
inner join TipoPelicula as tp
on pel.idTipo=tp.IdTipo


--2.- Préstamos de películas de país US, tipo Actualidad y efectuadas el mes de
--noviembre. Dar nombre de cliente, fecha de préstamo y título de la película.

use peliculas
go

select pel.Titulo, c.Nombre, tp.Tipo,p.FechaPrestamo
from Prestamo as p
inner join Clientes as c
on p.idcliente=c.IdCliente
inner join Peliculas as pel
on p.idpelicula=pel.idPelicula
inner join TipoPelicula as tp
on pel.idTipo=tp.IdTipo
where tp.Tipo ='Actualidad' and pel.Pais='US' and MONTH(p.FechaDevolucion)=11


--3.- Dar para todos los clientes con año de alta mayor que el año 1990. Indicar DNI,
--nombre y apellidos del cliente (en único campo de salida) y nº de préstamos
--realizados.

use peliculas
go

select c.Nombre + ' ' +c.Apellidos as NombreCliente, c.DNICliente, count(p.IdPrestamo) as CantidadPrestamos
from Prestamo as p
inner join Clientes as c
on p.idcliente=c.IdCliente
inner join Peliculas as pel
on p.idpelicula=pel.idPelicula
inner join TipoPelicula as tp
on pel.idTipo=tp.IdTipo
where year(c.FechaAlta) > 1990
group by c.Nombre, c.Apellidos,c.DNICliente


--4.- Mostrar el título, el director, los apellidos y nombre del cliente, el tipo de película,
--y la fecha de préstamo del préstamo siguiente en orden de fecha al de fecha 30 de julio
--de 2012.

use peliculas
go

select pel.Titulo, pel.Director, c.Nombre + ' ' + c.Apellidos as NombreCliente, tp.Tipo, p.FechaPrestamo
from Prestamo as p
inner join Clientes as c
on p.idcliente=c.IdCliente
inner join Peliculas as pel
on p.idpelicula=pel.idPelicula
inner join TipoPelicula as tp
on pel.idTipo=tp.IdTipo
where p.FechaPrestamo>'30/07/2012'

--5.- Para cada tipo de película dar el Número de préstamo e importe (diferencia en días
--entre fechaprestamo y fecha devolucion) multiplicado por el preciodiaefectuado.

use peliculas
go

select  p.IdPrestamo, DATEDIFF(day,p.FechaPrestamo,p.FechaDevolucion)*p.PrecioDiaEfectuado as Pago
from Prestamo as p
inner join Clientes as c
on p.idcliente=c.IdCliente
inner join Peliculas as pel
on p.idpelicula=pel.idPelicula
inner join TipoPelicula as tp
on pel.idTipo=tp.IdTipo
group by p.FechaPrestamo, p.FechaDevolucion, p.PrecioDiaEfectuado, p.IdPrestamo

--6.- Clientes sin préstamos, dando dombre, apellidos y DNICliente


--7.- Número de préstamos por mes por su nombre, pero ordenados por meses
--correlativos (Enero, febrero, marzo,...).


--8.- Película alquilada más veces, dando título y tipo.


--9.- Préstamos no devueltos en plazo (dar nombre de cliente, fecha de préstamo y título
--de la película)