
select ca.IdCA as ID, CA as CA, count(IdHogar) as CantidadHogares from ComunidadAutonoma ca
inner join DatosHogar dh on dh.IdCA = ca.IdCA
where CA like '%h%'
group by CA, ca.IdCA
go

CREATE FUNCTION F_ComunidadesA (@texto nvarchar(max)) 
returns TABLE 
AS 
    RETURN 
      (	select ca.IdCA as ID,
		CA as CA,
	    count(IdHogar) as CantidadHogares 
		from ComunidadAutonoma ca
		inner join DatosHogar dh on dh.IdCA = ca.IdCA
		where CA like '%'+@texto+'%'
		group by CA, ca.IdCA); 
go 

SELECT ID, 
       CA, 
       CantidadHogares 
FROM   dbo.F_ComunidadesA('a'); 

go 