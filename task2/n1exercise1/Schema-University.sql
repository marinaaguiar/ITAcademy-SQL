DROP DATABASE IF EXISTS university;
CREATE DATABASE university CHARACTER SET utf8mb4;
USE university;
 
CREATE TABLE departament (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE person (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nif VARCHAR(9) UNIQUE,
    name VARCHAR(25) NOT NULL,
    surname1 VARCHAR(50) NOT NULL,
    surname2 VARCHAR(50),
    city VARCHAR(25) NOT NULL,
    address VARCHAR(50) NOT NULL,
    phone VARCHAR(9),
    birth_date DATE NOT NULL,
    sex ENUM('H', 'M') NOT NULL,
    profession ENUM('teacher', 'alumno') NOT NULL
);
 
CREATE TABLE teacher (
    id_teacher INT UNSIGNED PRIMARY KEY,
    id_departament INT UNSIGNED NOT NULL,
    FOREIGN KEY (id_teacher) REFERENCES person(id),
    FOREIGN KEY (id_departament) REFERENCES departament(id)
);
 
 CREATE TABLE degree (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);
 
CREATE TABLE subject (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    credits FLOAT UNSIGNED NOT NULL,
    subject_type ENUM('básica', 'obligatoria', 'optativa') NOT NULL,
    course TINYINT UNSIGNED NOT NULL,
    term TINYINT UNSIGNED NOT NULL,
    id_teacher INT UNSIGNED,
    id_degree INT UNSIGNED NOT NULL,
    FOREIGN KEY(id_teacher) REFERENCES teacher(id_teacher),
    FOREIGN KEY(id_degree) REFERENCES degree(id)
);
 
CREATE TABLE school_course (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    year_start YEAR NOT NULL,
    year_finish YEAR NOT NULL
);

CREATE TABLE student_enrolls_subject (
    id_student INT UNSIGNED NOT NULL,
    id_subject INT UNSIGNED NOT NULL,
    id_school_course INT UNSIGNED NOT NULL,
    PRIMARY KEY (id_student, id_subject, id_school_course),
    FOREIGN KEY (id_student) REFERENCES person(id),
    FOREIGN KEY (id_subject) REFERENCES subject(id),
    FOREIGN KEY (id_school_course) REFERENCES school_course(id)
);
 
 /* Departamento */
INSERT INTO departament VALUES (1, 'Informática');
INSERT INTO departament VALUES (2, 'Matemáticas');
INSERT INTO departament VALUES (3, 'Economía y Empresa');
INSERT INTO departament VALUES (4, 'Educación');
INSERT INTO departament VALUES (5, 'Agronomía');
INSERT INTO departament VALUES (6, 'Química y Física');
INSERT INTO departament VALUES (7, 'Filología');
INSERT INTO departament VALUES (8, 'Derecho');
INSERT INTO departament VALUES (9, 'Biología y Geología');
 
 /* person */
INSERT INTO person VALUES (1, '26902806M', 'Salvador', 'Sánchez', 'Pérez', 'Almería', 'C/ Real del barrio alto', '950254837', '1991/03/28', 'H', 'alumno');
INSERT INTO person VALUES (2, '89542419S', 'Juan', 'Saez', 'Vega', 'Almería', 'C/ Mercurio', '618253876', '1992/08/08', 'H', 'alumno');
INSERT INTO person VALUES (3, '11105554G', 'Zoe', 'Ramirez', 'Gea', 'Almería', 'C/ Marte', '618223876', '1979/08/19', 'M', 'teacher');
INSERT INTO person VALUES (4, '17105885A', 'Pedro', 'Heller', 'Pagac', 'Almería', 'C/ Estrella fugaz', NULL, '2000/10/05', 'H', 'alumno');
INSERT INTO person VALUES (5, '38223286T', 'David', 'Schmidt', 'Fisher', 'Almería', 'C/ Venus', '678516294', '1978/01/19', 'H', 'teacher');
INSERT INTO person VALUES (6, '04233869Y', 'José', 'Koss', 'Bayer', 'Almería', 'C/ Júpiter', '628349590', '1998/01/28', 'H', 'alumno');
INSERT INTO person VALUES (7, '97258166K', 'Ismael', 'Strosin', 'Turcotte', 'Almería', 'C/ Neptuno', NULL, '1999/05/24', 'H', 'alumno');
INSERT INTO person VALUES (8, '79503962T', 'Cristina', 'Lemke', 'Rutherford', 'Almería', 'C/ Saturno', '669162534', '1977/08/21', 'M', 'teacher');
INSERT INTO person VALUES (9, '82842571K', 'Ramón', 'Herzog', 'Tremblay', 'Almería', 'C/ Urano', '626351429', '1996/11/21', 'H', 'alumno');
INSERT INTO person VALUES (10, '61142000L', 'Esther', 'Spencer', 'Lakin', 'Almería', 'C/ Plutón', NULL, '1977/05/19', 'M', 'teacher');
INSERT INTO person VALUES (11, '46900725E', 'Daniel', 'Herman', 'Pacocha', 'Almería', 'C/ Andarax', '679837625', '1997/04/26', 'H', 'alumno');
INSERT INTO person VALUES (12, '85366986W', 'Carmen', 'Streich', 'Hirthe', 'Almería', 'C/ Almanzora', NULL, '1971-04-29', 'M', 'teacher');
INSERT INTO person VALUES (13, '73571384L', 'Alfredo', 'Stiedemann', 'Morissette', 'Almería', 'C/ Guadalquivir', '950896725', '1980/02/01', 'H', 'teacher');
INSERT INTO person VALUES (14, '82937751G', 'Manolo', 'Hamill', 'Kozey', 'Almería', 'C/ Duero', '950263514', '1977/01/02', 'H', 'teacher');
INSERT INTO person VALUES (15, '80502866Z', 'Alejandro', 'Kohler', 'Schoen', 'Almería', 'C/ Tajo', '668726354', '1980/03/14', 'H', 'teacher');
INSERT INTO person VALUES (16, '10485008K', 'Antonio', 'Fahey', 'Considine', 'Almería', 'C/ Sierra de los Filabres', NULL, '1982/03/18', 'H', 'teacher');
INSERT INTO person VALUES (17, '85869555K', 'Guillermo', 'Ruecker', 'Upton', 'Almería', 'C/ Sierra de Gádor', NULL, '1973/05/05', 'H', 'teacher');
INSERT INTO person VALUES (18, '04326833G', 'Micaela', 'Monahan', 'Murray', 'Almería', 'C/ Veleta', '662765413', '1976/02/25', 'H', 'teacher');
INSERT INTO person VALUES (19, '11578526G', 'Inma', 'Lakin', 'Yundt', 'Almería', 'C/ Picos de Europa', '678652431', '1998/09/01', 'M', 'alumno');
INSERT INTO person VALUES (20, '79221403L', 'Francesca', 'Schowalter', 'Muller', 'Almería', 'C/ Quinto pino', NULL, '1980/10/31', 'H', 'teacher');
INSERT INTO person VALUES (21, '79089577Y', 'Juan', 'Gutiérrez', 'López', 'Almería', 'C/ Los pinos', '678652431', '1998/01/01', 'H', 'alumno');
INSERT INTO person VALUES (22, '41491230N', 'Antonio', 'Domínguez', 'Guerrero', 'Almería', 'C/ Cabo de Gata', '626652498', '1999/02/11', 'H', 'alumno');
INSERT INTO person VALUES (23, '64753215G', 'Irene', 'Hernández', 'Martínez', 'Almería', 'C/ Zapillo', '628452384', '1996/03/12', 'M', 'alumno');
INSERT INTO person VALUES (24, '85135690V', 'Sonia', 'Gea', 'Ruiz', 'Almería', 'C/ Mercurio', '678812017', '1995/04/13', 'M', 'alumno');
 
/* teacher */
INSERT INTO teacher VALUES (3, 1);
INSERT INTO teacher VALUES (5, 2);
INSERT INTO teacher VALUES (8, 3);
INSERT INTO teacher VALUES (10, 4);
INSERT INTO teacher VALUES (12, 4);
INSERT INTO teacher VALUES (13, 6);
INSERT INTO teacher VALUES (14, 1);
INSERT INTO teacher VALUES (15, 2);
INSERT INTO teacher VALUES (16, 3);
INSERT INTO teacher VALUES (17, 4);
INSERT INTO teacher VALUES (18, 5);
INSERT INTO teacher VALUES (20, 6);
 
 /* degree */
INSERT INTO degree VALUES (1, 'degree en Ingeniería Agrícola (Plan 2015)');
INSERT INTO degree VALUES (2, 'degree en Ingeniería Eléctrica (Plan 2014)');
INSERT INTO degree VALUES (3, 'degree en Ingeniería Electrónica Industrial (Plan 2010)');
INSERT INTO degree VALUES (4, 'degree en Ingeniería Informática (Plan 2015)');
INSERT INTO degree VALUES (5, 'degree en Ingeniería Mecánica (Plan 2010)');
INSERT INTO degree VALUES (6, 'degree en Ingeniería Química Industrial (Plan 2010)');
INSERT INTO degree VALUES (7, 'degree en Biotecnología (Plan 2015)');
INSERT INTO degree VALUES (8, 'degree en Ciencias Ambientales (Plan 2009)');
INSERT INTO degree VALUES (9, 'degree en Matemáticas (Plan 2010)');
INSERT INTO degree VALUES (10, 'degree en Química (Plan 2009)');
 
/* subject */
INSERT INTO subject VALUES (1, 'Álgegra lineal y matemática discreta', 6, 'básica', 1, 1, 3, 4);
INSERT INTO subject VALUES (2, 'Cálculo', 6, 'básica', 1, 1, 14, 4);
INSERT INTO subject VALUES (3, 'Física para informática', 6, 'básica', 1, 1, 3, 4);
INSERT INTO subject VALUES (4, 'Introducción a la programación', 6, 'básica', 1, 1, 14, 4);
INSERT INTO subject VALUES (5, 'Organización y gestión de empresas', 6, 'básica', 1, 1, 3, 4);
INSERT INTO subject VALUES (6, 'Estadística', 6, 'básica', 1, 2, 14, 4);
INSERT INTO subject VALUES (7, 'Estructura y tecnología de computadores', 6, 'básica', 1, 2, 3, 4);
INSERT INTO subject VALUES (8, 'Fundamentos de electrónica', 6, 'básica', 1, 2, 14, 4);
INSERT INTO subject VALUES (9, 'Lógica y algorítmica', 6, 'básica', 1, 2, 3, 4);
INSERT INTO subject VALUES (10, 'Metodología de la programación', 6, 'básica', 1, 2, 14, 4);
INSERT INTO subject VALUES (11, 'Arquitectura de Computadores', 6, 'básica', 2, 1, 3, 4);
INSERT INTO subject VALUES (12, 'Estructura de Datos y Algoritmos I', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO subject VALUES (13, 'Ingeniería del Software', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO subject VALUES (14, 'Sistemas Inteligentes', 6, 'obligatoria', 2, 1, 3, 4);
INSERT INTO subject VALUES (15, 'Sistemas Operativos', 6, 'obligatoria', 2, 1, 14, 4);
INSERT INTO subject VALUES (16, 'Bases de Datos', 6, 'básica', 2, 2, 14, 4);
INSERT INTO subject VALUES (17, 'Estructura de Datos y Algoritmos II', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO subject VALUES (18, 'Fundamentos de Redes de Computadores', 6 ,'obligatoria', 2, 2, 3, 4);
INSERT INTO subject VALUES (19, 'Planificación y Gestión de Proyectos Informáticos', 6, 'obligatoria', 2, 2, 3, 4);
INSERT INTO subject VALUES (20, 'Programación de Servicios Software', 6, 'obligatoria', 2, 2, 14, 4);
INSERT INTO subject VALUES (21, 'Desarrollo de interfaces de usuario', 6, 'obligatoria', 3, 1, 14, 4);
INSERT INTO subject VALUES (22, 'Ingeniería de Requisitos', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO subject VALUES (23, 'Integración de las Tecnologías de la Información en las Organizaciones', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO subject VALUES (24, 'Modelado y Diseño del Software 1', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO subject VALUES (25, 'Multiprocesadores', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO subject VALUES (26, 'Seguridad y cumplimiento normativo', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO subject VALUES (27, 'Sistema de Información para las Organizaciones', 6, 'optativa', 3, 1, NULL, 4); 
INSERT INTO subject VALUES (28, 'Tecnologías web', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO subject VALUES (29, 'Teoría de códigos y criptografía', 6, 'optativa', 3, 1, NULL, 4);
INSERT INTO subject VALUES (30, 'Administración de bases de datos', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO subject VALUES (31, 'Herramientas y Métodos de Ingeniería del Software', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO subject VALUES (32, 'Informática industrial y robótica', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO subject VALUES (33, 'Ingeniería de Sistemas de Información', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO subject VALUES (34, 'Modelado y Diseño del Software 2', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO subject VALUES (35, 'Negocio Electrónico', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO subject VALUES (36, 'Periféricos e interfaces', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO subject VALUES (37, 'Sistemas de tiempo real', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO subject VALUES (38, 'Tecnologías de acceso a red', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO subject VALUES (39, 'Tratamiento digital de imágenes', 6, 'optativa', 3, 2, NULL, 4);
INSERT INTO subject VALUES (40, 'Administración de redes y sistemas operativos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO subject VALUES (41, 'Almacenes de Datos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO subject VALUES (42, 'Fiabilidad y Gestión de Riesgos', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO subject VALUES (43, 'Líneas de Productos Software', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO subject VALUES (44, 'Procesos de Ingeniería del Software 1', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO subject VALUES (45, 'Tecnologías multimedia', 6, 'optativa', 4, 1, NULL, 4);
INSERT INTO subject VALUES (46, 'Análisis y planificación de las TI', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO subject VALUES (47, 'Desarrollo Rápido de Aplicaciones', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO subject VALUES (48, 'Gestión de la Calidad y de la Innovación Tecnológica', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO subject VALUES (49, 'Inteligencia del Negocio', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO subject VALUES (50, 'Procesos de Ingeniería del Software 2', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO subject VALUES (51, 'Seguridad Informática', 6, 'optativa', 4, 2, NULL, 4);
INSERT INTO subject VALUES (52, 'Biologia celular', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO subject VALUES (53, 'Física', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO subject VALUES (54, 'Matemáticas I', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO subject VALUES (55, 'Química general', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO subject VALUES (56, 'Química orgánica', 6, 'básica', 1, 1, NULL, 7);
INSERT INTO subject VALUES (57, 'Biología vegetal y animal', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO subject VALUES (58, 'Bioquímica', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO subject VALUES (59, 'Genética', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO subject VALUES (60, 'Matemáticas II', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO subject VALUES (61, 'Microbiología', 6, 'básica', 1, 2, NULL, 7);
INSERT INTO subject VALUES (62, 'Botánica agrícola', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO subject VALUES (63, 'Fisiología vegetal', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO subject VALUES (64, 'Genética molecular', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO subject VALUES (65, 'Ingeniería bioquímica', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO subject VALUES (66, 'Termodinámica y cinética química aplicada', 6, 'obligatoria', 2, 1, NULL, 7);
INSERT INTO subject VALUES (67, 'Biorreactores', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO subject VALUES (68, 'Biotecnología microbiana', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO subject VALUES (69, 'Ingeniería genética', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO subject VALUES (70, 'Inmunología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO subject VALUES (71, 'Virología', 6, 'obligatoria', 2, 2, NULL, 7);
INSERT INTO subject VALUES (72, 'Bases moleculares del desarrollo vegetal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO subject VALUES (73, 'Fisiología animal', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO subject VALUES (74, 'Metabolismo y biosíntesis de biomoléculas', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO subject VALUES (75, 'Operaciones de separación', 6, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO subject VALUES (76, 'Patología molecular de plantas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO subject VALUES (77, 'Técnicas instrumentales básicas', 4.5, 'obligatoria', 3, 1, NULL, 7);
INSERT INTO subject VALUES (78, 'Bioinformática', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO subject VALUES (79, 'Biotecnología de los productos hortofrutículas', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO subject VALUES (80, 'Biotecnología vegetal', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO subject VALUES (81, 'Genómica y proteómica', 4.5, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO subject VALUES (82, 'Procesos biotecnológicos', 6, 'obligatoria', 3, 2, NULL, 7);
INSERT INTO subject VALUES (83, 'Técnicas instrumentales avanzadas', 4.5, 'obligatoria', 3, 2, NULL, 7);

/* Curso escolar */
INSERT INTO school_course VALUES (1, 2014, 2015);
INSERT INTO school_course VALUES (2, 2015, 2016);
INSERT INTO school_course VALUES (3, 2016, 2017);
INSERT INTO school_course VALUES (4, 2017, 2018);
INSERT INTO school_course VALUES (5, 2018, 2019);

/* Alumno se matricula en subject */
INSERT INTO student_enrolls_subject VALUES (1, 1, 1);
INSERT INTO student_enrolls_subject VALUES (1, 2, 1);
INSERT INTO student_enrolls_subject VALUES (1, 3, 1);
INSERT INTO student_enrolls_subject VALUES (2, 1, 1);
INSERT INTO student_enrolls_subject VALUES (2, 2, 1);
INSERT INTO student_enrolls_subject VALUES (2, 3, 1);
INSERT INTO student_enrolls_subject VALUES (4, 1, 1);
INSERT INTO student_enrolls_subject VALUES (4, 2, 1);
INSERT INTO student_enrolls_subject VALUES (4, 3, 1);
INSERT INTO student_enrolls_subject VALUES (24, 1, 5);
INSERT INTO student_enrolls_subject VALUES (24, 2, 5);
INSERT INTO student_enrolls_subject VALUES (24, 3, 5);
INSERT INTO student_enrolls_subject VALUES (24, 4, 5);
INSERT INTO student_enrolls_subject VALUES (24, 5, 5);
INSERT INTO student_enrolls_subject VALUES (24, 6, 5);
INSERT INTO student_enrolls_subject VALUES (24, 7, 5);
INSERT INTO student_enrolls_subject VALUES (24, 8, 5);
INSERT INTO student_enrolls_subject VALUES (24, 9, 5);
INSERT INTO student_enrolls_subject VALUES (24, 10, 5);
INSERT INTO student_enrolls_subject VALUES (23, 1, 5);
INSERT INTO student_enrolls_subject VALUES (23, 2, 5);
INSERT INTO student_enrolls_subject VALUES (23, 3, 5);
INSERT INTO student_enrolls_subject VALUES (23, 4, 5);
INSERT INTO student_enrolls_subject VALUES (23, 5, 5);
INSERT INTO student_enrolls_subject VALUES (23, 6, 5);
INSERT INTO student_enrolls_subject VALUES (23, 7, 5);
INSERT INTO student_enrolls_subject VALUES (23, 8, 5);
INSERT INTO student_enrolls_subject VALUES (23, 9, 5);
INSERT INTO student_enrolls_subject VALUES (23, 10, 5);
INSERT INTO student_enrolls_subject VALUES (19, 1, 5);
INSERT INTO student_enrolls_subject VALUES (19, 2, 5);
INSERT INTO student_enrolls_subject VALUES (19, 3, 5);
INSERT INTO student_enrolls_subject VALUES (19, 4, 5);
INSERT INTO student_enrolls_subject VALUES (19, 5, 5);
INSERT INTO student_enrolls_subject VALUES (19, 6, 5);
INSERT INTO student_enrolls_subject VALUES (19, 7, 5);
INSERT INTO student_enrolls_subject VALUES (19, 8, 5);
INSERT INTO student_enrolls_subject VALUES (19, 9, 5);
INSERT INTO student_enrolls_subject VALUES (19, 10, 5);
