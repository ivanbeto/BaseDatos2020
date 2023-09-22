SQL>--Proyecto Bases de Datos    Grupo:01
SQL>--Integrantes de equipo:
SQL>-- Aguillon Castellanos Christian Geovanni
SQL>-- Beto Perez Ivan
SQL>-- Gomez Gonzalez Josue
SQL>-- Hernandez Torres Ricardo Antonio
SQL>
SQL>--CREACION DE LAS TABLAS
SQL>--Tabla TIPOLECTOR
SQL> CREATE TABLE TipoLector(
  2  tipoLector VarChar2(30),
  3  limiteMat Number(2) NOT NULL,
  4  diasPrestamo Number(2) NOT NULL,
  5  refrendos Number(2) NOT NULL,
  6  CONSTRAINT PK_TLector PRIMARY KEY (TipoLector)
  7  );

Table created.

SQL> --Creacion de la Tabla LECTOR 
SQL> CREATE TABLE Lector(
  2  id_Lector NUMBER(10),
  3  nomLec VARCHAR2(15) NOT NULL,
  4  patLec VARCHAR2(15) NOT NULL,
  5  matLec VARCHAR2(15),
  6  calleLec VARCHAR2(15) NOT NULL,
  7  colLec VARCHAR2(15) NOT NULL,
  8  delLec VARCHAR2(15) NOT NULL,
  9  telefonoLec NUMBER(10) NOT NULL,
 10  adeudo NUMBER(10),
 11  fechaVigen DATE DEFAULT SYSDATE + INTERVAL '1' YEAR,
 12  fechaAlta DATE DEFAULT SYSDATE NOT NULL,
 13  tipoLector VARCHAR2(30) NOT NULL,
 14  CONSTRAINT PK_Lector PRIMARY KEY (id_Lector),
 15  CONSTRAINT FK_Lector_TLector FOREIGN KEY (tipoLector) REFERENCES TipoLector
 16  );

Table created.

SQL> 
SQL> --Creacion de la Tabla MATERIAL
SQL> CREATE TABLE Material(
  2  id_material NUMBER(10),
  3  titulo VarChar2(30) NOT NULL,
  4  colocacion VarChar2(20) NOT NULL,
  5  ubicacion VarChar2(30) NOT NULL,
  6  tipoMaterial VarChar2(20) NOT NULL,
  7  CONSTRAINT PK_Material PRIMARY KEY (id_Material),
  8  CONSTRAINT CK_Material_TipoMaterial CHECK (tipoMaterial IN('Tesis','Libro'))
  9  );

Table created.

SQL> 
SQL> --Creacion de la Tabla LIBRO
SQL> CREATE TABLE Libro(
  2  id_material NUMBER(10),
  3  ISBN VarChar2(20) NOT NULL,
  4  numAdqui Number(10) NOT NULL,
  5  edicion VarChar2(20) NOT NULL,
  6  tema VarChar2(20) NOT NULL,
  7  CONSTRAINT PK_Libro PRIMARY KEY (id_Material),
  8  CONSTRAINT FK_Libro_Material FOREIGN KEY (id_Material) REFERENCES Material,
  9  CONSTRAINT U_LIB_ISBN UNIQUE (ISBN),
 10  CONSTRAINT U_LIB_NumAdqui UNIQUE (numAdqui)
 11  );

Table created.

SQL> 
SQL> --Creacion de la Tabla DIRECTOR
SQL> CREATE TABLE Director(
  2  id_director NUMBER(10) NOT NULL,
  3  gradoAca VARCHAR2(20) NOT NULL,
  4  nomDir VARCHAR2(20) NOT NULL,
  5  patDir VARCHAR2(20) NOT NULL,
  6  matDir VARCHAR2(20),
  7  CONSTRAINT PK_Director PRIMARY KEY (id_director)
  8  );

Table created.

SQL> 
SQL> --Creacion de la Tabla TESIS
SQL> CREATE TABLE Tesis(
  2  id_material NUMBER(10),
  3  id_tesis NUMBER(20) NOT NULL,
  4  anioPub Number(4) NOT NULL,
  5  carrera VarChar2(20) NOT NULL,
  6  id_director NUMBER(10) NOT NULL,
  7  CONSTRAINT PK_Tesis PRIMARY KEY (id_Material),
  8  CONSTRAINT FK_Tesis_Material FOREIGN KEY (id_Material) REFERENCES Material,
  9  CONSTRAINT FK_Tesis_Director FOREIGN KEY (id_director) REFERENCES Director,
 10  CONSTRAINT U_Tesis_idTesis UNIQUE (id_Tesis)
 11  );

Table created.

SQL> 
SQL> --Creacion de la tabla AUTOR
SQL> CREATE TABLE Autor(
  2  claveAutor NUMBER(10),
  3  nomAutor VarChar2(20) NOT NULL,
  4  patAutor VarChar2(20) NOT NULL,
  5  matDir VarChar2(20),
  6  nacionalidad VarChar2(20) NOT NULL,
  7  CONSTRAINT PK_Autor PRIMARY KEY (claveAutor)
  8  );

Table created.

SQL> 
SQL> --Creacion de la tabla CUENTA
SQL> CREATE TABLE Cuenta(
  2  id_material NUMBER(10),
  3  claveAutor NUMBER(10),
  4  CONSTRAINT PK_Cuenta PRIMARY KEY (id_Material,claveAutor),
  5  CONSTRAINT FK_Cuenta_Material FOREIGN KEY (id_Material) REFERENCES Material,
  6  CONSTRAINT FK_Cuenta_Autor FOREIGN KEY (claveAutor) REFERENCES Autor
  7  );

Table created.

