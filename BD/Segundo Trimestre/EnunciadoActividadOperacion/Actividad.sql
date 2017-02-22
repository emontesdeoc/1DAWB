USE operacionesquirurgicas
GO

--1.- Los materiales usados en más operaciones sacando los coincidentes.
--nombrematerial Noper
--Set de Hipófisis. 7
--Set de Osteosíntesis. 6
--Set de Párpados. 6
SELECT TOP 3 nombrematerial
	,COUNT(o.idoperacion) AS Nop
FROM material AS m
INNER JOIN materialintervencion AS mi ON m.idmaterial = mi.idmaterial
INNER JOIN intervencion AS i ON mi.idintervencion = i.idintervencion
INNER JOIN intervencionoperacion AS iop ON iop.idintervencion = i.idintervencion
INNER JOIN operacion AS o ON o.idoperacion = iop.idoperacion
GROUP BY nombrematerial
ORDER BY Nop DESC

--2.- Número de operaciones, número de intervenciones y número de pacientes
--distintos en operaciones realizadas en miércoles.
--Noper Ninter Npacien
--3 4 3
USE operacionesquirurgicas
GO

SELECT COUNT(DISTINCT o.idoperacion) AS Noper
	,COUNT(iop.idintervencion) AS Ninter
	,count(DISTINCT p.DNIPaciente) AS Npacien
FROM operacion AS o
INNER JOIN Paciente AS p ON o.DNIPaciente = p.DNIPaciente
INNER JOIN intervencionoperacion AS iop ON o.idoperacion = iop.idoperacion
WHERE DATEPART(dw, o.fechaoperacion) = 3

--3.- Nombre de los materiales usados en operaciones del mes de abril y cuya suma
--de cantidades sea de más de 10.
--nombrematerial Scantidad
--Set de Hipófisis. 17
--Set General de Tórax.12
--Trócares. 12
SELECT TOP 3 m.nombrematerial AS Nmaterial
	,SUM(mi.cantidad) AS Suma
FROM material AS m
INNER JOIN materialintervencion AS mi ON m.idmaterial = mi.idmaterial
INNER JOIN intervencion AS i ON i.idintervencion = mi.idintervencion
INNER JOIN intervencionoperacion AS iop ON iop.idintervencion = i.idintervencion
INNER JOIN operacion AS o ON o.idoperacion = iop.idoperacion
WHERE DATEPART(m, o.fechaoperacion) = 4
GROUP BY m.nombrematerial
HAVING SUM(mi.cantidad) > 10
ORDER BY Suma DESC

--4.- Pacientes con diferencia de años entre la operación y la fecha de nacimiento sea
--de más de 30 y que han usado materiales que contengan Winter.
--nombre
--maría ramos
--maría ruiz
SELECT DISTINCT p.Nombre
FROM Paciente AS p
INNER JOIN operacion AS o ON p.DNIPaciente = o.DNIPaciente
INNER JOIN intervencionoperacion AS iop ON iop.idoperacion = o.idoperacion
INNER JOIN intervencion AS i ON i.idintervencion = iop.idintervencion
INNER JOIN materialintervencion AS mi ON mi.idintervencion = i.idintervencion
INNER JOIN material AS m ON m.idmaterial = mi.idmaterial
WHERE m.nombrematerial LIKE '%Winter%'
	AND DATEDIFF(YEAR, p.FechaNacimiento, o.fechaoperacion) > 30

--5.- Intervenciones que contengan cirugía y con más de 3 materiales distintos
--denominaciontipo
--Cirugía de la Obesidad
--Cirugía de la Refracción (Operación Miopía)
--Cirugía para el Cáncer de Mama
SELECT DISTINCT i.denominaciontipo
FROM intervencion AS i
INNER JOIN materialintervencion AS mi ON i.idintervencion = mi.idintervencion
INNER JOIN material AS m ON mi.idmaterial = m.idmaterial
WHERE i.denominaciontipo LIKE '%Cirugía%'
GROUP BY i.denominaciontipo
HAVING COUNT(DISTINCT nombrematerial) > 3

--6.- Intervenciones que comiencen con A no realizadas nunca.
--denominaciontipo
--Adenoidectomía. Operación de Vegetaciones
--Angioplastia Coronaria
--Angioplastia Coronaria y Stents
--Apendicectomía
--Artroscopia. Cirugía de la Rodilla
--Autocontrol de la Glucosa
SELECT DISTINCT i.denominaciontipo
FROM intervencion AS i
LEFT JOIN intervencionoperacion AS iop ON i.idintervencion = iop.idintervencion
WHERE i.denominaciontipo like 'A%'
	AND iop.idintervencion IS NULL

--7.- Número de intervenciones realizadas a cada paciente, dando su nombre y dni, en marzo.
--nombre	dnipaciente	Ninterven 
--maría ruiz	13455656N	2 
--samuel gonzález	43554430C	1
SELECT p.Nombre
	,p.DNIPaciente
	,COUNT(iop.idintervencion) AS SInter
FROM operacion AS o
INNER JOIN intervencionoperacion iop ON o.idoperacion = iop.idoperacion
INNER JOIN Paciente p ON o.DNIPaciente = p.DNIPaciente
WHERE MONTH(O.fechaoperacion) = 3
GROUP BY p.Nombre
	,p.DNIPaciente

--8.- Dos materiales que aparecen en más intervenciones, sacando los que coincidan.
--nombrematerial	Ninterven 
--Set General de Cirugía.	8
--Set de Cánulas Estereotácticas.	7
--Set de Craneo.	7
SELECT TOP 2 m.nombrematerial
	,COUNT(mi.idintervencion) AS Ninterven
FROM material m
INNER JOIN materialintervencion mi ON m.idmaterial = mi.idmaterial
GROUP BY m.nombrematerial
ORDER BY Ninterven DESC

--9.- Operaciones (dando DNIPaciente y fechaoperacion) con más de 1 intervención y suma de cantidad en materiales sea más de 20.
--DNIPaciente fechaoperacion	Scant Nint
--13455656N	2015-03-16 00:00:00.000	22	2
--05679340L	2015-04-13 00:00:00.000	42	3
--43566789M	2015-04-16 00:00:00.000	23	3
SELECT O.DNIPaciente
	,O.fechaoperacion
	,sum(mi.cantidad) AS scant
	,Count(DISTINCT IOP.idintervencion) AS Nint
FROM operacion o
INNER JOIN intervencionoperacion iop ON o.idoperacion = iop.idoperacion
INNER JOIN materialintervencion mi ON iop.idintervencion = mi.idintervencion
GROUP BY o.DNIPaciente
	,o.fechaoperacion
HAVING Count(DISTINCT IOP.idintervencion) > 1
	AND sum(mi.cantidad) > 20

--10.- Pacientes (dando su nombre) con 0 ó 1 intervenciones, indicando el número de intervenciones.
--nombre	Ninterv
--alberto gonzález	0
--ana pérez	1 
--carmen ramos 0 
--fernando pérez 1 
--josé gonzález 0 
--josefa hernández 1 
--juan rodríguez 0 
--juana pérez 0 
--juana rodríguez 1 
--maría pérez 0 
--maría ramos 1 
--marta ruiz	1 
--pedro hernández 0 
--samuel gonzález 1
SELECT p.Nombre
	,count(iop.idintervencion) AS total
FROM Paciente p
LEFT JOIN operacion o ON o.DNIPaciente = p.DNIPaciente
LEFT JOIN intervencionoperacion iop ON iop.idoperacion = o.idoperacion
GROUP BY p.Nombre
HAVING count(iop.idintervencion) < 2
