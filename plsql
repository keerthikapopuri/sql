3.	Write a PL/SQL block which will accept a number and checks if it is a prime number or not. 
declare
n number;			
i number;		
temp number;	
begin
n:=&n;				
i := 2;
temp := 1;
for i in 2..n/2
loop
if mod(n, i) = 0 then
temp := 0;
exit;
end if;
end loop;
if temp = 1 then
dbms_output.put_line('it is prime number');
else
dbms_output.put_line('it is not a prime number');
end if;
end;		
SQL> @ C:\\Users\\exam2\\Desktop\\table.sql;
 23  /
Enter value for n: 67
old   6: n:=&n;
new   6: n:=67;
it is prime number

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

8.	Consider the following relation schemas
Emp
empid	name	salary	dno
 Del_History
dno	Rows_deleted	date
Write a PL/SQL block to delete records of all employees who belong to a particular department and then record the dno, no of rows deleted and date on which deletion occurred in the Del_History table using implicit cursors. 

declare
dept emp8.dno%type;
num number;
begin
dept:=&dept;
delete from emp8 where dno=dept;
if sql%found then
num:=sql%rowcount;
insert into del_history values(dept,num,sysdate);
end if;
end;

Wrote file afiedt.buf

  1* create table del_history(dno number,num_rows number,dtoday date)
SQL> /

Table created.

SQL> select * from emp8;

     EMPID EMPNAME                  SALARY        DNO
---------- -------------------- ---------- ----------
        12 keerthi                  100000          4
        13 divya                    100000          4
        12 sravs                     90000          3
        11 lohi                      90000          3
        10 alifa                     95000          5

SQL>  @ C:\\Users\\exam2\\Desktop\\table.sql;
 12  /
Enter value for dept: 4
old   5: dept:=&dept;
new   5: dept:=4;

PL/SQL procedure successfully completed.

SQL> select * from del_history;

       DNO   NUM_ROWS DTODAY
---------- ---------- ---------
         4          2 30-AUG-22

SQL> select * from emp8;

     EMPID EMPNAME                  SALARY        DNO
---------- -------------------- ---------- ----------
        12 sravs                     90000          3
        11 lohi                      90000          3
        10 alifa                     95000          5

9.	Given the table EMPLOYEE (EmpNo, Name, Salary, Designation, DeptID) write a cursor to select the five highest and lowest paid employees from the table.
declare
name emp.ename%type;
salary emp.sal%type;
cursor cur_high is select ename,sal from emp order by sal desc;
cursor cur_low is select ename,sal from emp order by sal;
begin
dbms_output.put_line('high to low');
open cur_high;
loop
fetch cur_high into name,salary;
exit when cur_high%rowcount>5;
dbms_output.put_line(name||' '||salary);
end loop;
dbms_output.put_line('low to high');
open cur_low;
loop
fetch cur_low into name,salary;
exit when cur_low%rowcount>5;
dbms_output.put_line(name||' '||salary);
end loop;
end;
/
SQL> @ C:\\Users\\TEMP.RVRjcCSE.000.001.002\\Desktop\\table.sql;
Input truncated to 1 characters
high to low
KING 5000
SCOTT 3200
FORD 3000
JONES 2975
BLAKE 2850
low to high
SMITH 800
JAMES 950
ADAMS 1100
MARTIN 1250
WARD 1250

PL/SQL procedure successfully completed.
10.	Consider the following relation schemas

Bank_Main
Acc_no	Name	Address	Acc-type	Curr_balance
Bank_Trans
Acc_no	Tr_type	Tr_date	Tr_amt	Upd_flag

Where acc_type is S – savings C- current 
Tr_type is D – deposit W – withdrawal 
Write a PL/SQL block to update master table’s (i.e., Bank_Main) curr_balance field with transaction details from transaction file (i.e., Bank_Trans) and also change the status of the Upd_flag field of transaction table to ‘Y’ once the updation is complete.
declare
acc bank_trans.accno%type;
typ varchar(2);
amount number;
cursor cur_trans is select accno,trtype,tramt from bank_trans;
begin
open cur_trans;
loop
fetch cur_trans into acc,typ,amount;
if cur_trans%NOTFOUND then exit;
end if;
if typ='w' then 
update bank_main set balance=balance-amount where acc=accno;
update bank_trans set upd_flag='y' where acc=accno;
else
update bank_main set balance=balance+amount where acc=accno;
update bank_trans set upd_flag='y' where acc=accno;
end if;
end loop;
close cur_trans;
end;
/
SQL> select * from bank_main;

     ACCNO NAME                 ADRESS               AC    BALANCE
---------- -------------------- -------------------- -- ----------
         1 keerthi              tenali               s       34000
         2 divya                prakasham            c       25000
         3 sravs                ongole               c       40000
         4 lohi                 guntur               c       32000

SQL> select * from bank_trans;

     ACCNO TR TRDATE         TRAMT UPD_F
---------- -- --------- ---------- -----
         1 w  06-SEP-22      12000
         2 d  06-SEP-22     100000

SQL> @ C:\\Users\\TEMP.RVRjcCSE.000.001.002\\Desktop\\table.sql;
Input truncated to 1 characters

