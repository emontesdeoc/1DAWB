--Emiliano Montesdeoca
--03ElementosFundamentales03


/*

Ejercicio pagina 11

Contar n� de registros con provincia Santa Cruz de Tenerife.
�Contar el n�mero de Islas diferentes.
�Contar el n� de Municipios de la provincia de "Palmas,
Las".
�Contar el n�mero de registros del segundo mes del a�o.
�Igual que el anterior si el n�mero fuera muy grande.
�Contar los registros con menos de 1000 habitantes con
islas.
�Contar las comunidades aut�nomas que contengan una E.

*/

use parobasicas
go


--Contar n� de registros con provincia Santa Cruz de Tenerife.

select COUNT(Provincia) from DatosCompletosTabla where Provincia='Santa Cruz de Tenerife'

--�Contar el n�mero de Islas diferentes.

select COUNT(distinct CA ) from DatosCompletosTabla

--�Contar el n� de Municipios de la provincia de "Palmas, Las".

select COUNT(Municipio) from DatosCompletosTabla where Provincia='Palmas, Las'

--�Contar el n�mero de registros del segundo mes del a�o.

select COUNT(Fecha) from DatosCompletosTabla where DATENAME(m,Fecha) = 'Febrero'

--�Igual que el anterior si el n�mero fuera muy grande.

select COUNT_BIG(Fecha) from DatosCompletosTabla where DATENAME(m,Fecha) = 'Febrero'

--�Contar los registros con menos de 1000 habitantes con islas.

select COUNT(Provincia) from DatosCompletosTabla where Padron <= 1000 and ISLA is not null

--�Contar las comunidades aut�nomas que contengan una E.

select COUNT(Provincia) from DatosCompletosTabla where Provincia like '%E%'


/*

Ejercicio pagina 16

�Sumar el padr�n a fecha '01/03/2013' de la provincia de Santa Cruz
de Tenerife
�Sumar el paro a fecha '01/02/2013' de los municipios de la
comunidad aut�noma de "Madrid, Comunidad de"
�Sumar los habitantes a fecha '01/02/2013' de las Comunidades
aut�nomas de Extremadura, Andaluc�a, Arag�n y Canarias.

*/

--�Sumar el padr�n a fecha '01/03/2013' de la provincia de Santa Cruz
--de Tenerife
set dateformat dmy;
select SUM(Padron) from DatosCompletosTabla where Fecha='01/03/2013' and Provincia='Santa Cruz de Tenerife'
--�Sumar el paro a fecha '01/02/2013' de los municipios de la
--comunidad aut�noma de "Madrid, Comunidad de"

select SUM(TotalParoRegistrado) from DatosCompletosTabla where Fecha='01/02/2013' and CA='Madrid, Comunidad de'


--�Sumar los habitantes a fecha '01/02/2013' de las Comunidades
--aut�nomas de Extremadura, Andaluc�a, Arag�n y Canarias.

select SUM(Padron) from DatosCompletosTabla where Fecha='01/02/2013' and CA in ('Extremadura', 'Andaluc�a', 'Arag�n', 'Canarias')


/*

Ejercicio pagina 24

�Calcular n� de registros, n� de registros con isla, media de paro, suma de
padr�n, varianza de padr�n de los datos de Canarias y Andaluc�a de fecha
01/02/2013.
�Calcular la media de los datos de paro de los registros con isla.
�Calcular la media y la desviaci�n t�pica de los datos de padr�n de los
municipios que contengan Villa.



*/


--�Calcular n� de registros, n� de registros con isla, media de paro, suma de
--padr�n, varianza de padr�n de los datos de Canarias y Andaluc�a de fecha
--01/02/2013.

select count(*) as NRegistros, count(distinct isla) as NRegistroConIsla, AVG(TotalParoRegistrado) as MediaParo, SUM(Padron) as SumaPadron, VAR(Padron) as VariantePadron from DatosCompletosTabla where (CA = 'Canarias' or CA = 'Andalucia') and Fecha = '01/02/2013'


--�Calcular la media de los datos de paro de los registros con isla.

select avg(TotalParoRegistrado) as ParoEnIsla from DatosCompletosTabla where ISLA is not null

--�Calcular la media y la desviaci�n t�pica de los datos de padr�n de los
--municipios que contengan Villa.

select avg(Padron) as Padron, STDEV(Padron) as Desviacion from DatosCompletosTabla where Municipio like '%Villa'

/*

Ejercicio pagina 34

�Mostrar los 10 municipios con m�s habitantes dentro de los de menos de
1000. Datos de fecha 01/03/2013
�Mostrar los 10 municipios con m�s parados dentro de los de menos de
100 habitantes, sacando los que empaten con el �ltimo. Datos de fecha
01/01/2013.
�Mostrar los 10 municipios de Canarias con menor cociente paro partido
por habitantes. Datos de fecha 01/01/2013

*/

--�Mostrar los 10 municipios con m�s habitantes dentro de los de menos de
--1000. Datos de fecha 01/03/2013

select top 10 Municipio from DatosCompletosTabla where Padron <= 1000 and Fecha = '01/03/2013'

--�Mostrar los 10 municipios con m�s parados dentro de los de menos de
--100 habitantes, sacando los que empaten con el �ltimo. Datos de fecha
--01/01/2013.

select top 10 with ties Municipio, Padron from DatosCompletosTabla where Padron <= 100 and Fecha = '01/03/2013' order by Padron asc

--�Mostrar los 10 municipios de Canarias con menor cociente paro partido
--por habitantes. Datos de fecha 01/01/2013

select top 10  Municipio, TotalParoRegistrado/CAST(Padron as decimal(9,2)) as ParoPorHabitante from DatosCompletosTabla where CA = 'Canarias' order by ParoPorHabitante