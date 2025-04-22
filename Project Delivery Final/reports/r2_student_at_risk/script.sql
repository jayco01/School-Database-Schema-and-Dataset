SPOOL "C:/cprg250/student_at_risk_output.txt"


clear columns
clear breaks
SET linesize 170
SET pagesize 80
SET TRIMOUT ON  
SET TRIMSPOOL ON    

COLUMN school_associated FORMAT A30;
COLUMN credential_name FORMAT A20;

SELECT c.school_associated, c.name AS credential_name, COUNT(s.status) AS at_risk, total.total_student AS school_total_student
-- , (COUNT(s.status)/total.total_student) AS risk_rate
FROM sis_student s
JOIN sis_student_credential scr 
    ON s.student_id = scr.student_id
JOIN sis_credential c
    ON scr.credential_number = c.credential_number
JOIN 
    (
        SELECT c.school_associated, COUNT(s.student_id) AS total_student
    FROM sis_student s 
    JOIN sis_student_credential scr
        ON s.student_id = scr.student_id
    JOIN sis_credential c
        ON scr.credential_number = c.credential_number
    GROUP BY c.school_associated
    ) total 
    ON c.school_associated = total.school_associated
WHERE s.status IN ('E','S','AP')
GROUP BY ROLLUP (c.school_associated, c.name, total.total_student)
ORDER BY c.school_associated, c.name
;













SPOOL OFF