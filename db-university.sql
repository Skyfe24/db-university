/* 1. Selezionare tutti gli studenti nati nel 1990 (160) */


SELECT * FROM `students` WHERE YEAR(date_of_birth) = '1990'; 


/*2. Selezionare tutti i corsi che valgono più di 10 crediti (479) */


SELECT * FROM `courses` WHERE cfu > 10;


/*3. Selezionare tutti gli studenti che hanno più di 30 anni */


SELECT * FROM `students` WHERE year(date_of_birth)< 1992;  oppure WHERE (YEAR(CURDATE())) - YEAR('date_of_birth') >= 30;


/*4. Selezionare tutti i corsi del primo semestre del primo anno di un qualsiasi corso di
laurea (286)  */


SELECT * FROM `courses`WHERE `period` = 'I semestre' AND `year` = 1;

/*5. Selezionare tutti gli appelli d'esame che avvengono nel pomeriggio (dopo le 14) del
20/06/2020 (21)  */

SELECT * FROM `exams` WHERE DATE(`date`) = '2020-06-20' AND TIME(`hour`) > '14:00';

/*6. Selezionare tutti i corsi di laurea magistrale (38)  */

SELECT * FROM `degrees` WHERE `level` = 'magistrale';

/*7. Da quanti dipartimenti è composta l'università? (12)           */

SELECT COUNT(*) AS 'numero_dipartimenti' FROM `departments`;

/* 8. Quanti sono gli insegnanti che non hanno un numero di telefono? (50)    */

SELECT COUNT(*) AS 'num_insegnanti' FROM `teachers` WHERE `phone`is NULL;


/*1. QUERY CON GROUP BY  */

/*1. Contare quanti iscritti ci sono stati ogni anno  */

SELECT COUNT(*) FROM `students` GROUP BY `enrolment_date`;

/*2. Contare gli insegnanti che hanno l'ufficio nello stesso edificio  */

SELECT COUNT(*) FROM `teachers` GROUP BY `office_address`;

/*3. Calcolare la media dei voti di ogni appello d'esame  */

SELECT 'exam_id', ROUND(AVG('vote')) AS 'vote_average' FROM 'exam_student' GROUP BY 'exam_id'

/*4. Contare quanti corsi di laurea ci sono per ogni dipartiment  */

SELECT COUNT ('name') AS 'Corso', 'department_id' FROM 'degrees' GROUP BY 'department_id'

/*  1. Selezionare tutti gli studenti iscritti al Corso di Laurea in Economia */

AS S JOIN `degrees` AS D ON S.`degree_id` = D.`id`
WHERE D.`name` = 'Corso di Laurea in Economia';

/*  2. Selezionare tutti i Corsi di Laurea del Dipartimento di Neuroscienze */

SELECT DEG.`name`
FROM `degrees` AS DEG
JOIN `departments` AS DEP ON DEP.`id` = DEG.`department_id`
WHERE DEP.`name` = 'Dipartimento di Neuroscienze';

/*  3. Selezionare tutti i corsi in cui insegna Fulvio Amato (id=44) */

SELECT T.`name`
FROM `teachers` AS T
JOIN `course_teacher` AS CT ON T.`id` = CT.`teacher_id` JOIN `courses` AS C ON CT.`course_id` = C.`id` 
WHERE T.`name` = 'Fulvio Amato';

/*  4. Selezionare tutti gli studenti con i dati relativi al corso di laurea a cui sono iscritti e il
relativo dipartimento, in ordine alfabetico per cognome e nome */ 

SELECT S.`surname`AS `cognome`, S.`name` AS `nome`, DEG.`name` AS 'Corso', DEP.`name` AS 'Dipartimento'
FROM `students` AS S
JOIN `degrees` AS DEG ON DEG.`id` = S.`degree_id` JOIN `departments` AS DEP ON DEP.`id` = DEG.`department_id`
ORDER BY S.`surname` DESC, S.`name` DESC;



/*  5. Selezionare tutti i corsi di laurea con i relativi corsi e insegnanti */



/*  6. Selezionare tutti i docenti che insegnano nel Dipartimento di Matematica (54) */



/*  7. BONUS: Selezionare per ogni studente quanti tentativi d’esame ha sostenuto per */


