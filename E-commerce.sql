-- 1.Create Database
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

-- 2️.Create Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) CHECK (price > 0)
);

-- 3️.Create Sales Table
CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    product_id INT,
    quantity INT CHECK (quantity > 0),
    sale_amount DECIMAL(10,2) CHECK (sale_amount > 0),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 4️.Insert Sample Data into Product Table
INSERT INTO Product (product_id, product_name, price) VALUES
(1, 'Laptop', 85000.00),
(2, 'Smartphone', 45000.00),
(3, 'Headphones', 5000.00),
(4, 'Keyboard', 1200.00),
(5, 'Mouse', 800.00),
(6, 'Monitor', 15000.00),
(7, 'Webcam', 3500.00);

-- 5️.Insert Sample Data into Sales Table
INSERT INTO Sales (sale_id, product_id, quantity, sale_amount) VALUES
(1, 1, 2, 170000.00),
(2, 2, 3, 135000.00),
(3, 3, 5, 25000.00),
(4, 4, 10, 12000.00),
(5, 5, 15, 12000.00),
(6, 6, 2, 30000.00),
(7, 7, 4, 14000.00);

/*Question 1: ORDER BY & LIMIT
		Scenario: Management wants to see the top 3 highest-priced products in the e-commerce system.
		Task: Write a SQL query to display the top 3 most expensive products.
			Sort by price in descending order.
			Use a LIMIT clause (or equivalent in SQL Server: TOP) to restrict to 3 products.
		Expected Output: Top 3 products with their product_id, product_name, and price.
*/
select sales.product_id , pro.product_name, sales.sale_amount as  price
from product as pro
join sales as sales
on sales.product_id= pro.product_id
order by sales.sale_amount desc
limit 3;

/*Question 2: Aggregate Functions
		Scenario: Management wants summary statistics of the sales data.
		Task:Write SQL queries using aggregate functions on the Sales table:
			COUNT() → total number of sales records
			SUM() → total sales amount
			AVG() → average sale amount
			MAX() → highest sale amount
			MIN() → lowest sale amount
		Expected Output: Aggregated results showing total sales, average sale amount, highest and lowest sale amounts.
*/

select count(sale_id) as Tot_Sales, Sum(sale_amount) as Tot_Sales,
	round(avg(sale_amount),2) as Average_Sales,
	max(sale_amount) as Highest_Sale_Amnt, min(sale_amount) as Lowest_Sale
from sales;

/* Question 3: GROUP BY & HAVING
		Scenario: Management wants to know which products have total sales amount greater than ₹100.
		Task:Use GROUP BY on product_id (or product_name) to calculate total sales per product.
			Use HAVING to filter products with total sales > 100.
		Expected Output:List of products with product_id, product_name, and total sales amount greater than ₹100.
*/

select sales.product_id , pro.product_name, 
		sum(sales.sale_amount) as  price
from product as pro
join sales as sales
on sales.product_id= pro.product_id
group by product_id, product_name
having price > 100;


/* Question 4: Window Functions
		Scenario: Management wants a ranking of products based on their prices.
		Task: Write a SQL query using a Window Function (RANK() or DENSE_RANK()) to rank products.
			Rank products from highest to lowest price.
		Expected Output: Each product with product_id, product_name, price, and rank according to price.
*/
