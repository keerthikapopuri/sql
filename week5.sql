SQL> select initcap(dname) from dept;

INITCAP(DNAME)
--------------
Accounting
Research
Sales
Operations
It
Cse

6 rows selected.

SQL> select concat(concat(concat(ename,'['),concat(job,']')),concat('RS.',sal)) as lensal from emp;

LENSAL
----------------------------------------------------------------
KING[PRESIDENT]RS.5000
BLAKE[MANAGER]RS.2850
CLARK[MANAGER]RS.2450
JONES[MANAGER]RS.2975
MARTIN[SALESMAN]RS.1250
ALLEN[SALESMAN]RS.1600
TURNER[SALESMAN]RS.1500
JAMES[CLERK]RS.950
WARD[SALESMAN]RS.1250
FORD[ANALYST]RS.3000
SMITH[CLERK]RS.800

LENSAL
----------------------------------------------------------------
SCOTT[ANALYST]RS.3200
ADAMS[CLERK]RS.1100
MILLER[CLERK]RS.1300

14 rows selected.

SQL> select dname,length(dname)-length(replace(lower(dname),'s','')) len from dept;

DNAME                 LEN
-------------- ----------
ACCOUNTING              0
RESEARCH                1
SALES                   2
OPERATIONS              1
it                      0
cse                     1

6 rows selected.

SQL> select deptno from dept
  2  MINUS
  3  select distinct(deptno) from emp;

    DEPTNO
----------
        40
        50
        60
 1* select * from emp where EXTRACT(year from hiredate)<1990 and EXTRACT(year from hiredate)>1980 and EXTRACT(day from hiredate)>14 order by hiredate
QL> /

    EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
--------- ---------- --------- ---------- --------- ---------- ----------
   DEPTNO
---------
     7499 ALLEN      SALESMAN        7698 20-FEB-81       1600        300
       30

     7521 WARD       SALESMAN        7698 22-FEB-81       1250        500
       30

     7654 MARTIN     SALESMAN        7698 28-SEP-81       1250       1400
       30


    EMPNO ENAME      JOB              MGR HIREDATE         SAL       COMM
--------- ---------- --------- ---------- --------- ---------- ----------
   DEPTNO
---------
     7839 KING       PRESIDENT            17-NOV-81       5000
       10

     7934 MILLER     CLERK           7782 23-JAN-82       1300
       10


  1  SELECT TO_CHAR (Sysdate, 'Day ddth Month YYYY HH:MI:SS AM') AS System_date_time
  2* FROM Dual
SQL> /

SYSTEM_DATE_TIME
-----------------------------------------
Tuesday   12th July      2022 02:47:47 PM
  1* select ename from emp,dual where to_char(hiredate,'dd')>15 and to_char(hiredate,'Day')='Wednesday' and (sysdate-hiredate)/30>20
SQL> /

ENAME
----------
SMITH

  1* select ename,round((sysdate-hiredate)/365) from emp,dual
SQL> /

ENAME      ROUND((SYSDATE-HIREDATE)/365)
---------- -----------------------------
KING                                  41
BLAKE                                 41
CLARK                                 41
JONES                                 41
MARTIN                                41
ALLEN                                 41
TURNER                                41
JAMES                                 41
WARD                                  41
FORD                                  41
SMITH                                 42

ENAME      ROUND((SYSDATE-HIREDATE)/365)
---------- -----------------------------
SCOTT                                 40
ADAMS                                 40
MILLER                                41

14 rows selected.


question 18.

  1* select to_char(to_date('&date','dd.mm.yy'),'Day') from dual
SQL> /
Enter value for date: 05.05.2003
old   1: select to_char(to_date('&date','dd.mm.yy'),'Day') from dual
new   1: select to_char(to_date('05.05.2003','dd.mm.yy'),'Day') from dual

TO_CHAR(T
---------
Monday
        
   question 12:
        
sql>select e1.ename from emp e1,dept d1 where e1.deptno=d1.deptno and e1.sal>(select avg(e2.sal) from emp e2,dept d2 where e2.deptno=d2.deptno and d1.dname=d2.dname)
        ENAME
----------
KING
JONES
SCOTT
FORD
BLAKE
ALLEN

question 16:        
sql>select e1.ename from emp e1
where e1.hiredate<(select e2.hiredate from emp e2 where lower(e2.job)='manager' and e1.deptno=e2.deptno)        
    ENAME
----------
ALLEN
WARD
SMITH
