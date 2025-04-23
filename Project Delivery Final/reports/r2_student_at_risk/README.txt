How to generate this report in SQL*Plus:

1. Open SQL*Plus and log in to your Oracle database.
2. Change to the directory where this report's script is saved.
3. At the SQL> prompt, enter:
     start script.sql
   and press Enter.
4. The script will use SPOOL to write the results to a file called student_at_risk_output.txt in the same directory.
5. Once the script finishes, open the output file to review the report.
