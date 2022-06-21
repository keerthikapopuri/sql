
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
SQL> select * from instructor order by salary desc, name asc;

ID    NAME                 DEPT_NAME                SALARY
----- -------------------- -------------------- ----------
22222 Einstein             Physics                   95000
83821 Brandt               Comp. Sci.                92000
12121 Wu                   Finance                   90000
33456 Gold                 Physics                   87000
98345 Kim                  Elec. Eng.                80000
76543 Singh                Finance                   80000
45565 Katz                 Comp. Sci.                75000
76766 Crick                Biology                   72000
10101 Srinivasan           Comp. Sci.                65000
58583 Califieri            History                   62000
32343 El Said              History                   60000

ID    NAME                 DEPT_NAME                SALARY
----- -------------------- -------------------- ----------
15151 Mozart               Music                     40000

12 rows selected.
SQL> select * from instructor,teaches;

ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 10101 CS-101
1        Fall         2009

12121 Wu                   Finance                   90000 10101 CS-101
1        Fall         2009

15151 Mozart               Music                     40000 10101 CS-101
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 10101 CS-101
1        Fall         2009

32343 El Said              History                   60000 10101 CS-101
1        Fall         2009

33456 Gold                 Physics                   87000 10101 CS-101
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 10101 CS-101
1        Fall         2009

58583 Califieri            History                   62000 10101 CS-101
1        Fall         2009

76543 Singh                Finance                   80000 10101 CS-101
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 10101 CS-101
1        Fall         2009

83821 Brandt               Comp. Sci.                92000 10101 CS-101
1        Fall         2009

98345 Kim                  Elec. Eng.                80000 10101 CS-101
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 10101 CS-315
1        Spring       2010

12121 Wu                   Finance                   90000 10101 CS-315
1        Spring       2010

15151 Mozart               Music                     40000 10101 CS-315
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 10101 CS-315
1        Spring       2010

32343 El Said              History                   60000 10101 CS-315
1        Spring       2010

33456 Gold                 Physics                   87000 10101 CS-315
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 10101 CS-315
1        Spring       2010

58583 Califieri            History                   62000 10101 CS-315
1        Spring       2010

76543 Singh                Finance                   80000 10101 CS-315
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 10101 CS-315
1        Spring       2010

83821 Brandt               Comp. Sci.                92000 10101 CS-315
1        Spring       2010

98345 Kim                  Elec. Eng.                80000 10101 CS-315
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 10101 CS-347
1        Fall         2009

12121 Wu                   Finance                   90000 10101 CS-347
1        Fall         2009

15151 Mozart               Music                     40000 10101 CS-347
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 10101 CS-347
1        Fall         2009

32343 El Said              History                   60000 10101 CS-347
1        Fall         2009

33456 Gold                 Physics                   87000 10101 CS-347
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 10101 CS-347
1        Fall         2009

58583 Califieri            History                   62000 10101 CS-347
1        Fall         2009

76543 Singh                Finance                   80000 10101 CS-347
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 10101 CS-347
1        Fall         2009

83821 Brandt               Comp. Sci.                92000 10101 CS-347
1        Fall         2009

98345 Kim                  Elec. Eng.                80000 10101 CS-347
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 12121 FIN-20
1        Spring       2010

12121 Wu                   Finance                   90000 12121 FIN-20
1        Spring       2010

15151 Mozart               Music                     40000 12121 FIN-20
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 12121 FIN-20
1        Spring       2010

32343 El Said              History                   60000 12121 FIN-20
1        Spring       2010

33456 Gold                 Physics                   87000 12121 FIN-20
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 12121 FIN-20
1        Spring       2010

58583 Califieri            History                   62000 12121 FIN-20
1        Spring       2010

76543 Singh                Finance                   80000 12121 FIN-20
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 12121 FIN-20
1        Spring       2010

83821 Brandt               Comp. Sci.                92000 12121 FIN-20
1        Spring       2010

98345 Kim                  Elec. Eng.                80000 12121 FIN-20
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 15151 MU-199
1        Spring       2010

12121 Wu                   Finance                   90000 15151 MU-199
1        Spring       2010

15151 Mozart               Music                     40000 15151 MU-199
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 15151 MU-199
1        Spring       2010

32343 El Said              History                   60000 15151 MU-199
1        Spring       2010

33456 Gold                 Physics                   87000 15151 MU-199
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 15151 MU-199
1        Spring       2010

