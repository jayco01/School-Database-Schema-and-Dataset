-- GROUP 4, Project Part 4, Creating Tables with Constraints.

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
spool "c:/cprg250/Group4.projectcreate.txt"

column "Current User" format A25
column "When Executed" format A22
-- This SQL command returns the name of the user who is running this script.
prompt

prompt Current User:

select sys_context(
   'USERENV',
   'OS_USER'
) as "Current User",
       to_char(
          sysdate,
          'YYYY-MM-DD HH24:MI:SS'
       ) as "When Executed"
  from dual;

-- This is the beginning of the sql code.
drop table sis_student_course_record cascade constraints;
drop table sis_sched_course_instructor cascade constraints;
drop table sis_course_prerequisite cascade constraints;
drop table sis_credential_course cascade constraints;
drop table sis_student_credential cascade constraints;
drop table sis_instructor cascade constraints;
drop table sis_scheduled_course cascade constraints;
drop table sis_course cascade constraints;
drop table sis_credential cascade constraints;
drop table sis_student cascade constraints;

--1
create table sis_student (
   student_id   number,
   first_name   nvarchar2(50) not null,
   last_name    nvarchar2(50) not null,
   phone_number nchar(12) not null,
   status       nvarchar2(2) not null,
   status_date  date not null,
   email        nvarchar2(100) not null,
   constraint student_phone_ck check ( regexp_like ( phone_number,
                                                     '^[0-9]{3}\.[0-9]{3}\.[0-9]{4}$' ) ),
   constraint student_email_ck check ( regexp_like ( email,
                                                     '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' ) ),
   constraint student_email_uk unique ( email ),
   constraint student_phone_uk unique ( phone_number )
);

alter table sis_student add constraint student_pk primary key ( student_id );


--2
create table sis_credential (
   credential_number number
      constraint credential_number_pk primary key,
   school_associated nvarchar2(50) not null,
   name              nvarchar2(50) not null,
   type              nvarchar2(2) not null,
   constraint cred_type_ck
      check ( type in ( 'MI',
                        'FT',
                        'CT',
                        'DP',
                        'AD',
                        'D' ) )
);


--3
create table sis_course (
   course_code    nchar(7)
      constraint course_code_ck check ( regexp_like ( course_code,
                                                      '^[A-Z]{4}\d{3}$' ) ),
   name           nvarchar2(100) not null,
   num_of_credits number(2,1) not null,
   constraint course_num_cred_ck check ( num_of_credits between 0.5 and 9 ),
   constraint course_code_pk primary key ( course_code )
);


--4
create table sis_scheduled_course (
   crn           number(5),
   semester_code number(6),
   course_code   nchar(7) not null,
   section_code  nchar(1) not null,
   constraint scheduled_course_pk primary key ( crn,
                                                semester_code ),
   constraint scheduled_course_sem_code_ck check ( regexp_like ( semester_code,
                                                                 '^(19|20)\d{2}(01|02|03|04)$' ) ),
   constraint scheduled_course_section_ck check ( regexp_like ( section_code,
                                                                '^[A-Z]$' ) ),
   constraint course_sched_course_code_fk foreign key ( course_code )
      references sis_course ( course_code )
);


--5
create table sis_instructor (
   instructor_id number
      constraint instructor_id_pk primary key,
   first_name    nvarchar2(50) not null,
   last_name     nvarchar2(50) not null,
   address       nvarchar2(100) not null,
   city          nvarchar2(40) not null,
   province      nchar(2) not null,
   postal_code   nchar(6) not null,
   phone_number  nchar(12) not null,
   email         nvarchar2(100) not null,
   constraint instructor_email_uk unique ( email ),
   constraint instructor_phone_uk unique ( phone_number ),
   constraint instructor_prov_ck
      check ( province in ( 'AB',
                            'BC',
                            'SK',
                            'MB',
                            'NB',
                            'NL',
                            'NT',
                            'NS',
                            'NU',
                            'ON',
                            'PE',
                            'QC',
                            'YT' ) ),
   constraint instructor_postal_ck check ( regexp_like ( postal_code,
                                                         '^[A-Z][0-9][A-Z][0-9][A-Z][0-9]$' ) ),
   constraint instructor_phone_ck check ( regexp_like ( phone_number,
                                                        '^\d{3}\.\d{3}\.\d{4}$' ) ),
   constraint instructor_email_ck check ( regexp_like ( email,
                                                        '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$' ) )
);


--6
create table sis_student_credential (
   student_id        number,
   credential_number number,
   start_date        date not null,
   completion_date   date,
   credential_status nchar(1) not null,
   constraint student_cred_pk primary key ( student_id,
                                            credential_number ),
   constraint student_studentcred_fk foreign key ( student_id )
      references sis_student ( student_id ),
   constraint cred_studentcred_fk foreign key ( credential_number )
      references sis_credential ( credential_number )
);

alter table sis_student_credential add constraint credential_status_ck
      check ( credential_status in ( 'A',
                                     'G',
                                     'E' ) );


--7
create table sis_credential_course (
   credential_number number,
   course_code       nchar(7),
   type_flag         number(1) not null,
   constraint type_flag_ck check ( type_flag in ( 1,
                                                  2 ) ),
   constraint cred_course_pk primary key ( credential_number,
                                           course_code ),
   constraint cred_credcourse_fk foreign key ( credential_number )
      references sis_credential ( credential_number ),
   constraint course_credcourse_fk foreign key ( course_code )
      references sis_course ( course_code )
);


--8
create table sis_course_prerequisite (
   prerequisite_course_code nchar(7),
   course_code              nchar(7),
   constraint course_prereq_pk primary key ( prerequisite_course_code,
                                             course_code ),
   constraint course_prereq_fk foreign key ( course_code )
      references sis_course ( course_code )
);

alter table sis_course_prerequisite add constraint prereqcourse_code_ck
      check (prerequisite_course_code != course_code);



--9
create table sis_sched_course_instructor (
   crn           number(5),
   semester_code number(6),
   instructor_id number,
   constraint sc_instructor_pk primary key ( crn,
                                             semester_code,
                                             instructor_id ),
   constraint sc_instructor_fk
      foreign key ( crn,
                    semester_code )
         references sis_scheduled_course ( crn,
                                           semester_code ),
   constraint instructor_sc_fk foreign key ( instructor_id )
      references sis_instructor ( instructor_id )
);


--10
create table sis_student_course_record (
   crn           number(5),
   semester_code number(6),
   course_code   nchar(7) not null,
   student_id    number not null,
   letter_grade  nvarchar2(2) not null,
   constraint sc_record_grade_ck check ( regexp_like ( letter_grade,
                                                          '^(A(\+|-)?|B(\+|-)?|C(\+|-)?|D(\+|-)?|F|I)$' ) ),
   constraint sc_record_pk primary key ( crn,
                                         semester_code,
                                         course_code ),
   constraint sc_record_fk
      foreign key ( crn,
                    semester_code )
         references sis_scheduled_course ( crn,
                                           semester_code ),
   constraint course_sc_record_fk foreign key ( course_code )
      references sis_course ( course_code ),
   constraint student_sc_student_fk foreign key ( student_id )
      references sis_student ( student_id )
);

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