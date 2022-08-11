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

 select * from emp where job='MANAGER';

 select ename ,sal from emp where sal >1000;

 select ename , sal from emp where Not ename='JAMES' ;

 select * from emp where ename like 'S%';

 select * from emp where ename like '%A%';

 select * from emp where ename like '__L%';

 select ename, (sal/30) as 'Daily Salry' from emp where ename ='JONES';

 select sum(sal) as 'Total Monthly Salary' from emp; 

 select avg(sal*12) as 'Average Annual Salary' from emp;

 select e.EmpNo, e.EName, e.Job, e.Sal, e.DeptNo from emp e where  not (deptno = 30 and job='SALESMAN') ;

select distinct(e.DeptNo), d.DName from emp e join dept d on e.DeptNo = d.deptno;

select EName as 'Employee', Sal as 'Monthly Salary', DeptNo from emp where Sal > 1500 and DeptNo in (10,30);

select EName, Job, Sal from emp where Job in ('Manager', 'Analyst') and Sal not in (1000,3000,5000);

select EName, sal, Comm from emp where Comm > (sal + (sal * 10/100));

select * from emp where EName like '%L%l%' and (DeptNo=30 or Mgr=7782);

select  ename  from emp 
       where DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE()))  >10 and DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE())) < 20;

select d.DeptNo, d.DName, e.EName from dept d, emp e where d.DeptNo = e.DeptNo order by d.DName, e.EName desc;

select EName, DateDiff(Year,DateName(YEAR,HireDate),DateName(YEAR,GETDATE())) as Experience from emp where EName='Miller';