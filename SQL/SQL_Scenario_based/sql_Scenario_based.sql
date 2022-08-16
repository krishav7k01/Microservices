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


