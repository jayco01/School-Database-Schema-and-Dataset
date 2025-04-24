How to generate this report in SQL*Plus:

PART 1 - BUILD THE DATABASE
1. Use Oracle SQLPlus or VS Code with the SQLPlus extension.
2. Make sure your session is pointed at the schema you want to use.
3. Run the build script first to create all tables and constraints.
4. Run the populate script to insert sample data.
 
PART 2 - RUN THE REPORT
1. Open SQL*Plus and log in to your Oracle database.
2. Navigate to the folder where your r4_high_performing_students script is saved.
3. At the SQL> prompt, type:
     start script.sql
   and press Enter.
4. The script will automatically run and create an output file called high_performing_students_output.txt in the same directory.
5. Once it finishes, open the output file to view the results.

