create database practica11_iabp;

use practica11_iabp;

CREATE TABLE PAIS(
ID_PAIS NUMERIC(2) NOT NULL,
NOMBRE VARCHAR(20),
IVA NUMERIC(4,2)
);

CREATE TABLE PERSONA(
RFC VARCHAR(12) NOT NULL,
NOMBRE VARCHAR(20),
APELLIDO VARCHAR(20),
SUELDO NUMERIC(6),
ID_PAIS NUMERIC(2),
ID_EMP NUMERIC(5) NULL
);

CREATE TABLE ESPECIALIDAD(
ID_ESPECIALIDAD NUMERIC(6) NOT NULL,
NOMBRE VARCHAR(20)
);
select * from especialidad;
select * from curso;

CREATE TABLE CURSO (
ID_CURSO NUMERIC(12) NOT NULL,
NOMBRE VARCHAR(50),
ID_ESPECIALIDAD NUMERIC(6),
COSTO NUMERIC(6)
);

CREATE TABLE DEPTO(
ID_DEPTO NUMERIC(6) NOT NULL,
AREA VARCHAR(20)
);
select * from depto;
CREATE TABLE ZONA(
ID_ZONA NUMERIC(6) NOT NULL,
NOMBRE VARCHAR(20),
DIRECCION VARCHAR(50),
CUPO NUMERIC(6)
);

CREATE TABLE ZONA_DEPTO(
ID_ZD NUMERIC(8) NOT NULL,
ID_ZONA NUMERIC(6),
ID_DEPTO NUMERIC(6)
);

CREATE TABLE D_CURSO(
ID_D_CURSO NUMERIC(6) NOT NULL,
RFC VARCHAR(12) NOT NULL,
ID_CURSO NUMERIC(12) NOT NULL,
ID_ZD NUMERIC(8) NOT NULL,
FECHA DATE NOT NULL
);

ALTER TABLE PAIS ADD CONSTRAINT PK_PAIS PRIMARY KEY (ID_PAIS);

ALTER TABLE PERSONA ADD CONSTRAINT PK_PERSONA PRIMARY KEY (RFC);
ALTER TABLE PERSONA ADD CONSTRAINT UQ_EMPLEADO UNIQUE (ID_EMP);
ALTER TABLE PERSONA ADD CONSTRAINT FK_PER_PAI FOREIGN KEY (ID_PAIS)
REFERENCES PAIS(ID_PAIS);

/*DROP TABLE DEPTO;
DROP TABLE ZONA;*/
DROP TABLE ZONA_DEPTO;
DROP TABLE D_CURSO;

ALTER TABLE ESPECIALIDAD ADD CONSTRAINT PK_ESP PRIMARY KEY (ID_ESPECIALIDAD);

ALTER TABLE CURSO ADD CONSTRAINT PK_CURSO PRIMARY KEY (ID_CURSO);
ALTER TABLE CURSO ADD CONSTRAINT FK_CUR_ESP FOREIGN KEY (ID_ESPECIALIDAD)
REFERENCES ESPECIALIDAD(ID_ESPECIALIDAD);

ALTER TABLE DEPTO ADD CONSTRAINT PK_DEPTO PRIMARY KEY (ID_DEPTO);
ALTER TABLE ZONA ADD CONSTRAINT PK_ZONA PRIMARY KEY (ID_ZONA);

ALTER TABLE ZONA_DEPTO ADD CONSTRAINT PK_ZD PRIMARY KEY (ID_ZD);
ALTER TABLE ZONA_DEPTO ADD CONSTRAINT FK_ZD_DEP FOREIGN KEY (ID_DEPTO)
REFERENCES DEPTO(ID_DEPTO);
ALTER TABLE ZONA_DEPTO ADD CONSTRAINT FK_ZD_ZONA FOREIGN KEY (ID_ZONA)
REFERENCES ZONA(ID_ZONA);


ALTER TABLE D_CURSO  ADD CONSTRAINT PK_D_CURSO PRIMARY KEY(ID_D_CURSO,RFC,ID_CURSO);
ALTER TABLE D_CURSO  ADD CONSTRAINT FK_DC_PER FOREIGN KEY(RFC)
REFERENCES PERSONA(RFC);
ALTER TABLE D_CURSO  ADD CONSTRAINT FK_DC_CURSO FOREIGN KEY(ID_CURSO)
REFERENCES CURSO(ID_CURSO);
ALTER TABLE D_CURSO  ADD CONSTRAINT FK_DC_ZD FOREIGN KEY(ID_ZD)
REFERENCES ZONA_DEPTO(ID_ZD);

--INSERCIONES
INSERT INTO PAIS VALUES(1,'Hungría',0.27);
INSERT INTO PAIS VALUES(2,'Croacia',0.25);
INSERT INTO PAIS VALUES(3,'Dinamarca',0.25);
INSERT INTO PAIS VALUES(4,'Noruega',0.25);
INSERT INTO PAIS VALUES(5,'Suecia',0.25);
INSERT INTO PAIS VALUES(6,'Finlandia',0.24);
INSERT INTO PAIS VALUES(7,'Islandia',0.24);
INSERT INTO PAIS VALUES(8,'Rumanía',0.24);
INSERT INTO PAIS VALUES(9,'Grecia',0.23);
INSERT INTO PAIS VALUES(10,'Irlanda',0.23);
INSERT INTO PAIS VALUES(11,'Polonia',0.23);
INSERT INTO PAIS VALUES(12,'Portugal',0.23);
INSERT INTO PAIS VALUES(13,'Italia',0.22);
INSERT INTO PAIS VALUES(14,'Uruguay',0.22);
INSERT INTO PAIS VALUES(15,'México',0.16);
INSERT INTO PAIS VALUES(16,'Argentina',0.21);
INSERT INTO PAIS VALUES(17,'Bélgica',0.21);
INSERT INTO PAIS VALUES(18,'Países Bajos',0.21);
INSERT INTO PAIS VALUES(19,'España',0.21);
INSERT INTO PAIS VALUES(20,'Francia',0.2);
INSERT INTO PAIS VALUES(21,'Marruecos',0.2);
INSERT INTO PAIS VALUES(22,'Reino Unido',0.2);
INSERT INTO PAIS VALUES(23,'Chile',0.19);
INSERT INTO PAIS VALUES(24,'Alemania',0.19);

select * from pais;

INSERT INTO ESPECIALIDAD VALUES(1,'BASE DE DATOS');
INSERT INTO ESPECIALIDAD VALUES(2,'REDES');
INSERT INTO ESPECIALIDAD VALUES(3,'HARDWARE');
INSERT INTO ESPECIALIDAD VALUES(4,'SEGURIDAD INFOR');
INSERT INTO ESPECIALIDAD VALUES(5,'GRAFICOS');
INSERT INTO ESPECIALIDAD VALUES(6,'BIG DATA');
INSERT INTO ESPECIALIDAD VALUES(7,'POO');

select * from especialidad;

insert into CURSO values (1,'SQL QUERY',1,28000);
insert into CURSO values (2,'SQL ADMINISTRATION AND CONFIGURE',1,22000);
insert into CURSO values (3,'SQL BIG DATA',1,24000);
insert into CURSO values (4,'CISCO CCNA',2,11000);
insert into CURSO values (5,'CISCO CCNP',2,25000);
insert into CURSO values (6,'CISCO FUNDAMENTOS',2,12000);
insert into CURSO values (7,'DISPOSITIVOS DE ENTRADA',3,21000);
insert into CURSO values (8,'ALMACENAMIENTO',3,16000);
insert into CURSO values (9,'ARQUITECTURA',3,24000);
insert into CURSO values (10,'ETHICAL HACKER',4,10000);
insert into CURSO values (11,'SEGURIDAD INFORMATICA INTRODUCCION',4,19000);
insert into CURSO values (12,'CRIPTOMONEDA',4,22000);
insert into CURSO values (13,'UNITY',5,15000);
insert into CURSO values (14,'RPG',5,17000);
insert into CURSO values (15,'FPS',5,12000);
insert into CURSO values (16,'MINERIA DE DATOS',6,19000);
insert into CURSO values (17,'ANALISIS SAS',6,27000);
insert into CURSO values (18,'TABLEROS DE CONTROL',6,25000);
insert into CURSO values (19,'INTRODUCCION POO',7,10000);
insert into CURSO values (20,'CLASES',7,28000);
insert into CURSO values (21,'POO AVANZADO',7,15000);

