USE university;

-- 1. Returns a list with the first last name, second last name and first name of all the students. The list must be ordered alphabetically from lowest to highest by first last name, second last name and first name.
SELECT surname1, surname2, name
FROM person
WHERE profession = 'alumno'
ORDER BY surname1 ASC, surname2 ASC, name ASC;

-- 2. Find out the first and last names of students who have not registered their phone number in the database.
SELECT surname1, surname2, name
FROM person
WHERE profession = 'alumno' AND phone IS NULL;

-- 3. Returns the list of students who were born in 1999.
SELECT surname1, surname2, name, birth_date
FROM person
WHERE profession = 'alumno' AND YEAR(birth_date) = 1999;

-- 4. Returns the list of teachers who have not registered their phone number in the database and also their NIF ends in K.
SELECT surname1, surname2, name
FROM person
WHERE profession = 'teacher' 
AND phone IS NULL 
AND nif LIKE '%K';

-- 5. Returns the list of subjects that are taught in the first semester, in the third year of the degree that has the identifier 7.
SELECT name
FROM subject
WHERE course = 3
AND term = 1
AND id_degree = 7;

-- 6. SELECT p.surname1, p.surname2, p.name, d.name AS department_name
SELECT p.surname1, p.surname2, p.name, d.name AS department_name
FROM person p
JOIN teacher t ON p.id = t.id_teacher
JOIN departament d ON t.id_departament = d.id
ORDER BY p.surname1 ASC, p.name ASC;

-- 7. Returns a list with the name of the subjects, start year and end year of the student's school year with NIF 26902806M.
SELECT s.name AS subject_name, sc.year_start, sc.year_finish
FROM person p
JOIN student_enrolls_subject ses ON p.id = ses.id_student
JOIN subject s ON ses.id_subject = s.id
JOIN school_course sc ON ses.id_school_course = sc.id
WHERE p.nif = '26902806M';

-- 8. Returns a list with the name of all the departments that have professors who teach a subject in the Degree in Computer Engineering (Plan 2015).
SELECT DISTINCT d.name AS department_name
FROM departament d
JOIN teacher t ON d.id = t.id_departament
JOIN subject s ON t.id_teacher = s.id_teacher
JOIN degree deg ON s.id_degree = deg.id
WHERE deg.name = 'degree en Ingeniería Informática (Plan 2015)';

-- 9. Returns a list of all students who have enrolled in a subject during the 2018/2019 school year.
SELECT DISTINCT person.surname1, person.surname2, person.name
FROM person
JOIN student_enrolls_subject ses ON person.id = ses.id_student
JOIN school_course sc ON ses.id_school_course = sc.id
WHERE sc.year_start = 2018 AND sc.year_finish = 2019;

-- LEFT JOIN - RIGHT JOIN

-- 1. Returns a list with the names of all the professors and the departments they are linked to. 
-- The list must also show those professors who do not have any associated department. The listing must return four columns, department name, first last name, second last name and teacher's name. 
-- The result will be sorted alphabetically from lowest to highest by department name, last name and first name.

SELECT d.name AS department_name, p.surname1, p.surname2, p.name AS teacher_name
FROM departament d
LEFT JOIN teacher t ON d.id = t.id_departament
LEFT JOIN person p ON t.id_teacher = p.id

UNION

SELECT d.name AS department_name, p.surname1, p.surname2, p.name AS teacher_name
FROM teacher t
RIGHT JOIN departament d ON d.id = t.id_departament
RIGHT JOIN person p ON t.id_teacher = p.id

ORDER BY department_name ASC, surname1 ASC, surname2 ASC, teacher_name ASC;

-- 2. Returns a list of professors who are not associated with a department.
SELECT person.surname1, person.surname2, person.name AS teacher_name
FROM teacher
LEFT JOIN departament ON teacher.id_departament = departament.id
JOIN person ON teacher.id_teacher = person.id
WHERE departament.id IS NULL;

-- 3. Returns a list of departments that do not have associate professors.
SELECT departament.name AS department_name
FROM departament
LEFT JOIN teacher ON departament.id = teacher.id_departament
WHERE teacher.id_teacher IS NULL;

-- 4. Returns a list of teachers who do not teach any subjects.
SELECT p.surname1, p.surname2, p.name AS teacher_name
FROM teacher t
LEFT JOIN subject s ON t.id_teacher = s.id_teacher 
JOIN person p ON t.id_teacher  = p.id 
WHERE s.id IS NULL AND p.profession  = 'teacher';


