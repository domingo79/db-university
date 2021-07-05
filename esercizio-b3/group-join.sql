--GROUP BY:
--Contare quanti iscritti ci sono stati ogni anno
SELECT COUNT(*) AS numero_studenti_per_anno, YEAR(enrolment_date) AS year
FROM students
GROUP BY year;

--Contare gli insegnanti che hanno l'ufficio nello stesso edificio

--Calcolare la media dei voti di ogni appello d'esame

--Contare quanti corsi di laurea ci sono per ogni dipartimento




--JOINS:
--Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia

-- Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze

-- Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44)

-- Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il relativo dipartimento, in ordine alfabetico per cognome e nome

-- Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti

-- Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54)

-- BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per superare ciascuno dei suoi esami