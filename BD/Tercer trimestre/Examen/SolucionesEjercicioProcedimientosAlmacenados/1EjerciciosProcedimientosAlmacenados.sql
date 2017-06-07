--1
 if object_id('pa_crear_libros') is not null
  drop procedure pa_crear_libros;

 exec sp_help pa_crear_libros;
go

 create procedure pa_crear_libros 
 as
  if object_id('libros')is not null
   drop table libros
  create table libros(
   codigo int identity,
   titulo varchar(40),
   autor varchar(30),
   editorial varchar(20),
   precio decimal(5,2),
   cantidad smallint,
   primary key(codigo)
  )
  insert into libros values('Uno','Richard Bach','Planeta',15,5)
  insert into libros values('Ilusiones','Richard Bach','Planeta',18,50)
  insert into libros values('El aleph','Borges','Emece',25,9)
  insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',45,100)
  insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',12,50)
  insert into libros values('Java en 10 minutos','Mario Molina','Paidos',35,300);
go


 exec sp_help pa_crear_libros;


--2
if object_id('pa_crear_libros') is not null
  drop procedure pa_crear_libros;
go
 create procedure pa_crear_libros 
 as
  if object_id('libros')is not null
   drop table libros
 
  create table libros(
   codigo int identity,
   titulo varchar(40),
   autor varchar(30),
   editorial varchar(20),
   precio decimal(5,2),
   cantidad smallint,
   primary key(codigo)
  )

  insert into libros values('Uno','Richard Bach','Planeta',15,5)
  insert into libros values('Ilusiones','Richard Bach','Planeta',18,50)
  insert into libros values('El aleph','Borges','Emece',25,9)
  insert into libros values('Aprenda PHP','Mario Molina','Nuevo siglo',45,100)
  insert into libros values('Matematica estas ahi','Paenza','Nuevo siglo',12,50)
  insert into libros values('Java en 10 minutos','Mario Molina','Paidos',35,300);
go

 exec pa_crear_libros;

 select codigo,titulo,autor,editoril,precio,cantidad from libros;

 sp_help pa_crear_libros;

 if object_id('pa_libros_limite_stock') is not null
  drop procedure pa_libros_limite_stock;
 go
 create proc pa_libros_limite_stock
  as
   select codigo,titulo,autor,editoril,precio,cantidad from libros
   where cantidad <=10;
go

 sp_help pa_libros_limite_stock;

 exec pa_libros_limite_stock;

 update libros set cantidad=2 where codigo=4;
 exec pa_libros_limite_stock;



--3

 if object_id('empleados') is not null
  drop table empleados;

 create table empleados(
  documento char(8),
  nombre varchar(20),
  apellido varchar(20),
  sueldo decimal(6,2),
  cantidadhijos tinyint,
  seccion varchar(20),
  primary key(documento)
 );

 insert into empleados values('22222222','Juan','Perez',300,2,'Contaduria');
 insert into empleados values('22333333','Luis','Lopez',300,0,'Contaduria');
 insert into empleados values ('22444444','Marta','Perez',500,1,'Sistemas');
 insert into empleados values('22555555','Susana','Garcia',400,2,'Secretaria');
 insert into empleados values('22666666','Jose Maria','Morales',400,3,'Secretaria');

 if object_id('pa_empleados_sueldo') is not null
  drop procedure pa_empleados_sueldo;
go
 create procedure pa_empleados_sueldo
  @sueldo decimal(6,2)
 as
  select nombre,apellido,sueldo,cantidadhijos,seccion
   from empleados
    where sueldo>=@sueldo;
go
 exec pa_empleados_sueldo 400;
 exec pa_empleados_sueldo 500;

 exec pa_empleados_sueldo;

 if object_id('pa_empleados_actualizar_sueldo') is not null
  drop procedure pa_empleados_actualizar_sueldo;
go
 create procedure pa_empleados_actualizar_sueldo
  @sueldoanterior decimal(6,2),
  @sueldonuevo decimal(6,2)
 as
  update empleados set sueldo=@sueldonuevo
   where sueldo=@sueldoanterior;
go
 exec pa_empleados_actualizar_sueldo 300,350;
 select documento,nombre,apellido,sueldo from empleados;

 exec pa_empleados_actualizar_sueldo;

 exec pa_empleados_actualizar_sueldo @sueldonuevo=400,@sueldoanterior=350;

 select nombre,apellido,sueldo,cantidadhijos,seccion from empleados;

 if object_id('pa_sueldototal') is not null
  drop procedure pa_sueldototal;
go
 create procedure pa_sueldototal
  @documento varchar(8) = '%' --cuidado no usar char(8)
 as
  select nombre,apellido,
  sueldototal=
   case 
    when sueldo<500 then sueldo+(cantidadhijos*200)
    when sueldo>=500 then sueldo+(cantidadhijos*100)
   end --as sueldototal
   from empleados
   where documento like @documento;
go
 exec pa_sueldototal '22333333';
 exec pa_sueldototal '22444444';
 exec pa_sueldototal '22666666';

 exec pa_sueldototal;

 

   