-- 5. Returns a list of subjects that do not have an assigned teacher.
SELECT  s.name AS subject_name
FROM subject s 
LEFT JOIN teacher t ON s.id_teacher = t.id_teacher 
WHERE t.id_teacher  IS NULL;

-- 6. Returns a list of all departments that have not taught subjects in any school year.
SELECT d.name AS departament_name
FROM departament d 
LEFT JOIN teacher t ON d.id  = t.id_departament 
LEFT JOIN subject s ON t.id_teacher  = s.id_teacher 
WHERE s.id IS NULL;

-- Summary Queries:

-- 1. Returns the total number of students there.
SELECT COUNT(*) 
FROM person 
WHERE person.profession = 'alumno';

-- 2. Calculate how many students were born in 1999.
SELECT COUNT(*) 
FROM person 
WHERE person.profession = 'alumno' AND birth_date >= '1999-01-01'AND birth_date  < '2000-01-01';

-- 3. Calculate how many teachers there are in each department. 
-- The result should only show two columns, one with the name of 
-- the department and another with the number of professors in that department. 
-- The result must only include the departments that have associate professors 
-- and must be ordered from highest to lowest by the number of professors.

SELECT COUNT(*), d.name 
FROM teacher t 
JOIN departament d ON t.id_teacher = d.id 
GROUP BY d.name 
ORDER BY COUNT(*) DESC;

-- 4. Returns a list with all the departments and the number of professors in each of them. 
-- Keep in mind that there may be departments that do not have associate professors. 
-- These departments must also appear in the list.
SELECT COUNT(t.id_teacher), d.name 
FROM teacher t 
RIGHT JOIN departament d ON t.id_departament = d.id 
GROUP BY d.name;

-- 5. Returns a list with the name of all the existing degrees in the database 
-- and the number of subjects each one has. Note that there may be degrees that 
-- do not have associated subjects. These grades must also appear in the listing. 
-- The result must be ordered from highest to lowest by the number of subjects.
 SELECT COUNT(s.id), d.name 
 FROM `degree` d
 LEFT JOIN subject s ON d.id = s.id_degree 
 GROUP BY d.name ORDER BY COUNT(*) DESC; 

-- 6. Returns a list with the name of all the existing degrees in the database and 
-- the number of subjects each one has, of the degrees that have more than 40 associated 
-- subjects.
SELECT COUNT(s.id), d.name 
FROM `degree` d 
LEFT JOIN subject s ON d.id = s.id_degree 
GROUP BY d.name HAVING COUNT(s.id) > 40;

-- 7. Returns a list showing the name of the degrees and the sum of the total number of credits for each subject type. 
-- The result must have three columns: name of the degree, type of subject and the sum of the credits of all the subjects of this type.
SELECT d.name AS degree_name,
       s.subject_type  AS subject_type,
       SUM(s.credits) AS total_credits
FROM degree d
JOIN subject s ON d.id  = s.id_degree
GROUP BY d.name, s.subject_type 
ORDER BY d.name, s.subject_type;

-- 8. Returns a list that shows how many students have enrolled in a subject in each of the school years. 
-- The result must show two columns, one column with the start year of the school year and another with the number of enrolled students.
SELECT COUNT(*) AS total_students, school_course.year_start 
FROM student_enrolls_subject 
JOIN school_course ON school_course.id = student_enrolls_subject.id_school_course  
GROUP BY school_course.year_start;

-- 9. Returns a list with the number of subjects taught by each teacher. 
-- The list must take into account those professors who do not teach any subjects. 
-- The result will show five columns: id, name, first last name, second last name and number of subjects. The result will be ordered from highest to lowest by the number of subjects.
SELECT COUNT(*) AS total_subjects, p.id, p.name, p.surname1, p.surname2  
FROM subject s 
JOIN person p ON p.id = subject.id_teacher 
GROUP BY p.id, p.name, p.surname1, p.surname2;

-- 10. Returns all data for the youngest student.
SELECT * 
FROM person 
WHERE profession = 'alumno' AND birth_date = (SELECT MAX(birth_date) FROM person);

-- 11. Returns a list of professors who have an associated department and who do not teach any subjects.
SELECT * 
FROM person 
LEFT JOIN teacher t ON person.id = t.id_teacher  
LEFT JOIN subject s ON t.id_teacher = s.id_teacher 
WHERE s.id_teacher IS NULL AND person.profession = 'teacher';










