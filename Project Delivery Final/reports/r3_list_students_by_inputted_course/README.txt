How to generate this report in SQL*Plus:

PART 1 - BUILD THE DATABASE
1. Use Oracle SQLPlus or VS Code with the SQLPlus extension.
2. Make sure your session is pointed at the schema you want to use.
3. Run the build script first to create all tables and constraints.
4. Run the populate script to insert sample data.
 
PART 2 - RUN THE REPORT
1. Open SQL*Plus and log in to your Oracle database.
2. Change to the directory where the script is saved.
3. At the SQL> prompt, enter:
     start script.sql
   and press Enter.
4. When prompted, type the course code you want to search for (e.g., CPRG200), then press Enter.
5. The script will use SPOOL to save the results to list_students_by_inputted_course_output.txt in the same folder.
6. Open the output file to review your report.
