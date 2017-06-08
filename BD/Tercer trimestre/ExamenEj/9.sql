select count(*) from Actividad
go
alter TRIGGER t_maximosactividades
ON Actividad 
after INSERT 
AS 
    DECLARE @a INT 
	DECLARE @b INT 

    SELECT @a = count(*) from Actividad
	if @a > 5
		begin
			select @b = inserted.IdActividad from inserted

			delete from Actividad
			where Actividad.IdActividad = @b
		end
    
	insert into Actividad values(7,'aa')