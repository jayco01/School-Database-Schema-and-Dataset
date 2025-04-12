-- Project – Part 56 – Populating Tables

-- GROUP 4, Project Part 5, Populating Tables.

-- Full documentation for the SQL*Plus tool can be found here:
-- https://docs.oracle.com/en/database/oracle/oracle-database/21/sqpug/preface.html#GUID-436EF2B3-54AF-4644-892E-5355C6E8FC23

-- Full documentation for the Oracle dialect of the SQL Language can be found here:
-- https://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/Preface.html#GUID-0897B474-6033-4398-AA8A-922F1C5CAF53

rem In Oracle SQL, comment lines can begin with rem and a space like this line,
-- or begin with two hyphens and a space like this line,
/* or they can  start with a slash and an asterisk,
   and end with an asterisk and a slash, like this block.
   Whichever way you do it, try to be consistent. */

-- To run a script named "renamethisscript.sql" in SQL*Plus,
-- put the script in the folder "C:/cprg250".
-- Start SQL*Plus and log in with the username cprg250.
-- Then use this command at the SQL> prompt:
--
--     start c:/cprg250/renamethisscript.sql
--
-- Remember to press the Enter key after typing that text!

-- What this does is tell SQL*Plus to start executing the SQL commands found
-- in the file that you specified.

-- The output from the executing commands will appear in the SQL*Plus window
-- as they execute.


-- Note:
-- SQL*Plus commands like CLEAR, SET, and SPOOL do not require
-- semicolons after them, because they are not SQL.
-- They set up the SQL*Plus command line interface to do certain things,
-- but are not passed along to the Oracle service that runs your code
-- in the background.

-- This SQL*Plus command undoes any column formatting that may have been set before the script was run.
clear columns

-- This SQL*Plus command undoes any break settings that may have been set before the script was run.
clear breaks

-- This SQL*Plus command starts displaying commands to the screen
-- or other output destination as they execute.
set echo on

-- This SQL*Plus command makes the output line length be 170 characters,
-- to help avoid ugly line breaks.
-- If you still get ugly line breaks, try increasing this value.
-- Try not to make it any larger than you need.
set linesize 170

-- This SQL*Plus command controls when SELECT output re-prints the column headers.
set pagesize 66

-- This SQL*Plus command opens an output file in the c:/cprg250 directory
-- that will receive the output from this script as it executes.
-- Such a file is sometimes called a "spool file".
-- YOU ARE SUPPOSED TO CHANGE THIS FILE NAME! MARKS WILL BE DEDUCTED IF YOU DO NOT.
-- An example might be
-- c:/cprg250/group10LabUnit11Output.txt
spool "c:/cprg250/Group4LabUnit9Output.txt"

-- This SQL command returns the name of the user who is running this script.
prompt
prompt Current User:
select sys_context('USERENV', 'OS_USER') as current_user
from dual;

-- This is where you put the formatting commands and SQL code that does what your
-- assignment requires.

-- Run this script each time you add a table, to make sure that each step is
-- working before you do the next.


-- Start by TRUNCATING the tables here.
-- Truncate the bridge tables (child tables) first, THEN Truncate the parent tables.
--
-- If the tables do not exist, you will get error messages.
-- Make sure that your table creation script has been run before you run this script.
--TRUNCATE TABLE tablename;

TRUNCATE TABLE sis_student_course_record;
TRUNCATE TABLE sis_sched_course_instructor;
TRUNCATE TABLE sis_course_prerequisite;
TRUNCATE TABLE sis_credential_course;
TRUNCATE TABLE sis_student_credential;
TRUNCATE TABLE sis_scheduled_course;
TRUNCATE TABLE sis_instructor;
TRUNCATE TABLE sis_course;
TRUNCATE TABLE sis_credential;
TRUNCATE TABLE sis_student;


----------------------------------------------------------------------------------------------------------

-- Now POPULATE the tables. Use the INSERT command.

-- !!!!!!!!!! !!!!!!!!!! !!!!!!!!!! !!!!!!!!!! !!!!!!!!!! 
-- REMEMBER TO INCLUDE ANY AI PROMPTS THAT YOU HAVE USED!
-- !!!!!!!!!! !!!!!!!!!! !!!!!!!!!! !!!!!!!!!! !!!!!!!!!! 

-- Remember that, unlike other SQL databases, Oracle does not allow
-- multiple rows of data to be inserted in a single INSERT statement.
-- You will need a separate INSERT statement for each row of data.


