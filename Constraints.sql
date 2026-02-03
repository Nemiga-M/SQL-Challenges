/*	Scenario		: 	You are creating a database for an online bookstore.
	Task			:	Create a table Books with columns:
							(BookID, Title, Author, ISBN, Price) 
						Create a table Orders with columns:
							(OrderID, BookID, OrderDate, Quantity) 
	Expected Output	:	Tables are created successfully with all constraints applied
*/ 
    
create database online_bookstore;
use online_bookstore;

		-- CREATING TABLES
create table books(
	Book_ID int primary key,
    Title varchar(100) not null,
    Author varchar(20) not null,
    ISBN varchar(20) unique,
    Price decimal(10,2) check (price>0)
    );
    
create table orders (
	Order_ID int primary key,
    Book_ID int,
    Order_Date date not null,
    Quantity int check (Quantity>0),
    foreign key (Book_ID) references books(Book_ID) 
    );
    
    
/*  Scenario		:	The bookstore wants to make sure ISBN is Default for every book.
	Task			:	Alter the Books table to add a Default constraint to the ISBN column.
	Expected Output	:	The ISBN column enforces uniqueness.
*/
 alter table books
 modify ISBN varchar(50) default 'N/A';
 
 
 /*	Scenario		:	You want to add sample book data and update certain records.
	Task			:	Insert at least 5 records into the Books table, respecting all constraints.
						Retrieve all records to verify entries.
						Update the Price or Quantity for a specific record while maintaining the CHECK constraints.
	Expected Output	:	All entries and updates comply with constraints and are displayed correctly.
    */
 
		-- INSERTING RECORDS
 insert into books 
	(Book_ID, Title, Author, ISBN, Price ) values
	(1001, 'SQL Fundamentals', 'John Smith', '978-1000000001', 450.00),
	(1002, 'Advanced SQL', 'Emma Brown', '978-1000000002', 680.50),
	(1003, 'Power BI Basics', 'Raj Kumar', '978-1000000003', 720.00),
	(1004, 'Power BI Advanced', 'Raj Kumar', '978-1000000004', 850.00),
	(1005, 'Python for Data Analysis', 'Alice Johnson', '978-1000000005', 999.00),
	(1006, 'Machine Learning Intro', 'David Lee', '978-1000000006', 1200.00),
	(1007, 'Deep Learning Essentials', 'David Lee', '978-1000000007', 1450.00),
	(1008, 'Excel for Analysts', 'Michael Clark', '978-1000000008', 399.99),
	(1009, 'Data Visualization', 'Sophia Miller', '978-1000000009', 550.75),
	(1010, 'Statistics Made Easy', 'Chris Wilson', '978-1000000010', 480.00),
	(1011, 'Big Data Concepts', 'Daniel Martin', '978-1000000011', 1300.00),
	(1012, 'Cloud Computing', 'Laura White', '978-1000000012', 1100.00),
	(1013, 'AI Fundamentals', 'Kevin Harris', '978-1000000013', 1400.00),
	(1014, 'Data Engineering', 'Brian Lewis', '978-1000000014', 1250.00),
	(1015, 'NoSQL Databases', 'Olivia Walker', '978-1000000015', 760.00),
	(1016, 'R Programming', 'Ethan Young', '978-1000000016', 680.00),
	(1017, 'Tableau Guide', 'Grace Hall', '978-1000000017', 820.00),
	(1018, 'Business Analytics', 'Nathan Scott', '978-1000000018', 900.00),
	(1019, 'Data Warehousing', 'Hannah Adams', '978-1000000019', 1150.00),
	(1020, 'Data Science Projects', 'Liam Turner', '978-1000000020', 1500.00);
    
insert into orders 
	(Order_ID, Book_ID, Order_Date, Quantity ) values
    (101, 1001, '2024-01-01', 2),
	(102, 1003, '2024-01-03', 1),
	(103, 1005, '2024-01-05', 3),
	(104, 1002, '2024-01-07', 2),
	(105, 1004, '2024-01-08', 1),
	(106, 1006, '2024-01-10', 2),
	(107, 1008, '2024-01-11', 4),
	(108, 1007, '2024-01-12', 1),
	(109, 1010, '2024-01-14', 3),
	(110, 1009, '2024-01-15', 2),
	(111, 1012, '2024-01-16', 1),
	(112, 1011, '2024-01-18', 2),
	(113, 1014, '2024-01-19', 3),
	(114, 1013, '2024-01-20', 1),
	(115, 1015, '2024-01-21', 2),
	(116, 1016, '2024-01-22', 1),
	(117, 1018, '2024-01-23', 4),
	(118, 1017, '2024-01-24', 2),
	(119, 1019, '2024-01-25', 1),
	(120, 1020, '2024-01-26', 3);
 
		-- RETRIVING TABLES
select * from books;
select* from orders;

		-- UPDATING RECORDS
set sql_safe_updates = 0;
update books 
set Price = 550.00, Author = 'John J. Patrick'
where Title = 'SQL Fundamentals';

 select * from books;

/*	Scenario		:	The bookstore wants to manage orders by removing some rows or clearing all data.
	Task			:	Use DELETE with a WHERE clause to remove specific rows from Orders table.
						Use TRUNCATE to remove all rows while keeping table structure intact.
	Expected Output	:	DELETE removes selected rows.
						TRUNCATE clears all rows quickly but keeps the table structure.
*/

		-- ALTERING CONSTRAINTS
alter table orders 
modify order_date date;
 
		-- UPDATE NULL IN ORDER_DATE TO DELETE ROWS
set sql_safe_updates = 0;
update orders
set order_date = NULL 
where Order_ID in(108,114);

select *from orders;

		-- DELETING NULL RECORDS
delete from orders 
where Order_Date is Null;
 
		-- TRUNCATE
truncate table orders;