SQL> 
SQL> --Creacion de la tabla de EJEMPLAR
SQL> CREATE TABLE Ejemplar(
  2  id_material NUMBER(10),
  3  numEjemplar NUMBER(10),
  4  estatus VARCHAR2(30) NOT NULL,
  5  CONSTRAINT PK_Ejemplar PRIMARY KEY (id_Material,numEjemplar),
  6  CONSTRAINT FK_Ejemplar_Material FOREIGN KEY (id_Material) REFERENCES Material,
  7  CONSTRAINT CK_Ejemplar_Estatus CHECK (Estatus IN('Disponible','No sale','Prestamo','Mantenimiento'))
  8  );

Table created.

SQL> 
SQL> --Creacion de la tabla PRESTAMO
SQL> CREATE TABLE Prestamo(
  2  fechaPrestamo DATE DEFAULT SYSDATE,
  3  id_Lector NUMBER(10),
  4  numEjemplar NUMBER(10),
  5  id_material NUMBER(10),
  6  fechaDevolucion DATE,
  7  fechaVenPrest DATE,
  8  monto NUMBER(10),
  9  fechaMulta Date,
 10  numRefrendo NUMBER(3),
 11  diasAtraso NUMBER(4),
 12  fechaRefrendo DATE DEFAULT SYSDATE NOT NULL,
 13  CONSTRAINT PK_Prestamo PRIMARY KEY (id_Material,numEjemplar,fechaPrestamo,id_lector),
 14  CONSTRAINT FK_Prestamo_Ejemplar FOREIGN KEY (id_Material,numEjemplar) REFERENCES Ejemplar,
 15  CONSTRAINT FK_Prestamo_Lector FOREIGN KEY (id_Lector) REFERENCES Lector
 16  );

Table created.

SQL> 
SQL> --Vista de los lectores que tienen prestamos
SQL> CREATE VIEW LectoresPrestamo AS
  2  SELECT e.id_lector, (e.nomLec||' '|| e.patLec) AS Nombre,
  3  p.numEjemplar, p.id_Material, p.fechaPrestamo,
  4  p.fechaVenPrest, p.numRefrendo
  5  FROM lector e
  6  Join Prestamo p
  7  on e.id_lector=p.id_lector;

View created.

SQL> 
SQL> --Vista de los libros de material
SQL> CREATE VIEW MaterialLibro AS
  2  SELECT m.id_material AS ID, m.tipoMaterial, m.titulo,
  3  l.tema, l.ISBN
  4  FROM Material m
  5  Join Libro l
  6  on M.id_Material=L.id_Material;

View created.

SQL> --Vista de las tesis de material
SQL> CREATE VIEW MaterialTesis AS
  2  SELECT m.id_material AS ID, m.tipoMaterial, m.titulo,
  3  t.carrera, (d.nomDir||' '|| d.patDir) AS nombre
  4  FROM Material m
  5  Join Tesis t
  6  on m.id_Material=t.id_Material
  7  Join Director d
  8  on t.id_Director=d.id_Director;

View created.

SQL> --Procedure que se encarga de la insercion de los tipos de lectores
SQL> CREATE OR REPLACE PROCEDURE spInsertTYPELEC(
  2  vTipo IN tipoLector.tipoLector%TYPE,
  3  vlimite IN tipoLector.limiteMat%TYPE,
  4  vDias IN tipoLector.diasPrestamo%TYPE,
  5  vRefrendos IN tipoLector.refrendos%TYPE)
  6  AS
  7  BEGIN
  8   INSERT INTO TIPOLECTOR VALUES(vTipo,vlimite,vDias,vRefrendos);
  9   COMMIT;
 10   DBMS_OUTPUT.PUT_LINE('TIPO LECTOR A¥ADIDO: '||vTipo);
 11  END spInsertTYPELEC;
 12  /

Procedure created.

SQL> --Ejecuciones del procedure anterior
SQL> EXEC spInsertTYPELEC('Estudiante', 3,8,1);

PL/SQL procedure successfully completed.

SQL> EXEC spInsertTYPELEC('Profesor', 5,15,2) ;

PL/SQL procedure successfully completed.

SQL> EXEC spInsertTYPELEC('Investigador', 10,30,3);

PL/SQL procedure successfully completed.

SQL> create sequence idLector
  2    start with 1
  3    increment by 1
  4    maxvalue 100000
  5    nocycle;

Sequence created.

SQL> --Procedure que realiza la insercion de los lectores a la tabla LECTOR
SQL> CREATE OR REPLACE PROCEDURE spInsertLector (
  2  vNombre IN Lector.nomLec%TYPE,
  3  vApPat IN Lector.patLec%TYPE,
  4  vApMat IN Lector.matLec%TYPE,
  5  vCalle IN Lector.calleLec%TYPE,
  6  vCol IN Lector.colLec%TYPE,
  7  vDel IN Lector.delLec%TYPE,
  8  vTelefono IN Lector.TelefonoLec%TYPE,
  9  vTipoLector IN Lector.tipoLector%TYPE)
 10  AS
 11  vId Lector.Id_Lector%TYPE := IDLECTOR.NEXTVAL;
 12  BEGIN
 13  INSERT INTO Lector (id_lector,nomLec,patLec,matLec,calleLec,ColLec,delLec,telefonoLec,tipoLector)
 14  VALUES(vId,vNombre,vApPat,vApMat,vCalle,vCol,vDel,vTelefono,vTipoLector);
 15  COMMIT;
 16  DBMS_OUTPUT.PUT_LINE('Lector creado: '||vNombre);
 17  END spInsertLector;
 18  /

Procedure created.

SQL> EXEC spInsertLector ('Juan','Alvarez','Ramirez','Juarez','San Pedro','Miguel Hidalgp',5560602045,'Estudiante');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertLector ('Pedro','Sanchez','Torres','numero 1','San Juan','xochimilco',5576625641,'Estudiante');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertLector ('Han','Solo','Ramirez','Skywalker','StarOfDead','Luna',5545657812,'Investigador');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertLector ('Josue','Beto','Torres','Quimica','El Rosario','Azcapotzalco',5598666411,'Profesor');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertLector ('Enrique','Sanchez','Ramirez','Fisica','El Rosario','Azcapotzalco',5556566411,'Profesor');