58583 Califieri            History                   62000 15151 MU-199
1        Spring       2010

76543 Singh                Finance                   80000 15151 MU-199
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 15151 MU-199
1        Spring       2010

83821 Brandt               Comp. Sci.                92000 15151 MU-199
1        Spring       2010

98345 Kim                  Elec. Eng.                80000 15151 MU-199
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 22222 PHY-10
1        Fall         2009

12121 Wu                   Finance                   90000 22222 PHY-10
1        Fall         2009

15151 Mozart               Music                     40000 22222 PHY-10
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 22222 PHY-10
1        Fall         2009

32343 El Said              History                   60000 22222 PHY-10
1        Fall         2009

33456 Gold                 Physics                   87000 22222 PHY-10
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 22222 PHY-10
1        Fall         2009

58583 Califieri            History                   62000 22222 PHY-10
1        Fall         2009

76543 Singh                Finance                   80000 22222 PHY-10
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 22222 PHY-10
1        Fall         2009

83821 Brandt               Comp. Sci.                92000 22222 PHY-10
1        Fall         2009

98345 Kim                  Elec. Eng.                80000 22222 PHY-10
1        Fall         2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 32343 HIS-35
1        Spring       2010

12121 Wu                   Finance                   90000 32343 HIS-35
1        Spring       2010

15151 Mozart               Music                     40000 32343 HIS-35
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 32343 HIS-35
1        Spring       2010

32343 El Said              History                   60000 32343 HIS-35
1        Spring       2010

33456 Gold                 Physics                   87000 32343 HIS-35
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 32343 HIS-35
1        Spring       2010

58583 Califieri            History                   62000 32343 HIS-35
1        Spring       2010

76543 Singh                Finance                   80000 32343 HIS-35
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 32343 HIS-35
1        Spring       2010

83821 Brandt               Comp. Sci.                92000 32343 HIS-35
1        Spring       2010

98345 Kim                  Elec. Eng.                80000 32343 HIS-35
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 45565 CS-101
1        Spring       2010

12121 Wu                   Finance                   90000 45565 CS-101
1        Spring       2010

15151 Mozart               Music                     40000 45565 CS-101
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 45565 CS-101
1        Spring       2010

32343 El Said              History                   60000 45565 CS-101
1        Spring       2010

33456 Gold                 Physics                   87000 45565 CS-101
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 45565 CS-101
1        Spring       2010

58583 Califieri            History                   62000 45565 CS-101
1        Spring       2010

76543 Singh                Finance                   80000 45565 CS-101
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 45565 CS-101
1        Spring       2010

83821 Brandt               Comp. Sci.                92000 45565 CS-101
1        Spring       2010

98345 Kim                  Elec. Eng.                80000 45565 CS-101
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 45565 CS-319
1        Spring       2010

12121 Wu                   Finance                   90000 45565 CS-319
1        Spring       2010

15151 Mozart               Music                     40000 45565 CS-319
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 45565 CS-319
1        Spring       2010

32343 El Said              History                   60000 45565 CS-319
1        Spring       2010

33456 Gold                 Physics                   87000 45565 CS-319
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 45565 CS-319
1        Spring       2010

58583 Califieri            History                   62000 45565 CS-319
1        Spring       2010

76543 Singh                Finance                   80000 45565 CS-319
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 45565 CS-319
1        Spring       2010

83821 Brandt               Comp. Sci.                92000 45565 CS-319
1        Spring       2010

98345 Kim                  Elec. Eng.                80000 45565 CS-319
1        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 76766 BIO-10
1        Summer       2009

12121 Wu                   Finance                   90000 76766 BIO-10
1        Summer       2009

15151 Mozart               Music                     40000 76766 BIO-10
1        Summer       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 76766 BIO-10
1        Summer       2009

32343 El Said              History                   60000 76766 BIO-10
1        Summer       2009

33456 Gold                 Physics                   87000 76766 BIO-10
1        Summer       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 76766 BIO-10
1        Summer       2009

58583 Califieri            History                   62000 76766 BIO-10
1        Summer       2009

76543 Singh                Finance                   80000 76766 BIO-10
1        Summer       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 76766 BIO-10
1        Summer       2009

83821 Brandt               Comp. Sci.                92000 76766 BIO-10
1        Summer       2009

98345 Kim                  Elec. Eng.                80000 76766 BIO-10
1        Summer       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 76766 BIO-30
1        Summer       2010

