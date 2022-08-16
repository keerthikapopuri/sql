1. read a number and print multiplication table
DECLARE
n NUMBER;
i NUMBER;
BEGIN
n:=&n;
for i in 1..10 LOOP
DBMS_OUTPUT.PUT_LINE(n||'*'||i||'='||n*i);
END LOOP;
END;
/
SQL> @C:\\Users\\y20cs142\\Desktop\\multiplicationtable.sql;
Input truncated to 1 characters
Enter value for n: 5
old   5: n:=&n;
new   5: n:=5;
5*1=5
5*2=10
5*3=15
5*4=20
5*5=25
5*6=30
5*7=35
5*8=40
5*9=45
5*10=50

PL/SQL procedure successfully completed.

2.read a number and check palindrome or not
DECLARE 
n NUMBER;
rev NUMBER:=0;
a NUMBER;
temp NUMBER;
BEGIN
n:=&n;
temp:=n;
WHILE n>0 LOOP
 a:=mod(n,10);
 rev:=(rev*10)+a;
 n:=trunc(n/10);
END LOOP;
IF rev=temp THEN DBMS_OUTPUT.PUT_LINE('it is palindrome');
ELSE DBMS_OUTPUT.PUT_LINE('it is not palindrome');
END IF;
END;
SQL> @C:\\Users\\y20cs142\\Desktop\\palindrome.sql;
 19  /
Enter value for n: 101
old   7: n:=&n;
new   7: n:=101;
it is palindrome

PL/SQL procedure successfully completed.

SQL> @C:\\Users\\y20cs142\\Desktop\\palindrome.sql;
 19  /
Enter value for n: 123
old   7: n:=&n;
new   7: n:=123;
it is not palindrome

PL/SQL procedure successfully completed.

3.read a number and print fibonacci sequence
DECLARE
n number;
a NUMBER:=0;
b NUMBER:=1;
c NUMBER;
BEGIN
n:=&n;
DBMS_OUTPUT.PUT_LINE(a);
DBMS_OUTPUT.PUT_LINE(b);
for i in 1..n-2 LOOP
  c:=a+b;
  DBMS_OUTPUT.PUT_LINE(c);
  a:=b;
  b:=c;
END LOOP;
END;
/	
SQL> @C:\\Users\\y20cs142\\Desktop\\fibonacci.sql;
Enter value for n: 6
old   7: n:=&n;
new   7: n:=6;
01
1
2
3
5

PL/SQL procedure successfully completed.

Input truncated to 2 characters
SQL> @C:\\Users\\y20cs142\\Desktop\\fibonacci.sql;
Enter value for n: 10
old   7: n:=&n;
new   7: n:=10;
0
1
1
2
3
5
8
13
21
34

PL/SQL procedure successfully completed.

4. read 2 numbers and find out lcm and hcf and insert into demo_tab
DECLARE 
n1 NUMBER;
n2 NUMBER;
hcf NUMBER:=1;
lcm NUMBER:=0;
small NUMBER;
large NUMBER;
flag NUMBER:=0;
BEGIN
n1:=&n1;
n2:=&n2;
IF n1>n2 THEN 
 small:=n2;
 large:=n1;
ELSE 
 small:=n1;
 large:=n2;
END IF;
for i in 1..small LOOP
  IF mod(n1,i)=0 and mod(n2,i)=0 THEN hcf:=i;
  END IF;
END LOOP;
lcm:=large;
while flag=0 LOOP
 IF mod(lcm,small)=0 THEN
   flag:=1;
 ELSE lcm:=lcm+large;
 END IF;
END LOOP;
INSERT INTO demo_tab values(n1,n2,hcf,lcm);
END;
SQL> create table demo_tab(num1 number,num2 number,hcf number,lcm number);

Table created.
SQL> @C:\\Users\\y20cs142\\Desktop\\hcflcm.sql;
 37  /
Enter value for n1: 8
old  10: n1:=&n1;
new  10: n1:=8;
Enter value for n2: 10
old  11: n2:=&n2;
new  11: n2:=10;

PL/SQL procedure successfully completed.

SQL> select * from demo_tab;

      NUM1       NUM2        HCF        LCM
---------- ---------- ---------- ----------
         8         10          2         40