-- 1) SIS_STUDENT
INSERT INTO sis_student VALUES (000111001, 'Luka', 'Doncic', '403.909.1001', 'A',  '23-JAN-2024', 'lucadoncic@gmail.com');
INSERT INTO sis_student VALUES (000110002, 'Lebron', 'James',  '403.903.0008', 'G',  '28-SEP-2010', 'lebronjames@kingj.com');
INSERT INTO sis_student VALUES (000111003, 'Devin', 'Booker', '403.902.6001', 'S',  '15-JAN-2023', 'devinbuckets@yahoo.com');
INSERT INTO sis_student VALUES (000110055, 'Kevin', 'Durant', '403.904.9009', 'A',  '21-MAY-2024', 'kevindurant@brick.com');
INSERT INTO sis_student VALUES (000111023, 'Lamelo', 'Ball',   '403.903.2001', 'AP', '13-MAY-2024', 'theproblem@icey.com');
INSERT INTO sis_student VALUES (000115000, 'Lonzo', 'Ball',   '403.903.2002', 'A',  '05-SEP-2024', 'lonzoball@bigballer.com');
INSERT INTO sis_student VALUES (000112004, 'Liangelo', 'Ball',   '403.902.0009', 'E',  '21-JAN-2023', 'gelo@rap.god');



-- 2) SIS_CREDENTIAL
INSERT INTO sis_credential VALUES (098321,'Business','Finance','D');
INSERT INTO sis_credential VALUES (096325,'Engineering','Civil','DP');
INSERT INTO sis_credential VALUES (087952,'Advanced Digital Technology','Software Development','DP');
INSERT INTO sis_credential VALUES (079962,'Arts','Photography','CT');
INSERT INTO sis_credential VALUES (062235,'Advanced Digital Technology','Data Analysis','CT');


-- 3) SIS_COURSE
-- Populating SIS_COURSE table

INSERT INTO sis_course VALUES ('FINC221', 'Introduction to Stock Market', 3.0);
INSERT INTO sis_course VALUES ('ACCT205', 'Introduction to Accounting', 3.0);
INSERT INTO sis_course VALUES ('FINC206', 'Introduction to Finance', 3.0);
INSERT INTO sis_course VALUES ('FINC240', 'Introduction to Excel and PowerBI', 3.0);
INSERT INTO sis_course VALUES ('BSNI305', 'Excel for Stock Market Data Analysis', 3.0);
INSERT INTO sis_course VALUES ('FINC310', 'Advance Finance Concepts', 3.0);
INSERT INTO sis_course VALUES ('FINC360', 'Futures, Crypto and Forex', 3.0);
INSERT INTO sis_course VALUES ('FINC420', 'Advance Corporate Finance', 3.0);

INSERT INTO sis_course VALUES ('MATH210', 'Linear Algebra', 3.0);
INSERT INTO sis_course VALUES ('ENGG212', 'Introduction to Structures and Designs', 3.0);
INSERT INTO sis_course VALUES ('ENGG201', 'Introduction to Engineering', 3.0);
INSERT INTO sis_course VALUES ('ENGG301', 'Advance Engineering Concepts', 3.0);
INSERT INTO sis_course VALUES ('PHYS305', 'Physics of Structures', 3.0);

INSERT INTO sis_course VALUES ('CPRG200', 'Object Oriented Programming 1', 3.0);
INSERT INTO sis_course VALUES ('CPRG203', 'Web Development 1', 3.0);
INSERT INTO sis_course VALUES ('COMM210', 'Technical Comminication', 3.0);
INSERT INTO sis_course VALUES ('CPRG300', 'Object Oriented Programming 2', 3.0);
INSERT INTO sis_course VALUES ('CPRG303', 'Web Development 2', 3.0);

INSERT INTO sis_course VALUES ('PHOT851', 'Photography Foundations 1', 6.0);
INSERT INTO sis_course VALUES ('PHOT852', 'Photography Foundations 2', 6.0);
INSERT INTO sis_course VALUES ('PHOT853', 'Photography Foundations 3', 6.0);

INSERT INTO sis_course VALUES ('DATA821', 'Data Analysis Foundations 1', 6.0);
INSERT INTO sis_course VALUES ('DATA822', 'Data Analysis Foundations 2', 6.0);
INSERT INTO sis_course VALUES ('DATA823', 'Corporate Data Analysis', 6.0);



-- 4) SIS_INSTRUCTOR
INSERT INTO sis_instructor VALUES (00052030,'Michael','Jordan','23 Panorama St NW','Calgary','AB','T3A1E2','403.601.3000','michael@jordan.com');