12121 Wu                   Finance                   90000 76766 BIO-30
1        Summer       2010

15151 Mozart               Music                     40000 76766 BIO-30
1        Summer       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 76766 BIO-30
1        Summer       2010

32343 El Said              History                   60000 76766 BIO-30
1        Summer       2010

33456 Gold                 Physics                   87000 76766 BIO-30
1        Summer       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 76766 BIO-30
1        Summer       2010

58583 Califieri            History                   62000 76766 BIO-30
1        Summer       2010

76543 Singh                Finance                   80000 76766 BIO-30
1        Summer       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 76766 BIO-30
1        Summer       2010

83821 Brandt               Comp. Sci.                92000 76766 BIO-30
1        Summer       2010

98345 Kim                  Elec. Eng.                80000 76766 BIO-30
1        Summer       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 83821 CS-190
1        Spring       2009

12121 Wu                   Finance                   90000 83821 CS-190
1        Spring       2009

15151 Mozart               Music                     40000 83821 CS-190
1        Spring       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 83821 CS-190
1        Spring       2009

32343 El Said              History                   60000 83821 CS-190
1        Spring       2009

33456 Gold                 Physics                   87000 83821 CS-190
1        Spring       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 83821 CS-190
1        Spring       2009

58583 Califieri            History                   62000 83821 CS-190
1        Spring       2009

76543 Singh                Finance                   80000 83821 CS-190
1        Spring       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 83821 CS-190
1        Spring       2009

83821 Brandt               Comp. Sci.                92000 83821 CS-190
1        Spring       2009

98345 Kim                  Elec. Eng.                80000 83821 CS-190
1        Spring       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 83821 CS-190
2        Spring       2009

12121 Wu                   Finance                   90000 83821 CS-190
2        Spring       2009

15151 Mozart               Music                     40000 83821 CS-190
2        Spring       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 83821 CS-190
2        Spring       2009

32343 El Said              History                   60000 83821 CS-190
2        Spring       2009

33456 Gold                 Physics                   87000 83821 CS-190
2        Spring       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 83821 CS-190
2        Spring       2009

58583 Califieri            History                   62000 83821 CS-190
2        Spring       2009

76543 Singh                Finance                   80000 83821 CS-190
2        Spring       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 83821 CS-190
2        Spring       2009

83821 Brandt               Comp. Sci.                92000 83821 CS-190
2        Spring       2009

98345 Kim                  Elec. Eng.                80000 83821 CS-190
2        Spring       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 83821 CS-319
2        Spring       2010

12121 Wu                   Finance                   90000 83821 CS-319
2        Spring       2010

15151 Mozart               Music                     40000 83821 CS-319
2        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 83821 CS-319
2        Spring       2010

32343 El Said              History                   60000 83821 CS-319
2        Spring       2010

33456 Gold                 Physics                   87000 83821 CS-319
2        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 83821 CS-319
2        Spring       2010

58583 Califieri            History                   62000 83821 CS-319
2        Spring       2010

76543 Singh                Finance                   80000 83821 CS-319
2        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 83821 CS-319
2        Spring       2010

83821 Brandt               Comp. Sci.                92000 83821 CS-319
2        Spring       2010

98345 Kim                  Elec. Eng.                80000 83821 CS-319
2        Spring       2010


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
10101 Srinivasan           Comp. Sci.                65000 98345 EE-181
1        Spring       2009

12121 Wu                   Finance                   90000 98345 EE-181
1        Spring       2009

15151 Mozart               Music                     40000 98345 EE-181
1        Spring       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
22222 Einstein             Physics                   95000 98345 EE-181
1        Spring       2009

32343 El Said              History                   60000 98345 EE-181
1        Spring       2009

33456 Gold                 Physics                   87000 98345 EE-181
1        Spring       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
45565 Katz                 Comp. Sci.                75000 98345 EE-181
1        Spring       2009

58583 Califieri            History                   62000 98345 EE-181
1        Spring       2009

76543 Singh                Finance                   80000 98345 EE-181
1        Spring       2009


ID    NAME                 DEPT_NAME                SALARY ID    COURSE
----- -------------------- -------------------- ---------- ----- ------
SEC_ID   SEMEST       YEAR
-------- ------ ----------
76766 Crick                Biology                   72000 98345 EE-181
1        Spring       2009

83821 Brandt               Comp. Sci.                92000 98345 EE-181
1        Spring       2009

