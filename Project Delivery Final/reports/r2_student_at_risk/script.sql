SPOOL "C:/cprg250/student_at_risk_output.txt"


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
    COUNT(DISTINCT CASE WHEN s.status IN ('E', 'S', 'AP') THEN s.student_id END) AS flagged_student,
    COUNT(DISTINCT sc.student_id) AS total_students,
    LPAD(TO_CHAR(
        ROUND(
            COUNT(DISTINCT CASE WHEN s.status IN ('E', 'S', 'AP') THEN s.student_id END) 
            * 100.0 / COUNT(DISTINCT sc.student_id), 0
        )
    ) || '%',10) AS flagged_pct
FROM sis_student_credential sc
JOIN sis_credential c 
    ON sc.credential_number = c.credential_number
JOIN sis_student s 
    ON sc.student_id = s.student_id
GROUP BY ROLLUP (c.school_associated, c.name)
ORDER BY 2, 1, 3
;



SPOOL OFF