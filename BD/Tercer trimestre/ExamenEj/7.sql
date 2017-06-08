
select a.DescActividad, count(idHogar) as Cantidad from DatosPersona dp
inner join Actividad a on dp.IdActividad = a.IdActividad
group by  a.DescActividad

CREATE VIEW v_veractividades AS 
select a.DescActividad, count(idHogar) as Cantidad from DatosPersona dp
inner join Actividad a on dp.IdActividad = a.IdActividad
group by  a.DescActividad
 
 
 
 SELECT DescActividad, Cantidad FROM v_veractividades 