SELECT * FROM CURSO;

insert into DEPTO values (1,'SISTEMAS');
insert into DEPTO values (2,'CONTA');
insert into DEPTO values (3,'RH');
insert into DEPTO values (4,'FINANZAS');
insert into DEPTO values (5,'VENTAS');

SELECT * FROM DEPTO;

insert into ZONA values (1,'SUR','TABASCO CHIAPAS YUCATAN',25);
insert into ZONA values (2,'ORIENTE','VERACRUZ PUEBLA',40);
insert into ZONA values (3,'PONIENTE','JALISCO AGUASCALIENTES',38);
insert into ZONA values (4,'CENTRO','CDMX EDO DE MEX',28);
insert into ZONA values (5,'NORTE','NUEVO LEON SINALOA',30);

SELECT * FROM ZONA;

insert into ZONA_DEPTO values (2,1,2);
insert into ZONA_DEPTO values (3,1,3);
insert into ZONA_DEPTO values (1,1,1);
insert into ZONA_DEPTO values (4,1,4);
insert into ZONA_DEPTO values (5,1,5);
insert into ZONA_DEPTO values (6,2,1);
insert into ZONA_DEPTO values (7,2,2);
insert into ZONA_DEPTO values (8,2,4);
insert into ZONA_DEPTO values (9,2,5);
insert into ZONA_DEPTO values (10,3,4);
insert into ZONA_DEPTO values (11,3,5);
insert into ZONA_DEPTO values (12,3,1);
insert into ZONA_DEPTO values (13,4,2);
insert into ZONA_DEPTO values (14,4,3);
insert into ZONA_DEPTO values (15,4,4);
insert into ZONA_DEPTO values (16,4,5);
insert into ZONA_DEPTO values (17,5,2);
insert into ZONA_DEPTO values (18,5,5);

SELECT * FROM ZONA_DEPTO;

insert into persona values ('TME9702079L5','hugo','Ramirez',15000,22,38);
insert into persona values ('TME991029CK2','sybil','Esmeralda',23000,14,37);
insert into persona values ('TMG000413FC0','Salvador','Aguirre',13000,6,36);
insert into persona values ('TMG020508L7A','OMAR','Hernandez',23000,16,35);
insert into persona values ('TMG0302257Z6','Natalia','Ramirez',3000,17,34);
insert into persona values ('TMG801003GU3','jose','Rodriguez',6000,6,33);
insert into persona values ('TMG9210161L6','Yazmin','Onofre',17000,5,32);
insert into persona values ('TMH7303296B8','javier','Reyes',16000,8,31);
insert into persona values ('TMI0003284W7','Griselda','gomez',8000,22,30);
insert into persona values ('TMI021011976','Carlos','Cano',13000,13,29);
insert into persona values ('TMI9207151E5','Maria','Garcia',16000,10,28);
insert into persona values ('TMI971031N52','Harumi','vazquez',25000,11,27);
insert into persona values ('TMJ900911N93','Gisela','Basurto',23000,14,26);
insert into persona values ('TMJ971023Q17','Victor','Monterrosas',8000,14,25);
insert into persona values ('TML051212CM7','Edgar','torres',4000,24,24);
insert into persona values ('TML830617I9A','Alejandro','belmont',3000,19,23);
insert into persona values ('TMN610302T3A','Norma','Lechuga',21000,18,22);
insert into persona values ('TMN9710158NA','Jorge','Fresnedo',13000,23,21);
insert into persona values ('TMO041011 T','eleazar','Soltero',12000,2,20);
insert into persona values ('TMO601122G75','Juan','Leija',7000,21,19);
insert into persona values ('TMO740802HP8','Veronica','Fernandez',14000,16,18);

insert into persona values ('TMO960316FU1','Carlos','bustillos',9000,21,17);
insert into persona values ('TMP550810S64','Octavio','briseño',11000,20,16);
insert into persona values ('TMP910516V24','Juan','Navarro',9000,3,15);
insert into persona values ('TMP960605R99','Ernesto','Fernandez',25000,3,14);
insert into persona values ('TMP981230EV0','maria','Tarin',4000,4,13);
insert into persona values ('TMR-7901205A','Rodrigo','Torres',7000,23,12);
insert into persona values ('TMR7901205A2','Roberto','Lomeli',8000,17,11);
insert into persona values ('TMR961128QE5','dulce','ramon',19000,24,10);
insert into persona values ('TMS751125P41','Paula','Avonce',10000,8,9);
insert into persona values ('TMS7901019Q7','Santiago','Mercado',9000,6,8);
insert into persona values ('TMS900308IS1','Gerardo','Lopez',5000,6,7);
insert into persona values ('TMS900308JS1','Remedios','Cosme ',12000,12,6);
insert into persona values ('TMT920323394','Maria','zamorano',16000,18,5);
insert into persona values ('TMU050114BE8','Fernando','echevarria',10000,15,4);
insert into persona values ('TMU9904122W6','Enrique','Bahena',16000,10,3);
insert into persona values ('TMZ051024LT0','Vianey','Rodriguez',25000,2,2);
insert into persona values ('TNA070118CA4','Luis','Salvador',14000,24,1);
insert into persona values ('TNA740805SG9','MANUEL','aragon',24000,12,NULL);
insert into persona values ('TNA920229I48','Sergio','Lopez',9000,2,NULL);
insert into persona values ('TNA930118558','lesli','Abarca',16000,2,NULL);
insert into persona values ('TNA970905T52','Roberto','Juarez',1000,22,NULL);
insert into persona values ('TNA990406N50','Ana','Torrencilla',24000,12,NULL);
insert into persona values ('TNC980810F14','norma','sanchez',4000,3,NULL);
insert into persona values ('TNE040505S56','Irene','Mendoza',1000,10,NULL);
insert into persona values ('TNE930722DYA','Laura','Dorante',17000,19,NULL);
insert into persona values ('TNG940915J47','Ana','Rodriguez',12000,21,NULL);
insert into persona values ('TNH8707023F4','DANAE','Orozco',8000,5,NULL);
insert into persona values ('TNI-960730HV','veronica','Macedo ',14000,8,NULL);
insert into persona values ('TNI000526QI8','Irma','Rangel',16000,5,NULL);

insert into persona values ('TNI960730HV9','rafael','De la luz',19000,11,NULL);
insert into persona values ('TNL560519S66','ricardo','Cervantes',3000,6,NULL);
insert into persona values ('TNM020111CY1','Erick','Gonzalez',21000,17,NULL);
insert into persona values ('TNM780113K72','karla','Luna',15000,9,NULL);
insert into persona values ('TNN920625DF6','Rodrigo','Gama',16000,13,NULL);
insert into persona values ('TNO0107062V8','Gerardo','velazquez',14000,23,NULL);
insert into persona values ('PTR770513SW5','Héctor','Moreno',2000,2,NULL);
insert into persona values ('PVA830308AY5','Adriana','Olivera',12000,13,NULL);
insert into persona values ('PVI880628788','Erick','Macarro',25000,24,NULL);
insert into persona values ('QAR910605RR5','Edith','velasquez',25000,10,NULL);
insert into persona values ('QAR941028Q38','Eduardo','Cervantes',15000,21,NULL);
insert into persona values ('QCO9310012U4','Eduardo','Leon',25000,5,NULL);
insert into persona values ('QES761108E21','Elena','Shreck',14000,19,NULL);
insert into persona values ('QIN770906NW8','Elisabeth','Liceaga',19000,13,NULL);
insert into persona values ('QKR940722B31','Elizabeth','garcia',15000,21,NULL);
insert into persona values ('QOR860909UJ4','Elizabeth','Osorio ',7000,12,NULL);
insert into persona values ('QSN9805081NO','Elizandra','Vilchis',3000,1,NULL);
insert into persona values ('QTR020808DJ7','Emmanuel','Ceja',13000,16,NULL);
insert into persona values ('QTR951012GSA','Enelin','Garcia ',10000,16,NULL);
insert into persona values ('PAS810514N20','Maria','Flores',12000,13,NULL);
insert into persona values ('PAM950124IHO','Oscar','Cruz',7000,2,NULL);
insert into persona values ('RBS990301FA6','Sergio','Kimura',2000,22,NULL);
insert into persona values ('RAG970207AV6','Zaira','Reyes',15000,2,NULL);
insert into persona values ('RAL931116MI0','Raul','Solorzano',18000,6,NULL);
insert into persona values ('RAR981215J85','sergio','Garcia',16000,12,NULL);
insert into persona values ('RAS920319JI8','Clemencia','guevara',2000,20,NULL);
insert into persona values ('RCA011025MM6','Ingrid','Ramirez',17000,6,NULL);
insert into persona values ('RCA830714NV1','Luis','Dominguez',20000,18,NULL);
insert into persona values ('RCG880729UA6','heriberto','mayen',25000,19,NULL);
insert into persona values ('RCM750827SV9','Daniel','Rodriguez',14000,19,NULL);

