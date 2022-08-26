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
5. Write a Pl/SQL program using FOR loop to insert ten rows into a database table.

 SQL> create table mul(col1 number,col2 number);

Table created.

SQL> @C:\\Users\\exam2\\Desktop\\table.sql;
declare
num number:=3;
begin
for i in 1..10 LOOP
insert into mul values(num,num*i);
END LOOP;
END;
/

PL/SQL procedure successfully completed.

SQL> select * from mul;

      COL1       COL2
---------- ----------
         3          3
         3          6
         3          9
         3         12
         3         15
         3         18
         3         21
         3         24
         3         27
         3         30

10 rows selected.

6.Consider the following relation schemas

Inventory
 
Product_ID	Product_name	Quantity	 

   Purchase_Record
 
Product_ID	Status	Date	 

Write a PL/SQL block to read the quantity of a product from inventory and if it is > 0 reduce the quantity by 1 and record the status of purchase of that product as ‘PURCHASED’. Otherwise record the status of purchase of that product as ‘OUT OF STOCK’. While recording the status of a purchase, record the date of transaction.

declare
id inventory.pid%type:=&id;
qt inventory.qty%type;
begin
select qty into qt from inventory where pid=id;
if qt>0 then
update inventory set qty=qty-1 where pid=id;
insert into purchase_record values(id,'PURCHASED',sysdate);
else
insert into purchase_record values(id,'NOT BUYED',sysdate);
end if;
end;
/
SQL> create table inventory(pid number,qty number,pname varchar(10));

Table created.

SQL>  create table purchase_record(pid number,status varchar(10),dtoday date

Table created.

  1* insert into inventory values(&pid,&qty,'&pname')
SQL> /
Enter value for pid: 1
Enter value for qty: 10
Enter value for pname: rice
old   1: insert into inventory values(&pid,&qty,'&pname')
new   1: insert into inventory values(1,10,'rice')

1 row created.

SQL> /
Enter value for pid: 2
Enter value for qty: 23
Enter value for pname: dal
old   1: insert into inventory values(&pid,&qty,'&pname')
new   1: insert into inventory values(2,23,'dal')

1 row created.
SQL> /
Enter value for pid: 3
Enter value for qty: 22
Enter value for pname: veggies
old   1: insert into inventory values(&pid,&qty,'&pname')
new   1: insert into inventory values(3,22,'veggies')

1 row created.

SQL> @C:\\Users\\exam2\\Desktop\\table.sql;
Enter value for id: 1
old   2: id inventory.pid%type:=&id;
new   2: id inventory.pid%type:=1;

PL/SQL procedure successfully completed.

SQL> select * from inventory;

       PID        QTY PNAME
---------- ---------- ----------
         1          9 rice
         2         23 dal
         3         22 veggies

SQL> select * from purchase_record;

       PID STATUS     DTODAY
---------- ---------- ---------
         1 PURCHASED  26-AUG-22
 7. Create a table employee with eno, ename, and basic_pay attributes, insert 3 to 4 records and write a PL/SQL block to calculate the Gross salary & Net salary for an employee for the following conditions:
HRA is 15% of basic.
DA is 62% of basic.
PF is 780/- if gross salary exceeds 8000, otherwise 600/-.
Professional tax is 2% of basic.
and then print the employee no, name, hra, da, pf, ptax, gross salary & net salary for that employee.


declare
bp employee.basic_pay%type;
no employee.eno%type;
name employee.ename%type;
hra number;
da number;
pf number;
ptax number;
gross number;
tax number;
net number;
req number:=&req;
begin
select eno,ename,basic_pay into no,name,bp from employee where eno=req;
hra:=(bp*15)/100;
da:=(bp*62)/100;
gross:=bp+hra+da;
if gross>8000 then
pf:=780;
else
pf:=600;
end if;
tax:=(bp*2)/100;
net:=gross-pf-tax;
dbms_output.put_line('No:'||' '||no||'name:'||' '||name||'basic:'||' '||
bp||'hra:'||' '||hra||'da:'||' '||da||'gross:'||' '||gross||'pf:'||' '||pf||'tax:'||' '||tax||'net:'||' '||net);
end;
/


SQL> create table employee(eno number,ename varchar(20),basic_pay number);

Table created.

SQL> insert into employee values(&eno,'&ename',&basic_pay);
Enter value for eno: 12
Enter value for ename: keerthi
Enter value for basic_pay: 90000
old   1: insert into employee values(&eno,'&ename',&basic_pay)
new   1: insert into employee values(12,'keerthi',90000)

1 row created.

SQL> /
Enter value for eno: 14
Enter value for ename: sravs
Enter value for basic_pay: 85000
old   1: insert into employee values(&eno,'&ename',&basic_pay)
new   1: insert into employee values(14,'sravs',85000)

1 row created.

SQL> /
Enter value for eno: 15
Enter value for ename: divya
Enter value for basic_pay: 85500
old   1: insert into employee values(&eno,'&ename',&basic_pay)
new   1: insert into employee values(15,'divya',85500)

1 row created.


SQL> @C:\\Users\\exam2\\Desktop\\table.sql;
Input truncated to 1 characters
Enter value for req: 12
old  12: req number:=&req;
new  12: req number:=12;
No: 12name: keerthibasic: 90000hra: 13500da: 55800gross: 159300pf: 780tax:
1800net: 156720
