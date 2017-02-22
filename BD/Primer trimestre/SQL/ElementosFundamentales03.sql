--Emiliano Montesdeoca
--03ElementosFundamentales03


/*

Ejercicio pagina 11

Contar nº de registros con provincia Santa Cruz de Tenerife.
•Contar el número de Islas diferentes.
•Contar el nº de Municipios de la provincia de "Palmas,
Las".
•Contar el número de registros del segundo mes del año.
•Igual que el anterior si el número fuera muy grande.
•Contar los registros con menos de 1000 habitantes con
islas.
•Contar las comunidades autónomas que contengan una E.

*/

use parobasicas
go


--Contar nº de registros con provincia Santa Cruz de Tenerife.

select COUNT(Provincia) from DatosCompletosTabla where Provincia='Santa Cruz de Tenerife'

--•Contar el número de Islas diferentes.

select COUNT(distinct CA ) from DatosCompletosTabla

--•Contar el nº de Municipios de la provincia de "Palmas, Las".

select COUNT(Municipio) from DatosCompletosTabla where Provincia='Palmas, Las'

--•Contar el número de registros del segundo mes del año.

select COUNT(Fecha) from DatosCompletosTabla where DATENAME(m,Fecha) = 'Febrero'

--•Igual que el anterior si el número fuera muy grande.

select COUNT_BIG(Fecha) from DatosCompletosTabla where DATENAME(m,Fecha) = 'Febrero'

--•Contar los registros con menos de 1000 habitantes con islas.

select COUNT(Provincia) from DatosCompletosTabla where Padron <= 1000 and ISLA is not null

--•Contar las comunidades autónomas que contengan una E.

select COUNT(Provincia) from DatosCompletosTabla where Provincia like '%E%'


/*

Ejercicio pagina 16

•Sumar el padrón a fecha '01/03/2013' de la provincia de Santa Cruz
de Tenerife
•Sumar el paro a fecha '01/02/2013' de los municipios de la
comunidad autónoma de "Madrid, Comunidad de"
•Sumar los habitantes a fecha '01/02/2013' de las Comunidades
autónomas de Extremadura, Andalucía, Aragón y Canarias.

*/

--•Sumar el padrón a fecha '01/03/2013' de la provincia de Santa Cruz
--de Tenerife
set dateformat dmy;
select SUM(Padron) from DatosCompletosTabla where Fecha='01/03/2013' and Provincia='Santa Cruz de Tenerife'
--•Sumar el paro a fecha '01/02/2013' de los municipios de la
--comunidad autónoma de "Madrid, Comunidad de"

select SUM(TotalParoRegistrado) from DatosCompletosTabla where Fecha='01/02/2013' and CA='Madrid, Comunidad de'


--•Sumar los habitantes a fecha '01/02/2013' de las Comunidades
--autónomas de Extremadura, Andalucía, Aragón y Canarias.

select SUM(Padron) from DatosCompletosTabla where Fecha='01/02/2013' and CA in ('Extremadura', 'Andalucía', 'Aragón', 'Canarias')


/*

Ejercicio pagina 24

•Calcular nº de registros, nº de registros con isla, media de paro, suma de
padrón, varianza de padrón de los datos de Canarias y Andalucía de fecha
01/02/2013.
•Calcular la media de los datos de paro de los registros con isla.
•Calcular la media y la desviación típica de los datos de padrón de los
municipios que contengan Villa.



*/


--•Calcular nº de registros, nº de registros con isla, media de paro, suma de
--padrón, varianza de padrón de los datos de Canarias y Andalucía de fecha
--01/02/2013.

select count(*) as NRegistros, count(distinct isla) as NRegistroConIsla, AVG(TotalParoRegistrado) as MediaParo, SUM(Padron) as SumaPadron, VAR(Padron) as VariantePadron from DatosCompletosTabla where (CA = 'Canarias' or CA = 'Andalucia') and Fecha = '01/02/2013'


--•Calcular la media de los datos de paro de los registros con isla.

select avg(TotalParoRegistrado) as ParoEnIsla from DatosCompletosTabla where ISLA is not null

--•Calcular la media y la desviación típica de los datos de padrón de los
--municipios que contengan Villa.

select avg(Padron) as Padron, STDEV(Padron) as Desviacion from DatosCompletosTabla where Municipio like '%Villa'

/*

Ejercicio pagina 34

•Mostrar los 10 municipios con más habitantes dentro de los de menos de
1000. Datos de fecha 01/03/2013
•Mostrar los 10 municipios con más parados dentro de los de menos de
100 habitantes, sacando los que empaten con el último. Datos de fecha
01/01/2013.
•Mostrar los 10 municipios de Canarias con menor cociente paro partido
por habitantes. Datos de fecha 01/01/2013

*/

--•Mostrar los 10 municipios con más habitantes dentro de los de menos de
--1000. Datos de fecha 01/03/2013

select top 10 Municipio from DatosCompletosTabla where Padron <= 1000 and Fecha = '01/03/2013'

--•Mostrar los 10 municipios con más parados dentro de los de menos de
--100 habitantes, sacando los que empaten con el último. Datos de fecha
--01/01/2013.

select top 10 with ties Municipio, Padron from DatosCompletosTabla where Padron <= 100 and Fecha = '01/03/2013' order by Padron asc

--•Mostrar los 10 municipios de Canarias con menor cociente paro partido
--por habitantes. Datos de fecha 01/01/2013

select top 10  Municipio, TotalParoRegistrado/CAST(Padron as decimal(9,2)) as ParoPorHabitante from DatosCompletosTabla where CA = 'Canarias' order by ParoPorHabitante