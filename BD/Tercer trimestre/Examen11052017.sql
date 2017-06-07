-- Emiliano Montesdeoca del Puerto 


--1.- Procedimiento almacenado al que le pasemos como parámetro el nombre de un Distrito y devuelva en un parámetro de salida la suma 
--del Area de los barrios de ese distrito o un -1 si el distrito no existe. 

USE datossctfe 
go 

CREATE PROCEDURE Sp_areadistrito @ndistrito NVARCHAR(max), 
                                @salida    FLOAT output 
AS 
    IF @ndistrito = (SELECT distrito 
                     FROM   distrito 
                     WHERE  distrito = @ndistrito) 
      BEGIN 
          SELECT @salida = Sum(area) 
          FROM   distrito 
                 INNER JOIN barrio 
                         ON barrio.cod_distrito = distrito.coddistrito 
          WHERE  distrito = @ndistrito 
          GROUP  BY cod_distrito, 
                    distrito 
      END 
    ELSE 
      BEGIN 
          PRINT '-1'; 
      END 

go 

DECLARE @varsalida FLOAT; 

EXEC Sp_areadistrito 
  '', 
  @varsalida output; 

PRINT Cast(@varsalida AS MONEY) 

go 

-- Procedimiento almacenado que le pasemos como dato de entrada una cantidad de paradas (mayor que 0) y nos muestre los 
-- nombres de los barrios que tengan esa cantidad de paradas.  
CREATE PROCEDURE Sp_taxidistrito @ndistrito INTEGER 
AS 
    SELECT barrio AS BarrioParadas 
    FROM   barrio 
           INNER JOIN paradas_taxi 
                   ON barrio.cod_barrio = paradas_taxi.cod_barrio 
    GROUP  BY barrio 
    HAVING Count(paradas_taxi.cod_barrio) = @ndistrito 

go 

EXEC Sp_taxidistrito 
  2 

go 
-- 3. Queremos crear un procedimiento almacenado mediante cursor que recorra una tabla auxiliar que contendrá para cada registro 
--un select válido dividido en dos campos (uno con el select y los campos y otro desde el from) y una tabla de destino. 
--Se trata de que el programa borre la tabla de destino si existe y mediante la sentencia select la cree y cargue de datos. 

--4. Función de tabla en línea que nos muestre la suma del valor de datospadron por barrio para grupos de edad que contengan una 
--edad pasada como parámetro. Hacer un ejemplo de uso. 

CREATE FUNCTION F_datospadron (@eNumero INT) 
returns TABLE 
AS 
    RETURN 
      (SELECT Sum(datospadron.valor) AS Suma, 
              grupoedad.edadinicial  AS Inicial, 
              grupoedad.edadfinal    AS Final 
       FROM   datospadron 
              INNER JOIN barrio 
                      ON barrio.cod_barrio = datospadron.cod_barrio 
              INNER JOIN grupoedad 
                      ON datospadron.clavegrupo = grupoedad.clave 
       WHERE  @eNumero BETWEEN grupoedad.edadinicial AND grupoedad.edadfinal 
       GROUP  BY grupoedad.edadfinal, 
                 grupoedad.edadinicial); 

go 

SELECT suma, 
       inicial, 
       final 
FROM   dbo.F_datospadron(12); 

go 

--5.- Función de tabla mediante instrucciones que le pasemos como parámetro una letra (A,X,Y) 
--Para cada barrio dará el nombre y el valor de:  
--  Para la A dar Area  
--  Para la X dar UTM_X  
--  Para la Y dar UTM_Y  
go

CREATE FUNCTION dbo.F_barrio (@letra VARCHAR(1)) 
returns @newtable TABLE ( 
  barrio   NVARCHAR(max), 
  variable FLOAT ) 
AS 
  BEGIN 
      IF @letra = 'A' 
        INSERT @newtable 
        SELECT barrio, 
               area 
        FROM   barrio 
      ELSE IF @letra = 'X' 
        INSERT @newtable 
        SELECT barrio, 
               utm_x 
        FROM   barrio 
      ELSE IF @letra = 'Y' 
        INSERT @newtable 
        SELECT barrio, 
               utm_y 
        FROM   barrio 

      RETURN 
  END; 

go 

SELECT barrio, 
       variable 
FROM   F_barrio('A') 

go 


--6- Crear un índice para la tabla Paradas_Taxi por el campo direccion.  

CREATE INDEX ix_paradastaxi 
  ON paradas_taxi(direccion) 

go 

--7.- Crear una vista que nos muestre edadinicial y edad final de cada grupoedad. Hacer un ejemplo de uso.

CREATE VIEW v_veredades AS SELECT DISTINCT(grupoedad.edadinicial), grupoedad.edadfinal FROM grupoedad SELECT edadinicial, edadfinal FROM v_veredades 

--8.- Recuperar copia de seguridad indicando objetos que contiene del tipo indicado en la lista: 

--  Tablas de usuario y nº de registros  
--  Índices  
--  Foreign key  
--  Funciones de usuario  
--  Procedimientos almacenados de usuario  

-- SOLUCION --
-- Tiene 3 tablas
--		Familia -> tiene 6 registros || Tiene 3 indices
--		paso -> no tiene registros || Tiene 1 indice
--		Planta -> tiene 17 registrs || Tiene 1 indice
-- Tiene 1 procedimiento almacenado
-- Tiene 1 funciona
-- Tiene 

--9.- Crear la tabla paso con la estructura siguiente:  
--  fechahora datetime  
--  coddistrito int  
--  usuario varchar(200)  


CREATE TABLE paso 
  ( 
     fechahora   DATETIME, 
     coddistrito INT, 
     usuario     VARCHAR(200) 
  ) 

CREATE TABLE logdistrito 
  ( 
     fechahora   DATETIME, 
     coddistrito INT, 
     usuario     VARCHAR(200) 
  ) 

go 

--Añadir un trigger a la tabla distrito que cuando hagamos un alta de distrito añada un registro a la tabla logdistrito 
--con el coddistrito añadido, el usuario obtenido de SYSTEM_USER y la fechahora de getdate().  

CREATE TRIGGER t_paso 
ON paso 
after INSERT 
AS 
    DECLARE @a INT 

    SELECT @a = inserted.coddistrito 
    FROM   inserted 

    INSERT INTO logdistrito 
    VALUES     (Getdate(), 
                @a, 
                SYSTEM_USER) 

    INSERT INTO paso 
    VALUES     ('12/02/1995', 
                12345, 
                'emi') 

    SELECT * 
    FROM   logdistrito 