-- Emiliano Montesdeoca del Puerto 
--1.- Procedimiento almacenado al que le pasemos como parámetro el nombre de un Distrito y devuelva en un parámetro de salida la suma 
--del Area de los barrios de ese distrito o un -1 si el distrito no existe. 
USE datossctfe 
go 

ALTER PROCEDURE Sp_areadistrito @ndistrito NVARCHAR(max), 
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
ALTER PROCEDURE Sp_taxidistrito @ndistrito INTEGER 
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

--if OBJECT_ID('tablauxiliar') is not null  drop table TablaIndices; 
--go 
--create table tablaauxiliar (tabladestino VARCHAR(100), seleccion1 VARCHAR(max), seleccion2 VARCHAR(max)) 
--go 

IF object_id('tablaaxuiliar') IS NOT NULL DROP table tablaaxuiliar
create table tablaaxuiliar ( tabladestino varchar(100),  seleccion1 varchar(max),  seleccion2 varchar(max))
go 

CREATE PROCEDURE sp_ejer3
as

DECLARE @tablaorigen TABLE
(
  tabladestino varchar(100),  seleccion1 varchar(max),  seleccion2 varchar(max)
)

INSERT INTO @tablaorigen (tabladestino,seleccion1,seleccion2)
  SELECT tabladestino, seleccion1,seleccion2
    FROM tablaaxuiliar

declare @sentencia1 nvarchar(max);
declare @sentencia2 nvarchar(max);
declare @tabladestino nvarchar(max);
declare @seleccion1 nvarchar(max);
declare @seleccion2 nvarchar(max);

declare CUR cursor for select  tabladestino, seleccion1,seleccion2 from  @tablaorigen; 
open CUR 
fetch next from CUR into  @tabladestino, @seleccion1, @seleccion2

-- por cada campo en tablaauxiliar
while @@FETCH_STATUS=0
begin	

-- pillar el nombre de la tabla
declare @test nvarchar(max) =  @seleccion2;
declare @test2 nvarchar(max);
set @test2 = (SELECT SUBSTRING(@test,6,100) as Value);
set @test2 = SUBSTRING(@test2,0,CHARINDEX(' ', @test2));
print @test2;

-- buscar los nombres de los campos y su tipo

declare CUR2 cursor for select  COLUMN_NAME,DATA_TYPE from  information_schema.columns  where table_name = @test2; 
open CUR2 
fetch next from CUR2 into  

while @@FETCH_STATUS=0
begin	
set @sentencia1 = 'select COLUMN_NAME,DATA_TPYE '+@seleccion2
set @sentencia2 = 'Create table ' + @tabladestino + '( barrio,)';


end


set @sentencia2 = 'Create table ' + @tabladestino + '( barrio,)';


end
 
select * from information_schema.columns where table_name = 'tablaaxuiliar'

--4. Función de tabla en línea que nos muestre la suma del valor de datospadron por barrio para grupos de edad que contengan una 
--edad pasada como parámetro. Hacer un ejemplo de uso. 


--5.- Función de tabla mediante instrucciones que le pasemos como parámetro una letra (A,X,Y) 
--Para cada barrio dará el nombre y el valor de:  
--  Para la A dar Area  
--  Para la X dar UTM_X  
--  Para la Y dar UTM_Y  


--6- Crear un índice para la tabla Paradas_Taxi por el campo direccion.  


--7.- Crear una vista que nos muestre edadinicial y edad final de cada grupoedad. Hacer un ejemplo de uso.


--8.- Recuperar copia de seguridad indicando objetos que contiene del tipo indicado en la lista: 
--  Tablas de usuario y nº de registros  
--  Índices  
--  Foreign key  
--  Funciones de usuario  
--  Procedimientos almacenados de usuario  


--9.- Crear la tabla paso con la estructura siguiente:  
--  fechahora datetime  
--  coddistrito int  
--  usuario varchar(200)  
--Añadir un trigger a la tabla distrito que cuando hagamos un alta de distrito añada un registro a la tabla logdistrito 
--con el coddistrito añadido, el usuario obtenido de SYSTEM_USER y la fechahora de getdate().  