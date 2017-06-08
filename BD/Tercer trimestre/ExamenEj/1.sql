select count(FechaNacimiento) from actividad a
inner join DatosPersona dp on dp.IdActividad = a.IdActividad
where (DATEPART(m,FechaNacimiento) between 3 and 4) and a.DescActividad = 'Trabajando'


select * from Actividad
go

alter PROCEDURE Sp_desactividad @Actividad nvarchar(max), 
                                @marzo integer output, @abril integer output, @existe integer output
AS 
    IF (select count(FechaNacimiento) from actividad 
					inner join DatosPersona on DatosPersona.IdActividad = Actividad.IdActividad
					where (DATEPART(m,FechaNacimiento) between 3 and 4) and Actividad.DescActividad = @Actividad) > 0
      BEGIN 
          SELECT @marzo = count(FechaNacimiento)
          FROM   actividad 
                 inner join DatosPersona on DatosPersona.IdActividad = Actividad.IdActividad
          WHERE  DATEPART(m,FechaNacimiento) = 3 and Actividad.DescActividad = @Actividad;

		   SELECT @abril = count(FechaNacimiento)
          FROM   actividad 
                 inner join DatosPersona on DatosPersona.IdActividad = Actividad.IdActividad
          WHERE  DATEPART(m,FechaNacimiento) = 4 and Actividad.DescActividad = @Actividad;

		  SET @existe = 1;
      END 
    ELSE 
      BEGIN 
          SET @existe = 0;
      END 

go 