SQL*Plus: Release 8.1.7.0.0 - Production on Tue Apr 26 12:12:20 2022

(c) Copyright 2000 Oracle Corporation.  All rights reserved.


Connected to:
Oracle8i Release 8.1.7.0.0 - Production
JServer Release 8.1.7.0.0 - Production

SQL> select * from tab;

no rows selected


SQL> create table course(course_name varchar(10),course_id number,department

Table created.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
COURSE                         TABLE

SQL> create table student(name varchar(15),id varchar(8),course varchar(5),s

Table created.

SQL> create table grade(id varchar(8),semester number,course varchar(5),grad

Table created.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
COURSE                         TABLE
GRADE                          TABLE
STUDENT                        TABLE

SQL> alter table course add instructor varchar(10);

Table altered.

SQL> alter table student modify id number;

Table altered.

SQL> alter table course
  2  drop column instructor;

Table altered.
SQL> desc course;
 Name                                      Null?    Type
 ----------------------------------------- -------- ------------------------
 COURSE_NAME                                        VARCHAR2(10)
 COURSE_ID                                          NUMBER
 DEPARTMENT                                         VARCHAR2(3)

SQL> desc grade;
 Name                                      Null?    Type
 ----------------------------------------- -------- ------------------------
 ID                                                 VARCHAR2(8)
 SEMESTER                                           NUMBER
 COURSE                                             VARCHAR2(5)
 GRADE                                              VARCHAR2(1)

SQL> insert into course values('dbms','12','cs');

1 row created.

SQL> alter table course modify course_name varchar(25);

Table altered.
SQL> insert into course values('&course_name','&course_id','&department');
Enter value for course_name: stastistics
Enter value for course_id: 10
Enter value for department: cs/
old   1: insert into course values('&course_name','&course_id','&department'
new   1: insert into course values('stastistics','10','cs/')

1 row created.

SQL> insert into course values('&course_name','&course_id','&department');
Enter value for course_name: os
Enter value for course_id: 9
Enter value for department: cs
old   1: insert into course values('&course_name','&course_id','&department'
new   1: insert into course values('os','9','cs')

1 row created.

SQL> select * from course;

COURSE_NAME                COURSE_ID DEP
------------------------- ---------- ---
dbms                              12 cs
stastistics                       10 cs/
os                                 9 cs

SQL> insert into student values('&name','&id','&course','&semester');
Enter value for name: keerthika
Enter value for id: 142
Enter value for course: dbms
Enter value for semester: 4
old   1: insert into student values('&name','&id','&course','&semester')
new   1: insert into student values('keerthika','142','dbms','4')

1 row created.

SQL> insert into student values('&name','&id','&course','&semester');
Enter value for name: sravanti
Enter value for id: 170
Enter value for course: os
Enter value for semester: 4
old   1: insert into student values('&name','&id','&course','&semester')
new   1: insert into student values('sravanti','170','os','4')

1 row created.

SQL> insert into student values('&name','&id','&course','&semester');
Enter value for name: divya
Enter value for id: 186
Enter value for course: cs
Enter value for semester: 4
old   1: insert into student values('&name','&id','&course','&semester')
new   1: insert into student values('divya','186','cs','4')

1 row created.

SQL> insert into grade values('&id','&semester','&course','&grade');
Enter value for id: cs113
Enter value for semester: 4
Enter value for course: dbms
Enter value for grade: a
old   1: insert into grade values('&id','&semester','&course','&grade')
new   1: insert into grade values('cs113','4','dbms','a')

1 row created.

SQL> /
Enter value for id: cs111
Enter value for semester: 3
Enter value for course: cs
Enter value for grade:
old   1: insert into grade values('&id','&semester','&course','&grade')
new   1: insert into grade values('cs111','3','cs','')

1 row created.

SQL> /
Enter value for id: cs110
Enter value for semester: 3
Enter value for course: cs
Enter value for grade: o
old   1: insert into grade values('&id','&semester','&course','&grade')
new   1: insert into grade values('cs110','3','cs','o')

1 row created.

SQL> select * from course;

COURSE_NAME                COURSE_ID DEP
------------------------- ---------- ---
dbms                              12 cs
stastistics                       10 cs/
os                                 9 cs

SQL> select * from student;

NAME                    ID COURS   SEMESTER
--------------- ---------- ----- ----------
keerthika              142 dbms           4
sravanti               170 os             4
divya                  186 cs             4

SQL> select * from grade;

ID         SEMESTER COURS G
-------- ---------- ----- -
cs113             4 dbms  a
cs111             3 cs
cs110             3 cs    o

SQL> update course set course_name='m1' where course_id='9';

1 row updated.

SQL> update student set id='172' where name='sravanti';

1 row updated.

SQL> update grade set grade='a';

3 rows updated.

SQL> update grade set grade='b',semester='6' where id='cs113';

1 row updated.

SQL> select * from course;

COURSE_NAME                COURSE_ID DEP
------------------------- ---------- ---
dbms                              12 cs
stastistics                       10 cs/
m1                                 9 cs

SQL> select * from student;

NAME                    ID COURS   SEMESTER
--------------- ---------- ----- ----------
keerthika              142 dbms           4
sravanti               172 os             4
divya                  186 cs             4

SQL> select * from grade;

ID         SEMESTER COURS G
-------- ---------- ----- -
cs113             6 dbms  b
cs111             3 cs    a
cs110             3 cs    a

SQL> delete from course where course_name='dbms';

1 row deleted.

SQL> delete from grade where id='cs110';

1 row deleted.

SQL> delete from student where id='142';

1 row deleted.

SQL> select * from course;

COURSE_NAME                COURSE_ID DEP
------------------------- ---------- ---
stastistics                       10 cs/
m1                                 9 cs

SQL> select * from student;

NAME                    ID COURS   SEMESTER
--------------- ---------- ----- ----------
sravanti               172 os             4
divya                  186 cs             4

SQL> select * from grade;

ID         SEMESTER COURS G
-------- ---------- ----- -
cs113             6 dbms  b
cs111             3 cs    a

SQL> update student set id='170' where initcap(name)='Sravanti';

1 row updated.

SQL> select * from student;

NAME                    ID COURS   SEMESTER
--------------- ---------- ----- ----------
sravanti               170 os             4
divya                  186 cs             4

SQL> drop table grade;

Table dropped.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
COURSE                         TABLE
STUDENT                        TABLE

SQL> truncate table course;

Table truncated.

SQL> select * from tab;

TNAME                          TABTYPE  CLUSTERID
------------------------------ ------- ----------
COURSE                         TABLE
STUDENT                        TABLE

SQL> desc course;
 Name                                      Null?    Type
 ----------------------------------------- -------- ------------------------
 COURSE_NAME                                        VARCHAR2(25)
 COURSE_ID                                          NUMBER
 DEPARTMENT                                         VARCHAR2(3)

SQL> select * from course;

no rows selected

SQL> commit;

Commit complete.

SQL> rollback;

Rollback complete.

SQL> 