PL/SQL procedure successfully completed.


SQL> --Secuencia para la llave primaria de material
SQL> create sequence idMaterial
  2    start with 1
  3    increment by 1
  4    maxvalue 100000
  5    nocycle;

Sequence created.

SQL> --Procedure que utiliza la secuencia anterior para la insercion de material a la tabla MATERIAL
SQL> CREATE OR REPLACE PROCEDURE spInsertMaterial(
  2  vTitulo IN Material.titulo%TYPE,
  3  vColocacion IN Material.colocacion%TYPE,
  4  vUbicacion IN Material.ubicacion%TYPE,
  5  vtipoMaterial IN Material.tipoMaterial%TYPE)
  6  AS
  7  vid Material.id_material%TYPE:=idMaterial.NEXTVAL;
  8  BEGIN
  9   INSERT INTO Material VALUES(vid,vtitulo,vColocacion,vUbicacion,vTipoMaterial);
 10   COMMIT;
 11   DBMS_OUTPUT.PUT_LINE('Material A¥ADIDO: '||vTitulo);
 12  END spInsertMaterial;
 13  /

Procedure created.

SQL> --Ejecuciones del procedimiento de insercion de material
SQL> EXEC spInsertMaterial('Ecuaciones Diferenciales','110','UAT08R','Libro');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertMaterial('Matematicas','100','UAT76C','Libro');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertMaterial('Termodinamica','210','QBT34N','Libro');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertMaterial('EDA II','300','BNR93N','Libro');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertMaterial('Mec nica','420','NSA34I','Libro');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertMaterial('Datasheet','333','BAS34N','Tesis');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertMaterial('Funcion del corazon','323','BNR43N','Tesis');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertMaterial('Leyes a Futuro','520','BDE34I','Tesis');

PL/SQL procedure successfully completed.

SQL> 
SQL> --Procedure que realiza la insercion de libros en su respectiva tabla LIBRO
SQL> CREATE OR REPLACE PROCEDURE spInsertLibro(
  2  vid IN Libro.id_material%TYPE,
  3  vISBN IN Libro.ISBN%TYPE,
  4  vNumAdqui IN Libro.numAdqui%TYPE,
  5  vEdicion IN Libro.edicion%TYPE,
  6  vTema IN Libro.Tema%TYPE)
  7  AS
  8  BEGIN
  9  INSERT INTO LIBRO VALUES(vid,vISBN,vNumAdqui,vEdicion,vTema);
 10  COMMIT;
 11  DBMS_OUTPUT.PUT_LINE('Libro A¥ADIDO: '||vISBN);
 12  END spInsertLibro;
 13  /

Procedure created.

SQL> --Ejecuciones de inserciones de libros
SQL> EXEC spInsertLibro('1','978-75638894',10903,'Primera Edicion','Laplace');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertLibro('2','946-75284622',97197,'Segunda Edicion','Operaciones Basicas');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertLibro('3','857-21414238',56723,'Octava Edicion','Introduccion');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertLibro('4','264-84254721',2646,'Decima Edicion','Estructuras');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertLibro('5','563-93529524',12121,'Tercera Edicion','Tiro Parabolico');

PL/SQL procedure successfully completed.

SQL> --Secuencia para la llave primaria de director
SQL> create sequence idDirector
  2    start with 1
  3    increment by 1
  4    maxvalue 100000
  5    nocycle;

Sequence created.

SQL> --Procedure que utiliza la secuencia anterior para la insercion de directores a su tabla DIRECTOR
SQL> CREATE OR REPLACE PROCEDURE spInsertDirector(
  2  vgradoAca IN Director.gradoAca%TYPE,
  3  vNomDir IN Director.NomDir%TYPE,
  4  vPatDir IN Director.PatDir%TYPE,
  5  vMatDir IN Director.MatDir%TYPE)
  6  AS
  7  vid Director.id_director%TYPE :=idDirector.NEXTVAL;
  8  BEGIN
  9  INSERT INTO Director VALUES(vid,vGradoAca,vNomDir,vPatDir,vMatDir);
 10  COMMIT;
 11  DBMS_OUTPUT.PUT_LINE('Director A¥ADIDO: '||vNomDir);
 12  END spInsertDirector;
 13  /

Procedure created.

SQL> --Ejecuciones de insercion de directores
SQL> EXEC spInsertDirector('Licenciado','Segismundo','Garcia','Aguilar');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertDirector('Licenciado','Horacio','P‚rez','De Leon');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertDirector('Maestro','Gustabo','Garcia','Castillo');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertDirector('Doctor','Jack','Conway','');

PL/SQL procedure successfully completed.

SQL> --Procedure que se encarga de hacer inserciones de tesis en su tabla TESIS
SQL> CREATE OR REPLACE PROCEDURE spTesis(
  2  vidM IN Tesis.id_Material%TYPE,
  3  vidT IN Tesis.id_Tesis%TYPE,
  4  vAnioPub IN Tesis.anioPub%TYPE,
  5  vCarrera IN Tesis.carrera%TYPE,
  6  vidD IN Tesis.id_director%TYPE)
  7  AS
  8  BEGIN
  9  INSERT INTO Tesis VALUES(vidM,vidT,vAnioPub,vCarrera,vidD);
 10  COMMIT;
 11  DBMS_OUTPUT.PUT_LINE('Tesis A¥ADIDA: '||vIDM);
 12  END spTesis;
 13  /

Procedure created.

SQL> --Ejemplos de ejecucion del procedure
SQL> EXEC spTesis(6,7462,2015,'Ing. Comput',1);

PL/SQL procedure successfully completed.

SQL> EXEC spTesis(7,2528,2011,'Medicina',2);

PL/SQL procedure successfully completed.

SQL> EXEC spTesis(8,3823,2014,'Derecho',4);

PL/SQL procedure successfully completed.

