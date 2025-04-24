SPOOL "C:/cprg250/student_at_risk_output.txt"

-- I used ChatGPT4.0 to generate this report
-- At the end of the third prompt, the AI gave me a script which resulted in some errors but I was able to make a few changes to get the script working

-- Initial Prompt:
/*
I’m trying to make a report in Oracle 12c that shows which programs have the most at risk students
At risk means the student status is E, S, or AP
I want to see the program name, the school it's under, the number of at risk students, and the percentage of them compared to the total students in that program
Add a total row using ROLLUP
*/

-- Follow up prompt:
/*
I also need to see the total number of students per program
The percentage should be based on that
Format the percentage like 99%
*/

-- Follow up prompt:
/*
Use a clear alias for the percentage like flagged_pct
Don’t include extra columns in the GROUP BY, just what’s needed for the ROLLUP
*/


clear columns
clear breaks
SET linesize 170
SET pagesize 80
SET TRIMOUT ON  
SET TRIMSPOOL ON    

COLUMN credential_name FORMAT A20
COLUMN school FORMAT A30
COLUMN total_students FORMAT 999
COLUMN flagged_student FORMAT 999
COLUMN flagged_pct FORMAT A11

SELECT 
    c.name AS credential_name,
    c.school_associated AS school,
    COUNT(CASE WHEN s.status IN ('E', 'S', 'AP') THEN s.student_id END) AS flagged_student, 
    COUNT(sc.student_id) AS total_students,
    LPAD(TO_CHAR(
        ROUND(
            COUNT(CASE WHEN s.status IN ('E', 'S', 'AP') THEN s.student_id END) 
            * 100.0 / COUNT(sc.student_id), 0
        )
    ) || '%',10) AS flagged_pct
FROM sis_student_credential sc
JOIN sis_credential c 
    ON sc.credential_number = c.credential_number
JOIN sis_student s 
    ON sc.student_id = s.student_id
GROUP BY ROLLUP (c.school_associated, c.name)
ORDER BY 2, 1, 3;


SPOOL OFF