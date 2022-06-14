SQL> create table course(course_id number primary key,course_name varchar(10) unique);

Table created.
SQL> insert into course values(&course_id,'&course_name');
Enter value for course_id: 121
Enter value for course_name: m1
old   1: insert into course values(&course_id,'&course_name')
new   1: insert into course values(121,'m1')

1 row created.

SQL> /
Enter value for course_id: 122
Enter value for course_name: c
old   1: insert into course values(&course_id,'&course_name')
new   1: insert into course values(122,'c')

1 row created.

SQL> /
Enter value for course_id: 123
Enter value for course_name: dbms
old   1: insert into course values(&course_id,'&course_name')
new   1: insert into course values(123,'dbms')

1 row created.
////////////////////////////////////////////////////////////////////////////////////////
SQL> create table studentnew(sno number,sname varchar2(10) not null,cont number,inst number,grade fl
oat,constraint pk_sno primary key(sno),constraint uniq_cont unique(cont),constraint fk_inst foreign 
key(inst) references instructor(instid));

Table created.
////////////////////////////////////////////////////////////////////////////////////////
SQL> create table student(student_id number primary key,student_name varchar(15) not null,
t,constraint chk_grade check(grade>=0.0 and grade<=10.0));

Table created.

SQL> alter table add inst number;
alter table add inst number
            *
ERROR at line 1:
ORA-00903: invalid table name


SQL> alter table student add inst number;

Table altered.

SQL> alter table student add constraint course_qw foreign key(inst) references course(cour

Table altered.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 STUDENT_ID                                NOT NULL NUMBER
 STUDENT_NAME                              NOT NULL VARCHAR2(15)
 GRADE                                              FLOAT(126)
 INST                                               NUMBER

SQL> insert into student values(&student_id,'&student_name',&grade,&inst);
Enter value for student_id: 142
Enter value for student_name: keerthi
Enter value for grade: 9.23
Enter value for inst: 121
old   1: insert into student values(&student_id,'&student_name',&grade,&inst)
new   1: insert into student values(142,'keerthi',9.23,121)

1 row created.

SQL> /
Enter value for student_id: 170
Enter value for student_name: sravs
Enter value for grade: 9.1
Enter value for inst: 122
old   1: insert into student values(&student_id,'&student_name',&grade,&inst)
new   1: insert into student values(170,'sravs',9.1,122)

1 row created.

SQL> /
Enter value for student_id: 186
Enter value for student_name: divya
Enter value for grade: 9.0
Enter value for inst: 123
old   1: insert into student values(&student_id,'&student_name',&grade,&inst)
new   1: insert into student values(186,'divya',9.0,123)

1 row created.

SQL> select * from student;

STUDENT_ID STUDENT_NAME         GRADE       INST
---------- --------------- ---------- ----------
       142 keerthi               9.23        121
       170 sravs                  9.1        122
       186 divya                    9        123

SQL> alter table course add department varchar2(4) default 'cse';

Table altered.

SQL> select * from course;

 COURSE_ID COURSE_NAM DEPA
---------- ---------- ----
       121 m1         cse
       122 c          cse
       123 dbms       cse

SQL> insert into student values('142','mouni','9.45','122');
insert into student values('142','mouni','9.45','122')
*
ERROR at line 1:
ORA-00001: unique constraint (Y20CS142.SYS_C00175594) violated


SQL> insert into student values('95','lohi','10.3','122');
insert into student values('95','lohi','10.3','122')
*
ERROR at line 1:
ORA-02290: check constraint (Y20CS142.CHK_GRADE) violated


SQL> insert into student values('95','lohi','9.45','111');
insert into student values('95','lohi','9.45','111')
*
ERROR at line 1:
ORA-02291: integrity constraint (Y20CS142.COURSE_QW) violated - parent key not
found


SQL> update student set student_id='142' where grade='9.1';
update student set student_id='142' where grade='9.1'
*
ERROR at line 1:
ORA-00001: unique constraint (Y20CS142.SYS_C00175594) violated


SQL> update student set grade='10.4' where student_name='divya';
update student set grade='10.4' where student_name='divya'
                                                                                      
                                                                                      SQL> delete from student where student_name=null;

0 rows deleted.

SQL> delete from student where grade='10.1';

0 rows deleted.

SQL> delete from student where inst='143';

0 rows deleted.

SQL> delete from course where department='ece';

0 rows deleted.
                                                                                      
*
ERROR at line 1:
ORA-02290: check constraint (Y20CS142.CHK_GRADE) violated


SQL> update student set inst='143' where student_id='142';
update student set inst='143' where student_id='142'
*
ERROR at line 1:
ORA-02291: integrity constraint (Y20CS142.COURSE_QW) violated - parent key not
found


SQL> update student set student_name= where student_id='142';
update student set student_name= where student_id='142'
                                 *
ERROR at line 1:
ORA-00936: missing expression


SQL> update student set student_name=null where student_id='142';
update student set student_name=null where student_id='142'
       *
ERROR at line 1:
ORA-01407: cannot update ("Y20CS142"."STUDENT"."STUDENT_NAME") to NULL

SQL> insert into course values('124','m1','ece');
insert into course values('124','m1','ece')
*
ERROR at line 1:
ORA-00001: unique constraint (Y20CS142.SYS_C00175407) violated


SQL> update course set course_name='dbms' where course_id='121';
update course set course_name='dbms' where course_id='121'
*
ERROR at line 1:
ORA-00001: unique constraint (Y20CS142.SYS_C00175407) violated


SQL> alter table student
  2  drop constraint chk_grade;

Table altered.

SQL> alter table student
  2  drop constraint course_qw;

Table altered.
SQL> select constraint_name,table_name from user_constraints;

CONSTRAINT_NAME                TABLE_NAME
------------------------------ ------------------------------
SYS_C00175406                  COURSE
SYS_C00175407                  COURSE
SYS_C00174481                  INSTRUCTOR
SYS_C00175592                  STUDENT
SYS_C00175594                  STUDENT
SYS_C00174872                  STUDENT2
UNIQ                           STUDENT2
PRI                            STUDENT2
F_KEY                          STUDENT2

9 rows selected.

SQL> alter table student
  2  drop constraint SYS_C00175592;

Table altered.

SQL> alter table student
  2  drop constraint SYS_C00175594;

Table altered.

SQL> alter table student add constraint pk_key primary key(student_id);

Table altered.
SQL> alter table student modify student_name not null;

Table altered.

SQL> alter table student add constraint kh_key foreign key(inst) references course(course_id);

Table altered.
                                                                                      