SQL> --Secuencia que se usa para la llave primaria de Autor.
SQL> create sequence idAutor
  2    start with 1
  3    increment by 1
  4    maxvalue 100000
  5    nocycle;

Sequence created.

SQL> --Procedure que utiliza la secuencia anterior para la inserción de autores en la tabla AUTOR.
SQL> CREATE OR REPLACE PROCEDURE spInsertAutor(
  2  vNomAutor IN Autor.NomAutor%TYPE,
  3  vPatAutor IN Autor.patAutor%TYPE,
  4  vMatAutor IN Autor.matDir%TYPE,
  5  vNacionalidad IN Autor.Nacionalidad%TYPE)
  6  AS
  7  vClaveAutor Autor.claveAutor%TYPE :=idAutor.NEXTVAL;
  8  BEGIN
  9  INSERT INTO Autor VALUES(vClaveAutor,vNomAutor,vPatAutor,vMatAutor,vNacionalidad);
 10  COMMIT;
 11  DBMS_OUTPUT.PUT_LINE('Autor ANADIDO: '||vNomAutor);
 12  END spInsertAutor;
 13  /

Procedure created.

SQL> --Ejecucion del procedure de autores
SQL> EXEC spInsertAutor('Josue','Gomez','Gonzalez','Senegal');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertAutor('Christian','Aguillon','Castellanos','Madagascar');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertAutor('Ricardo','Hernandez','Torres','Dominicano');

PL/SQL procedure successfully completed.

SQL> EXEC spInsertAutor('Ivan','Beto','Perez','Canadiense');

PL/SQL procedure successfully completed.

SQL> 
SQL> --Procedimiento para la tabla de la relacion entre las tablas AUTOR y MATERIAL
SQL> CREATE OR REPLACE PROCEDURE spCuenta(
  2  vidM IN Cuenta.id_Material%TYPE,
  3  vClaveAutor IN Cuenta.claveAutor%TYPE)
  4  AS
  5  BEGIN
  6  INSERT INTO Cuenta VALUES(vidM,vClaveAutor);
  7  COMMIT;
  8  DBMS_OUTPUT.PUT_LINE('Cuenta ANADIDA: '||vIDM);
  9  END spCuenta;
 10  /

Procedure created.

SQL> --Ejemplos de ejecucion del procedure
SQL> EXEC spCuenta(1,2);

PL/SQL procedure successfully completed.

SQL> EXEC spCuenta(2,2);

PL/SQL procedure successfully completed.

SQL> EXEC spCuenta(3,3);

PL/SQL procedure successfully completed.

SQL> EXEC spCuenta(4,1);

PL/SQL procedure successfully completed.

SQL> EXEC spCuenta(5,4);

PL/SQL procedure successfully completed.

SQL> 
SQL> --Creacion del procedimiento para la insercion de ejemplares en la tabla de EJEMPLAR
SQL> CREATE OR REPLACE PROCEDURE spEjemplar(
  2  vidM IN Ejemplar.id_Material%TYPE,
  3  vNumEjemplar IN Ejemplar.numEjemplar%TYPE,
  4  vEstatus IN Ejemplar.Estatus%TYPE
  5  )
  6  AS
  7  BEGIN
  8  INSERT INTO Ejemplar VALUES(vidM,vNumEjemplar,vEstatus);
  9  COMMIT;
 10  DBMS_OUTPUT.PUT_LINE('Ejemplar A¥ADIDO');
 11  END spEjemplar;
 12  /

Procedure created.

SQL> 
SQL> --Ejecucion del procedimiento de insercion, con su estatus.
SQL> EXEC spEjemplar(1,1,'Disponible');

PL/SQL procedure successfully completed.

SQL> EXEC spEjemplar(1,2,'Disponible');

PL/SQL procedure successfully completed.

SQL> EXEC spEjemplar(1,3,'No sale');

PL/SQL procedure successfully completed.

SQL> EXEC spEjemplar(2,2,'Disponible');

PL/SQL procedure successfully completed.

SQL> EXEC spEjemplar(3,1,'Mantenimiento');

PL/SQL procedure successfully completed.

SQL> EXEC spEjemplar(4,1,'Disponible');

PL/SQL procedure successfully completed.

SQL> EXEC spEjemplar(5,1,'Disponible');

PL/SQL procedure successfully completed.

SQL> EXEC spEjemplar(6,1,'Mantenimiento');

PL/SQL procedure successfully completed.

SQL> EXEC spEjemplar(7,1,'Disponible');

PL/SQL procedure successfully completed.

SQL> EXEC spEjemplar(8,1,'Disponible');

PL/SQL procedure successfully completed.

SQL> EXEC spEjemplar(8,2,'Disponible');

PL/SQL procedure successfully completed.
                 
SQL> --Funcion que se encarga de calcular la multa correspondiente
SQL> CREATE OR REPLACE FUNCTION ftHayMulta(
  2  viL IN Prestamo.id_Lector%TYPE
  3  )
  4  RETURN NUMBER
  5  
  6  IS
  7  --Declaracion de las variables del procedure
  8  vDiasAtraso NUMBER;
  9  vfechaVenPrest DATE;
 10  vMulta NUMBER:=0;
 11  --Creacion del cursor encargado del calculo de la multa
 12  CURSOR cursorPrestamo
 13  IS
 14  SELECT fechaVenPrest
 15  FROM Prestamo
 16  WHERE id_Lector=viL
 17  AND (monto IS NULL OR monto > 0);
 18  
 19  
 20  BEGIN
 21  
 22  OPEN cursorPrestamo;
 23  LOOP
 24  FETCH cursorPrestamo
 25  INTO vfechaVenPrest;
 26  --Calculo de la multa
 27  IF vfechaVenPrest < SYSDATE THEN
 28  vMulta:=vMulta+1;
 29  END IF;
 30  EXIT WHEN cursorPrestamo%NOTFOUND;
 31  
 32  END LOOP;
 33  CLOSE cursorPrestamo;
 34  RETURN(vMulta);
 35  END ftHayMulta;
 36  /

