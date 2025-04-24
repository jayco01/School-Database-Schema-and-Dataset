How to generate this report in SQL*Plus:

PART 1 - BUILD THE DATABASE
1. Use Oracle SQLPlus or VS Code with the SQLPlus extension.
2. Make sure your session is pointed at the schema you want to use.
3. Run the build script first to create all tables and constraints.
4. Run the populate script to insert sample data.
 
PART 2 - RUN THE REPORT
1. Open SQL*Plus and log in to your Oracle database.
2. Use the CD command or navigate to the folder r1_instructor_sections_class_average.
3. At the SQL> prompt, run the script by typing:
     start script.sql
   Then press Enter.
4. The script will create an output file called instructor_sections_class_average_output.txt in the same folder, using the SPOOL command.
5. When the script finishes running, review the output file to see the results.
