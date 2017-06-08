select ca.CA from DatosHogar dh
inner join ComunidadAutonoma ca on ca.IdCA = dh.IdCA
group by ca.CA
order by count(IdHogar) desc
OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY
go


alter PROCEDURE Sp_Comunidades @salida1 nvarchar(max) output,
                                @salida2 nvarchar(max) output 
AS 
			select @salida1 = ca.CA from DatosHogar dh
							inner join ComunidadAutonoma ca on ca.IdCA = dh.IdCA
							group by ca.CA
							order by count(IdHogar) desc
							OFFSET 0 ROWS FETCH NEXT 1 ROWS ONLY

			select @salida2 = ca.CA from DatosHogar dh
							inner join ComunidadAutonoma ca on ca.IdCA = dh.IdCA
							group by ca.CA
							order by count(IdHogar) desc
							OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY
    
go 

declare @a nvarchar(max);
declare @b nvarchar(max);

exec Sp_Comunidades @a output, @b output;

print @a; print @b