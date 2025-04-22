
SPOOL "C:/cprg250/instructor_sections_class_average_output.txt"

clear columns
clear breaks
SET linesize 170
SET pagesize 80
SET TRIMOUT ON  
SET TRIMSPOOL ON    

COLUMN first_name FORMAT A13;
COLUMN last_name FORMAT A15;
COLUMN SEMESTER FORMAT A10;
COLUMN course_code FORMAT A12; 
COLUMN SECTION FORMAT A7; 
COLUMN class_avg FORMAT A11; 

SELECT i.first_name, i.last_name, 
    RPAD(sc.semester_code,10) AS "SEMESTER", 
    sc.course_code, LPAD(sc.section_code, 4) AS "SECTION",
    LPAD(TO_CHAR(AVG(
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
    ),99.99),8) AS class_avg
FROM sis_instructor i
JOIN sis_sched_course_instructor sci
    ON i.instructor_id = sci.instructor_id
JOIN sis_scheduled_course sc
    ON sci.crn = sc.crn 
    AND sci.semester_code = sc.semester_code
JOIN sis_student_course_record scr
    ON sc.crn = scr.crn
    AND sc.semester_code = scr.semester_code
GROUP BY i.first_name, i.last_name, 
    sc.semester_code, sc.course_code, 
    sc.section_code
ORDER BY 4,3,5,2,6
;

SPOOL OFF