--Emiliano Montesdeoca del Puerto
--1DAWB
-- CIFP Cesar Manrique
USE Paro;

--Probar una consulta que nos muestre el total de parados por provincia para el mes de
--enero. Sacará también el nombre de la Comunidad autónoma.
SELECT sum(TotalParoRegistrado) AS Paro
	,Provincia
FROM Padron
INNER JOIN Municipios ON Municipios.CodMunicipio = Padron.CodMunicipio
INNER JOIN Provincias ON Provincias.CodProvincia = Municipios.CodProvincia
INNER JOIN ComunidadesAutonomas ON ComunidadesAutonomas.CodCA = Provincias.CodCA
INNER JOIN ParoMes ON paromes.CodMunicipio = Municipios.CodMunicipio
WHERE DATEPART(M, Fecha) = 1
GROUP BY Provincia;
GO

--2. Crear una vista basada en esa consulta. (ver_paro_provincia)
CREATE VIEW ver_paro_provincia
AS
SELECT sum(TotalParoRegistrado) AS Paro
	,CA
	,Provincia
FROM Padron
INNER JOIN Municipios ON Municipios.CodMunicipio = Padron.CodMunicipio
INNER JOIN Provincias ON Provincias.CodProvincia = Municipios.CodProvincia
INNER JOIN ComunidadesAutonomas ON ComunidadesAutonomas.CodCA = Provincias.CodCA
INNER JOIN ParoMes ON paromes.CodMunicipio = Municipios.CodMunicipio
WHERE DATEPART(M, Fecha) = 1
GROUP BY CA
	,Provincia;
GO

--3. Usar la vista sacando todos sus datos.
SELECT *
FROM ver_paro_provincia;
GO

--4. Usar la vista para sacar la suma de parados por Comunidad Autónoma.
SELECT Paro
	,CA
FROM ver_paro_provincia GO;

--5. Crear una vista sobre la tabla ComunidadesAutonomas
CREATE VIEW ver_comunidades_autonomas
AS
SELECT *
FROM ComunidadesAutonomas;
GO

--6. Ver los datos que contiene
EXEC sp_help ver_comunidades_autonomas;
GO

--7. Borrar la vista anterior comprobando que existe
IF OBJECT_ID('ver_comunidades_autonomas', 'V') IS NOT NULL
	DROP VIEW ver_comunidades_autonomas;
GO

--8. Mostrar la estructura de la vista ver_paro_provincia
EXEC sp_helptext ver_paro_provincia;
GO

--9. Crear de nuevo la vista pero encriptada
CREATE VIEW ver_comunidades_autonomas
	WITH ENCRYPTION
AS
SELECT *
FROM ComunidadesAutonomas;
GO

--10. Comprobar que no se puede ver su estructura
EXEC sp_helptext ver_comunidades_autonomas;
GO

--11. Actualizar el nombre de una Comunidad Autónoma a través de la vista
UPDATE ver_paro_provincia
SET CA = 'Atlantida'
WHERE CA = 'Canarias'
GO

--Error
--Mens. 4403, Nivel 16, Estado 1, Línea 76
--No se puede actualizar la vista o función 'ver_paro_provincia' porque contiene agregados o una cláusula DISTINCT o GROUP BY, o un operador PIVOT o UNPIVOT.
--12. Intentar una inserción
INSERT INTO ver_paro_provincia
VALUES (
	20000
	,'Montevideo'
	,'Uruguay'
	);
GO

--Errr
--Mens. 4406, Nivel 16, Estado 1, Línea 85
--No puede actualizar ni insertar la vista o función 'ver_paro_provincia' porque contiene un campo derivado o constante.
--13. Crear una vista que acceda a las Comunidades autónomas solamente
CREATE VIEW ver_comunidadesautonomas
AS
SELECT CA
	,CodCA
FROM ComunidadesAutonomas;
GO

--14. Hacer una inserción correcta sobre esa vista
INSERT INTO ver_comunidadesautonomas
VALUES (
	'Uruguay'
	,50
	);

--15. Borrar el registro creado anteriormente, usando también la vista
DELETE
FROM ver_comunidadesautonomas
WHERE CodCA = 50;
GO

--16. Crear una vista que muestre sólo las Comunidades autónomas que comiencen con C y
--con la opción with check option
CREATE VIEW ver_comunidadesautonomas_por_C
AS
SELECT CA
	,CodCA
FROM ComunidadesAutonomas
WHERE CA LIKE 'C%'
WITH CHECK
OPTION;
GO

--17. Probar inserciones y modificaciones que validen el funcionamiento de la opción
--aplicada
INSERT INTO ver_comunidadesautonomas_por_C
VALUES (
	'Argentina'
	,50
	);GO;

--Error
--Mens. 550, Nivel 16, Estado 1, Línea 122
--Error en la inserción o actualización debido a que la vista de destino especifica WITH CHECK OPTION o alcanza una vista con esta opción, y una o más filas resultantes de la operación no se califican con la restricción CHECK OPTION.
INSERT INTO ver_comunidadesautonomas_por_C
VALUES (
	'Colombia'
	,50
	);GO;

--Esta si funciona porque si empieza por C
--18. Modificar la vista anterior filtrando a comunidades autónomas que comiencen por A
ALTER VIEW ver_comunidadesautonomas_por_C
AS
SELECT CA
	,CodCA
FROM ComunidadesAutonomas
WHERE CA LIKE 'A%'
WITH CHECK
OPTION