Function created.

SQL> --Procedimiento que se encarga de asignar la multa a aquellos lectores que
SQL> --hicieron devolucion de algun material fuera de tiempo.
SQL> CREATE OR REPLACE PROCEDURE spMulta(
  2  viL IN Prestamo.id_Lector%TYPE
  3  )
  4  
  5  AS
  6  
  7  vDiasAtraso NUMBER(2);
  8  vmonto NUMBER:=0;
  9  vfechaVenPrest DATE;
 10  vidMaterial NUMBER(10);
 11  vNuEjem NUMBER(10);
 12  --Cursor que asigna la multa
 13  CURSOR cursorPrestamo
 14  IS
 15  SELECT fechaVenPrest,id_material,numEjemplar
 16  FROM Prestamo
 17  WHERE id_Lector=viL
 18  AND (monto IS NULL OR monto > 0);
 19  
 20  BEGIN
 21  OPEN cursorPrestamo;
 22  LOOP
 23  FETCH cursorPrestamo
 24  INTO vfechaVenPrest,vidMaterial,vNuEjem;
 25  
 26  IF vfechaVenPrest < SYSDATE THEN
 27  
 28  vDiasAtraso:=TRUNC(SYSDATE)-TRUNC(vfechaVenPrest);
 29  UPDATE Prestamo SET monto=vDiasAtraso*10,fechaMulta=SYSDATE,diasAtraso=vDiasAtraso
 30  WHERE id_Material=vidMaterial AND numEjemplar=vNuEjem AND id_lector=viL;
 31  
 32  END IF;
 33  
 34  EXIT WHEN cursorPrestamo%NOTFOUND;
 35  
 36  END LOOP;
 37  CLOSE cursorPrestamo;
 38  
 39  SELECT SUM(monto)
 40  INTO vmonto
 41  FROM Prestamo
 42  WHERE id_Lector=viL;
 43  
 44  UPDATE Lector SET adeudo=vmonto
 45  WHERE id_lector=viL;
 46  
 47  END spMulta;
 48  /

Procedure created.

SQL> --Procedure que realiza la insercion de los prestamos a la tabla PRESTAMO
SQL> CREATE OR REPLACE PROCEDURE spPrestamo(
  2  viL IN Prestamo.id_Lector%TYPE,
  3  vNumEjemplar IN Prestamo.numEjemplar%TYPE,
  4  viM IN Prestamo.id_Material%TYPE
  5  )
  6  
  7  AS
  8  --Variables de validacion
  9  vValLector NUMBER(10);
 10  vValEjemplar NUMBER(10);
 11  vfechaVigen DATE;
 12  vValNumEjemplar NUMBER(10);
 13  vValMulta NUMBER;
 14  vestatus VARCHAR2(30);
 15  vtipoLector VARCHAR2(30);
 16  vadeudo NUMBER(10);
 17  vlimiteMat Number(2);
 18  vrefrendos Number(2);
 19  vTotalPrestamos NUMBER(10);
 20  vdiasPrestamo Number(2);
 21  
 22  BEGIN
 23  --Se verifica que exista el material en su tabla
 24  SELECT SUM(id_material)
 25  INTO vValEjemplar
 26  FROM  Ejemplar
 27  WHERE exists
 28  (SELECT id_material
 29  FROM Ejemplar
 30  WHERE id_material=viM);
 31  --Se busca que el lector exista en la tabla de LECTOR.
 32  SELECT SUM(id_Lector)
 33  INTO vValLector
 34  FROM  Lector
 35  WHERE exists
 36  (SELECT id_Lector
 37  FROM LECTOR
 38  WHERE id_Lector=viL);
 39  --Se busca que exista el ejemplar en su tabla
 40  SELECT SUM(numEjemplar)
 41  INTO vValNumEjemplar
 42  FROM  Ejemplar
 43  WHERE exists
 44  (SELECT numEjemplar
 45  FROM Ejemplar
 46  WHERE numEjemplar=vNumEjemplar);
 47  
 48  
 49  --Verificaciones de existencia
 50  IF vValLector IS NULL THEN
 51  DBMS_OUTPUT.PUT_LINE('No existe el lector con id: '||viL);
 52  ELSIF vValEjemplar IS NULL THEN
 53  DBMS_OUTPUT.PUT_LINE('No existe el Material con id: '||viM);
 54  ELSIF vNumEjemplar IS NULL THEN
 55  DBMS_OUTPUT.PUT_LINE('No existe el Ejemplar con numero: '||vNumEjemplar);
 56  ELSE
 57  
 58  vValMulta:=ftHayMulta(viL);
 59  
 60  IF vValMulta>0 THEN
 61  spMulta(viL);
 62  END IF;
 63  
 64  SELECT fechaVigen
 65  INTO vfechaVigen
 66  FROM  Lector
 67  WHERE id_Lector=viL;
 68  
 69  SELECT estatus
 70  INTO vestatus
 71  FROM  Ejemplar
 72  WHERE id_material=viM AND numEjemplar=vNumEjemplar;
 73  
 74  SELECT adeudo,tipoLector
 75  INTO vadeudo,vtipoLector
 76  FROM LECTOR
 77  WHERE id_Lector=viL;
 78  
 79  SELECT limiteMat,diasPrestamo
 80  INTO vlimiteMat,vdiasPrestamo
 81  FROM TipoLector
 82  WHERE tipoLector=vtipoLector;
 83  
 84  SELECT COUNT(id_Lector)
 85  INTO vTotalPrestamos
 86  FROM Prestamo
 87  WHERE id_Lector=viL
 88  AND fechaDevolucion IS NULL;
 89  
 90  SELECT SUM(id_Lector)
 91  INTO vrefrendos
 92  FROM Prestamo
 93  WHERE id_Lector=viL
 94  AND id_material=viM
 95  AND numEjemplar=vNumEjemplar
 96  AND fechaDevolucion IS NULL;
 97  --Casos donde no se puede realizar un prestamo y Caso donde si se puede
 98  IF vfechaVigen < SYSDATE THEN
 99  DBMS_OUTPUT.PUT_LINE('Su suscripcion a expirado');