INSERT INTO sis_instructor VALUES (00052031,'Larry','Bird','05 Crescent Heights Rd NE','Calgary','AB','T3A4E1','403.221.3203','lbird@edu.sait.com');

INSERT INTO sis_instructor VALUES (00052032,'Steve','Nash','13 Assist St','Vancouver','BC','V6B1V2','604.631.4050','snash@edu.sait.com');

INSERT INTO sis_instructor VALUES (00052033,'Magic','Johnson','90 Seton Main St','Calgary','AB','T3A2B5','403.332.4009','magicj@edu.sait.com');

INSERT INTO sis_instructor VALUES (00052034,'Shaquille','ONeal','48 Dunk Valley Rd','Red Deer','AB','T5A3H2','403.621.0478','shaq@edu.sait.com');

INSERT INTO sis_instructor VALUES (00052035,'Tim','Duncan','9865 University Road NW','Calgary','AB','T3A4N6','403.221.9846','timduncan@edu.sait.com');

INSERT INTO sis_instructor VALUES (00052036,'Bill','Russell','652 Forest Lawn NE','Calgary','AB','T3B2P9','403.591.3986','billrussell@edu.sait.com');

INSERT INTO sis_instructor VALUES (00052037,'Kareem','Abdul-Jabbar','33 Skyhook Ave','Toronto','ON','M5V3C9','416.983.3300','kareem@edu.sait.com');

INSERT INTO sis_instructor VALUES (00052038,'Wilt','Chamberlain','13 Dipper Drive','Montreal','QC','H3Z2Y7','514.764.1313','wilt@edu.sait.com');

INSERT INTO sis_instructor VALUES (00052039,'Dirk','Nowitzki','41 Uptown Drive','Winnipeg','MB','R3C1V9','204.321.4141','dnowitzki@edu.sait.com');


-- 5) SIS_SCHEDULED_COURSE
INSERT INTO sis_scheduled_course VALUES (10001, 202401, 'FINC221', 'A');

INSERT INTO sis_scheduled_course VALUES (10002, 202401, 'ACCT205', 'B');

INSERT INTO sis_scheduled_course VALUES (10009, 202401, 'PHOT851', 'C');

INSERT INTO sis_scheduled_course VALUES (10003, 202402, 'FINC206', 'A');

INSERT INTO sis_scheduled_course VALUES (10004, 202402, 'FINC240', 'B');

INSERT INTO sis_scheduled_course VALUES (10005, 202403, 'CPRG200', 'A');

INSERT INTO sis_scheduled_course VALUES (10006, 202403, 'MATH210', 'C');

INSERT INTO sis_scheduled_course VALUES (10010, 202403, 'ENGG201', 'D');

INSERT INTO sis_scheduled_course VALUES (10007, 202404, 'DATA821', 'A');

INSERT INTO sis_scheduled_course VALUES (10008, 202404, 'CPRG300', 'B');


------------------------------------------------------------------------
--After writing the insert statements for the parent tables, I copied my entire script and pasted it to CHATGPT4.0 to give it some context. I then wrote the prompts below.
--I tested a few prompts before I figured out a prompt "Template" that gave me the correct SQL script format that I wanted.
/*
TEMPLATE:
    Step 1
    - state the table name, oracle version and column names
    Step 2
    - state the business rules relevant to the table
    step 3
    - clarify any specific rules that was confusing or was not explicitly stated in the business rules
*/
------------------------------------------------------------------------

-- 6) SIS_STUDENT_CREDENTIAL
/*
AI Prompt
"I’m working on populating my SIS_STUDENT_CREDENTIAL table in Oracle 21c. The columns are: (student_id, credential_number, start_date, completion_date, credential_status).

Here's what I need:
2 students should have 1 credential each
1 student should have 2 credentials

I’ve got 7 students in total and 5 credentials

Status can be 'A' for active, 'G' for granted, or 'E' for expired
Can you create realistic insert statements using the DD-MON-YYYY date format?"

"Optimize the script. If someone started in 2010, the completion date should land somewhere around 2014. Also, just make sure the status makes sense, like if the credential is completed, the status should be 'G'."
*/
INSERT INTO sis_student_credential VALUES (000111001,098321,'24-JAN-2024',NULL,'A');
INSERT INTO sis_student_credential VALUES (000111003,079962,'15-JAN-2023',NULL,'E');
INSERT INTO sis_student_credential VALUES (000110055,087952,'21-MAY-2024','15-DEC-2025','G');
INSERT INTO sis_student_credential VALUES (000110055,062235,'16-DEC-2025',NULL,'A');
INSERT INTO sis_student_credential VALUES (000110002,096325,'28-SEP-2010','30-APR-2014','G');


