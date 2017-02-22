--1.- Mostrar para todos los pr�stamos, el t�tulo, el director, los apellidos y nombre del
--cliente, el tipo de pel�cula, y la fecha de pr�stamo

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


--2.- Pr�stamos de pel�culas de pa�s US, tipo Actualidad y efectuadas el mes de
--noviembre. Dar nombre de cliente, fecha de pr�stamo y t�tulo de la pel�cula.

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


--3.- Dar para todos los clientes con a�o de alta mayor que el a�o 1990. Indicar DNI,
--nombre y apellidos del cliente (en �nico campo de salida) y n� de pr�stamos
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


--4.- Mostrar el t�tulo, el director, los apellidos y nombre del cliente, el tipo de pel�cula,
--y la fecha de pr�stamo del pr�stamo siguiente en orden de fecha al de fecha 30 de julio
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

--5.- Para cada tipo de pel�cula dar el N�mero de pr�stamo e importe (diferencia en d�as
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

--6.- Clientes sin pr�stamos, dando dombre, apellidos y DNICliente


--7.- N�mero de pr�stamos por mes por su nombre, pero ordenados por meses
--correlativos (Enero, febrero, marzo,...).


--8.- Pel�cula alquilada m�s veces, dando t�tulo y tipo.


--9.- Pr�stamos no devueltos en plazo (dar nombre de cliente, fecha de pr�stamo y t�tulo
--de la pel�cula)