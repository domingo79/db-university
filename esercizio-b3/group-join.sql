--GROUP BY:
--Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(id) AS iscritti, YEAR(`enrolment_date`) AS anno_iscrizione
FROM students
GROUP BY YEAR(`enrolment_date`)

--Contare gli insegnanti che hanno l'ufficio nello stesso edificio
SELECT COUNT(id) 
AS insegnanti, `office_address` AS edificio
FROM `teachers` 
GROUP BY edificio;

--Calcolare la media dei voti di ogni appello d'esame
SELECT AVG(`vote`) 
AS `avarage_vote`, exam_id
FROM `exam_student`
GROUP BY exam_id;

--Contare quanti corsi di laurea ci sono per ogni dipartimento
SELECT COUNT(*) 
AS 'number_degrees', department_id
FROM degrees
GROUP BY department_id;

--JOINS:
--Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia
SELECT students.*
FROM students
JOIN degrees
ON students.degree_id = degrees.id
WHERE degrees.name = 'Corso di Laurea in Economia';

-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze
SELECT degrees.*
FROM degrees
JOIN departments
ON
degrees.department_id = department_id
WHERE departments.name = 'Dipartimento di Neuroscienze';

-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)
SELECT courses.*
FROM course_teacher
JOIN courses
ON course_teacher.course_id = course_id
WHERE course_teacher.teacher_id = 44;

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome
SELECT students.id, students.name, students.surname, students.enrolment_date, degrees.name AS corso, departments.name AS dipartimento
FROM students
JOIN degrees
ON students.degree_id = degrees.id
JOIN departments
ON degrees.department_id = departments.id
ORDER BY students.surname, students.name ASC;

-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti
SELECT degrees.name AS corso_di_laurea, courses.name AS descrizione_corso, teachers.name AS nome_insegnante, teachers.surname AS cognome_insegnante
FROM degrees
JOIN courses
ON degrees.id = courses.degree_id
JOIN course_teacher
ON course_teacher.course_id = courses.id
JOIN teachers
ON course_teacher.teacher_id = teachers.id;

-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)
SELECT teachers.*, departments.name AS dipartimento
FROM teachers
JOIN course_teacher
ON teachers.id = course_teacher.teacher_id
JOIN courses 
ON course_teacher.course_id = courses.id
JOIN degrees
ON courses.degree_id = degrees.id
JOIN departments
ON degrees.department_id = departments.id
WHERE departments.name = "Dipartimento di Matematica";

-- BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami