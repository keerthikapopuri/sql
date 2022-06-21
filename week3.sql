
SQL> select * from student;

ID    NAME                 DEPT_NAME              TOT_CRED
----- -------------------- -------------------- ----------
00128 Zhang                Comp. Sci.                  102
12345 Shankar              Comp. Sci.                   32
19991 Brandt               History                      80
23121 Chavez               Finance                     110
44553 Peltier              Physics                      56
45678 Levy                 Physics                      46
54321 Williams             Comp. Sci.                   54
55739 Sanchez              Music                        38
70557 Snow                 Physics                       0
76543 Brown                Comp. Sci.                   58
76653 Aoi                  Elec. Eng.                   60

ID    NAME                 DEPT_NAME              TOT_CRED
----- -------------------- -------------------- ----------
98765 Bourikas             Elec. Eng.                   98
98988 Tanaka               Biology                     120

13 rows selected.

SQL> select dept_name,name from instructor;

DEPT_NAME            NAME
-------------------- --------------------
Comp. Sci.           Srinivasan
Finance              Wu
Music                Mozart
Physics              Einstein
History              El Said
Physics              Gold
Comp. Sci.           Katz
History              Califieri
Finance              Singh
Biology              Crick
Comp. Sci.           Brandt

DEPT_NAME            NAME
-------------------- --------------------
Elec. Eng.           Kim

12 rows selected.

SQL> select name from instructor where dept_name='Biology';

NAME
--------------------
Crick

SQL> select name from instructor where salary>70000;

NAME
--------------------
Wu
Einstein
Gold
Katz
Singh
Crick
Brandt
Kim

8 rows selected.
SQL> select title from course where dept_name='Comp.Sci.' and credits=3;

no rows selected

SQL> select title from course where dept_name='Comp. Sci.' and credits=3;

TITLE
--------------------------------------------------
Robotics
Image Processing
Database System Concepts

SQL> select name,salary,1.1*salary raised_sal
  2  from instructor;

NAME                     SALARY RAISED_SAL
-------------------- ---------- ----------
Srinivasan                65000      71500
Wu                        90000      99000
Mozart                    40000      44000
Einstein                  95000     104500
El Said                   60000      66000
Gold                      87000      95700
Katz                      75000      82500
Califieri                 62000      68200
Singh                     80000      88000
Crick                     72000      79200
Brandt                    92000     101200

NAME                     SALARY RAISED_SAL
-------------------- ---------- ----------
Kim                       80000      88000

12 rows selected.

SQL> select name from instructor where salary>=90000 and salary<=100000;

NAME
--------------------
Wu
Einstein
Brandt

SQL> select name from instructor where salary is null;

no rows selected

SQL> select dept_name from department where lower(dept_name) like 'sci_';

no rows selected

SQL> select dept_name from department where lower(dept_name) like '%sci%';

DEPT_NAME
--------------------
Comp. Sci.

SQL> select building from department where lower(building) like '%watson%'

BUILDING
---------------
Watson
Watson

SQL> select dept_name from department where lower(building) like '%watson%

DEPT_NAME
--------------------
Biology
Physics

SQL> select name from instructor where dept_name='Physics' order by name;

NAME
--------------------
Einstein
Gold