select * from persona;

insert into persona values ('RCM960130PF3','jose','perez',19000,8,NULL);
insert into persona values ('RDC9906041X8','Roberto','gomez',23000,17,NULL);
insert into persona values ('RDD940518SS4','Guillermo','Briones',8000,10,NULL);
insert into persona values ('RDI970813D48','Lorenzo','Palomares ',19000,10,NULL);
insert into persona values ('RDI990802HC6','Cristina','Malacara',16000,16,NULL);
insert into persona values ('REA911209U60','Francisco','Chavarria',14000,11,NULL);
insert into persona values ('REC960419DL9','reyna','Delgado',19000,18,NULL);
insert into persona values ('RED010601PU9','luis','Gonzalez',22000,23,NULL);
insert into persona values ('REN04071486A','josefina','Moya',22000,16,NULL);
insert into persona values ('RES971009E10','Marcela','hernadez ',21000,15,NULL);
insert into persona values ('RET020513DG3','Veronica','alonso',16000,2,NULL);
insert into persona values ('RET970926IZ6','Margarita','Sanchez',5000,12,NULL);
insert into persona values ('REV050325FM6','Domitila','Tellez',16000,11,NULL);
insert into persona values ('REV980926668','lesly','Ortiz',20000,8,NULL);
insert into persona values ('REX011109AX8','Mildret','Velaso',20000,3,NULL);
insert into persona values ('REX820315BH9','Danae','Vazquez ',8000,10,NULL);
insert into persona values ('REX970521MTA','Fabiola','Munguia',2000,3,NULL);
insert into persona values ('RFL9402088Z7','Humberto','Martinez',21000,7,NULL);
insert into persona values ('RFR020122GP6','Maria','De Santiago',2000,8,NULL);
insert into persona values ('RFR051107UC3','Rafael','Melchor',20000,5,NULL);
insert into persona values ('RGA780728SP9','Jose','Reyes',23000,12,NULL);
insert into persona values ('RGB0202125C5','Ana','Vazquez ',23000,5,NULL);
insert into persona values ('RGT010126G16','Elisa','Vargas',4000,19,NULL);
insert into persona values ('RIM000403C53','Ismael','Flores',11000,13,NULL);
insert into persona values ('RIM990403C53','Marco','Serrano',12000,20,NULL);
insert into persona values ('RIN020201I27','manuel','Mendoza',15000,7,NULL);
insert into persona values ('RLJ0002175B0','Jose','Gonzales',9000,16,NULL);
insert into persona values ('RLN0301213W0','Sandra','Trejo',14000,6,NULL);
insert into persona values ('RLO001121I15','Maria','Lopez',13000,7,NULL);
insert into persona values ('RLO0509062K1','maria','Reyes',22000,18,NULL);
insert into persona values ('RMA9612022U3','Noe','jimenez',17000,10,NULL);
insert into persona values ('RME0304148N4','Veronica','Cruz ',8000,4,NULL);
insert into persona values ('PAE9812026X8','Erika','Irene',24000,10,NULL);
insert into persona values ('PAB831230AU8','Enrique','Cabrera',14000,16,NULL);
insert into persona values ('ANL7011122B7','Gabino','Morales',18000,6,100);
insert into persona values ('ANI890324N61','Elizandra','Zamora',23000,1,99);
insert into persona values ('ANI890224N61','Alejandro','Aguilar',3000,18,98);
insert into persona values ('ANA80052693A','Fernando','Juarez',17000,5,97);
insert into persona values ('AMT970606V64','Yolanda','Hernandez',25000,16,96);
insert into persona values ('AMO050719560','Rodrigo','Rodríguez',4000,10,95);
insert into persona values ('AMO010129PL3','rene','Flores ',12000,19,94);
insert into persona values ('AMM960715RV1','Jorge','vasquez',25000,10,93);
insert into persona values ('AMM9401111H4','Edgar','villanueva',17000,10,92);
insert into persona values ('AML010828FM3','Maribel','Aldrete',8000,24,91);
insert into persona values ('AML010710U25','Francisco','Gomez',20000,14,90);
insert into persona values ('AMI791127P51','Edgar','serralde',1000,4,89);
insert into persona values ('AMI740520SP1','Yazmin','Carmona',21000,16,88);
insert into persona values ('AMI001006MB2','omar','Cruz',11000,10,87);
insert into persona values ('AME980128HP8','Juan','Villalobos',10000,11,86);
insert into persona values ('AME970425FZ7','Guillermo','Garcia',5000,10,85);

SELECT * FROM PERSONA;
insert into persona values ('AME961129CA5','Raul','Sosa ',3000,11,84);
insert into persona values ('AME720202UV4','Leticia','Beltran',24000,16,83);
insert into persona values ('AME510426D43','JOSE','Vieria',22000,15,82);
insert into persona values ('AME021217161','Evangelina','Soto',4000,22,81);
insert into persona values ('AME0108036D5','silvia','Rodriguez',24000,7,80);
insert into persona values ('AMC840424NY9','Luis','Cruz ',22000,23,79);
insert into persona values ('AMA990917SI3','Ezequiel','carretero',10000,21,78);
insert into persona values ('AMA011218M72','viridiana','Servin',9000,7,77);
insert into persona values ('AMA010616H19','Sergio','sanchez',16000,13,76);
insert into persona values ('ALV961213V22','Ricardo','Gallelos',13000,22,75);
insert into persona values ('ALU891214FE9','marisol','ramirez',5000,15,74);
insert into persona values ('ALT940628UJ9','ruben','ainslie',1000,7,73);
insert into persona values ('ALS940920E87','Roberto','Palma',16000,22,72);
insert into persona values ('ALR821119841','Mariana','valdepeña',25000,5,71);
insert into persona values ('ALR740107PS9','jorge','Cortes',23000,5,70);
insert into persona values ('ALR731010387','Irma','Barajas',21000,2,69);
insert into persona values ('ALR7006236YA','Sergio','Ramirez',25000,3,68);
insert into persona values ('ALR7006236Y4','Elizabeth','Leal',17000,13,67);
insert into persona values ('ALR040524JB8','Marisol','Cruz ',23000,11,66);
insert into persona values ('ALO881003R85','Maria','escobar',12000,16,65);
insert into persona values ('ALO020918GP9','Marcela','Muñoz',15000,23,64);
insert into persona values ('ALM9611059B2','Norma','Eugenia',25000,21,63);
insert into persona values ('ALM9103062WA','Alejandro','Diaz de Leon',18000,23,62);
insert into persona values ('ALM580517AG1','Jorge','Repper',13000,24,61);
insert into persona values ('ALI991002DI0','Alejandro','Rascon',14000,1,60);
insert into persona values ('ALI991002D10','Jose','Gomez',20000,24,59);
insert into persona values ('ALI9608158ZA','Guadalupe','Mc Beath',21000,9,58);
insert into persona values ('ALG011126KTA','CECILIA','Montes',5000,22,57);
insert into persona values ('ALE9803025LA','Maria','Herrera',4000,19,56);
insert into persona values ('ALE980212LG6','Carlos','Maximo',14000,1,55);
insert into persona values ('ALE960613RB5','Armando','Fernandez',15000,5,54);
insert into persona values ('ALC891113UIA','Claudia','Morales',14000,10,53);
insert into persona values ('ALC7408228Y3','VIRIDIANA','Rodriguez',9000,16,52);
insert into persona values ('ALC050627L98','Cecilia','Valencia',14000,10,51);
insert into persona values ('ALC021022P23','Argelia','Aguilar',16000,17,50);
insert into persona values ('ALC020629DRA','Manuel','Lugo',8000,10,49);
insert into persona values ('ALB8111268Q8','America','Frutis',18000,21,48);
insert into persona values ('ALA980421U37','Gabriel','Lueva',5000,1,47);
insert into persona values ('ALA9712227A8','jorge','Esquivel',11000,6,46);
insert into persona values ('ALA860723AM9','Vladimir','Diaz',17000,24,45);
insert into persona values ('AJU9507136N0','Rafael','garcia',2000,9,44);
insert into persona values ('AJU920926IJO','Angeles','Cortes',20000,24,43);
insert into persona values ('AJO960709A44','Pamela','Meade',20000,10,42);
insert into persona values ('AJO020729QJ4','Edgardo','Clemente',11000,7,41);
insert into persona values ('AIN9304058R7','Maria','Ornelas',12000,1,40);
insert into persona values ('AID900322B93','Marcos','Embriz',21000,16,39);
insert into persona values ('ANM050715LS7','Nancy','Sanchez',24000,20,NULL);
insert into persona values ('AOI960201NX4','Gabriela','Lopez',15000,13,NULL);
insert into persona values ('AOR960612JKA','Erick','Chavez',12000,10,NULL);
insert into persona values ('APA0008194E6','Cristina','Ruiz',19000,18,NULL);
insert into persona values ('APA990118AY4','Alfredo','Barranco',1000,4,NULL);