-- 7) SIS_CREDENTIAL_COURSE
/*
AI Prompt
"I'm working on the SIS_CREDENTIAL_COURSE bridging table in Oracle 21c. Columns are:
(credential_number, course_code, type_flag) where type_flag is 1 for required, 0 for optional.

Here’s the setup:
2 certificates, each should have 2 to 3 courses
2 diplomas, around 5 courses each
1 finance degree with about 6 courses

I’m aiming for 4–5 required and 1–2 optional per diploma or degree.

Can you generate realistic insert statements using existing credential numbers like 098321, 096325, etc., and course codes like FINC221, CPRG200, etc.?"
*/
INSERT INTO sis_credential_course VALUES (098321,'FINC221',1);
INSERT INTO sis_credential_course VALUES (098321,'ACCT205',0);
INSERT INTO sis_credential_course VALUES (098321,'FINC206',1);
INSERT INTO sis_credential_course VALUES (098321,'FINC310',1);
INSERT INTO sis_credential_course VALUES (098321,'FINC240',1);
INSERT INTO sis_credential_course VALUES (098321,'FINC420',1);
INSERT INTO sis_credential_course VALUES (096325,'ENGG201',1);
INSERT INTO sis_credential_course VALUES (096325,'ENGG212',1);
INSERT INTO sis_credential_course VALUES (096325,'ENGG301',1);
INSERT INTO sis_credential_course VALUES (096325,'MATH210',1);
INSERT INTO sis_credential_course VALUES (096325,'PHYS305',1);
INSERT INTO sis_credential_course VALUES (087952,'CPRG200',1);
INSERT INTO sis_credential_course VALUES (087952,'CPRG203',1);
INSERT INTO sis_credential_course VALUES (087952,'CPRG300',1);
INSERT INTO sis_credential_course VALUES (087952,'CPRG303',1);
INSERT INTO sis_credential_course VALUES (087952,'COMM210',0);
INSERT INTO sis_credential_course VALUES (079962,'PHOT851',1);
INSERT INTO sis_credential_course VALUES (079962,'PHOT852',1);
INSERT INTO sis_credential_course VALUES (079962,'PHOT853',0);
INSERT INTO sis_credential_course VALUES (062235,'DATA821',1);
INSERT INTO sis_credential_course VALUES (062235,'DATA822',1);
INSERT INTO sis_credential_course VALUES (062235,'DATA823',0);


-- 8) SIS_COURSE_PREREQUISITE
/*
AI Prompt
"I'm working on the SIS_COURSE_PREREQUISITE table in Oracle 21c. Columns are: (prerequisite_course_code, course_code).

Constraints:
A course can have 0, 1, or multiple prerequisites
A course can’t be its own prerequisite

I’ve got courses like FINC206, FINC310, FINC360, etc.
Can you create logical prerequisite relationships? Like advanced finance courses should require intro-level ones (e.g. FINC310 needs FINC206).
Same for engineering, ENGG301 should need ENGG201.

Also, include a couple for data analysis. Something like DATA822 needs DATA821, and DATA823 needs DATA822.
Just generate insert statements that make sense."
*/
INSERT INTO sis_course_prerequisite VALUES ('FINC206','FINC310');
INSERT INTO sis_course_prerequisite VALUES ('FINC310','FINC360');
INSERT INTO sis_course_prerequisite VALUES ('FINC310','FINC420');
INSERT INTO sis_course_prerequisite VALUES ('ENGG201','ENGG301');
INSERT INTO sis_course_prerequisite VALUES ('CPRG200','CPRG300');
INSERT INTO sis_course_prerequisite VALUES ('CPRG203','CPRG303');
INSERT INTO sis_course_prerequisite VALUES ('DATA821','DATA822');
INSERT INTO sis_course_prerequisite VALUES ('DATA822','DATA823');


