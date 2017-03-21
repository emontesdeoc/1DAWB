
select ca from ComunidadAutonoma


--1

select distinct ca as CA, count(IdHogar) as Hogares from DatosHogar dh
inner join TipoHogar th on  th.IdTipoHogar=dh.IdTipoHogar
inner join ComunidadAutonoma ca on ca.IdCA=dh.IdCA
where  dh.Lavadora = 'No' or dh.Coche = 'No' and th.IdTipoHogar = 2
group by ca

--2

--Veo todos las medias de todos los hogares y cuantos hogares del tipo
select AVG(RentaDisponible) as AVGRenta,  IdTipoHogar as IdTipoHogar, count(IdTipoHogar) as HogaresDelTipo from DatosHogar
group by IdTipoHogar
order by AVGRenta desc
--Veo el tipo de hogar del mayor media
select top 1 AVG(RentaDisponible) as AVGRenta,  IdTipoHogar as IdTipoHogar  from DatosHogar
group by IdTipoHogar
order by AVGRenta desc

--consulta final
select top 1 AVG(RentaDisponible) as AVGRenta, IdTipoHogar as IdTipoHogar, count(IdTipoHogar) as HogaresDelTipo from DatosHogar
--where IdTipoHogar = IdTipoHogar
group by IdTipoHogar
order by AVGRenta desc


--3

select Actividad.IdActividad as idActividad,  count(Actividad.IdActividad) as PersonasActividad  from Actividad
inner join DatosPersona on DatosPersona.IdActividad=Actividad.IdActividad
inner join DatosHogar on DatosHogar.IdHogar=DatosPersona.IdHogar
inner join ComunidadAutonoma ca on DatosHogar.IdCA=ca.IdCA
where ca.CA = 'Canarias' and DATEPART(dw,DatosHogar.FechaEntrevista) = 3 
group by Actividad.IdActividad
having count(Actividad.IdActividad) > 9


--4

select * from DatosHogar

select distinct ca.CA, COUNT( distinct IdTipoHogar) as TiposDeHogares, COUNT( distinct IdTipoViv) as TiposDeViviendas from DatosHogar dh
inner join ComunidadAutonoma ca on dh.IdCA=ca.IdCA
where dh.Poblacion = 'Media' and dh.RentaDisponible < 75000
group by ca.CA


--5

select Actividad.IdActividad as idActividad,  count(Actividad.IdActividad) as PersonasActividad, count(distinct DatosHogar.IdHogar) as Hogares  from Actividad
inner join DatosPersona on DatosPersona.IdActividad=Actividad.IdActividad
inner join DatosHogar on DatosHogar.IdHogar=DatosPersona.IdHogar
inner join ComunidadAutonoma ca on DatosHogar.IdCA=ca.IdCA
where DatosHogar.IdTipoHogar is null
group by Actividad.IdActividad

--6

select count(distinct DescTipoViv) as TiposVivienda, count(distinct  th.DescTipoHogar) as TiposHogares from TipoVivienda
full join DatosHogar dh on dh.IdTipoViv=TipoVivienda.idTipoViv
full join TipoHogar th on th.IdTipoHogar=dh.IdTipoHogar
where dh.IdHogar is null


--7


select DatosHogar.IdHogar as Hogar, count(DatosHogar.IdHogar) as NumeroPersonas, ca.CA as ComunidadAutonoma from DatosHogar
inner join DatosPersona dp on dp.IdHogar=DatosHogar.IdHogar
inner join ComunidadAutonoma ca on DatosHogar.IdCA=ca.IdCA
group by DatosHogar.IdHogar, ca.CA


select CONVERT(float,avg(subconsulta.NumeroPersonas)) as Media, subconsulta.ComunidadAutonoma from 
(select DatosHogar.IdHogar as Hogar, count(DatosHogar.IdHogar) as NumeroPersonas, ca.CA as ComunidadAutonoma from DatosHogar
inner join DatosPersona dp on dp.IdHogar=DatosHogar.IdHogar
inner join ComunidadAutonoma ca on DatosHogar.IdCA=ca.IdCA
group by DatosHogar.IdHogar, ca.CA) as subconsulta
group by subconsulta.ComunidadAutonoma




select avg(subconsulta2.MediaHogar) as Media
from (
select DatosHogar.IdHogar, DatosHogar.Coche,DatosHogar.Ordenador, avg(DatosHogar.RentaDisponible) as MediaHogar, count(a.IdActividad) as Personas from DatosHogar
inner join DatosPersona dp on DatosHogar.IdHogar = dp.IdHogar
inner join Actividad a on a.IdActividad=dp.IdActividad
where DatosHogar.Coche = 'No' and DatosHogar.Ordenador = 'Sí' 
group by  DatosHogar.IdHogar, DatosHogar.Coche,DatosHogar.Ordenador
having count(a.IdActividad)>4 ) as subconsulta2;

select DatosHogar.IdHogar, DatosHogar.Coche,DatosHogar.Ordenador, avg(DatosHogar.RentaDisponible) from DatosHogar
inner join DatosHogar dh on dh.IdHogar=DatosHogar.IdHogar
where DatosHogar.Coche = 'No' and DatosHogar.Ordenador = 'Sí'
group by  DatosHogar.IdHogar, DatosHogar.Coche,DatosHogar.Ordenador





-- (*)13.- Hallar la media de la suma del 
-- padrón por barrios.
--select avg(padron)
--from
--(select barrio, sum (valor) as padron
--from barrio as b
--inner join DatosPadron as p
--	on p.COD_BARRIO=b.COD_BARRIO
--group by barrio) as db;