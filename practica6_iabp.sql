create database practica6_iabp;
use practica6_iabp;


create table hospital(
codHospital			numeric(3),
nombreHosp			varchar(40),
num_camas			numeric(3),
delegacion			varchar(50),
CONSTRAINT PK_HOSPITAL PRIMARY KEY (codHospital)
);

create table TelefonoHospital(
codHospital			numeric(3),
telefono			numeric(9),
CONSTRAINT PK_TELEFONOHOS PRIMARY KEY (codHospital, telefono),
CONSTRAINT FK_TELEHOS FOREIGN KEY (codHospital) REFERENCES HOSPITAL (codHospital)
);

create table medico(
RFC					varchar(14),
nombreMed			varchar(40),
apPaterno			varchar(40),
apMaterno			varchar(40),
fecha_nacimiento	varchar(8),
CONSTRAINT PK_MEDICO PRIMARY KEY (RFC),
CONSTRAINT FK_MED FOREIGN KEY (RFC) REFERENCES MEDICO (RFC)
);

create table especialidad(
ID_servicio			numeric(3),
nombre_serv			varchar(30),
comentario			varchar(200),
num_camas_libres	numeric(3),
codHospital			numeric(3),
RFC					varchar(14),
CONSTRAINT PK_ESPECIALIDAD PRIMARY KEY (ID_servicio),
CONSTRAINT FK_HOSP_ESPECIALIDAD FOREIGN KEY (codHospital) REFERENCES HOSPITAL (codHospital),
CONSTRAINT FK_MED_ESPECIALIDAD FOREIGN KEY (RFC) REFERENCES MEDICO (RFC)
);

create table historia_medica(
numSS				numeric(9),
num_visitas			numeric(3),
carnet				varchar(70)
CONSTRAINT PK_HISM PRIMARY KEY (numSS)
);

create table visita(
ID_visita			numeric(2),
fechaVisita			varchar(8),
horaVisita			varchar(5),
CONSTRAINT PK_VISITA PRIMARY KEY (ID_visita)
);

create table internado(
num_habitacion		numeric(3),
fecha_salida		varchar(8),
ID_visita			numeric(2),
CONSTRAINT PK_INTERNADO PRIMARY KEY (num_habitacion),
CONSTRAINT FK_INTD_VISA	FOREIGN KEY (ID_visita) REFERENCES VISITA (ID_visita)
);


create table paciente(
CURP				varchar(18),
nombrePaciente		varchar(40),
apPaternoPaciente	varchar(40),
apMaternoPaciente	varchar(40),
fecha_nac_pac		varchar(8),
genero				varchar(1),
RFC_pac				varchar(14),
num_habitacion		numeric(3),
CONSTRAINT PK_PACIENTE PRIMARY KEY (CURP),
CONSTRAINT FK_PAC_PACIENTE FOREIGN KEY (CURP) REFERENCES PACIENTE (CURP),
CONSTRAINT FK_PAC_INTD FOREIGN KEY (num_habitacion) REFERENCES INTERNADO (num_habitacion),
CONSTRAINT CK_GENERO CHECK (GENERO IN('F','M','S'))
);

create table cita(
numCita				numeric(3),
fechCita			varchar(8),
horaCita			varchar(5),
tratamiento			varchar(100),
diagnostico			varchar(100),
numSS				numeric(9),
CURP				varchar(18),
CONSTRAINT PK_CITA PRIMARY KEY (numCita),
CONSTRAINT FK_CITA_HISM FOREIGN KEY (numSS) REFERENCES historia_medica (numSS),
CONSTRAINT PK_CITA_PACE FOREIGN KEY (CURP) REFERENCES PACIENTE (CURP)
);

insert into hospital values (786,'Hospital Angeles',035,'Migue Hidalgo');
insert into hospital values (786,'San Bernardo',104,'Ecatepec');

