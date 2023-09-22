create database practica2_iabp;

use practica2_iabp;

create table ventas(

ID_ventas		numeric(3),
nombre_producto	varchar(40),
precio			numeric(3),
num_ventas		numeric(3)
);

create table empleados(

ID_empleado		numeric(4),
nombre			varchar(50),
art_vendidos	numeric(3)

);

insert into ventas values(343,'Cereal',67,8);
insert into ventas values(732,'Skittles',16,45);
insert into ventas values(415,'Leche',20,76);

insert into empleados values(4527,'Josue Gomez',50);
insert into empleados values(1625,'Ivan Beto',56);
insert into empleados values(5736,'Adriana Calderon',34);

select *from ventas;
select *from empleados;