-- 9) SIS_SCHED_COURSE_INSTRUCTOR
/*
AI Prompt
"I'm filling the SIS_SCHED_COURSE_INSTRUCTOR bridging table in Oracle 21c. Columns are: (crn, semester_code, instructor_id).

Each scheduled course can have one or more instructors.
I’ve got CRNs like 10001, 10002, etc. (from SIS_SCHEDULED_COURSE), and instructor IDs like 00052030, 00052031, etc.

Can you give me around 12–15 insert statements that assign instructors to scheduled courses?
Make sure every course has at least one instructor, and include at least one course that’s co-taught by two instructors."
*/
INSERT INTO sis_sched_course_instructor VALUES (10001,202401,00052030);
INSERT INTO sis_sched_course_instructor VALUES (10002,202401,00052031);
INSERT INTO sis_sched_course_instructor VALUES (10009,202401,00052032);
INSERT INTO sis_sched_course_instructor VALUES (10009,202401,00052033);
INSERT INTO sis_sched_course_instructor VALUES (10003,202402,00052034);
INSERT INTO sis_sched_course_instructor VALUES (10004,202402,00052035);
INSERT INTO sis_sched_course_instructor VALUES (10005,202403,00052036);
INSERT INTO sis_sched_course_instructor VALUES (10006,202403,00052037);
INSERT INTO sis_sched_course_instructor VALUES (10010,202403,00052038);
INSERT INTO sis_sched_course_instructor VALUES (10007,202404,00052039);
INSERT INTO sis_sched_course_instructor VALUES (10008,202404,00052030);
INSERT INTO sis_sched_course_instructor VALUES (10008,202404,00052031);


-- 10) SIS_STUDENT_COURSE_RECORD
/*
AI Prompt
"I'm working on the SIS_STUDENT_COURSE_RECORD table in Oracle 21c. Columns are:
(crn, semester_code, course_code, student_id, letter_grade).

I need 20 rows total. Here are the given rules:
Multiple students can be in the same scheduled course
Grades can be A, A+, B, B+, C, D, F, or I for incomplete
Make sure each (crn, semester_code, course_code) exists in SIS_SCHEDULED_COURSE
Spread the records across 7 students

Generate realistic insert statements."
*/
-- Summer 2024
INSERT INTO sis_student_course_record VALUES (10001,202401,'FINC221',000111001,'A+');
INSERT INTO sis_student_course_record VALUES (10001,202401,'FINC221',000111023,'B');
INSERT INTO sis_student_course_record VALUES (10002,202401,'ACCT205',000110002,'A');
INSERT INTO sis_student_course_record VALUES (10002,202401,'ACCT205',000111023,'C-');
INSERT INTO sis_student_course_record VALUES (10009,202401,'PHOT851',000111003,'F');
INSERT INTO sis_student_course_record VALUES (10009,202401,'PHOT851',000110055,'A-');

-- Fall 2024
INSERT INTO sis_student_course_record VALUES (10003,202402,'FINC206',000110055,'B+');
INSERT INTO sis_student_course_record VALUES (10003,202402,'FINC206',000112004,'I');
INSERT INTO sis_student_course_record VALUES (10004,202402,'FINC240',000110002,'C+');

-- Winter 2025
INSERT INTO sis_student_course_record VALUES (10005,202403,'CPRG200',000111003,'B');
INSERT INTO sis_student_course_record VALUES (10005,202403,'CPRG200',000115000,'B+');
INSERT INTO sis_student_course_record VALUES (10006,202403,'MATH210',000111001,'A');
INSERT INTO sis_student_course_record VALUES (10006,202403,'MATH210',000111023,'A+');
INSERT INTO sis_student_course_record VALUES (10010,202403,'ENGG201',000112004,'D+');

-- Spring 2025
INSERT INTO sis_student_course_record VALUES (10007,202404,'DATA821',000115000,'A+');
INSERT INTO sis_student_course_record VALUES (10007,202404,'DATA821',000110002,'F');
INSERT INTO sis_student_course_record VALUES (10008,202404,'CPRG300',000111001,'B-');
INSERT INTO sis_student_course_record VALUES (10008,202404,'CPRG300',000110055,'A');
INSERT INTO sis_student_course_record VALUES (10008,202404,'CPRG300',000111003,'I');
INSERT INTO sis_student_course_record VALUES (10008,202404,'CPRG300',000112004,'B+');

COMMIT;

-- This is where you end the assignment's SQL code.
-- After this, the following commands stop writing the output to the
-- screen and spool output file, and reset any formatting commands
-- that may have been part of the SQL code.

-- This SQL*Plus command stops displaying the commands as they execute.
set echo off

-- This SQL*Plus command stops the output from being written to the spool file.
spool off

-- These SQL*Plus commands undo any column formats or column break settings
-- that may have been set in this script.
clear columns
clear breaks
