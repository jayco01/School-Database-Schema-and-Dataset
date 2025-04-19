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

INSERT INTO sis_student VALUES (000115001, 'Jayson', 'Tatum', '403.901.1001', 'A', '12-JAN-2024', 'jtatum@gmail.com');
INSERT INTO sis_student VALUES (000115002, 'Stephen', 'Curry', '403.901.1002', 'A', '10-JAN-2024', 'chef30@nba.com');
INSERT INTO sis_student VALUES (000115003, 'Giannis', 'Antetokounmpo', '403.901.1003', 'G', '02-MAY-2023', 'greekfreak@bucks.com');
INSERT INTO sis_student VALUES (000115004, 'Jimmy', 'Butler', '403.901.1004', 'A', '09-JAN-2024', 'himmybuckets@gmail.com');
INSERT INTO sis_student VALUES (000115005, 'Joel', 'Embiid', '403.901.1005', 'AP', '21-APR-2024', 'theprocess@nba.com');
INSERT INTO sis_student VALUES (000115006, 'Nikola', 'Jokic', '403.901.1006', 'A', '03-JAN-2024', 'jokicnicola@denver.com');
INSERT INTO sis_student VALUES (000115007, 'Zion', 'Williamson', '403.901.1007', 'S', '12-FEB-2024', 'zwilliamson@nola.com');
INSERT INTO sis_student VALUES (000115008, 'Tyrese', 'Haliburton', '403.901.1008', 'A', '18-JAN-2024', 'halibuckets@gmail.com');
INSERT INTO sis_student VALUES (000115009, 'Ja', 'Morant', '403.901.1009', 'S', '20-FEB-2024', 'morant@grizz.com');
INSERT INTO sis_student VALUES (000115010, 'Bradley', 'Beal', '403.901.1010', 'G', '05-SEP-2022', 'bballbeal@gmail.com');
INSERT INTO sis_student VALUES (000115011, 'Kawhi', 'Leonard', '403.901.1011', 'A', '10-JAN-2024', 'kawhi.silent@nba.com');
INSERT INTO sis_student VALUES (000115012, 'Paul', 'George', '403.901.1012', 'AP', '13-MAR-2024', 'pg13@clippers.com');
INSERT INTO sis_student VALUES (000115013, 'Damian', 'Lillard', '403.901.1013', 'A', '07-JAN-2024', 'dame@milwaukee.com');
INSERT INTO sis_student VALUES (000115014, 'Karl', 'Towns', '403.901.1014', 'A', '11-JAN-2024', 'ktowns@timberwolves.com');
INSERT INTO sis_student VALUES (000115015, 'Anthony', 'Edwards', '403.901.1015', 'A', '04-JAN-2024', 'antman@gmail.com');
INSERT INTO sis_student VALUES (000115016, 'Draymond', 'Green', '403.901.1016', 'E', '02-FEB-2024', 'draytrash@warriors.com');
INSERT INTO sis_student VALUES (000115017, 'Klay', 'Thompson', '403.901.1017', 'G', '05-MAY-2023', 'splash2@gmail.com');
INSERT INTO sis_student VALUES (000115018, 'Andrew', 'Wiggins', '403.901.1018', 'A', '08-JAN-2024', 'wiggycanada@warriors.com');
INSERT INTO sis_student VALUES (000115019, 'RJ', 'Barrett', '403.901.1019', 'AP', '19-JAN-2024', 'rjbarrett@raptors.com');
INSERT INTO sis_student VALUES (000115020, 'Scottie', 'Barnes', '403.901.1020', 'A', '09-JAN-2024', 'scottieb@raptors.com');
INSERT INTO sis_student VALUES (000115021, 'Shai', 'Gilgeous-Alexander', '403.901.1021', 'A', '06-JAN-2024', 'shai@thunder.com');
INSERT INTO sis_student VALUES (000115022, 'Jalen', 'Green', '403.901.1022', 'S', '16-JAN-2024', 'jalengreen@gmail.com');
INSERT INTO sis_student VALUES (000115023, 'Cade', 'Cunningham', '403.901.1023', 'A', '12-JAN-2024', 'cade@pistons.com');
INSERT INTO sis_student VALUES (000115024, 'Josh', 'Giddey', '403.901.1024', 'A', '13-JAN-2024', 'jgiddy@okc.com');
INSERT INTO sis_student VALUES (000115025, 'DeAaron', 'Fox', '403.901.1025', 'A', '17-JAN-2024', 'foxspeed@gmail.com');
INSERT INTO sis_student VALUES (000115026, 'Bam', 'Adebayo', '403.901.1026', 'A', '15-JAN-2024', 'bam@heat.com');
INSERT INTO sis_student VALUES (000115027, 'Tyler', 'Herro', '403.901.1027', 'AP', '22-JAN-2024', 'tylerbuckets@heat.com');
INSERT INTO sis_student VALUES (000115028, 'Desmond', 'Bane', '403.901.1028', 'A', '18-JAN-2024', 'bane3pt@gmail.com');
INSERT INTO sis_student VALUES (000115029, 'Jordan', 'Poole', '403.901.1029', 'S', '24-JAN-2024', 'jpooleparty@wiz.com');
INSERT INTO sis_student VALUES (000115030, 'Fred', 'VanVleet', '403.901.1030', 'G', '02-SEP-2023', 'fredv@houston.com');

