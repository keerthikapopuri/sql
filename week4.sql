SQL> select max(capacity),avg(capacity) from classroom;

MAX(CAPACITY) AVG(CAPACITY)
------------- -------------
          500           132

SQL> select min(budget) from department;

MIN(BUDGET)
-----------
      50000
SQL> select count(*),sum(credits)
  2  from course
  3  where dept_name='Biology';

  COUNT(*) SUM(CREDITS)
---------- ------------
         3           11



SQL> select avg(salary) from instructor where dept_name='Comp. Sci.';

AVG(SALARY)
-----------
 77333.3333


SQL> select dept_name,avg(salary) from instructor group by dept_name;

DEPT_NAME            AVG(SALARY)
-------------------- -----------
Biology                    72000
Comp. Sci.            77333.3333
Elec. Eng.                 80000
Finance                    85000
History                    61000
Music                      40000
Physics                    91000

7 rows selected.
SQL> select avg(salary),dept_name from instructor group by dept_name having avg(salary)>42000;

AVG(SALARY) DEPT_NAME
----------- --------------------
      72000 Biology
 77333.3333 Comp. Sci.
      80000 Elec. Eng.
      85000 Finance
      61000 History
      91000 Physics

6 rows selected.
SQL> select count(*) from teaches t,instructor i where semester='Spring' and year=2010 and t.ID=i.ID
 group by dept_name;

  COUNT(*)
----------
         4
         1
         1
         1


SQL> select avg(salary),dept_name from instructor group by dept_name having avg(salary)>42000;

AVG(SALARY) DEPT_NAME
----------- --------------------
      72000 Biology
 77333.3333 Comp. Sci.
      80000 Elec. Eng.
      85000 Finance
      61000 History
      91000 Physics

6 rows selected.
SQL> select max(salary),dept_name from instructor group by dept_nam

MAX(SALARY) DEPT_NAME
----------- --------------------
      72000 Biology
      92000 Comp. Sci.
      80000 Elec. Eng.
      90000 Finance
      62000 History
      40000 Music
      95000 Physics

7 rows selected.
SQL> select max(salary),dept_name from instructor group by dept_name;

MAX(SALARY) DEPT_NAME
----------- --------------------
      72000 Biology
      92000 Comp. Sci.
      80000 Elec. Eng.
      90000 Finance
      62000 History
      40000 Music
      95000 Physics

7 rows selected.
SQL> select t.course_id,title,credits
  2  from takes t,course c
  3  where t.ID=12345 and c.course_id=t.course_id;

COURSE_I TITLE                                                 CREDITS
-------- -------------------------------------------------- ----------
CS-101   Intro. to Computer Science                                  4
CS-190   Game Design                                                 4
CS-315   Robotics                                                    3
CS-347   Database System Concepts                                    3

SQL> select sum(credits),ID 
  2  from takes t,course c
  3  where c.course_id=t.course_id
  4  group by ID;

SUM(CREDITS) ID
------------ -----
           7 00128
          14 12345
           3 19991
           3 23121
           4 44553
          11 45678
           8 54321
           3 55739
           7 76543
           3 76653
           7 98765

SUM(CREDITS) ID
------------ -----
           8 98988

12 rows selected.
SQL> select count(distinct t.ID)
  2  from takes t
  3  where (t.course_id,t.semester,t.year) in (select course_id,semester,year from teaches where ID=
10101);

COUNT(DISTINCTT.ID)
-------------------
                  6
SQL> select title
  2  from course
  3  where course_id in (select course_id from teaches where (semester='Fall' and year=2009) or (sem
ester='Spring' and year=2010));

TITLE
--------------------------------------------------
Intro. to Computer Science
Robotics
Image Processing
Database System Concepts
Investment Banking
World History
Music Video Production
Physical Principles

8 rows selected.
SQL> select distinct(title)
  2  from course c,takes t
  3  where t.semester='Fall' and t.year=2009 and c.course_id=t.course_id and t.course_id not in (sel
ect course_id from takes where semester='Spring' and year=2010 );

TITLE
--------------------------------------------------
Database System Concepts
Physical Principles
SQL> select distinct(title)
  2  from course c,takes t
  3  where t.semester='Fall' and t.year=2009 and c.course_id=t.course_id and t.course_id  in (select
 course_id from takes where semester='Spring' and year=2010 );

TITLE
--------------------------------------------------
Intro. to Computer Science
SQL> select title from course
  2  where course_id in
  3  (select course_id from teaches where year=2009 group by course_id having count(course_id)<=1);

TITLE
--------------------------------------------------
Intro. to Biology
Intro. to Computer Science
Database System Concepts
Intro. to Digital Systems
Physical Principles
SQL> select title from course
  2  where course_id in
  3  (select course_id from teaches where year=2009 group by course_id having count(course_id)>=2)
  4  ;

TITLE
--------------------------------------------------
Game Design
SQL> select avg(salary)
  2  from instructor
  3  where dept_name in (select dept_name from instructor group by dept_name having avg(salary)>4200
0);

AVG(SALARY)
-----------
      78000

SQL> select dept_name 
  2  from department 
  3  where budget=(select max(budget) from department);

DEPT_NAME
--------------------
Finance
SQL> select name
  2  from instructor
  3  where ID not in (select distinct(ID) from teaches);

NAME
--------------------
Gold
Califieri
Singh
