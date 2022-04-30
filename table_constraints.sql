
Table dropped.

SQL>  create table student(sno number primary key,sname varchar2(15) not null,cont number unique,gra
de float,constraint chk_grade check(grade>=0.0 and grade<=10.0));

Table created.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SNO                                       NOT NULL NUMBER
 SNAME                                     NOT NULL VARCHAR2(15)
 CONT                                               NUMBER
 GRADE                                              FLOAT(126)
SQL> create table instructor(instid number primary key);

Table created.

SQL> insert into instructor values(211);

1 row created.

SQL> insert into instructor values(212);

1 row created.

SQL> alter table student add deptno number references instructor(inst_id);
alter table student add deptno number references instructor(inst_id)
                                                            *
ERROR at line 1:
ORA-00904: invalid column name


SQL> alter table student add deptno number references instructor(instid);

Table altered.

SQL> desc student;
 Name                                      Null?    Type
 ----------------------------------------- -------- ---------------------------
 SNO                                       NOT NULL NUMBER
 SNAME                                     NOT NULL VARCHAR2(15)
 CONT                                               NUMBER
 GRADE                                              FLOAT(126)
 DEPTNO                                             NUMBER

SQL> insert into student values('142','keerthika','9381640527','9.12','211');

1 row created.

SQL> insert into student values('170','sravanti','9866621633','9','212');

1 row created.

SQL> insert into student values('170','keerthi','1234567890','8.9','212');
insert into student values('170','keerthi','1234567890','8.9','212')
*
ERROR at line 1:
ORA-00001: unique constraint (Y20CS142.SYS_C00174452) violated


SQL> insert into student values('186','divya','987654321','8.9','212');

1 row created.

SQL> insert into student values('181',NULL,'9231456480','9.8','211');
insert into student values('181',NULL,'9231456480','9.8','211')
                      *
ERROR at line 1:
ORA-01400: cannot insert NULL into ("Y20CS142"."STUDENT"."SNAME")


SQL> insert into student values('003','alifa','9866621633','9.8','211');
insert into student values('003','alifa','9866621633','9.8','211')
*
ERROR at line 1:
ORA-00001: unique constraint (Y20CS142.SYS_C00174453) violated


SQL> insert into student values('003','alifa','9763457890','10.1','211');
insert into student values('003','alifa','9763457890','10.1','211')
*
ERROR at line 1:
ORA-02290: check constraint (Y20CS142.CHK_GRADE) violated


SQL> insert into student values('003','alifa','9763457890','10.0','211');

1 row created.


SQL> ed
SQL> create table student2(sno number,sname varchar2(10),cont number,inst number,grade float,constra
int pk_sno primary key(sno),constraint uniq_cont unique(cont),constraint fk_inst foreign key(inst) r
eferences instructor(instid));

Table created.
SQL> desc student2;
 Name                                      Null?    Type
 ----------------------------------------- -------- ----------------------------
 SNO                                       NOT NULL NUMBER
 SNAME                                              VARCHAR2(10)
 CONT                                               NUMBER
 INST                                               NUMBER
 GRADE                                              FLOAT(126)


SQL> insert into student2 values('003','alifa','1234567890','211','10,0');
insert into student2 values('003','alifa','1234567890','211','10,0')
                                                             *
ERROR at line 1:
ORA-01722: invalid number


SQL> insert into student2 values('012','avyaktha','987345120','212','9.5');

1 row created.

SQL> insert into student2 values('003','alifa','9866621633','211','9.8');

1 row created.

SQL> select * from student2;

       SNO SNAME            CONT       INST      GRADE
---------- ---------- ---------- ---------- ----------
        12 avyaktha    987345120        212        9.5
         3 alifa      9866621633        211        9.8