INSERT INTO sis_student VALUES (000115061, 'Aja', 'Wilson', '403.555.1001', 'A', '15-JAN-2024', 'ajawilson22@gmail.com');
INSERT INTO sis_student VALUES (000115062, 'Breanna', 'Stewart', '403.555.1002', 'A', '18-JAN-2024', 'breannastew30@edu.ca');
INSERT INTO sis_student VALUES (000115063, 'Sabrina', 'Ionescu', '403.555.1003', 'A', '12-JAN-2024', 'sabrinaio20@outlook.com');
INSERT INTO sis_student VALUES (000115064, 'Kelsey', 'Plum', '403.555.1004', 'A', '20-JAN-2024', 'kplum10@gmail.com');
INSERT INTO sis_student VALUES (000115065, 'Arike', 'Ogunbowale', '403.555.1005', 'AP', '22-JAN-2024', 'arikeo24@edu.ca');
INSERT INTO sis_student VALUES (000115066, 'Napheesa', 'Collier', '403.555.1006', 'A', '14-JAN-2024', 'napheesa33@outlook.com');
INSERT INTO sis_student VALUES (000115067, 'Diamond', 'Miller', '403.555.1007', 'A', '17-JAN-2024', 'diamondm5@gmail.com');
INSERT INTO sis_student VALUES (000115068, 'Aliyah', 'Boston', '403.555.1008', 'A', '16-JAN-2024', 'aliyahboston@gmail.com');
INSERT INTO sis_student VALUES (000115069, 'Rhyne', 'Howard', '403.555.1009', 'G', '10-JAN-2024', 'rhynehoward@gmail.com');
INSERT INTO sis_student VALUES (000115070, 'Caitlin', 'Clark', '403.555.1010', 'A', '19-JAN-2024', 'caitlinclark22@gmail.com');

INSERT INTO sis_student VALUES (000115071, 'Charli', 'Collier', '403.555.1011', 'A', '13-JAN-2024', 'charlicollier@edu.ca');
INSERT INTO sis_student VALUES (000115072, 'Satou', 'Sabally', '403.555.1012', 'AP', '21-JAN-2024', 'satousabally@outlook.com');
INSERT INTO sis_student VALUES (000115073, 'Chennedy', 'Carter', '403.555.1013', 'S', '05-JAN-2024', 'ccarter@edu.ca');
INSERT INTO sis_student VALUES (000115074, 'Jackie', 'Young', '403.555.1014', 'A', '11-JAN-2024', 'jackieyoung12@gmail.com');
INSERT INTO sis_student VALUES (000115075, 'Jordan', 'Horston', '403.555.1015', 'A', '06-JAN-2024', 'jhorston23@edu.ca');
INSERT INTO sis_student VALUES (000115076, 'Haley', 'Jones', '403.555.1016', 'A', '09-JAN-2024', 'haleyjones@edu.ca');
INSERT INTO sis_student VALUES (000115077, 'Lexie', 'Hull', '403.555.1017', 'G', '12-JAN-2024', 'lexiehull@outlook.com');
INSERT INTO sis_student VALUES (000115078, 'Shakira', 'Austin', '403.555.1018', 'A', '04-JAN-2024', 'shakiraaustin@gmail.com');
INSERT INTO sis_student VALUES (000115079, 'DiJonai', 'Carrington', '403.555.1019', 'S', '07-JAN-2024', 'dcarrington5@edu.ca');
INSERT INTO sis_student VALUES (000115080, 'Tyasha', 'Harris', '403.555.1020', 'A', '08-JAN-2024', 'tyharris52@gmail.com');

INSERT INTO sis_student VALUES (000115081, 'Victoria', 'Vivians', '403.555.1021', 'A', '14-JAN-2024', 'vvivians@edu.ca');
INSERT INTO sis_student VALUES (000115082, 'Marina', 'Mabrey', '403.555.1022', 'S', '02-JAN-2024', 'mmabrey3@edu.ca');
INSERT INTO sis_student VALUES (000115083, 'Olivia', 'Nelson-Ododa', '403.555.1023', 'A', '15-JAN-2024', 'olivia.no@edu.ca');
INSERT INTO sis_student VALUES (000115084, 'Monika', 'Czinano', '403.555.1024', 'A', '03-JAN-2024', 'monikacz@edu.ca');
INSERT INTO sis_student VALUES (000115085, 'Ashley', 'Joens', '403.555.1025', 'AP', '11-JAN-2024', 'ashleyjoens@outlook.com');
INSERT INTO sis_student VALUES (000115086, 'Jasmine', 'Thomas', '403.555.1026', 'A', '10-JAN-2024', 'jthomas12@gmail.com');
INSERT INTO sis_student VALUES (000115087, 'Brittney', 'Sykes', '403.555.1027', 'A', '13-JAN-2024', 'bsykes@edu.ca');
INSERT INTO sis_student VALUES (000115088, 'Alanna', 'Smith', '403.555.1028', 'A', '20-JAN-2024', 'alannasmith@edu.ca');
INSERT INTO sis_student VALUES (000115089, 'Kia', 'Nurse', '403.555.1029', 'G', '18-JAN-2024', 'kianurse@gmail.com');
INSERT INTO sis_student VALUES (000115090, 'Brionna', 'Jones', '403.555.1030', 'A', '22-JAN-2024', 'bjones42@gmail.com');



