SPOOL "C:/cprg250/high_performing_students_output.txt"

clear columns
clear breaks
SET linesize 170
SET pagesize 60
SET TRIMOUT ON  
SET TRIMSPOOL ON

COLUMN first_name FORMAT A15;
COLUMN last_name FORMAT A20;
COLUMN credential_name FORMAT A20;
COLUMN student_avg FORMAT 99.99;
COLUMN credential_avg FORMAT 99.99;
COLUMN relative_performance FORMAT A20;

WITH program_avg AS (
    SELECT c.credential_number,
        AVG(
            CASE scr.letter_grade
                WHEN N'A+' THEN 100
                WHEN N'A' THEN 89
                WHEN N'A-' THEN 84
                WHEN N'B+' THEN 79
                WHEN N'B' THEN 76
                WHEN N'B-' THEN 72
                WHEN N'C+' THEN 69
                WHEN N'C' THEN 66
                WHEN N'C-' THEN 62
                WHEN N'D+' THEN 59
                WHEN N'D' THEN 54
                WHEN N'D-' THEN 50
                WHEN N'F' THEN 0
                WHEN N'I' THEN NULL
                ELSE NULL
            END
        ) AS total_avg
    FROM sis_student_course_record scr
    JOIN sis_student s
        ON scr.student_id = s.student_id
    JOIN sis_student_credential scred
        ON s.student_id = scred.student_id
    JOIN sis_credential c
        ON scred.credential_number = c.credential_number
    GROUP BY c.credential_number
), 
student_avg AS (
    SELECT s.student_id, scred.credential_number,
        AVG(
            CASE scr.letter_grade
                WHEN N'A+' THEN 100
                WHEN N'A' THEN 89
                WHEN N'A-' THEN 84
                WHEN N'B+' THEN 79
                WHEN N'B' THEN 76
                WHEN N'B-' THEN 72
                WHEN N'C+' THEN 69
                WHEN N'C' THEN 66
                WHEN N'C-' THEN 62
                WHEN N'D+' THEN 59
                WHEN N'D' THEN 54
                WHEN N'D-' THEN 50
                WHEN N'F' THEN 0
                WHEN N'I' THEN NULL
                ELSE NULL
            END
        ) AS total_avg
    FROM sis_student_course_record scr
    JOIN sis_student s
        ON scr.student_id = s.student_id
    JOIN sis_student_credential scred
        ON s.student_id = scred.student_id
    GROUP BY s.student_id, scred.credential_number
)
SELECT s.student_id, s.first_name, s.last_name, 
    c.credential_number AS "CREDENTIAL#", c.name AS credential_name, sa.total_avg AS student_avg, pa.total_avg AS credential_avg,
    LPAD(TO_CHAR(ROUND(((sa.total_avg/pa.total_avg)*100),0)) || '%',12) AS relative_performance
FROM program_avg pa
JOIN student_avg sa
    ON pa.credential_number = sa.credential_number
JOIN sis_student s
    ON sa.student_id = s.student_id
JOIN sis_credential c
    ON sa.credential_number = c.credential_number
WHERE sa.total_avg > pa.total_avg
ORDER BY 5, 6 DESC, 3, 2
;



SPOOL OFF