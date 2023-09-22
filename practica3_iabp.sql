create database practica3_iabp;

use practica3_iabp;

create table division(

ID_division		numeric(3),
nombre_div		varchar(30)
);

create table carrera(

ID_carrera		numeric(3),
nombre_carrera	varchar(30),
ID_division		numeric(3)
);


create table facultad(

ID_facultad		numeric(3),
nombre_fac		varchar(40),
ubicacion		varchar(200)
);

create table pago(

ID_pago			numeric(6),
tipo_pago		varchar(20),
monto			numeric(3)
);


create table alumno(

ID_alumno		numeric(9),
nombre			varchar(30),
semestre		numeric(2),
promedio		numeric(3),
ID_carrera		numeric(3),
ID_facultad		numeric(3),
ID_pago			numeric(6)
);

select *from alumno;
select *from carrera; 
select *from division; 
select *from facultad; 
select *from pago; 