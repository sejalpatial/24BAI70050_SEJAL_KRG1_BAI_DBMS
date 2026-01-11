CREATE TABLE book(
 book_id NUMERIC PRIMARY KEY,
 book_name VARCHAR(100),
 book_author VARCHAR(50),
 date_of_issue DATE
);

CREATE TABLE MEMBERS(
uid NUMERIC PRIMARY KEY,
member_name varchar (50)
);
create table book_issue(
member_uid numeric not null,
book_id numeric not null,
date_of_issue date not null,
foreign key (member_uid) references members(uid),
foreign key (book_id) references book(book_id)
)
INSERT INTO book (book_id,book_name,book_author,date_of_issue)
VALUES('1000','HARRY POTTER','JK ROWLING','12-10-26'),
('1001','MAGIC','ANNIE HATHAWAY','11-10-22'),
('1002','ATOMIC HABITS','ABC','11-10-20');

SELECT * FROM book; 

INSERT INTO MEMBERS (member_uid,member_name)
VALUES('202','RAJU'),
('203','TOMMY'),
('204','TILLU');

SELECT * FROM MEMBERS;

INSERT INTO book_issue (member_uid,book_id,date_of_issue)
VALUES('202','1000','12-6-25'),
('203','1000','18-09-25'),
('204','1001','20-10-24');
UPDATE MEMBERS SET member_name='yoma' where member_name='RAJU'; 
SELECT * FROM book_issue;

CREATE ROLE Librarian;
CREATE ROLE Librarian3 WITH LOGIN PASSWORD 'lib123';


GRANT SELECT,INSERT,DELETE ON MEMBERS,book_issue,book to Librarian;
GRANT Librarian1 TO Sejal;





