select count(dh.IdHogar) as Hogares, DescTipoViv from DatosHogar dh
inner join TipoVivienda tv on dh.IdTipoViv = tv.idTipoViv
group by DescTipoViv

select count(dh.IdHogar) as Hogares, DescTipoHogar from DatosHogar dh
inner join TipoHogar th on dh.IdTipoViv = th.IdTipoHogar
group by DescTipoHogar
go

alter FUNCTION dbo.F_Descripcion (@letra VARCHAR(1)) 
returns @newtable TABLE ( 
  cantidad   integer, 
  descripcion nvarchar(max) ) 
AS 
  BEGIN 
      IF @letra = 'H' 
        INSERT @newtable 
        select count(dh.IdHogar) as Hogares, DescTipoHogar from DatosHogar dh
		inner join TipoHogar th on dh.IdTipoHogar = th.IdTipoHogar
		group by DescTipoHogar
      ELSE IF @letra = 'V' 
		INSERT @newtable 
        select count(dh.IdHogar) as Hogares, DescTipoViv from DatosHogar dh
		inner join TipoVivienda tv on dh.IdTipoViv = tv.idTipoViv
		group by DescTipoViv
      RETURN 
  END; 

go 

select cantidad,descripcion from F_Descripcion('H')