-- 2) SIS_CREDENTIAL
INSERT INTO sis_credential VALUES (098321,'Business','Finance','D');
INSERT INTO sis_credential VALUES (096325,'Engineering','Civil','DP');
INSERT INTO sis_credential VALUES (087952,'Advanced Digital Technology','Software Development','DP');
INSERT INTO sis_credential VALUES (079962,'Arts','Photography','CT');
INSERT INTO sis_credential VALUES (062235,'Advanced Digital Technology','Data Analysis','CT');

INSERT INTO sis_credential VALUES (054321, 'Business', 'Accounting', 'D');
INSERT INTO sis_credential VALUES (043256, 'Engineering', 'Mechanical', 'DP');
INSERT INTO sis_credential VALUES (037654, 'Health Sciences', 'Nursing', 'DP');
INSERT INTO sis_credential VALUES (029876, 'Hospitality', 'Culinary Arts', 'CT');
INSERT INTO sis_credential VALUES (024578, 'Business', 'Marketing', 'D');
INSERT INTO sis_credential VALUES (018932, 'Media Arts', 'Graphic Design', 'CT');
INSERT INTO sis_credential VALUES (012345, 'Advanced Digital Technology', 'Cybersecurity', 'AD');



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

-- Business: Accounting & Marketing
INSERT INTO sis_course VALUES ('ACCT210', 'Financial Accounting Principles', 3.0);
INSERT INTO sis_course VALUES ('ACCT310', 'Managerial Accounting', 3.0);
INSERT INTO sis_course VALUES ('MKTG101', 'Principles of Marketing', 3.0);
INSERT INTO sis_course VALUES ('MKTG204', 'Digital Marketing Strategies', 3.0);

-- Engineering: Mechanical
INSERT INTO sis_course VALUES ('MECH220', 'Thermodynamics', 3.0);
INSERT INTO sis_course VALUES ('MECH310', 'Fluid Mechanics', 3.0);
INSERT INTO sis_course VALUES ('MECH330', 'Mechanical Systems Design', 3.0);

-- Health Sciences: Nursing
INSERT INTO sis_course VALUES ('NURS101', 'Introduction to Nursing Practice', 3.0);
INSERT INTO sis_course VALUES ('NURS210', 'Human Anatomy and Physiology', 3.0);

-- Advanced Digital Tech: Cybersecurity
INSERT INTO sis_course VALUES ('CYBR110', 'Introduction to Cybersecurity', 3.0);
INSERT INTO sis_course VALUES ('CYBR210', 'Network Security Basics', 3.0);

-- Hospitality: Culinary Arts
INSERT INTO sis_course VALUES ('CULN100', 'Foundations of Culinary Arts', 3.0);
INSERT INTO sis_course VALUES ('CULN200', 'World Cuisines and Cultures', 3.0);

-- Media Arts: Graphic Design
INSERT INTO sis_course VALUES ('GRPH101', 'Fundamentals of Graphic Design', 3.0);
INSERT INTO sis_course VALUES ('GRPH202', 'Typography and Visual Communication', 3.0);


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

INSERT INTO sis_instructor VALUES (00052040, 'Charles', 'Barkley', '34 TNT Dr', 'Calgary', 'AB', 'T3A1C4', '403.555.1984', 'cbarkley@edu.sait.com');
INSERT INTO sis_instructor VALUES (00052041, 'Patrick', 'Ewing', '33 Georgetown Ln', 'Edmonton', 'AB', 'T5H2K5', '780.555.1986', 'pewing@edu.sait.com');
INSERT INTO sis_instructor VALUES (00052042, 'Karl', 'Malone', '32 Mailman Ave', 'Red Deer', 'AB', 'T4N3Z3', '403.777.1990', 'kmalone@edu.sait.com');
INSERT INTO sis_instructor VALUES (00052043, 'John', 'Stockton', '12 Assist Blvd', 'Calgary', 'AB', 'T3B4P1', '403.901.1992', 'jstockton@edu.sait.com');
INSERT INTO sis_instructor VALUES (00052044, 'Reggie', 'Miller', '31 Pacers Rd', 'Regina', 'SK', 'S4P3Y5', '306.912.1989', 'rmiller@edu.sait.com');
INSERT INTO sis_instructor VALUES (00052045, 'Gary', 'Payton', '20 Glove Street', 'Vancouver', 'BC', 'V6H3R4', '604.777.1991', 'gpayton@edu.sait.com');
INSERT INTO sis_instructor VALUES (00052046, 'Detlef', 'Schrempf', '11 Sonics Blvd', 'Toronto', 'ON', 'M5V1B1', '416.690.1993', 'dschrempf@edu.sait.com');
INSERT INTO sis_instructor VALUES (00052047, 'Mitch', 'Richmond', '2 Shooting Guard Ln', 'Saskatoon', 'SK', 'S7H4R9', '306.808.1994', 'mrichmond@edu.sait.com');
INSERT INTO sis_instructor VALUES (00052048, 'Alonzo', 'Mourning', '33 Heat Heart St', 'Montreal', 'QC', 'H3B1L6', '514.808.1995', 'amourning@edu.sait.com');
INSERT INTO sis_instructor VALUES (00052049, 'Latrell', 'Sprewell', '8 Spree Run', 'Halifax', 'NS', 'B3H2Y2', '902.777.1996', 'lsprewell@edu.sait.com');



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