select * from persona;

insert into persona values ('APC721129CQ8','Blas','Mares',3000,22,NULL);
insert into persona values ('APE9003284Y4','Jose','Ortiz',10000,23,NULL);
insert into persona values ('APE9508042S0','Luis','Don ',1000,7,NULL);
insert into persona values ('APH720720AT9','iris','Dominguez',7000,10,NULL);
insert into persona values ('API7202187W5','Refugio','Paredes',16000,23,NULL);
insert into persona values ('APL040619PF6','Luis','Nafarrata',17000,13,NULL);
insert into persona values ('APN050322HY6','Nancy','Barajas',2000,23,NULL);
insert into persona values ('APN05032HY6','Dolores','muñoz',6000,9,NULL);
insert into persona values ('APR0305058L2','Rosendo','Macedo ',9000,17,NULL);
insert into persona values ('AQU681211FV0','paulina','Villareal',17000,16,NULL);
insert into persona values ('AQU9811051R7','Elizabeth','pilar',18000,12,NULL);
insert into persona values ('ARA0405277P6','Juan','Cervantes',8000,21,NULL);
insert into persona values ('ARA641221CX0','Martin','Rodriguez',5000,3,NULL);
insert into persona values ('ARA930625LM0','miguel','Prieto',18000,7,NULL);
insert into persona values ('ARA960918HC5','Karina','Rodriguez',19000,22,NULL);
insert into persona values ('ARA990917AF0','mario','flores',15000,7,NULL);
insert into persona values ('ARC900626BY4','irma','Tarin',21000,6,NULL);
insert into persona values ('ARD740315TF1','lizette','Baca',4000,24,NULL);
insert into persona values ('ARE981218TK6','Rodolfo','Rojas',15000,11,NULL);
insert into persona values ('ARI0006019U3','Romulo','torres',1000,11,NULL);
insert into persona values ('ARI970507JB1','Alejandra','Gonzalez',21000,24,NULL);
insert into persona values ('ARM990923KY8','Karla','Cabello',2000,19,NULL);
insert into persona values ('ARM9911306A5','maria','Ponce',3000,7,NULL);
insert into persona values ('ASA880330RU7','Elizabeth','Izquierdo',11000,22,NULL);
insert into persona values ('ASA950105MX8','Omar','Trasviña',10000,22,NULL);
insert into persona values ('ASA950208UK2','Roberto','Damian',7000,8,NULL);
insert into persona values ('ASD940317DJ7','Marvella','Oliva',24000,8,NULL);
insert into persona values ('ASE000504DBA','Jose','Moreno',23000,24,NULL);
insert into persona values ('ASE0009266M0','Martha','Gomez',9000,15,NULL);
insert into persona values ('ASE950901TIA','Oscar','SALAZAR',6000,6,NULL);
insert into persona values ('ASE970909D99','Paulina','Hernandez',22000,19,NULL);
insert into persona values ('ASF960710QR3','luz','Betancourt',4000,19,NULL);
insert into persona values ('ASG970521JP5','Mario','Flores',24000,4,NULL);
insert into persona values ('ASI980611SM9','maria','Ulacia',10000,15,NULL);
insert into persona values ('ASJ930415P18','Nadia','Paez',11000,14,NULL);
insert into persona values ('ASL030722HC9','Raul','Hurtado ',20000,1,NULL);
insert into persona values ('ASM040121SE2','rufino','Baylon',23000,14,NULL);
insert into persona values ('ASO870311VE3','arely','Davalo',5000,21,NULL);
insert into persona values ('ASR770801G51','blanca','Garcia ',17000,3,NULL);
insert into persona values ('ASS001002KX0','DIEGO','Ortega',9000,1,NULL);
insert into persona values ('ASS990416FT8','Erike','Rodriguez',21000,22,NULL);
insert into persona values ('AST890525BX4','Fabiola','Camacho',12000,21,NULL);
insert into persona values ('ASU040120TS4','Ileana','Fernandez',2000,23,NULL);
insert into persona values ('ASU750908AV5','roberto','Zamorano',18000,20,NULL);
insert into persona values ('ATA000223JL2','Salvador','Pell',15000,21,NULL);
insert into persona values ('CFE9904134P0','Luis','Fuentes ',6000,6,NULL);
insert into persona values ('CFL010329RS7','Marcela','Espinoza',25000,7,NULL);
insert into persona values ('CFL9610257Y8','Edith','Ortega',16000,8,NULL);
insert into persona values ('CFM721016HNA','Erick','galeana',3000,5,NULL);
insert into persona values ('CFN930804T32','Juan','Lopez',16000,9,NULL);
insert into persona values ('CFP020530P50','Pablo','terrzas',22000,11,NULL);
insert into persona values ('CFT900220987','Luis','Valencia',24000,23,NULL);
insert into persona values ('CG0936 AUTO','Oscar','Moreno',15000,17,NULL);
insert into persona values ('CG1699 TRANS','Jose','Ascanio',9000,13,NULL);
insert into persona values ('CG27010 DELI','Juan','Parra',8000,16,NULL);
insert into persona values ('CG55152 FABR','Zoraya','Baylon',16000,12,NULL);
insert into persona values ('CG990701 SOC','Ana','Ibarra',24000,19,NULL);
insert into persona values ('CG991074 TRA','juan','villavicencio',21000,16,NULL);
insert into persona values ('CG991493 TRA','maria','Reyes',20000,17,NULL);
insert into persona values ('CG991600 TRA','Miriam','Rivas',16000,22,NULL);
insert into persona values ('CGA010118TQ4','karla','castañeda',7000,22,NULL);
insert into persona values ('CGA900209HW8','Audi','Hinojosa',12000,13,NULL);
insert into persona values ('CGO990611QK5','Gerardo','gutierrez',15000,22,NULL);
insert into persona values ('CGS821202RT3','Juan','Flores',7000,9,NULL);
insert into persona values ('CGT980424GN7','Carlos','Velazquez',24000,1,NULL);
insert into persona values ('CHI0512131N5','janely','Muela',8000,3,NULL);
insert into persona values ('CHU01109TG8','Lorenzo','Lopez',21000,22,NULL);
insert into persona values ('CHU011109TG8','Erika','Salais',16000,22,NULL);
insert into persona values ('CIC9303278B5','arturo','Baylon',25000,21,NULL);
insert into persona values ('CID9406151K7','rosalia','Pegueros',21000,5,NULL);
insert into persona values ('CIN921207MSA','Ana','Gomez',22000,8,NULL);
insert into persona values ('CIN941109QX0','Rosa','Lopez',24000,23,NULL);
insert into persona values ('CIP9107094G4','Diana','Herminia',14000,23,NULL);
insert into persona values ('CIT840629957','Enelin','Garcia',11000,15,NULL);
insert into persona values ('CLA980724UW3','Jorge','Briseño',6000,14,NULL);
insert into persona values ('CLE900920Q18','Leonardo','Vega',18000,4,NULL);
insert into persona values ('CLL021112MI0','Francisco','Rivera',4000,21,NULL);
insert into persona values ('CLO8612012Q0','Diego','Meade',13000,12,NULL);
insert into persona values ('CLR940317645','Iris','Mosso',6000,8,NULL);
insert into persona values ('CLS790825NK6','LUCERO','Aguilar',15000,20,NULL);
insert into persona values ('CMA060208KR2','MIRIAM','Rodriguez',3000,6,NULL);
insert into persona values ('CMA9903027X8','Manuel','Lopez',16000,15,NULL);
insert into persona values ('CME020318M51','Marco','Castro',10000,6,NULL);
insert into persona values ('CME9607127I6','RAMON','Avonce',16000,18,NULL);
insert into persona values ('CML990721E11','Claudia','Castro',20000,2,NULL);
insert into persona values ('CMO911129639','Florentino','relgadas',15000,1,NULL);
insert into persona values ('CMP020930947','Yesenia','Arreola',2000,10,NULL);
insert into persona values ('CNA020109R61','Francisco','Vazquez ',3000,18,NULL);
insert into persona values ('CNO831222DL0','Ana','ferrer',12000,14,NULL);
insert into persona values ('COB030124575','Blanca','Hernandez',1000,13,NULL);
insert into persona values ('COF021108SM1','Rolando','Batta',20000,24,NULL);
insert into persona values ('COI0104261T1','Sandra','Valdez',1000,6,NULL);
insert into persona values ('COM030310QG7','Sergio','Garcia',22000,10,NULL);
insert into persona values ('CON980216NQ2','Luis','Medrano',20000,16,NULL);
insert into persona values ('CPC950717D26','otto','Perez',25000,3,NULL);
insert into persona values ('CPE910412J5A','Martha','Hernandez',4000,5,NULL);
insert into persona values ('CPE910524CN9','Erika','Canales',20000,9,NULL);
insert into persona values ('CPI950418NE5','Jose','Olguin',9000,8,NULL);
insert into persona values ('CQP0307129T5','German','Caballero',6000,23,NULL);
insert into persona values ('CQS9406174V4','Violeta','Romero',13000,22,NULL);
insert into persona values ('CRE800407IQ4','Yolanda','jimenez',19000,16,NULL);
insert into persona values ('TGM740603H34','Ana','Malacara',7000,17,NULL);
insert into persona values ('TGM780112UU2','Diego','Garcia',9000,21,NULL);
insert into persona values ('TGO020409V45','Jessica','Sosa ',11000,5,NULL);
insert into persona values ('TGO501017QH7','Yesenia','Sayago',5000,18,NULL);
insert into persona values ('TGO810817TC9','Martin','Esteves',15000,5,NULL);
insert into persona values ('TGO940208SG8','silvia','Sosa',14000,11,NULL);
insert into persona values ('TGP9411291X2','Jorge','Vega',23000,11,NULL);
insert into persona values ('TGR000927DL4','ricardo','Trofimova',13000,13,NULL);
insert into persona values ('TGR0204151M7','Elvira','Bautista',3000,11,NULL);
insert into persona values ('TGR030123GU4','Gabriel','Lara',14000,6,NULL);
insert into persona values ('TGR670313N15','Candy','Hernandez',22000,11,NULL);
insert into persona values ('TGR930505RA6','Esteban','Fernandez',17000,14,NULL);
insert into persona values ('TGS761023DR9','Jose','Gomez',23000,4,NULL);
insert into persona values ('TGS820120318','Marcela','garcia',16000,14,NULL);
insert into persona values ('TGT0111298D7','Norma','Lopez',12000,9,NULL);
insert into persona values ('TGT890502Q39','Yesenia','Pineda',6000,12,NULL);
insert into persona values ('TGU001027151','Yaxum','Aldrete',6000,15,NULL);
insert into persona values ('TGV050314N51','Claudia','Ramirez',1000,9,NULL);
insert into persona values ('TGV980715MR1','Laura','Castro',23000,5,NULL);
insert into persona values ('THA930215847','Luz','Castañeda',4000,16,NULL);
insert into persona values ('THD9001194Q1','Hector','Martinez',25000,1,NULL);
insert into persona values ('THE891018FC5','Christian','Terrazas',10000,4,NULL);
insert into persona values ('THE940114CR8','Vianey','Martinez',21000,22,NULL);
insert into persona values ('THE970303HE5','Carmen','rivapalacios',13000,20,NULL);
insert into persona values ('THE980324HYA','EDGAR','Rodriguez',18000,14,NULL);
insert into persona values ('THE980420RK3','Julia','perez',4000,18,NULL);
insert into persona values ('THG050822ET1','teresa','Villalobos',12000,16,NULL);
insert into persona values ('THG980519DM9','Osiris','Serra',9000,20,NULL);
insert into persona values ('THH981218DS0','Carlos','Uribe',1000,8,NULL);
insert into persona values ('THI000706RW6','Esteban','Alcalá',16000,24,NULL);
insert into persona values ('THI030228LL6','Daniel','Muela',6000,12,NULL);
insert into persona values ('THI750725EX3','Esteban','salas',20000,11,NULL);
insert into persona values ('THI980317M55','Natalia','Gonzalez',2000,17,NULL);
insert into persona values ('TIB600729U37','Lilia','Mendez',19000,17,NULL);
insert into persona values ('TIC0107253B6','German','Salvador',18000,10,NULL);
insert into persona values ('TIC020502814','fernando','Villanueva',20000,15,NULL);
insert into persona values ('TIC0210223CA','Juan','Guzman',14000,8,NULL);
insert into persona values ('TIC761216630','Leticia','Toro',8000,1,NULL);
insert into persona values ('TIC920511BT9','Denise','Tovar',8000,12,NULL);
insert into persona values ('TIC961203CB9','Arturo','Galvan',22000,16,NULL);
insert into persona values ('TIC990128H40','Magali','Abreu',13000,5,NULL);
insert into persona values ('TID030228HG1','Gabriela','Hinojosa',5000,1,NULL);
insert into persona values ('TID960301M19','Maria','Salguero',19000,17,NULL);
insert into persona values ('TIE810925S94','Roxana','Reyes',16000,21,NULL);
insert into persona values ('TIE940328153','Lorena','Cisnero',10000,17,NULL);
insert into persona values ('TIE980511CW9','ARTURO','Montes',19000,4,NULL);
insert into persona values ('TIF9310057HA','Jose','Espinoza',6000,16,NULL);
insert into persona values ('TIG8902064M6','erika','Rodriguez',5000,13,NULL);
insert into persona values ('TIG981016CF6','Maria','Saenz',1000,17,NULL);
insert into persona values ('TIJ021123DE6','Alejandro','Salais',10000,13,NULL);
insert into persona values ('TIL950911QE9','Norma','pastrana',11000,24,NULL);
insert into persona values ('TIM9106143X3','Tania','Ledezma',7000,24,NULL);
insert into persona values ('TIM910620ND7','RICARDO','Rivera',7000,15,NULL);
insert into persona values ('TIM9111255P5','Claudia','Cosme ',5000,2,NULL);
insert into persona values ('TES0509151F4','Tania','ucha',14000,3,NULL);
insert into persona values ('TES790917FP2','Carlos','Gabriel',10000,4,NULL);
insert into persona values ('TES870608TK6','Vianey','De la Cruz',10000,16,NULL);
insert into persona values ('TES900801IS1','ELENA','Lechuga',25000,10,NULL);
insert into persona values ('TES900806IS1','Luis','Sanchez',15000,24,NULL);
insert into persona values ('TES910530QQ8','Pablo','Damian',24000,18,NULL);
insert into persona values ('TES9212128J9','Alejandro','Carcamo',4000,19,NULL);
insert into persona values ('TES991026197','Fausto','Vega',23000,16,NULL);
insert into persona values ('TET630824PG5','Alfonso','Mendoza',6000,21,NULL);
insert into persona values ('TET7611019P5','Ana','Rodriguez',8000,3,NULL);
insert into persona values ('TET960508QJ1','Laura','Malacara',23000,16,NULL);
insert into persona values ('TET981216350','Alvaro','Leon',8000,14,NULL);
insert into persona values ('TEU000703RZ3','Raul','Hernandez',15000,18,NULL);
insert into persona values ('TEU820616CY9','Yazmin','Uribe',14000,17,NULL);
insert into persona values ('TEU9005041Y2','Osvaldo','Islas',11000,17,NULL);
insert into persona values ('TEV9005092N4','Elisabeth','ruiz',12000,7,NULL);
insert into persona values ('TEX020731LI7','Sandra','Tena ',8000,7,NULL);
insert into persona values ('TEX030403NC8','Enrique','Gonzales',16000,18,NULL);
insert into persona values ('TEX990521628','agustin','Sevilla',8000,4,NULL);
insert into persona values ('TEZ7309246M0','claudia','Gonzales',2000,19,NULL);
insert into persona values ('TEZ820708ML3','Rafael','Betancourt',3000,22,NULL);
insert into persona values ('TFA980912VEA','Salvador','Albarran',8000,13,NULL);
insert into persona values ('TFA990617PE7','Cynthia','Martinez',19000,4,NULL);
insert into persona values ('TFE980630M94','Lionel','Gomez',6000,3,NULL);
insert into persona values ('TFG060626CT6','Santiago','Garcia',17000,18,NULL);
insert into persona values ('TFG8911307D1','Jorge','anne',20000,5,NULL);
insert into persona values ('TFL930708UZ2','Jose','Soto',25000,22,NULL);
insert into persona values ('TFL980511ES7','lourdes','Garcia ',17000,11,NULL);
insert into persona values ('TFM990316GW0','Jose','cruz',4000,3,NULL);
insert into persona values ('TFN050405R71','Marco','Elizalde',23000,17,NULL);
insert into persona values ('TFO900216LS8','Sergio','García',24000,1,NULL);
insert into persona values ('TFR000612BA9','Adriana','Morales',20000,15,NULL);
insert into persona values ('TFR920518QA0','irma','Dorante',12000,18,NULL);
insert into persona values ('TFR950817EWA','Jose','Ortiz',13000,24,NULL);
insert into persona values ('TFR991118IU1','Maria','Leija',10000,12,NULL);
insert into persona values ('TFU920511UZ0','Karen','Aguilera',16000,15,NULL);
insert into persona values ('TGA021128CE2','Veronica','colon',14000,9,NULL);
insert into persona values ('TGA030620E54','Erika','serratos',2000,6,NULL);
insert into persona values ('TGA900105PU0','ma.','Perez',1000,1,NULL);
insert into persona values ('TGA900907MB7','Juan','Vieria',8000,20,NULL);
insert into persona values ('TGA920214LZ4','Octavio','Hernandez',12000,5,NULL);
insert into persona values ('TGA950523KDA','Adriana','Martínez',20000,22,NULL);
insert into persona values ('TGA950607RZ5','ERIKA','Alvarez',21000,20,NULL);
insert into persona values ('TGA980606238','Erika','Ruiz',2000,5,NULL);
insert into persona values ('TGB8310089F1','Marco','Hernandez',8000,4,NULL);
insert into persona values ('TGB941129NE1','Norma','Uribe',17000,23,NULL);
insert into persona values ('TGC7408282F6','elizabeth','Islas',24000,10,NULL);
insert into persona values ('TGE001116RQ5','Javier','ruiz',22000,24,NULL);
insert into persona values ('TGE820831T49','Carmen','Tena ',10000,20,NULL);
insert into persona values ('TGG0302069T7','ingrid','Gonzales',6000,20,NULL);
insert into persona values ('TGG0310206C5','Daniel','Sevilla',12000,18,NULL);
insert into persona values ('TGG780125436','Gabriela','Gonzales',13000,18,NULL);
insert into persona values ('TGI9811172R2','Ana','Betancourt',25000,9,NULL);
insert into persona values ('TGL011022S49','Roberto','Albarran',17000,8,NULL);
insert into persona values ('TGL820401L67','Karina','Martinez',13000,23,NULL);
insert into persona values ('TGM040619MD3','Lauro','Gomez',4000,11,NULL);