100  ELSIF vadeudo > 0 THEN
101  DBMS_OUTPUT.PUT_LINE('Usted tiene una multa de: '||vadeudo);
102  ELSIF vTotalPrestamos >= vlimiteMat THEN
103  DBMS_OUTPUT.PUT_LINE('Alcanzo el limite de materiales maximo: '||vlimiteMat);
104  ELSIF vrefrendos IS NOT NULL THEN
105  DBMS_OUTPUT.PUT_LINE('Usted ya tiene este material en prestamo');
106  ELSIF vestatus <>'Disponible' THEN
107  DBMS_OUTPUT.PUT_LINE('El material tiene el estatus '||vestatus||' ,no se puede prestar');
108  ELSE 
109  INSERT INTO Prestamo(id_Lector,numEjemplar,id_material,fechaVenPrest)
110  VALUES(viL,vNumEjemplar,viM,SYSDATE + vdiasPrestamo);
111  UPDATE Ejemplar SET estatus = 'Prestamo'
112  WHERE id_material=viM AND numEjemplar=vNumEjemplar;
113  COMMIT;
114  DBMS_OUTPUT.PUT_LINE('Prestamo HECHO');
115  END IF;
116  
117  END IF;
118  END spPrestamo;
119  /

Procedure created.

SQL> --Procedure que se encarga del manejo de los refrendos que tiene el lector dependiendo del tipo
SQL> CREATE OR REPLACE PROCEDURE spResello(
  2  viL IN Prestamo.id_Lector%TYPE,
  3  vNumEjemplar IN Prestamo.numEjemplar%TYPE,
  4  viM IN Prestamo.id_Material%TYPE
  5  )
  6  
  7  AS
  8  --Variables de validacion
  9  vValLector NUMBER(10);
 10  vValEjemplar NUMBER(10);
 11  vfechaVigen DATE;
 12  vValNumEjemplar NUMBER(10);
 13  vValPrestamo Number(2);
 14  vValMulta NUMBER;
 15  vestatus VARCHAR2(30);
 16  vtipoLector VARCHAR2(30);
 17  vadeudo NUMBER(10);
 18  vlimiteMat Number(2);
 19  vrefrendos Number(2);
 20  vTotalPrestamos NUMBER(10);
 21  vdiasPrestamo Number(2);
 22  vrefrendosActuales Number(2);
 23  vfechaVenPrest DATE;
 24  vcero NUMBER:=0;
 25  BEGIN
 26  --Comprobacion de existencia 
 27  SELECT SUM(id_material)
 28  INTO vValEjemplar
 29  FROM  Ejemplar
 30  WHERE exists
 31  (SELECT id_material
 32  FROM Ejemplar
 33  WHERE id_material=viM);
 34  
 35  SELECT SUM(id_Lector)
 36  INTO vValLector
 37  FROM  Lector
 38  WHERE exists
 39  (SELECT id_Lector
 40  FROM LECTOR
 41  WHERE id_Lector=viL);
 42  
 43  SELECT SUM(numEjemplar)
 44  INTO vValNumEjemplar
 45  FROM  Ejemplar
 46  WHERE exists
 47  (SELECT numEjemplar
 48  FROM Ejemplar
 49  WHERE numEjemplar=vNumEjemplar);
 50  
 51  IF vValLector IS NULL THEN
 52  DBMS_OUTPUT.PUT_LINE('No existe el lector con id: '||viL);
 53  ELSIF vValEjemplar IS NULL THEN
 54  DBMS_OUTPUT.PUT_LINE('No existe el Material con id: '||viM);
 55  ELSIF vNumEjemplar IS NULL THEN
 56  DBMS_OUTPUT.PUT_LINE('No existe el Ejemplar con numero: '||vNumEjemplar);
 57  ELSE
 58  --Uso de la funcion verificando si tiene multa el lector
 59  vValMulta:=ftHayMulta(viL);
 60  
 61  IF vValMulta>0 THEN
 62  spMulta(viL);
 63  END IF;
 64  
 65  SELECT fechaVigen
 66  INTO vfechaVigen
 67  FROM  Lector
 68  WHERE id_Lector=viL;
 69  
 70  SELECT estatus
 71  INTO vestatus
 72  FROM  Ejemplar
 73  WHERE id_material=viM AND numEjemplar=vNumEjemplar;
 74  
 75  SELECT adeudo,tipoLector
 76  INTO vadeudo,vtipoLector
 77  FROM LECTOR
 78  WHERE id_Lector=viL;
 79  
 80  SELECT limiteMat,refrendos,diasPrestamo
 81  INTO vlimiteMat,vrefrendos,vdiasPrestamo
 82  FROM TipoLector
 83  WHERE tipoLector=vtipoLector;
 84  
 85  SELECT SUM(id_Lector)
 86  INTO vValPrestamo
 87  FROM Prestamo
 88  WHERE id_Lector=viL
 89  AND id_material=viM
 90  AND numEjemplar=vNumEjemplar
 91  AND fechaDevolucion IS NULL;
 92  
 93  IF vfechaVigen < SYSDATE THEN
 94  DBMS_OUTPUT.PUT_LINE('Su suscripcion a expirado');
 95  ELSIF vadeudo > 0 THEN
 96  DBMS_OUTPUT.PUT_LINE('Usted tiene una multa de: '||vadeudo);
 97  ELSIF vestatus <>'Prestamo' THEN
 98  DBMS_OUTPUT.PUT_LINE('El material no se encuentra en prestamo');
 99  ELSIF vValPrestamo IS NULL THEN
