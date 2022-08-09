create database krishav;

use krishav;

create table dept(  
  deptno int,  
  dname  varchar(30),  
  loc    varchar(30),  
  primary key (deptno)  
)

create table emp(  
  empno int,  
  ename    varchar(30),  
  job      varchar(30),  
  mgr    int,  
  hiredate date,  
  sal int,  
  comm  int,  
  deptno  int,  
 primary key (empno),  
  constraint fk_deptno foreign key (deptno) references dept (deptno)  
)

insert into DEPT (DEPTNO, DNAME, LOC)
values(10, 'ACCOUNTING', 'NEW YORK')

insert into dept  
values(20, 'RESEARCH', 'DALLAS')

insert into dept  
values(30, 'SALES', 'CHICAGO')

insert into dept  
values(40, 'OPERATIONS', 'BOSTON')


select * from emp;

 INSERT INTO EMP VALUES(7369, 'SMITH', 'CLERK', 7902,'17-Dec-1980', 800, NULL, 20);
 INSERT INTO EMP VALUES(7499, 'ALLEN', 'SALESMAN', 7698,'20-FEB-1981', 1600, 300, 30);
 INSERT INTO EMP VALUES(7521, 'WARD', 'SALESMAN', 7698,'22-FEB-1981', 1250, 500, 30);
 INSERT INTO EMP VALUES(7566, 'JONES', 'MANAGER', 7839,'2-APR-1981', 2975, NULL, 20);
 INSERT INTO EMP VALUES(7654, 'MARTIN', 'SALESMAN', 7698,'28-SEP-1981', 1250, 1400, 30);
 INSERT INTO EMP VALUES(7698, 'BLAKE', 'MANAGER', 7839,'1-MAY-1981', 2850, NULL, 30);
 INSERT INTO EMP VALUES(7782, 'CLARK', 'MANAGER', 7839,'9-JUN-1981', 2450, NULL, 10);
 INSERT INTO EMP VALUES(7788, 'SCOTT', 'ANALYST', 7566,'09-DEC-1982', 3000, NULL, 20);
 INSERT INTO EMP VALUES(7839, 'KING', 'PRESIDENT', NULL,'17-NOV-1981', 5000, NULL, 10);
 INSERT INTO EMP VALUES(7844, 'TURNER', 'SALESMAN', 7698,'8-SEP-1981', 1500, 0, 30);
 INSERT INTO EMP VALUES(7876, 'ADAMS', 'CLERK', 7788,'12-JAN-1983', 1100, NULL, 20);
 INSERT INTO EMP VALUES(7900, 'JAMES', 'CLERK', 7698,'3-DEC-1981', 950, NULL, 30);
 INSERT INTO EMP VALUES(7902, 'FORD', 'ANALYST', 7566,'3-DEC-1981', 3000, NULL, 20);
 INSERT INTO EMP VALUES(7934, 'MILLER', 'CLERK', 7782,'23-JAN-1982', 1300, NULL, 10);

 select * from emp;

 select * from emp where ename like 'A%';

 select * from emp where mgr IS NULL ;

 select ename,empno,sal from emp where sal between 1200 and 1400;

 update w  set w.sal += (sal*0.10) from emp w , dept d where w.deptno = d.deptno and d.dname = 'RESEARCH';

 select count(*) as 'Total No Of Clerk' from emp where job='clerk';

 select job,count(*) as 'Total Employee', avg(sal) as 'Avg Salary'  from emp group by job;

 select * from emp where sal in(select max(sal) AS Result from emp union select min(sal) as Result from emp);

 select * from dept where deptno not in(select deptno from emp);

 select ename,sal from emp where job='ANALYST' and sal>1200 and deptno=20;

 select e.deptno ,d.dname, sum(e.sal)  from emp e, dept d where e.deptno = d.deptno group by e.deptno ,d.dname;

 select ename,sal from emp where ename in('MILLER','SMITH');

 select ename from emp where ename like 'A%' or ename like 'M%';

 select ename, (sal*12) as 'Yearly Salary' from emp where ename='SMITH' ;

 select ename , sal from emp where sal not between 1500 and 2850;