INSERT INTO sis_scheduled_course VALUES (30001, 202402, 'FINC221', 'F');
INSERT INTO sis_scheduled_course VALUES (30002, 202403, 'FINC221', 'B');
INSERT INTO sis_scheduled_course VALUES (30003, 202404, 'FINC221', 'B');
INSERT INTO sis_scheduled_course VALUES (30004, 202404, 'ACCT205', 'D');
INSERT INTO sis_scheduled_course VALUES (30005, 202402, 'ACCT205', 'F');
INSERT INTO sis_scheduled_course VALUES (30006, 202403, 'PHOT851', 'B');
INSERT INTO sis_scheduled_course VALUES (30007, 202401, 'FINC206', 'E');
INSERT INTO sis_scheduled_course VALUES (30008, 202402, 'FINC206', 'D');
INSERT INTO sis_scheduled_course VALUES (30009, 202401, 'FINC240', 'D');
INSERT INTO sis_scheduled_course VALUES (30010, 202401, 'FINC240', 'A');
INSERT INTO sis_scheduled_course VALUES (30011, 202403, 'FINC240', 'B');
INSERT INTO sis_scheduled_course VALUES (30012, 202401, 'CPRG200', 'A');
INSERT INTO sis_scheduled_course VALUES (30013, 202403, 'CPRG200', 'D');
INSERT INTO sis_scheduled_course VALUES (30014, 202402, 'MATH210', 'B');
INSERT INTO sis_scheduled_course VALUES (30015, 202403, 'MATH210', 'A');
INSERT INTO sis_scheduled_course VALUES (30016, 202402, 'MATH210', 'B');
INSERT INTO sis_scheduled_course VALUES (30017, 202403, 'ENGG201', 'A');
INSERT INTO sis_scheduled_course VALUES (30018, 202402, 'DATA821', 'A');
INSERT INTO sis_scheduled_course VALUES (30019, 202402, 'CPRG300', 'E');
INSERT INTO sis_scheduled_course VALUES (30020, 202403, 'CPRG300', 'F');