100  DBMS_OUTPUT.PUT_LINE('Usted no tiene este material en prestamo');
101  ELSE
102  SELECT numRefrendo,fechaVenPrest
103  INTO vrefrendosActuales,vfechaVenPrest
104  FROM Prestamo
105  WHERE id_Lector=viL
106  AND id_material=viM
107  AND numEjemplar=vNumEjemplar;
108  vrefrendosActuales:=vrefrendosActuales+vcero;
109  IF vrefrendosActuales >= vrefrendos THEN
110  DBMS_OUTPUT.PUT_LINE('Usted ya no puede sacar este material en prestamo');
111  ELSIF vfechaVenPrest >= SYSDATE THEN
112  DBMS_OUTPUT.PUT_LINE('Aun no se encuentra el la fecha limite del prestamo');
113  ELSE
114  UPDATE Prestamo SET fechaVenPrest= SYSDATE + vdiasPrestamo,fechaPrestamo=SYSDATE,
115  numRefrendo=numRefrendo+1,fechaRefrendo=SYSDATE
116  WHERE id_Material=viM AND numEjemplar=vNumEjemplar AND id_lector=viL;
117  COMMIT;
118  DBMS_OUTPUT.PUT_LINE('Resello HECHO');
119  END IF;
120  END IF;
121  
122  END IF;
123  END spResello;
124  /

Procedure created.

SQL> --Procedimiento que se encarga de gestionar la devolucion de algun material
SQL> CREATE OR REPLACE PROCEDURE spDevolucion(
  2  viL IN Prestamo.id_Lector%TYPE,
  3  vNumEjemplar IN Prestamo.numEjemplar%TYPE,
  4  viM IN Prestamo.id_Material%TYPE
  5  )
  6  
  7  AS
  8  --Variables de validacion
  9  vValLector NUMBER(10);
 10  vValEjemplar NUMBER(10);
 11  vfechaVigen DATE;
 12  vValNumEjemplar NUMBER;
 13  vValPrestamo Number(2);
 14  vestatus VARCHAR2(30);
 15  vadeudo NUMBER(10);
 16  vValMulta NUMBER;
 17  
 18  
 19  BEGIN
 20  --Comprobacion de existencia
 21  SELECT SUM(id_material)
 22  INTO vValEjemplar
 23  FROM  Ejemplar
 24  WHERE exists
 25  (SELECT id_material
 26  FROM Ejemplar
 27  WHERE id_material=viM);
 28  
 29  SELECT SUM(id_Lector)
 30  INTO vValLector
 31  FROM  Lector
 32  WHERE exists
 33  (SELECT id_Lector
 34  FROM LECTOR
 35  WHERE id_Lector=viL);
 36  
 37  SELECT COUNT(numEjemplar)
 38  INTO vValNumEjemplar
 39  FROM  Ejemplar
 40  WHERE exists
 41  (SELECT numEjemplar
 42  FROM Ejemplar
 43  WHERE numEjemplar=vNumEjemplar
 44  AND id_material=viM);
 45  --Casos de no existencia
 46  IF vValLector IS NULL THEN
 47  DBMS_OUTPUT.PUT_LINE('No existe el lector con id: '||viL);
 48  ELSIF vValEjemplar IS NULL THEN
 49  DBMS_OUTPUT.PUT_LINE('No existe el Material con id: '||viM);
 50  ELSIF vNumEjemplar = 0 THEN
 51  DBMS_OUTPUT.PUT_LINE('No existe el Ejemplar con numero: '||vNumEjemplar);
 52  ELSE
 53  --Se compueba si el lector tiene multa o no
 54  vValMulta:=ftHayMulta(viL);
 55  
 56  IF vValMulta>0 THEN
 57  spMulta(viL);
 58  END IF;
 59  
 60  SELECT fechaVigen
 61  INTO vfechaVigen
 62  FROM  Lector
 63  WHERE id_Lector=viL;
 64  
 65  SELECT estatus
 66  INTO vestatus
 67  FROM  Ejemplar
 68  WHERE id_material=viM AND numEjemplar=vNumEjemplar;
 69  
 70  SELECT SUM(id_Lector)
 71  INTO vValPrestamo
 72  FROM Prestamo
 73  WHERE id_Lector=viL
 74  AND id_material=viM
 75  AND numEjemplar=vNumEjemplar
 76  AND fechaDevolucion IS NULL;
 77  
 78  IF vfechaVigen < SYSDATE THEN
 79  DBMS_OUTPUT.PUT_LINE('Su suscripcion a expirado');
 80  ELSIF vestatus <>'Prestamo' THEN
 81  DBMS_OUTPUT.PUT_LINE('El material no se encuentra en prestamo');
 82  ELSIF vValPrestamo IS NULL THEN
 83  DBMS_OUTPUT.PUT_LINE('Usted no tiene este material en prestamo');
 84  ELSE
 85  UPDATE Prestamo SET fechaDevolucion=SYSDATE
 86  WHERE id_Material=viM AND numEjemplar=vNumEjemplar AND id_lector=viL;
 87  --Cambio de estatus cuando se ha hecho una devolucion
 88  UPDATE Ejemplar SET estatus = 'Disponible'
 89  WHERE id_material=viM AND numEjemplar=vNumEjemplar;
 90  COMMIT;
 91  DBMS_OUTPUT.PUT_LINE('Devolucion Exitosa');
 92  END IF;
 93  
 94  END IF;
 95  END spDevolucion;
 96  /

Procedure created.

