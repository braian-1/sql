CREATE DATABASE entrenamiento;
USE entrenamiento;
CREATE TABLE estudiantes (
    idEstudiantes INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    apellido2 VARCHAR(50),
    correo VARCHAR(100),
    genero VARCHAR(50),
    identificacion FLOAT,
    carrera VARCHAR(50),
    fecha_nacimiento DATE,
    fecha_ingreso DATE
);

INSERT INTO estudiantes (nombre,apellido,apellido2,correo,genero,identificacion,carrera,fecha_nacimiento,fecha_ingreso) 
VALUES 
("pepito","cardona","osorio","pepito@gmail.com","masculino",1782632732,"ingeniero","2007-09-30","2023-08-23"),
("maria","perez","lopez","maria52@gmail.com","femenino",732732893,"fotografa","2002-10-25","2024-01-20"),
("carlos","jimenez","bermudez","carlos943@gmail.com","masculino",1023988871,"desarrollador","2001-03-20","2021-02-17"),
("pablo","cardona","garcia","pablo8743@gmail.com","masculino",8739232,"artista","2000-11-12","2025-01-21"),
("juan","torres","castillo","juant0843@gmail.com","masculino",97483743,"nutricionista","1999-10-11","2020-10-13");

CREATE TABLE docentes (
    idDocentes INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    apellido2 VARCHAR(50),
    correo_institucional VARCHAR(100),
    departamento_academico VARCHAR(50),
    años_de_experiencia FLOAT
);

INSERT INTO docentes (nombre,apellido,apellido2,correo_institucional,departamento_academico,años_de_experiencia) 
VALUES 
("juan","cardona","perez","juan78432@gmail.com","antioquia",5),
("ana","perez","jimenez","anaP8743@gmail.com","antioquia",2),
("david","osorio","torres","davit090238@gmail.com","antioquia",7);

CREATE TABLE cursos (
    idCursos INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nombre VARCHAR(50),
    codigo FLOAT,
    creditos VARCHAR(50),
    semestre FLOAT,
    id_docente INT,
    FOREIGN KEY (id_docente) REFERENCES docentes(idDocentes)
);

INSERT INTO cursos (nombre,codigo,creditos,semestre,id_docente)
VALUES 
("matematicas",01,"2",1,3),
("filosofia",02,"3",3,2),
("ingles",03,"4",2,1);

CREATE TABLE inscripciones (
    idInscripciones INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    id_estudiantes INT,
    id_cursos INT,
    fecha_inscripcion DATE,
    calificacion_final DECIMAL(3,1),
    FOREIGN KEY (id_estudiantes) REFERENCES estudiantes(idEstudiantes),
    FOREIGN KEY (id_cursos) REFERENCES cursos(idCursos)
);

INSERT INTO inscripciones (id_estudiantes,id_cursos,fecha_inscripcion,calificacion_final)
VALUES 
(1,3,"2023-04-23",4.2),
(5,1,"2022-10-12",3.2),
(3,2,"2020-01-11",4.1),
(4,1,"2025-01-22",3.0),
(2,2,"2022-09-10",3.8),
(1,1,"2019-02-03",4.8),
(4,3,"2024-03-16",4.0),
(5,2,"2021-01-29",3.1);


SELECT e.nombre estudiantes,c.nombre cursos FROM inscripciones i JOIN estudiantes e ON i.id_estudiantes = e.idEstudiantes JOIN cursos c ON i.id_cursos = c.idCursos;
--Esta parte lo que hace es que me imprime el nombre del estudiante y el curso 

SELECT nombre,apellido,apellido2 FROM docentes WHERE años_de_experiencia >= 5;
--este me trae a los docentes que tengan mas de cinco años de experiencia