98345 Kim                  Elec. Eng.                80000 98345 EE-181
1        Spring       2009


180 rows selected.
SQL> select name,i.dept_name,building from instructor i,department d where i.dept_name=d.dept_name;

NAME                 DEPT_NAME            BUILDING
-------------------- -------------------- ---------------
Srinivasan           Comp. Sci.           Taylor
Wu                   Finance              Painter
Mozart               Music                Packard
Einstein             Physics              Watson
El Said              History              Painter
Gold                 Physics              Watson
Katz                 Comp. Sci.           Taylor
Califieri            History              Painter
Singh                Finance              Painter
Crick                Biology              Watson
Brandt               Comp. Sci.           Taylor

NAME                 DEPT_NAME            BUILDING
-------------------- -------------------- ---------------
Kim                  Elec. Eng.           Taylor

12 rows selected.
SQL> select distinct i.name from instructor i, teaches t where i.ID=t.ID;

NAME
--------------------
Brandt
Crick
Einstein
El Said
Katz
Kim
Mozart
Srinivasan
Wu

9 rows selected.
SQL> select distinct c.course_id,c.title from takes t, course c where t.course_id=c.course_id and t.
ID=12345;

COURSE_I TITLE
-------- --------------------------------------------------
CS-101   Intro. to Computer Science
CS-190   Game Design
CS-315   Robotics
CS-347   Database System Concepts
SQL> select t.course_id, i.name from instructor i, teaches t where i.ID=t.ID and i.dept_name='Comp. 
Sci.';

COURSE_I NAME
-------- --------------------
CS-101   Srinivasan
CS-315   Srinivasan
CS-347   Srinivasan
CS-101   Katz
CS-319   Katz
CS-190   Brandt
CS-190   Brandt
CS-319   Brandt

8 rows selected.

SQL> select i.name,t.course_id from teaches t,instructor i where t.ID=i.ID;

NAME                 COURSE_I
-------------------- --------
Srinivasan           CS-101
Srinivasan           CS-315
Srinivasan           CS-347
Wu                   FIN-201
Mozart               MU-199
Einstein             PHY-101
El Said              HIS-351
Katz                 CS-101
Katz                 CS-319
Crick                BIO-101
Crick                BIO-301

NAME                 COURSE_I
-------------------- --------
Brandt               CS-190
Brandt               CS-190
Brandt               CS-319
Kim                  EE-181

15 rows selected.

SQL> select distinct i1.name from instructor i1,instructor i2 where i1.salary>i2.salary and i2.dept_
name='Biology';

NAME
--------------------
Brandt
Einstein
Gold
Katz
Kim
Singh
Wu
SQL> select distinct i.* from teaches t, instructor i where t.ID=i.ID;

ID    NAME                 DEPT_NAME                SALARY
----- -------------------- -------------------- ----------
10101 Srinivasan           Comp. Sci.                65000
12121 Wu                   Finance                   90000
15151 Mozart               Music                     40000
22222 Einstein             Physics                   95000
32343 El Said              History                   60000
45565 Katz                 Comp. Sci.                75000
76766 Crick                Biology                   72000
83821 Brandt               Comp. Sci.                92000
98345 Kim                  Elec. Eng.                80000

9 rows selected.
SQL> select i.name,c.title from instructor i,teaches t,student s,takes ta,course c where s.ID=ta.ID
and s.dept_name='Biology' and ta.course_ID=t.course_id and t.ID=i.ID and t.course_id=c.course_id;

NAME                 TITLE
-------------------- --------------------------------------------------
Crick                Intro. to Biology
Crick                Genetics
SQL> select course_id from teaches where (semester='Fall' and year=2010) or (semester='Spring' and y
ear=2010);

COURSE_I
--------
CS-315
FIN-201
MU-199
HIS-351
CS-101
CS-319
CS-319

7 rows selected.
SQL> select course_id from teaches where semester='Fall' and year='2009'
  2  MINUS
  3  select course_id from teaches where semester='Spring' and year=2010;

COURSE_I
--------
CS-347
PHY-101

SQL> select distinct s.name from student s, takes t, course c where c.dept_name='Comp. Sci.' and t.I
D=s.ID and c.course_id=t.course_id;

NAME
--------------------
Bourikas
Brown
Levy
Shankar
Williams
Zhang

6 rows selected.
SQL> select ID from instructor
  2  MINUS
  3  select distinct ID from teaches;

ID
-----
33456
58583
76543
