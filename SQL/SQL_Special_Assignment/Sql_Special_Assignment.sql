CREATE TABLE clients
(CLIENT_ID INT PRIMARY KEY,CNAME VARCHAR(40)NOT NULL,ADDRESS VARCHAR(30),EMAIL VARCHAR(30)UNIQUE,PHONE INT,BUSINESS vARCHAR(20)NOT NULL);

insert into clients VALUES
(1001,'ACME Utilities','Noida','contact@acmeutil.com',9567882,'Manufiacturing');

Insert into clients  values (1002,'Trackon 
Consultants','Mumbai','consult@trackon.com',873090,'Consultant');

Insert into clients  values 
(1003,'MoneySaver Distributors','Bangalore','save@moneysaver.com',786655,'Reseller');

Insert into clients values 
(1004,'Lawful Corp','Chennai','justice@lawful.com',922219,'Professional');

CREATE TABLE departments(DEPTno INT PRIMARY KEY,DNAME VARCHAR(15)NOT NULL,LOC VARCHAR(20));

Insert into departments (DEPTNO,DNAME,LOC) values (10,'Design','Pune');

Insert into departments (DEPTNO,DNAME,LOC) values (20,'Development','Pune');

Insert into departments (DEPTNO,DNAME,LOC) values (30,'Testing','Mumbai');

Insert into departments (DEPTNO,DNAME,LOC) values (40,'Document','Mumbai')

CREATE TABLE employees(EMPNO INT PRIMARY KEY,ENAME VARCHAR(20)NOT NULL,JOB VARCHAR(15),SALARy INT CHECK (SALARY > 0),
DEPTNO INT REFERENCES departments(DEPTNO));

Insert into employees  values (7001,'Sandeep','Analyst',25000,10);

Insert into employees  values (7002,'Rajesh','Designer',30000,10);

Insert into employees  values (7003,'Madhav','Developer',40000,20);

Insert into  employees values (7004,'Manoj','Developer',40000,20);

Insert into employees  values (7005,'Abhay','Designer',35000,10);

Insert into employees  values (7006,'Uma','Tester',30000,30);

Insert into employees values (7007,'Gita','Tech. Writer',30000,40);

Insert into employees  values (7008,'Priya','Tester',35000,30);

Insert into employees  values 
(7009,'Nutan','Developer',45000,20);

Insert into employees values (7010,'Smita','Analyst',20000,10);

Insert into employees  values (7011,'Anand','Project Mgr',65000,10);

CREATE TABLE PROJECTS
(PROJECT INT PRIMARY KEY,DESCR VARCHAR(30)NOT NULL,STARTDATE DATE,
PLANNED_ENDDATE DATE,ACTUAL_END_DATE DATE,BUDGET INT CHECK(BUDGET > 0),CLIENT_ID INT REFERENCES clients(CLIENT_ID));

Insert into PROJECTS  values (401,'Inventory','01-APR-11','01-OCT-11','31-OCT-11',150000,1001);
Insert into PROJECTS  values (402,'Accounting','01-AUG-11','01-JAN-12',null,500000,1002);
Insert into PROJECTS  values (403,'Payroll','01-OCT-11','31-DEC-11',null,75000,1003);
Insert into PROJECTS values (404,'Contact Mgmt','01-NOV-11','31-DEC-11',null,50000,1004);

CREATE TABLE empprojecttasks(PROJECT_ID INT REFERENCES PROJECTS(PROJECT),EMPNO INT REFERENCES employees(EMPNO),START_DATE DATE,END_DATE DATE,TASK VARCHAR(25)NOT NULL,STATUS VARCHAR(15)NOT NULL,PRIMARY KEY(PROJECT_ID,EMPNO));

Insert into empprojecttasks values (401,7001,'01-APR-11','20-APR-11','System Analysis','Completed');

Insert into empprojecttasks values (401,7002,'21-APR-11','30-MAY-11','System Design','Completed');

Insert into empprojecttasks values (401,7003,'01-JUN-11','15-JUL-11','Coding','Completed');
Insert into empprojecttasks values (401,7004,'18-JUL-11','01-SEP-11','Coding','Completed');
Insert into empprojecttasks values (401,7006,'03-SEP-11','15-SEP-11','Testing','Completed');
insert into empprojecttasks values (401,7009,'18-SEP-11','05-OCT-11','Code Change','Completed');
Insert into empprojecttasks values (401,7008,'06-OCT-11','16-OCT-11','Testing','Completed');
Insert into empprojecttasks values (401,7007,'06-OCT-11','22-OCT-11','Documentation','Completed');
Insert into empprojecttasks values (401,7011,'22-OCT-11','31-OCT-11','Sign of','Completed');
Insert into empprojecttasks values (402,7010,'01-AUG-11','20-AUG-11','System Analysis','Completed');
Insert into empprojecttasks values (402,7002,'22-AUG-11','30-SEP-11','System Design','Completed');
Insert into empprojecttasks values (402,7004,'01-OCT-11',null,'Coding','In Progress');

SELECT * FROM clients;
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM PROJECTS;
SELECT * FROM empprojecttasks;
 