INSERT INTO sis_scheduled_course VALUES (40051, 202401, 'ACCT210', 'A');
INSERT INTO sis_scheduled_course VALUES (40052, 202402, 'ACCT310', 'B');
INSERT INTO sis_scheduled_course VALUES (40053, 202403, 'MKTG101', 'C');
INSERT INTO sis_scheduled_course VALUES (40054, 202404, 'MKTG204', 'D');
INSERT INTO sis_scheduled_course VALUES (40055, 202401, 'MECH220', 'E');
INSERT INTO sis_scheduled_course VALUES (40056, 202402, 'MECH310', 'F');
INSERT INTO sis_scheduled_course VALUES (40057, 202403, 'MECH330', 'G');
INSERT INTO sis_scheduled_course VALUES (40058, 202404, 'NURS101', 'H');
INSERT INTO sis_scheduled_course VALUES (40059, 202401, 'NURS210', 'I');
INSERT INTO sis_scheduled_course VALUES (40060, 202402, 'CYBR110', 'J');
INSERT INTO sis_scheduled_course VALUES (40061, 202403, 'CYBR210', 'K');
INSERT INTO sis_scheduled_course VALUES (40062, 202404, 'CULN100', 'L');
INSERT INTO sis_scheduled_course VALUES (40063, 202401, 'CULN200', 'M');
INSERT INTO sis_scheduled_course VALUES (40064, 202402, 'GRPH101', 'N');
INSERT INTO sis_scheduled_course VALUES (40065, 202403, 'GRPH202', 'O');








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
INSERT INTO sis_student_credential VALUES (000111001,062235,'25-Jan-2022','02-Mar-2023','G');
INSERT INTO sis_student_credential VALUES (000111001,037654,'16-Mar-2021',NULL,'A');
INSERT INTO sis_student_credential VALUES (000110002,079962,'01-Dec-2021',NULL,'A');
INSERT INTO sis_student_credential VALUES (000111003,062235,'08-May-2022','23-Mar-2024','E');
INSERT INTO sis_student_credential VALUES (000111003,037654,'17-Sep-2022','07-Aug-2024','G');
INSERT INTO sis_student_credential VALUES (000110055,029876,'15-Mar-2023','30-May-2025','G');
INSERT INTO sis_student_credential VALUES (000110055,054321,'30-May-2020','29-Oct-2021','G');
INSERT INTO sis_student_credential VALUES (000111023,096325,'08-Dec-2022',NULL,'A');
INSERT INTO sis_student_credential VALUES (000111023,054321,'24-Oct-2020','10-Aug-2022','G');
INSERT INTO sis_student_credential VALUES (000115000,018932,'07-May-2020','24-Feb-2021','G');
INSERT INTO sis_student_credential VALUES (000112004,096325,'07-Apr-2023','04-Jun-2024','E');
INSERT INTO sis_student_credential VALUES (000112004,043256,'03-Mar-2023','03-May-2024','E');
INSERT INTO sis_student_credential VALUES (000115001,062235,'22-Jan-2020',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115002,024578,'22-Mar-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115003,024578,'05-Sep-2020','21-Apr-2021','G');
INSERT INTO sis_student_credential VALUES (000115003,054321,'23-Apr-2022','19-Feb-2023','E');
INSERT INTO sis_student_credential VALUES (000115004,098321,'28-May-2022','14-Oct-2024','E');
INSERT INTO sis_student_credential VALUES (000115004,037654,'28-Apr-2023','20-Dec-2024','E');
INSERT INTO sis_student_credential VALUES (000115005,098321,'08-Feb-2024','09-Nov-2025','E');
INSERT INTO sis_student_credential VALUES (000115006,012345,'16-Mar-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115007,024578,'19-Sep-2023','12-Dec-2024','E');
INSERT INTO sis_student_credential VALUES (000115007,087952,'27-May-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115008,062235,'03-Nov-2021','18-Dec-2023','G');
INSERT INTO sis_student_credential VALUES (000115009,098321,'06-Apr-2021','11-Sep-2022','E');
INSERT INTO sis_student_credential VALUES (000115009,096325,'10-Sep-2020',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115010,087952,'07-Aug-2021','15-May-2022','G');
INSERT INTO sis_student_credential VALUES (000115011,043256,'01-Jan-2024',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115012,043256,'11-May-2023','12-Nov-2024','G');
INSERT INTO sis_student_credential VALUES (000115012,037654,'04-Aug-2023','12-Aug-2025','E');
INSERT INTO sis_student_credential VALUES (000115013,062235,'09-Jan-2021','03-Jan-2023','E');
INSERT INTO sis_student_credential VALUES (000115014,037654,'24-Sep-2020','29-Sep-2021','E');
INSERT INTO sis_student_credential VALUES (000115014,062235,'09-Jul-2022','27-Nov-2023','G');
INSERT INTO sis_student_credential VALUES (000115015,024578,'28-Jul-2022',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115016,054321,'09-Nov-2022','20-Jun-2024','E');
INSERT INTO sis_student_credential VALUES (000115016,043256,'23-Nov-2023','27-Apr-2026','G');
INSERT INTO sis_student_credential VALUES (000115017,098321,'03-Jul-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115017,079962,'12-Jan-2022',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115018,098321,'03-Jan-2021',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115019,096325,'08-Mar-2023','02-Oct-2024','E');
INSERT INTO sis_student_credential VALUES (000115020,098321,'29-May-2020','30-Jun-2021','G');
INSERT INTO sis_student_credential VALUES (000115020,079962,'17-Feb-2022',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115021,037654,'24-Sep-2020',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115022,087952,'07-May-2020',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115023,096325,'05-Nov-2023','30-Jun-2025','G');
INSERT INTO sis_student_credential VALUES (000115024,096325,'22-May-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115024,098321,'25-Jun-2021',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115025,012345,'06-Mar-2022','20-Jan-2023','E');
INSERT INTO sis_student_credential VALUES (000115025,043256,'27-Jun-2023','21-Mar-2024','E');
INSERT INTO sis_student_credential VALUES (000115026,024578,'07-Dec-2021','01-Mar-2023','G');
INSERT INTO sis_student_credential VALUES (000115027,037654,'28-May-2020',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115027,062235,'01-Feb-2024','10-Oct-2024','E');
INSERT INTO sis_student_credential VALUES (000115028,054321,'13-Mar-2020','21-Oct-2021','E');
INSERT INTO sis_student_credential VALUES (000115028,062235,'06-Oct-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115029,012345,'02-May-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115029,096325,'04-Apr-2020','11-Dec-2020','E');
INSERT INTO sis_student_credential VALUES (000115030,043256,'03-May-2022',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115030,054321,'23-Apr-2021','20-May-2023','E');
INSERT INTO sis_student_credential VALUES (000115061,037654,'29-Jun-2021',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115062,087952,'27-Apr-2023','30-Jan-2024','E');
INSERT INTO sis_student_credential VALUES (000115062,098321,'12-Mar-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115063,087952,'14-Jun-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115063,018932,'07-Feb-2024',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115064,029876,'08-Nov-2020','01-Jan-2022','G');
INSERT INTO sis_student_credential VALUES (000115065,096325,'12-Apr-2023','17-May-2025','E');
INSERT INTO sis_student_credential VALUES (000115066,024578,'06-Dec-2023','10-Jun-2025','E');
INSERT INTO sis_student_credential VALUES (000115067,029876,'30-Oct-2020','07-Apr-2023','E');
INSERT INTO sis_student_credential VALUES (000115067,079962,'01-Jun-2020',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115068,062235,'15-Nov-2020','25-Apr-2023','G');
INSERT INTO sis_student_credential VALUES (000115069,043256,'18-May-2023','27-Mar-2024','G');
INSERT INTO sis_student_credential VALUES (000115070,079962,'10-Feb-2021','17-Oct-2022','E');
INSERT INTO sis_student_credential VALUES (000115071,054321,'22-Jan-2022','08-Jul-2024','G');
INSERT INTO sis_student_credential VALUES (000115071,098321,'28-Sep-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115072,018932,'09-May-2023','10-Jun-2024','E');
INSERT INTO sis_student_credential VALUES (000115072,012345,'30-Jun-2020',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115073,087952,'20-Nov-2023','27-Sep-2024','E');
INSERT INTO sis_student_credential VALUES (000115074,054321,'02-Aug-2020','26-Sep-2021','E');
INSERT INTO sis_student_credential VALUES (000115074,024578,'23-Jul-2020','19-Dec-2022','E');
INSERT INTO sis_student_credential VALUES (000115075,029876,'25-Apr-2022',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115076,054321,'27-Jul-2020',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115076,096325,'25-Apr-2022','21-Jul-2023','E');
INSERT INTO sis_student_credential VALUES (000115077,024578,'24-Aug-2020','01-Jun-2022','E');
INSERT INTO sis_student_credential VALUES (000115078,012345,'03-Nov-2023','05-Sep-2024','G');
INSERT INTO sis_student_credential VALUES (000115079,037654,'16-Aug-2021','13-Nov-2023','E');
INSERT INTO sis_student_credential VALUES (000115079,054321,'17-Jun-2021',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115080,024578,'30-Oct-2022','19-Feb-2024','E');
INSERT INTO sis_student_credential VALUES (000115081,079962,'10-Jan-2022',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115082,037654,'31-Jul-2020',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115083,012345,'12-May-2021',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115083,024578,'14-Jan-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115084,087952,'09-Dec-2023','08-Oct-2025','E');
INSERT INTO sis_student_credential VALUES (000115085,054321,'29-Sep-2022','18-Jul-2023','E');
INSERT INTO sis_student_credential VALUES (000115086,024578,'11-Nov-2023','26-Feb-2026','G');
INSERT INTO sis_student_credential VALUES (000115087,029876,'11-Apr-2023','08-Jul-2025','E');
INSERT INTO sis_student_credential VALUES (000115088,087952,'04-May-2020','20-Oct-2022','E');
INSERT INTO sis_student_credential VALUES (000115089,054321,'28-Mar-2021',NULL,'A');
INSERT INTO sis_student_credential VALUES (000115089,018932,'23-Sep-2021','13-Sep-2022','E');
INSERT INTO sis_student_credential VALUES (000115090,018932,'05-Nov-2022','21-Aug-2024','E');
INSERT INTO sis_student_credential VALUES (000115090,043256,'20-Jan-2024',NULL,'A');

INSERT INTO sis_student_credential VALUES (000111023,098321,'15-JAN-2023',NULL,'A');
INSERT INTO sis_student_credential VALUES (000112004,079962,'15-JAN-2023','15-Jan-2025','G');
INSERT INTO sis_student_credential VALUES (000115000,062235,'15-JAN-2023',NULL,'A');




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
INSERT INTO sis_credential_course VALUES (054321,'ACCT205',0);
INSERT INTO sis_credential_course VALUES (098321,'FINC206',1);
INSERT INTO sis_credential_course VALUES (098321,'FINC310',1);
INSERT INTO sis_credential_course VALUES (098321,'FINC240',0);
INSERT INTO sis_credential_course VALUES (098321,'FINC420',1);
INSERT INTO sis_credential_course VALUES (054321,'ACCT210',0);
INSERT INTO sis_credential_course VALUES (054321,'ACCT310',1);
INSERT INTO sis_credential_course VALUES (024578,'MKTG101',1);
INSERT INTO sis_credential_course VALUES (054321,'MKTG101',1);
INSERT INTO sis_credential_course VALUES (024578,'MKTG204',0);
INSERT INTO sis_credential_course VALUES (043256,'MECH220',0);
INSERT INTO sis_credential_course VALUES (043256,'MECH310',1);
INSERT INTO sis_credential_course VALUES (043256,'MECH330',0);
INSERT INTO sis_credential_course VALUES (096325,'ENGG201',1);
INSERT INTO sis_credential_course VALUES (096325,'ENGG212',0);
INSERT INTO sis_credential_course VALUES (096325,'ENGG301',1);
INSERT INTO sis_credential_course VALUES (096325,'MATH210',0);
INSERT INTO sis_credential_course VALUES (043256,'PHYS305',0);
INSERT INTO sis_credential_course VALUES (037654,'NURS101',1);
INSERT INTO sis_credential_course VALUES (037654,'NURS210',1);
INSERT INTO sis_credential_course VALUES (087952,'CPRG200',0);
INSERT INTO sis_credential_course VALUES (087952,'CPRG203',1);
INSERT INTO sis_credential_course VALUES (087952,'CPRG300',1);
INSERT INTO sis_credential_course VALUES (087952,'CPRG303',1);
INSERT INTO sis_credential_course VALUES (087952,'COMM210',1);
INSERT INTO sis_credential_course VALUES (024578,'COMM210',1);
INSERT INTO sis_credential_course VALUES (079962,'PHOT851',0);
INSERT INTO sis_credential_course VALUES (079962,'PHOT852',1);
INSERT INTO sis_credential_course VALUES (079962,'PHOT853',0);
INSERT INTO sis_credential_course VALUES (062235,'DATA821',0);
INSERT INTO sis_credential_course VALUES (062235,'DATA822',0);
INSERT INTO sis_credential_course VALUES (062235,'DATA823',0);
INSERT INTO sis_credential_course VALUES (018932,'CYBR110',1);
INSERT INTO sis_credential_course VALUES (018932,'CYBR210',1);
INSERT INTO sis_credential_course VALUES (012345,'GRPH101',0);
INSERT INTO sis_credential_course VALUES (012345,'GRPH202',0);
INSERT INTO sis_credential_course VALUES (029876,'CULN100',0);
INSERT INTO sis_credential_course VALUES (029876,'CULN200',0);
INSERT INTO sis_credential_course VALUES (098321,'BSNI305',0);






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

INSERT INTO sis_course_prerequisite VALUES ('ACCT205','ACCT210');
INSERT INTO sis_course_prerequisite VALUES ('ACCT210','ACCT310');
INSERT INTO sis_course_prerequisite VALUES ('MKTG101','MKTG204');
INSERT INTO sis_course_prerequisite VALUES ('ENGG201','ENGG212');
INSERT INTO sis_course_prerequisite VALUES ('ENGG212','ENGG301');
INSERT INTO sis_course_prerequisite VALUES ('ENGG301','MATH210');
INSERT INTO sis_course_prerequisite VALUES ('MATH210','PHYS305');
INSERT INTO sis_course_prerequisite VALUES ('MECH220','MECH310');
INSERT INTO sis_course_prerequisite VALUES ('MECH310','MECH330');
INSERT INTO sis_course_prerequisite VALUES ('NURS101','NURS210');
INSERT INTO sis_course_prerequisite VALUES ('CYBR110','CYBR210');
INSERT INTO sis_course_prerequisite VALUES ('CULN100','CULN200');
INSERT INTO sis_course_prerequisite VALUES ('GRPH101','GRPH202');
INSERT INTO sis_course_prerequisite VALUES ('PHOT851','PHOT852');
INSERT INTO sis_course_prerequisite VALUES ('PHOT852','PHOT853');



-- 9) SIS_SCHED_COURSE_INSTRUCTOR
/*
AI Prompt
"I'm filling the SIS_SCHED_COURSE_INSTRUCTOR bridging table in Oracle 21c. Columns are: (crn, semester_code, instructor_id).

Each scheduled course can have one or more instructors.
I’ve got CRNs like 10001, 10002, etc. (from SIS_SCHEDULED_COURSE), and instructor IDs like 00052030, 00052031, etc.

Can you give me around 12–15 insert statements that assign instructors to scheduled courses?
Make sure every course has at least one instructor, and include at least one course that’s co-taught by two instructors."
*/
INSERT INTO sis_sched_course_instructor VALUES (10001,202401,00052037);
INSERT INTO sis_sched_course_instructor VALUES (10002,202401,00052039);
INSERT INTO sis_sched_course_instructor VALUES (10009,202401,00052032);
INSERT INTO sis_sched_course_instructor VALUES (10003,202402,00052030);
INSERT INTO sis_sched_course_instructor VALUES (10004,202402,00052035);
INSERT INTO sis_sched_course_instructor VALUES (10005,202403,00052032);
INSERT INTO sis_sched_course_instructor VALUES (10006,202403,00052030);
INSERT INTO sis_sched_course_instructor VALUES (10010,202403,00052036);
INSERT INTO sis_sched_course_instructor VALUES (10007,202404,00052034);
INSERT INTO sis_sched_course_instructor VALUES (10007,202404,00052033);
INSERT INTO sis_sched_course_instructor VALUES (10008,202404,00052034);
INSERT INTO sis_sched_course_instructor VALUES (30001,202402,00052038);
INSERT INTO sis_sched_course_instructor VALUES (30001,202402,00052030);
INSERT INTO sis_sched_course_instructor VALUES (30002,202403,00052036);
INSERT INTO sis_sched_course_instructor VALUES (30003,202404,00052036);
INSERT INTO sis_sched_course_instructor VALUES (30003,202404,00052037);
INSERT INTO sis_sched_course_instructor VALUES (30004,202404,00052032);
INSERT INTO sis_sched_course_instructor VALUES (30005,202402,00052033);
INSERT INTO sis_sched_course_instructor VALUES (30006,202403,00052039);
INSERT INTO sis_sched_course_instructor VALUES (30007,202401,00052036);
INSERT INTO sis_sched_course_instructor VALUES (30008,202402,00052031);
INSERT INTO sis_sched_course_instructor VALUES (30009,202401,00052039);
INSERT INTO sis_sched_course_instructor VALUES (30010,202401,00052030);
INSERT INTO sis_sched_course_instructor VALUES (30011,202403,00052034);
INSERT INTO sis_sched_course_instructor VALUES (30012,202401,00052030);
INSERT INTO sis_sched_course_instructor VALUES (30013,202403,00052031);
INSERT INTO sis_sched_course_instructor VALUES (30014,202402,00052036);
INSERT INTO sis_sched_course_instructor VALUES (30015,202403,00052037);
INSERT INTO sis_sched_course_instructor VALUES (30016,202402,00052033);
INSERT INTO sis_sched_course_instructor VALUES (30017,202403,00052037);
INSERT INTO sis_sched_course_instructor VALUES (30018,202402,00052036);
INSERT INTO sis_sched_course_instructor VALUES (30018,202402,00052033);
INSERT INTO sis_sched_course_instructor VALUES (30019,202402,00052036);
INSERT INTO sis_sched_course_instructor VALUES (30019,202402,00052032);
INSERT INTO sis_sched_course_instructor VALUES (30020,202403,00052037);


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

INSERT INTO sis_student_course_record VALUES (30001,202402,'FINC221',000115006,'I');
INSERT INTO sis_student_course_record VALUES (30001,202402,'FINC221',000115012,'A+');
INSERT INTO sis_student_course_record VALUES (30001,202402,'FINC221',000115002,'I');
INSERT INTO sis_student_course_record VALUES (30001,202402,'FINC221',000115011,'F');
INSERT INTO sis_student_course_record VALUES (30002,202403,'FINC221',000115002,'C');
INSERT INTO sis_student_course_record VALUES (30002,202403,'FINC221',000115006,'B+');
INSERT INTO sis_student_course_record VALUES (30003,202404,'FINC221',000115001,'C');
INSERT INTO sis_student_course_record VALUES (30003,202404,'FINC221',000115004,'F');
INSERT INTO sis_student_course_record VALUES (30003,202404,'FINC221',000115000,'C');
INSERT INTO sis_student_course_record VALUES (30003,202404,'FINC221',000115011,'D');
INSERT INTO sis_student_course_record VALUES (30004,202404,'ACCT205',000115000,'I');
INSERT INTO sis_student_course_record VALUES (30004,202404,'ACCT205',000115001,'D');
INSERT INTO sis_student_course_record VALUES (30004,202404,'ACCT205',000115012,'A+');
INSERT INTO sis_student_course_record VALUES (30004,202404,'ACCT205',000115011,'A+');
INSERT INTO sis_student_course_record VALUES (30005,202402,'ACCT205',000115005,'C');
INSERT INTO sis_student_course_record VALUES (30005,202402,'ACCT205',000115006,'B+');
INSERT INTO sis_student_course_record VALUES (30005,202402,'ACCT205',000115009,'B+');
INSERT INTO sis_student_course_record VALUES (30005,202402,'ACCT205',000115003,'D');
INSERT INTO sis_student_course_record VALUES (30006,202403,'PHOT851',000115010,'A');
INSERT INTO sis_student_course_record VALUES (30006,202403,'PHOT851',000115009,'C');
INSERT INTO sis_student_course_record VALUES (30007,202401,'FINC206',000115003,'B');
INSERT INTO sis_student_course_record VALUES (30007,202401,'FINC206',000115000,'C');
INSERT INTO sis_student_course_record VALUES (30008,202402,'FINC206',000115010,'A');
INSERT INTO sis_student_course_record VALUES (30008,202402,'FINC206',000115007,'D');
INSERT INTO sis_student_course_record VALUES (30008,202402,'FINC206',000115002,'I');
INSERT INTO sis_student_course_record VALUES (30009,202401,'FINC240',000115000,'I');
INSERT INTO sis_student_course_record VALUES (30009,202401,'FINC240',000115007,'A+');
INSERT INTO sis_student_course_record VALUES (30010,202401,'FINC240',000115010,'B');
INSERT INTO sis_student_course_record VALUES (30010,202401,'FINC240',000115003,'I');
INSERT INTO sis_student_course_record VALUES (30010,202401,'FINC240',000115005,'A+');
INSERT INTO sis_student_course_record VALUES (30011,202403,'FINC240',000115012,'B');
INSERT INTO sis_student_course_record VALUES (30011,202403,'FINC240',000115006,'B+');
INSERT INTO sis_student_course_record VALUES (30011,202403,'FINC240',000115005,'C');
INSERT INTO sis_student_course_record VALUES (30011,202403,'FINC240',000115009,'C');
INSERT INTO sis_student_course_record VALUES (30012,202401,'CPRG200',000115004,'B');
INSERT INTO sis_student_course_record VALUES (30012,202401,'CPRG200',000115001,'B+');
INSERT INTO sis_student_course_record VALUES (30012,202401,'CPRG200',000115006,'B+');
INSERT INTO sis_student_course_record VALUES (30013,202403,'CPRG200',000115011,'C');
INSERT INTO sis_student_course_record VALUES (30013,202403,'CPRG200',000115008,'A+');
INSERT INTO sis_student_course_record VALUES (30014,202402,'MATH210',000115001,'D');
INSERT INTO sis_student_course_record VALUES (30014,202402,'MATH210',000115012,'B');
INSERT INTO sis_student_course_record VALUES (30014,202402,'MATH210',000115008,'A+');
INSERT INTO sis_student_course_record VALUES (30015,202403,'MATH210',000115000,'F');
INSERT INTO sis_student_course_record VALUES (30015,202403,'MATH210',000115011,'A');
INSERT INTO sis_student_course_record VALUES (30015,202403,'MATH210',000115002,'B');
INSERT INTO sis_student_course_record VALUES (30016,202402,'MATH210',000115008,'I');
INSERT INTO sis_student_course_record VALUES (30016,202402,'MATH210',000115003,'C');
INSERT INTO sis_student_course_record VALUES (30016,202402,'MATH210',000115011,'D');
INSERT INTO sis_student_course_record VALUES (30017,202403,'ENGG201',000115001,'B+');
INSERT INTO sis_student_course_record VALUES (30017,202403,'ENGG201',000115003,'D');
INSERT INTO sis_student_course_record VALUES (30017,202403,'ENGG201',000115000,'D');
INSERT INTO sis_student_course_record VALUES (30017,202403,'ENGG201',000115010,'I');
INSERT INTO sis_student_course_record VALUES (30018,202402,'DATA821',000115001,'A+');
INSERT INTO sis_student_course_record VALUES (30018,202402,'DATA821',000115011,'D');
INSERT INTO sis_student_course_record VALUES (30018,202402,'DATA821',000115005,'D');
INSERT INTO sis_student_course_record VALUES (30018,202402,'DATA821',000115002,'B+');
INSERT INTO sis_student_course_record VALUES (30019,202402,'CPRG300',000115007,'C');
INSERT INTO sis_student_course_record VALUES (30019,202402,'CPRG300',000115003,'I');
INSERT INTO sis_student_course_record VALUES (30019,202402,'CPRG300',000115011,'B');
INSERT INTO sis_student_course_record VALUES (30019,202402,'CPRG300',000115000,'D');
INSERT INTO sis_student_course_record VALUES (30020,202403,'CPRG300',000115003,'D');
INSERT INTO sis_student_course_record VALUES (30020,202403,'CPRG300',000115000,'A+');
INSERT INTO sis_student_course_record VALUES (30020,202403,'CPRG300',000115010,'B+');


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