PL/SQL procedure successfully completed.

SQL> select * from bank_trans;

     ACCNO TR TRDATE         TRAMT UPD_F
---------- -- --------- ---------- -----
         1 w  06-SEP-22      12000 y
         2 d  06-SEP-22     100000 y

SQL> select * from bank_main;

     ACCNO NAME                 ADRESS               AC    BALANCE
---------- -------------------- -------------------- -- ----------
         1 keerthi              tenali               s       22000
         2 divya                prakasham            c      125000
         3 sravs                ongole               c       40000
         4 lohi                 guntur               c       32000


SQL> create table bank_main(accno number,name varchar(20),adress varchar(20),acctype varchar(2),bala
nce number);

Table created.

SQL> insert into bank_main values(&accno,'&name','&adress','&acctype',&balance);
Enter value for accno: 1
Enter value for name: keerthi
Enter value for adress: tenali
Enter value for acctype: s
Enter value for balance: 34000
old   1: insert into bank_main values(&accno,'&name','&adress','&acctype',&balance)
new   1: insert into bank_main values(1,'keerthi','tenali','s',34000)

1 row created.

SQL> /
Enter value for accno: 2
Enter value for name: divya
Enter value for adress: prakasham
Enter value for acctype: c
Enter value for balance: 25000
old   1: insert into bank_main values(&accno,'&name','&adress','&acctype',&balance)
new   1: insert into bank_main values(2,'divya','prakasham','c',25000)

1 row created.

SQL> /
Enter value for accno: 3
Enter value for name: sravs
Enter value for adress: ongole
Enter value for acctype: c
Enter value for balance: 40000
old   1: insert into bank_main values(&accno,'&name','&adress','&acctype',&balance)
new   1: insert into bank_main values(3,'sravs','ongole','c',40000)

1 row created.

SQL> /
Enter value for accno: 4
Enter value for name: lohi
Enter value for adress: guntur
Enter value for acctype: c
Enter value for balance: 32000
old   1: insert into bank_main values(&accno,'&name','&adress','&acctype',&balance)
new   1: insert into bank_main values(4,'lohi','guntur','c',32000)

1 row created.

SQL> create table bank_trans(accno number,trtype varchar(2),trdate date,tramt number,upd_flag varcha
r(5) default null);

Table created.

  1* insert into bank_trans values(&accno,'&trtypre',sysdate,&tramt,'&upd_flag')
SQL> /
Enter value for accno: 1
Enter value for trtypre: d
Enter value for tramt: 13000
Enter value for upd_flag: 
old   1: insert into bank_trans values(&accno,'&trtypre',sysdate,&tramt,'&upd_flag')
new   1: insert into bank_trans values(1,'d',sysdate,13000,'')

1 row created.

SQL> /
Enter value for accno: 3
Enter value for trtypre: w
Enter value for tramt: 10000
Enter value for upd_flag: 
old   1: insert into bank_trans values(&accno,'&trtypre',sysdate,&tramt,'&upd_flag')
new   1: insert into bank_trans values(3,'w',sysdate,10000,'')

1 row created.

SQL> /
Enter value for accno: 2
Enter value for trtypre: d
Enter value for tramt: 15000
Enter value for upd_flag: 
old   1: insert into bank_trans values(&accno,'&trtypre',sysdate,&tramt,'&upd_flag')
new   1: insert into bank_trans values(2,'d',sysdate,15000,'')

1 row created.
11. Write a PL/SQL block to handle the following built-in exceptions
no_data_found
too_many_rows
zero_divide  

declare

bp employee.basic_pay%type;

no employee.eno%type;

name employee.ename%type;
req number:=&req;
begin
select eno,ename,basic_pay into bp,no,name from employee where no=req;
exception
when NO_DATA_FOUND then
dbms_output.put_line('data not found');
end;
/
SQL> @C:\\Users\\exam2\\Desktop\\table.sql;
Input truncated to 1 characters
Enter value for req: 17
old   8: req number:=&req;
new   8: req number:=17;
data not found

PL/SQL procedure successfully completed.

declare
bp employee.basic_pay%type;
name employee.ename%type;
no employee.eno%type;
req number:=&req;
begin
select eno,ename,basic_pay into no,name,bp from employee where eno=req;
exception
when TOO_MANY_ROWS then
dbms_output.put_line('too many rows found');
end;
/
SQL> @C:\\Users\\exam2\\Desktop\\table.sql;
Input truncated to 1 characters
Enter value for req: 15
old   5: req number:=&req;
new   5: req number:=15;
too many rows found

PL/SQL procedure successfully completed.

declare
bp employee.basic_pay%type;
name employee.ename%type;
no employee.eno%type;
req number:=&req;
m number;
begin
select eno,ename,basic_pay into no,name,bp from employee where eno=req;
m:=bp/0;
exception
when zero_divide then
dbms_output.put_line('zero division occured');
end;
/
SQL>  @C:\\Users\\exam2\\Desktop\\table.sql;
Input truncated to 1 characters
Enter value for req: 12
old   5: req number:=&req;
new   5: req number:=12;
zero division occured

PL/SQL procedure successfully completed.