INSERT INTO D_CURSO VALUES(1,'CG55152 FABR',1,10,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'ANL7011122B7',4,15,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'CFE9904134P0',5,2,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'TGO020409V45',6,15,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'CFE9904134P0',6,14,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'TGB941129NE1',7,4,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'RLJ0002175B0',7,1,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'TGO020409V45',9,11,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'CFL9610257Y8',9,11,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'RGB0202125C5',10,1,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'ALE980212LG6',15,18,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'ASA950208UK2',18,13,'04/10/2019');
INSERT INTO D_CURSO VALUES(1,'ALE960613RB5',21,17,'04/10/2019');
INSERT INTO D_CURSO VALUES(2,'REV050325FM6',1,12,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'TEZ7309246M0',2,2,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'RCM960130PF3',3,17,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'CLL021112MI0',3,18,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'TIC0107253B6',3,3,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'CG990701 SOC',4,6,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'TFR991118IU1',4,8,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'TID960301M19',6,3,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'TMP960605R99',7,17,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'QTR020808DJ7',7,9,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'AME961129CA5',8,1,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'AJO960709A44',9,2,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'TGR670313N15',10,18,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'TME9702079L5',10,11,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'TGA900907MB7',13,14,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'PAS810514N20',15,6,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'TFL930708UZ2',18,4,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'ASA950208UK2',18,10,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'TNA990406N50',19,16,'13/10/2019');
INSERT INTO D_CURSO VALUES(2,'CON980216NQ2',21,10,'13/10/2019');
INSERT INTO D_CURSO VALUES(3,'CLL021112MI0',1,13,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'ANI890224N61',2,16,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'ASM040121SE2',4,15,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'ALO881003R85',5,10,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'AMA990917SI3',5,9,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'TMI0003284W7',6,6,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'CHI0512131N5',7,8,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'RDC9906041X8',7,11,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'PTR770513SW5',8,2,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'ANM050715LS7',9,17,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'TMP550810S64',9,3,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'TGE001116RQ5',9,6,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'ANI890224N61',10,8,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'TES900806IS1',10,7,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'TID030228HG1',11,13,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'CLR940317645',11,5,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'TIB600729U37',13,7,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'TFN050405R71',13,2,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'TNA970905T52',14,9,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'RES971009E10',14,14,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'THE970303HE5',15,14,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'COB030124575',16,7,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'ARA960918HC5',17,1,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'ARA641221CX0',18,5,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'CFM721016HNA',19,6,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'TFR991118IU1',19,3,'12/01/2019');
INSERT INTO D_CURSO VALUES(3,'TES900801IS1',19,9,'12/01/2019');
INSERT INTO D_CURSO VALUES(4,'RDC9906041X8',2,14,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'AOR960612JKA',2,1,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'RDI970813D48',3,3,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'APE9003284Y4',4,1,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TMH7303296B8',5,16,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'RCM960130PF3',5,14,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TIC961203CB9',6,12,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'COB030124575',8,16,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'ALR7006236Y4',9,3,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'AMA011218M72',12,8,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'ASD940317DJ7',12,6,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TGO501017QH7',12,3,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TNI-960730HV',14,14,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TGR030123GU4',14,4,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'THH981218DS0',14,14,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TMO960316FU1',15,15,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TGR670313N15',16,6,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TGV050314N51',16,5,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'QIN770906NW8',18,2,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TMO740802HP8',19,17,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'ASE000504DBA',19,6,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'CIP9107094G4',19,8,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TGR0204151M7',19,4,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'ANA80052693A',19,9,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'ASG970521JP5',20,1,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'CLE900920Q18',20,17,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TEX990521628',20,9,'16/03/2019');
INSERT INTO D_CURSO VALUES(4,'TIF9310057HA',20,14,'16/03/2019');
INSERT INTO D_CURSO VALUES(5,'CRE800407IQ4',1,15,'27/09/2019');
INSERT INTO D_CURSO VALUES(5,'APR0305058L2',5,11,'27/09/2019');
INSERT INTO D_CURSO VALUES(5,'CG991493 TRA',9,8,'27/09/2019');
INSERT INTO D_CURSO VALUES(5,'CFP020530P50',10,18,'27/09/2019');
INSERT INTO D_CURSO VALUES(5,'TGO810817TC9',11,4,'27/09/2019');
INSERT INTO D_CURSO VALUES(5,'ASF960710QR3',12,4,'27/09/2019');
INSERT INTO D_CURSO VALUES(5,'CG0936 AUTO',13,8,'27/09/2019');
INSERT INTO D_CURSO VALUES(5,'TIE940328153',14,18,'27/09/2019');
INSERT INTO D_CURSO VALUES(5,'TMP910516V24',15,9,'27/09/2019');
INSERT INTO D_CURSO VALUES(5,'APA0008194E6',20,10,'27/09/2019');
INSERT INTO D_CURSO VALUES(6,'TMZ051024LT0',1,16,'22/02/2019');
INSERT INTO D_CURSO VALUES(6,'RDI990802HC6',2,14,'22/02/2019');
INSERT INTO D_CURSO VALUES(6,'CNA020109R61',3,17,'22/02/2019');
INSERT INTO D_CURSO VALUES(6,'THE980420RK3',10,10,'22/02/2019');
INSERT INTO D_CURSO VALUES(7,'RES971009E10',1,14,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'APN050322HY6',2,5,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'TGG0302069T7',4,5,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'AMO010129PL3',4,10,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'TGC7408282F6',4,17,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'TMT920323394',5,15,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'TGE820831T49',8,10,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'TFG060626CT6',8,8,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'THE980324HYA',9,17,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'ALC020629DRA',11,9,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'ALO020918GP9',11,9,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'TNI960730HV9',12,12,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'ALE9803025LA',12,10,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'RED010601PU9',15,10,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'CFP020530P50',15,8,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'ASR770801G51',15,12,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'THE980324HYA',16,4,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'ASE0009266M0',16,9,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'TMG0302257Z6',17,15,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'ASF960710QR3',18,3,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'THE970303HE5',18,17,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'TMN610302T3A',19,5,'02/04/2019');
INSERT INTO D_CURSO VALUES(7,'RDC9906041X8',21,17,'02/04/2019');
INSERT INTO D_CURSO VALUES(8,'ARA990917AF0',5,10,'06/04/2019');
INSERT INTO D_CURSO VALUES(8,'AMI740520SP1',15,6,'06/04/2019');
INSERT INTO D_CURSO VALUES(8,'TGT890502Q39',16,16,'06/04/2019');
INSERT INTO D_CURSO VALUES(8,'THE980420RK3',16,12,'06/04/2019');
INSERT INTO D_CURSO VALUES(8,'TMU9904122W6',18,15,'06/04/2019');
INSERT INTO D_CURSO VALUES(8,'TGR670313N15',18,9,'06/04/2019');
INSERT INTO D_CURSO VALUES(8,'ASM040121SE2',18,17,'06/04/2019');
INSERT INTO D_CURSO VALUES(8,'TMI021011976',18,13,'06/04/2019');
INSERT INTO D_CURSO VALUES(8,'ARA930625LM0',21,14,'06/04/2019');
INSERT INTO D_CURSO VALUES(8,'RDC9906041X8',21,12,'06/04/2019');
INSERT INTO D_CURSO VALUES(8,'AMT970606V64',21,4,'06/04/2019');
INSERT INTO D_CURSO VALUES(9,'CHU01109TG8',2,17,'30/07/2019');
INSERT INTO D_CURSO VALUES(9,'TGA980606238',11,2,'30/07/2019');
INSERT INTO D_CURSO VALUES(9,'QKR940722B31',13,16,'30/07/2019');
INSERT INTO D_CURSO VALUES(9,'APL040619PF6',16,11,'30/07/2019');
INSERT INTO D_CURSO VALUES(10,'APL040619PF6',1,5,'15/02/2019');
INSERT INTO D_CURSO VALUES(10,'TET981216350',6,13,'15/02/2019');
INSERT INTO D_CURSO VALUES(10,'REX970521MTA',7,3,'15/02/2019');
INSERT INTO D_CURSO VALUES(10,'RAL931116MI0',9,18,'15/02/2019');
INSERT INTO D_CURSO VALUES(10,'TNI-960730HV',15,14,'15/02/2019');
INSERT INTO D_CURSO VALUES(10,'ASS990416FT8',16,17,'15/02/2019');
INSERT INTO D_CURSO VALUES(10,'ASE950901TIA',17,5,'15/02/2019');
INSERT INTO D_CURSO VALUES(11,'RIM000403C53',1,16,'22/02/2019');
INSERT INTO D_CURSO VALUES(11,'TIC0210223CA',2,13,'22/02/2019');
INSERT INTO D_CURSO VALUES(11,'TID030228HG1',6,8,'22/02/2019');
INSERT INTO D_CURSO VALUES(11,'CIN921207MSA',6,8,'22/02/2019');
INSERT INTO D_CURSO VALUES(11,'AME021217161',6,16,'22/02/2019');
INSERT INTO D_CURSO VALUES(11,'ALB8111268Q8',10,7,'22/02/2019');
INSERT INTO D_CURSO VALUES(11,'TGA021128CE2',11,8,'22/02/2019');
INSERT INTO D_CURSO VALUES(11,'APN050322HY6',17,12,'22/02/2019');
INSERT INTO D_CURSO VALUES(11,'APR0305058L2',18,6,'22/02/2019');
INSERT INTO D_CURSO VALUES(11,'ASG970521JP5',21,13,'22/02/2019');
INSERT INTO D_CURSO VALUES(11,'CG990701 SOC',21,2,'22/02/2019');
INSERT INTO D_CURSO VALUES(12,'TMU050114BE8',1,15,'26/11/2019');
INSERT INTO D_CURSO VALUES(12,'TID030228HG1',5,11,'26/11/2019');
INSERT INTO D_CURSO VALUES(12,'ASR770801G51',13,17,'26/11/2019');
INSERT INTO D_CURSO VALUES(13,'ASG970521JP5',1,7,'12/05/2019');
INSERT INTO D_CURSO VALUES(13,'APN050322HY6',2,15,'12/05/2019');
INSERT INTO D_CURSO VALUES(13,'REV050325FM6',5,17,'12/05/2019');
INSERT INTO D_CURSO VALUES(13,'TEX020731LI7',6,16,'12/05/2019');
INSERT INTO D_CURSO VALUES(13,'THI980317M55',13,10,'12/05/2019');
INSERT INTO D_CURSO VALUES(14,'TMR961128QE5',1,8,'19/08/2019');
INSERT INTO D_CURSO VALUES(14,'REC960419DL9',2,14,'19/08/2019');
INSERT INTO D_CURSO VALUES(14,'RIN020201I27',2,6,'19/08/2019');
INSERT INTO D_CURSO VALUES(14,'REN04071486A',3,1,'19/08/2019');
INSERT INTO D_CURSO VALUES(14,'RLN0301213W0',3,4,'19/08/2019');
INSERT INTO D_CURSO VALUES(14,'TMJ900911N93',5,11,'19/08/2019');
INSERT INTO D_CURSO VALUES(14,'TGO501017QH7',9,18,'19/08/2019');
INSERT INTO D_CURSO VALUES(14,'AMI740520SP1',10,1,'19/08/2019');
INSERT INTO D_CURSO VALUES(14,'TFA980912VEA',14,10,'19/08/2019');
INSERT INTO D_CURSO VALUES(14,'CLR940317645',20,16,'19/08/2019');
INSERT INTO D_CURSO VALUES(15,'TGA980606238',7,15,'04/05/2019');
INSERT INTO D_CURSO VALUES(15,'TFE980630M94',7,11,'04/05/2019');
INSERT INTO D_CURSO VALUES(15,'AME980128HP8',11,1,'04/05/2019');
INSERT INTO D_CURSO VALUES(15,'TGR670313N15',12,18,'04/05/2019');
INSERT INTO D_CURSO VALUES(15,'RDI970813D48',13,3,'04/05/2019');
INSERT INTO D_CURSO VALUES(15,'PVI880628788',16,2,'04/05/2019');
INSERT INTO D_CURSO VALUES(15,'AMI001006MB2',20,18,'04/05/2019');
INSERT INTO D_CURSO VALUES(15,'ALC891113UIA',20,11,'04/05/2019');
INSERT INTO D_CURSO VALUES(16,'ARA960918HC5',10,9,'21/09/2019');
INSERT INTO D_CURSO VALUES(16,'THE980420RK3',13,14,'21/09/2019');
INSERT INTO D_CURSO VALUES(16,'ALO881003R85',20,3,'21/09/2019');
INSERT INTO D_CURSO VALUES(17,'CFN930804T32',1,14,'25/11/2019');
INSERT INTO D_CURSO VALUES(17,'TET7611019P5',2,6,'25/11/2019');
INSERT INTO D_CURSO VALUES(17,'CIP9107094G4',3,14,'25/11/2019');
INSERT INTO D_CURSO VALUES(17,'TMS751125P41',4,16,'25/11/2019');
INSERT INTO D_CURSO VALUES(17,'TMZ051024LT0',4,13,'25/11/2019');
INSERT INTO D_CURSO VALUES(17,'QKR940722B31',12,9,'25/11/2019');
INSERT INTO D_CURSO VALUES(17,'ASR770801G51',20,6,'25/11/2019');
INSERT INTO D_CURSO VALUES(18,'TMI971031N52',2,10,'29/03/2019');
INSERT INTO D_CURSO VALUES(18,'ASE950901TIA',4,16,'29/03/2019');
INSERT INTO D_CURSO VALUES(18,'TNG940915J47',4,17,'29/03/2019');
INSERT INTO D_CURSO VALUES(18,'ASJ930415P18',6,6,'29/03/2019');
INSERT INTO D_CURSO VALUES(18,'APE9508042S0',20,13,'29/03/2019');
INSERT INTO D_CURSO VALUES(19,'RES971009E10',4,16,'07/07/2019');
INSERT INTO D_CURSO VALUES(19,'CIN921207MSA',7,18,'07/07/2019');
INSERT INTO D_CURSO VALUES(19,'RLO001121I15',10,16,'07/07/2019');
INSERT INTO D_CURSO VALUES(19,'TFM990316GW0',15,7,'07/07/2019');
INSERT INTO D_CURSO VALUES(19,'TET7611019P5',18,15,'07/07/2019');
INSERT INTO D_CURSO VALUES(19,'CME9607127I6',21,12,'07/07/2019');
INSERT INTO D_CURSO VALUES(20,'AJU920926IJO',3,8,'30/10/2019');
INSERT INTO D_CURSO VALUES(20,'TEX030403NC8',10,7,'30/10/2019');
INSERT INTO D_CURSO VALUES(20,'RDD940518SS4',10,2,'30/10/2019');
INSERT INTO D_CURSO VALUES(20,'ASA950105MX8',13,1,'30/10/2019');
INSERT INTO D_CURSO VALUES(20,'ARA0405277P6',13,4,'30/10/2019');
INSERT INTO D_CURSO VALUES(20,'TNO0107062V8',14,7,'30/10/2019');
INSERT INTO D_CURSO VALUES(20,'TNA740805SG9',18,17,'30/10/2019');
INSERT INTO D_CURSO VALUES(20,'CLR940317645',20,13,'30/10/2019');
INSERT INTO D_CURSO VALUES(20,'ALR740107PS9',21,18,'30/10/2019');
INSERT INTO D_CURSO VALUES(20,'AJO960709A44',21,2,'30/10/2019');
INSERT INTO D_CURSO VALUES(20,'ALU891214FE9',21,11,'30/10/2019');

SELECT * FROM PERSONA;
SELECT * FROM CURSO;
SELECT * FROM D_CURSO;
SELECT * FROM ZONA_DEPTO;
SELECT * FROM ZONA;
SELECT * FROM ESPECIALIDAD;
SELECT * FROM DEPTO;
SELECT * FROM PAIS;


select sueldo from persona
where rfc='TME9702079L5';

select * from persona
where sueldo > 15000;

select * from persona
where sueldo > (select sueldo from persona
                where rfc='TME9702079L5');

select id_pais, sum(sueldo) from persona
group by id_pais
order by sum(sueldo);

select id_pais, sum(sueldo) from persona
group by id_pais 
having sum(sueldo) >1;

select id_pais, sum(sueldo) from persona
group by id_pais;

select id_pais, avg(sueldo) from persona 
group by id_pais
having avg(sueldo) > (select avg(sueldo) from persona);

select * from especialidad;
select * from pais;

select nombre from pais
where id_pais = (select id_especialidad from especialidad
                where nombre = 'REDES');


SELECT NOMBRE FROM ESPECIALIDAD
 WHERE ID_ESPECIALIDAD =(select ID_CURSO from curso
    where id_curso=(select ID_ZONA from zona
        where id_zona = (select count (area) from depto )));



--CON WHERE
-- Personas que son de paises con IVA mayor al 0.16
SELECT NOMBRE, APELLIDO, ID_PAIS FROM PERSONA
WHERE ID_PAIS > (SELECT ID_PAIS FROM PAIS
				 WHERE IVA = 0.16);

-- EL area que tenga el mismo id_departamento que el cupo de una zona 
SELECT AREA FROM DEPTO
WHERE ID_DEPTO = (SELECT ID_ZONA FROM ZONA WHERE CUPO = 28);

-- Nombre del curso que tenga el mismo identificador que la especialidad Graficos.
SELECT NOMBRE FROM CURSO
WHERE ID_ESPECIALIDAD = (SELECT ID_ESPECIALIDAD FROM ESPECIALIDAD WHERE NOMBRE ='GRAFICOS');


--CON WHERE Y HAVING
--Cursos mas caros para las personas con mas sueldo en el pais 1
SELECT ID_CURSO, MAX(COSTO) AS COSTO_MAX
FROM CURSO
GROUP BY ID_CURSO, COSTO
HAVING COSTO > (SELECT MAX(SUELDO) FROM PERSONA	
				WHERE ID_PAIS = 1);



--CON HAVING
-- estos son :v
--Nombre y maximo del id de especialidad agrupando por el nombre conde el max del id sea
--igual al minimo del id de curso de la tabla curso
select nombre,MAX(id_especialidad) from
especialidad group by NOMBRE
having MAX(id_especialidad) = (SELECT MIN(ID_CURSO) FROM CURSO);


-- Numero de pais y la suma de puesto que sea mayor al promedio de los cursos.
select id_pais, sum(sueldo) from persona
group by id_pais
having sum(sueldo)> (select avg(costo) from CURSO);
--

SELECT ID_PAIS, RFC, NOMBRE, APELLIDO FROM PERSONA
WHERE ID_PAIS = 2;

select area,max(id_depto) as NUM_DEPTO from depto
group by area 
having max(id_depto) = 5;

SELECT * FROM CURSO;

select id_pais, avg(sueldo) from persona 
group by id_pais
having avg(sueldo) > (select avg(sueldo) from persona);

select * from CURSO;

