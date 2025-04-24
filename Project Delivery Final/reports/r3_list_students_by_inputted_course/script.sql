SPOOL "C:/cprg250/list_students_by_inputted_course_output.txt"


clear columns
clear breaks
SET linesize 170
SET pagesize 80
SET TRIMOUT ON  
SET TRIMSPOOL ON

COLUMN first_name FORMAT A15;
COLUMN last_name FORMAT A20;
COLUMN course_code FORMAT A11;


SELECT DISTINCT s.student_id, s.first_name, 
    s.last_name, scr.semester_code, scr.course_code
FROM sis_student s
JOIN sis_student_course_record scr 
    ON s.student_id = scr.student_id
WHERE scr.course_code = UPPER(TRIM('&course_code'));


SPOOL OFF