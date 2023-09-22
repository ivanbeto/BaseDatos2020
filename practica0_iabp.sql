create database practica0_iabp;

use practica0_iabp;

create table alumno(

num_cuenta		numeric(9),
nombre			varchar(50),
id_carrera		numeric(3),
semestre		numeric(2),
generacion		numeric(4),
id_escuela		numeric(2)

);

create table carrera(

id_carrera		numeric(3),
nombre			varchar(40),
duracion		numeric(2)

);

create table escuela(

id_escuela		numeric(2),
nombre_escuela	varchar(25),
ubicacion		varchar(200)

);

insert into carrera values(110,'Ing.Computacion',10);
insert into carrera values(101,'Ing.Civil',9);
insert into carrera values(205,'Gastronomia',6);
insert into carrera values(108,'Quimica',10);
insert into carrera values(310,'Actuaria',9);

select *from carrera;

insert into escuela values(10,'UNAM','C.U., Coyoacán, 04510 Ciudad de México, CDMX');
insert into escuela values(11,'IPN ESIME Culhuacán','Avenida Santa Ana 1000, San Francisco Culhuacan, Culhuacan CTM V, Coyoacán, 04440 Ciudad de México, CDMX');
insert into escuela values(12,'UAM Xochimilco','Calz. del Hueso 1100, Coapa, Villa Quietud, Coyoacán, 04960 Coyoacán, CDMX');
insert into escuela values(13,'UNITEC Campus Sur','Ermita Iztapalapa 557, Granjas Esmeralda, Iztapalapa, 09810 Ciudad de México, CDMX');
insert into escuela values(14,'Col. Amado Nervo','Calle Bajío 220, Roma Sur, Cuauhtémoc, 06760 Ciudad de México, CDMX');

select *from escuela;

insert into alumno values(315131437,'Iván Beto',110,6,2018,10);
insert into alumno values(315063828,'Josué Gómez',110,6,2018,10);
insert into alumno values(315198001,'Christian Aguillon',110,6,2018,10);
insert into alumno values(315130296,'Scarlet Garcia',108,6,2018,10);
insert into alumno values(466123148,'Alonso Hernández',205,3,2019,13);
insert into alumno values(314355210,'Abril Alarcón',310,6,2018,10);
insert into alumno values(315489712,'Aby Domínguez',310,6,2018,11);
insert into alumno values(477852463,'Hector Ruiz',110,4,2019,11);
insert into alumno values(412511248,'Rodrigo Valadez',205,2,2020,13);
insert into alumno values(315264589,'Juan Carlos Antonio',101,6,2018,10);
insert into alumno values(315468545,'Moisés Aguilar',101,6,2018,10);
insert into alumno values(315498752,'Violeta Avilés',310,6,2018,14);
insert into alumno values(314569856,'Eleonora Goldoni',108,4,2019,14);
insert into alumno values(412478741,'Roberto Mosqueda',205,2,2020,12);
insert into alumno values(521369884,'Eduardo Moreno',101,2,2020,14);

select *from alumno;