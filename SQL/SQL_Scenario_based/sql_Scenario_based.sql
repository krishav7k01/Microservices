CREATE TABLE books (
  id int,
  title varchar(100) NOT NULL,
  author varchar(100) NOT NULL,
  published_date datetime NOT NULL,
  isbn char(12),
  PRIMARY KEY (id),
  UNIQUE (isbn)
);

INSERT INTO books
  
  VALUES
      (1, 'My First SQL Book', 'Mary Parker',
          '2012-02-22 12:08:17',
          '981483029127'),
      (2, 'My Second SQL Book', 'John Mayer',
          '1972-07-03 09:22:45',
          '857300923713'),
      (3, 'My First SQL Book', 'Cary Flint',
          '2015-10-18 14:05:44',
          '523120967812');

select * from books;

select * from books where author like '%er';

CREATE TABLE reviews (
  id int,
  book_id int NOT NULL,
  reviewer_name varchar(255),
  content varchar(255),
  rating integer,
  published_date datetime ,
  PRIMARY KEY (id),
  FOREIGN KEY (book_id) REFERENCES books(id)
      
);


INSERT INTO reviews
  VALUES
      (1, 1, 'John Smith', 'My first review', 4,
          '2017-12-10 05:50:11'),
      (2, 2, 'John Smith', 'My second review', 5,
          '2017-10-13 15:05:12'),
      (3, 2, 'Alice Walker', 'Another review', 1,
          '2017-10-22 23:47:10');

select b.title as title ,b.author as Author, r.reviewer_name as Reviewer from books as b JOIN reviews as r ON b.id=r.book_id;


select reviewer_name  from reviews group by reviewer_name having count(*) >1;


--------------------------------------------------------------------------------------------------------

create table Customer(
    Id int primary key,
	Name varchar(30),
	age int,
	Address varchar(30),
	salary float
)

insert into Customer values(1,'Ramesh',32,'Ahmedabad',2000.00)

insert into Customer values(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),
(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),
(6,'Komal',22,'MP',4500.00),
(7,'Muffy',24,'Indore',10000.00)


   select Name  from customer 
   where Address like '%o%' and Address IN(select Address from customer group by Address having COUNT(*)>1);

     create table tblOrder(
     oId int primary key,
	 ordDate datetime,
	 customer_Id int references Customer(Id),
	 amount int
)

insert into tblOrder values(102,'2009-10-08',3,3000),
(100,'2009-10-08',3,1500),
(101,'2009-11-20',2,1560),
(103,'2008-05-20',4,2060)


   select ordDate, count(customer_Id) as 'Total Customer' from tblOrder
   group by ordDate


create table Employee(
    empId int primary key,
	empName varchar(30),
	age int,
	empAddress varchar(30),
	salary float
)


insert into Employee values(1,'Ramesh',32,'Ahmedabad',2000.00),
(2,'Khilan',25,'Delhi',1500.00),
(3,'Kaushik',23,'Kota',2000.00),
(4,'Chaitali',25,'Mumbai',6500.00),
(5,'Hardik',27,'Bhopal',8500.00),
(6,'Komal',22,'MP',null),
(7,'Muffy',24,'Indore',null)


   select Lower(empName) from Employee
   where salary is null;


create table StudentDetails(
       registerNo int primary key,
	   Name varchar(30),
	   age int,
	   qualification varchar(10),
	   mobileNo bigint,
	   mail_id varchar(50),
	   loc varchar(30),
	   gender varchar(2)
)


insert into StudentDetails values(2,'Sai',22,'B.E',9952836777,'Sai@gmail.com','Chennai','M'),
(3,'Kumar',20,'BSC',7890125648,'Kumar@gmail.com','Madurai','M'),
(4,'Selvi',22,'B.Tech',8904567342,'selvi@gmail.com','Selam','F'),
(5,'Nisha',25,'M.E',7834672310,'Nisha@gmail.com','Theni','F'),
(6,'SaiSaran',21,'B.A',7890345678,'saran@gmail.com','Madurai','F'),
(7,'Tom',23,'BCA',8901234675,'Tom@gmail.com','Pune','M')

   select gender,count(gender) from StudentDetails
   group by gender


create table CourseDetails(
       Id varchar(20) primary key,
	   Name varchar(30),
	   startDate date,
	   endDate date,
	   fee float
)


insert into CourseDetails values('DN003','DotNet','2018-02-01','2018-02-28',15000),
('DV004','DataVisualization','2018-03-01','2018-04-15',15000),
('JA002','AdvancedJava','2018-01-02','2018-01-20',10000),
('JC001','CoreJava','2018-01-02','2018-01-12',3000)

create table tblCourseRegistration(
	registerNo int references StudentDetails(registerNo),
	cId varchar(20) references CourseDetails(Id),
	batch varchar(5)
	primary key(registerNo,cId)
)


insert into tblCourseRegistration values(2,'DN003','FN'),
(3,'DV004','AN'),
(4,'JA002','FN'),
(2,'JA002','AN'),
(5,'JC001','FN')


   select cd.Id, Name, count(registerNo) as Count from CourseDetails cd join tblCourseRegistration cr
   on cd.Id = cr.cId
   group by Name, cd.Id
   order by cd.Id desc

 
create table Customer9(
	cId int primary key,
	firstName varchar(30),
	lastName varchar(30)
)

insert into Customer9 values(1,'George','Washington'),
(2,'John','Adams'),
(3,'Thomas','Jefferson'),
(4,'James','Madison'),
(5,'James','Monroe')


create table Order9(
	orderId int primary key,
	orderDate date,
	amount float,
	customerId int
)

insert into Order9 values(1,'1776-07-04',234.56,1),
(2,'1760-03-14',78.50,3),
(3,'1784-05-23',124.00,2),
(4,'1790-08-03',65.50,3),
(5,'1795-07-21',25.50,10),
(6,'1787-11-27',14.40,9)



   select firstName, lastName from Customer9 c join Order9 o
   on c.cId = o.customerId
   group by firstName, lastName
   having count(customerId) = 2


   select Name, Upper(loc) from StudentDetails
   order by Name desc

create table OrderV(
	ordId int primary key,
	orderDate date,
	orderNumber int,
	customerId int,
	totalAmount float
)

create table ProductV(
	prodId int primary key,
	productName varchar(20),
	supplierId int,
	unitPrice float,
	package float,
	isDiscontinued bit
)

create table tblOrderItemV(
	id int primary key,
	orderId int references OrderV(ordId),
	productId int references ProductV(prodId),
	unitPrice float,
	quantity int
)


   create view productOrderView as
   select productName, quantity, orderNumber
   from ProductV p join tblOrderItemV oi
   on p.prodId = oi.productId
   join OrderV o
   on o.ordId = oi.orderId

   select * from productOrderView
   
   



  