SQL> --Procedimiento que se encarga de la eliminacion de un lector
SQL> CREATE OR REPLACE PROCEDURE spEliminaLector(
  2  viL IN Lector.id_Lector%TYPE)
  3  AS
  4   vPrestamos NUMBER;
  5   vValLector NUMBER(10);
  6   vrefrendos NUMBER;
  7   vNomLec Lector.nomLec%TYPE;
  8   vPatLec Lector.patLec%TYPE;
  9   vValMulta NUMBER;
 10   vadeudo NUMBER;
 11  BEGIN
 12  
 13  --Se busca si el lector existe
 14   SELECT COUNT(id_Lector)
 15   INTO vValLector
 16   FROM  Lector
 17   WHERE id_Lector=viL;
 18  
 19  --Se busca si el lector tiene prestamos o no
 20   SELECT COUNT(id_Lector)
 21   INTO vPrestamos
 22   FROM Prestamo
 23   WHERE id_Lector=viL
 24   AND fechaDevolucion IS NULL;
 25  
 26   IF vValLector = 0 THEN
 27       DBMS_OUTPUT.PUT_LINE('El lector con id '||viL||' no existe');
 28   ELSIF vPrestamos > 0 THEN
 29      DBMS_OUTPUT.PUT_LINE('No se puede eliminar al lector porque tiene prestamo(s) a£n');
 30   ELSE
 31      vValMulta:=ftHayMulta(viL);
 32  
 33      IF vValMulta>0 THEN
 34      spMulta(viL);
 35      END IF;
 36  
 37      SELECT adeudo
 38      INTO vadeudo
 39      FROM LECTOR
 40      WHERE id_Lector=viL;
 41  
 42      IF vadeudo > 0 THEN
 43      DBMS_OUTPUT.PUT_LINE('Usted tiene una multa: '||vadeudo);
 44      ELSE
 45      SELECT nomLec, patLec
 46      INTO vNomLec, vPatLec
 47      FROM Lector
 48      WHERE id_Lector=viL;
 49  
 50      DELETE FROM LECTOR WHERE id_Lector = viL;
 51      COMMIT;
 52      DBMS_OUTPUT.PUT_LINE('El lector '||vNomLec||' '||vPatLec|| 'con ID '||viL||' ha sido eliminado');
 53      END IF;
 54   END IF;
 55  END spEliminaLector;
 56  /

Procedure created.

SQL> --Procedure que se encarga del pago de una multa para un lector determinado
SQL> CREATE OR REPLACE PROCEDURE spPagarMulta(
  2  viL IN Lector.id_lector%TYPE)
  3  AS
  4    vValLector NUMBER(10);
  5    vAdeudo NUMBER;
  6    vNomLec Lector.nomLec%TYPE;
  7    vPatLec Lector.patLec%TYPE;
  8    vValMulta NUMBER;
  9    vcountMultas NUMBER;
 10    vcountDevueltos NUMBER;
 11  BEGIN
 12  --Comprobaciones de existencia
 13  ---Verifica el el lector existe
 14   SELECT COUNT(id_Lector)
 15   INTO vValLector
 16   FROM  Lector
 17   WHERE id_Lector=viL;
 18  
 19  --Se busca si el lector tiene adeudo
 20   SELECT SUM(monto)
 21   INTO vAdeudo
 22   FROM Prestamo
 23   WHERE id_Lector=viL;
 24  
 25   IF vValLector = 0 THEN
 26       DBMS_OUTPUT.PUT_LINE('El lector con id '||viL||' no existe');
 27   ELSIF vAdeudo <= 0 THEN
 28       DBMS_OUTPUT.PUT_LINE('No tiene adeudo');
 29   ELSE
 30   -- Devuelve a los lectores que devolvieron su material pero tienen multa de la tabla prestamo
 31      SELECT COUNT(fechaDevolucion),COUNT(id_lector)
 32      INTO vcountDevueltos,vcountMultas
 33      FROM Prestamo
 34      WHERE id_Lector=viL
 35      AND (monto > 0);
 36       --Caso donde aun tenga materiales pendientes sin devolver
 37       IF vcountDevueltos <> vcountMultas THEN
 38       DBMS_OUTPUT.PUT_LINE('Debe devolver los materiales antes de pagar su multa');
 39       ELSE
 40       --Caso donde se paga la multa
 41       SELECT nomLec, patLec
 42       INTO vNomLec, vPatLec
 43       FROM Lector
 44       WHERE id_Lector=viL;
 45  
 46       UPDATE PRESTAMO SET
 47       MONTO = 0
 48       WHERE id_Lector = viL;
 49  
 50       UPDATE LECTOR SET
 51       ADEUDO = 0
 52       WHERE id_Lector = viL;
 53       DBMS_OUTPUT.PUT_LINE('Pago hecho del usuario: '||vNomLec);
 54      END IF;
 55    END IF;
 56  COMMIT;
 57  
 58  END spPagarMulta;
 59  /

Procedure created.

SQL> --Procedure que realiza la eliminacion de algun material
SQL> CREATE OR REPLACE PROCEDURE spEliminaMat(vIM IN Material.id_Material%TYPE)
  2  AS
  3   vMat NUMBER;
  4   vMatPrestamo NUMBER(10);
  5   vValMulta NUMBER;
  6  BEGIN
  7  
  8  ---Se busca que el material exista en la tabla material
  9   SELECT SUM(id_Material)
 10   INTO vMat
 11   FROM Material
 12   WHERE exists
 13      (SELECT id_Material
 14      FROM Material
 15      WHERE id_Material=vIM);
 16  
 17  
 18  --Se busca que el material se encuentre dentro de los prestamos
 19   SELECT COUNT(id_Material)
 20   INTO vMatPrestamo
 21   FROM Prestamo
 22   WHERE id_Material=vIM;
 23  
 24  
 25  
 26      IF vMat IS NULL THEN
 27      DBMS_OUTPUT.PUT_LINE('El material con el ID '||vIM||' no existe en registro');
 28      ELSIF vMatPrestamo > 0 THEN
 29      DBMS_OUTPUT.PUT_LINE('El material no puede ser eliminado porque tiene ejemplares a prestamo');
 30      ELSE
 31      DELETE FROM MATERIAL WHERE id_Material = vIM;
 32      DBMS_OUTPUT.PUT_LINE('El material con ID '||vIM||' ha sio eliminado');
 33      COMMIT;
 34      END IF;
 35  END spEliminaMat;
 36  /

Procedure created.

SQL> spool off;
