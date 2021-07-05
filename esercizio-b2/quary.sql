-- 1.Selezionare tutti gli studenti nati nel 1990(160)
SELECT * 
FROM `students`
WHERE YEAR(`date_of_birth`) = 1990;

-- 2.Selezionare tutti i corsi che valgono più di 10 crediti(479)
SELECT * 
FROM `courses` 
WHERE `cfu`> 10;
ORDER BY `cfu` ASC 

-- 3.Selezionare tutti gli studenti che hanno più di 30 anni
--SELECT *
--FROM `students`
--WHERE YEAR(date_of_birth) < YEAR(CURDATE()) -30;  --3186

SELECT * 
FROM `students` 
WHERE TIMESTAMPDIFF(YEAR,`date_of_birth`,CURDATE()) > 30; --3110

-- 4.Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso dilaurea(286)
SELECT *
FROM `courses`
WHERE `period` = 'I semestre'
AND `year` = 1;

-- 5.Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del 20/06/2020(21)
SELECT * 
FROM `exams` 
WHERE `date` = "2020-06-20" 
AND HOUR(`hour`) >= 14;

-- 6.Selezionare tutti i corsi di laurea magistrale(38)
SELECT *
FROM `degrees`
WHERE `level`
LIKE "%magistrale%";

-- 7.Da quanti dipartimenti è composta l'università?(12)
SELECT COUNT(`id`) 
AS dipartimenti_totali
FROM `departments`;

-- 8.Quanti sono gli insegnanti che non hanno un numero di telefono?(50)
SELECT * 
FROM `teachers` 
WHERE `phone` IS NULL;


--qualche live
SELECT COUNT(`id`) AS 'numero_corsi', `cfu`
FROM `courses`
GROUP BY cfu;

-- selezionare tutti i corsi di laurea in informatica
SELECT courses.id, courses.name, courses.period, courses.cfu
FROM courses
JOIN degrees
ON courses.degree_id = degrees.id
WHERE degrees.name = 'Corso di Laurea in Informatica';

-- selezionare le informazioni sul corso id = 144, con tutti i rispettivi appelli d'esame
SELECT courses.id, courses.name, courses.description, courses.period, courses.year, courses.cfu
FROM `courses`
JOIN `exams`
ON `courses`.`id` = exams.course_id
WHERE courses.id = 144;

--selezionare a quale dipartimento appartiene il corso di laurea in dipartimento dell'economia
SELECT departments.*
FROM departments
JOIN degrees
ON departments.id = degrees.department_id
WHERE degrees.name = `Corso di laurea....`

-- selezionare tutti gli appelli d'esame del Corso di Laurea Magistrale in Fisica del primo anno
SELECT courses.id AS corso_id, courses.name, courses.description
FROM degrees
JOIN courses
ON degrees.id = courses.degree_id
JOIN exams
ON courses.id = exams.course_id
WHERE degrees.name = 'Corso di Laurea Magistrale in Fisica'
AND courses.year = 1;