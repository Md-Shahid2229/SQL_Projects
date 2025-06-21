-- Create Database
CREATE DATABASE OnlineBookstore;

-- Switch to the database
\c OnlineBookstore;

-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;


-- Import Data into Books Table
COPY Books(Book_ID, Title, Author, Genre, Published_Year, Price, Stock) 
FROM 'D:\Course Updates\30 Day Series\SQL\CSV\Books.csv' 
CSV HEADER;

-- Import Data into Customers Table
COPY Customers(Customer_ID, Name, Email, Phone, City, Country) 
FROM 'D:\Course Updates\30 Day Series\SQL\CSV\Customers.csv' 
CSV HEADER;

-- Import Data into Orders Table
COPY Orders(Order_ID, Customer_ID, Book_ID, Order_Date, Quantity, Total_Amount) 
FROM 'D:\Course Updates\30 Day Series\SQL\CSV\Orders.csv' 
CSV HEADER;





1) Retrieve all books in the "Fiction" genre
SELECT * FROM BOOKS_IN_THE_FICTION

CREATE VIEW BOOKS_IN_THE_FICTION AS
SELECT * FROM books
where genre = 'Fiction';


2) Find books published after the year 1950
SELECT * FROM Books_published_after_1950 

CREATE VIEW Books_published_after_1950 as
SELECT * FROM Books
where published_year>= 1950;


3) List all customers from the Canada
SELECT * FROM CUSTOMERS_FROM_CANADA 

CREATE VIEW CUSTOMERS_FROM_CANADA AS
SELECT * FROM customers
where country = 'Canada';

4) Show orders placed in November 2023

CREATE VIEW Orders_placed_IN_Nov as
SELECT * FROM Orders
where order_date BETWEEN '2023-11-01' AND '2023-11-30';


5) Retrieve the total stock of books available
SELECT * FROM total_Stock_available

CREATE VIEW total_Stock_available AS
SELECT SUM(stock) as total_Stock_available
from books
order by total_Stock_available;

6) Find the details of the most expensive book
SELECT * from Expensive_book

CREATE VIEW Expensive_book as
SELECT * FROM Books order by price desc limit 1;

7) Show all customers who ordered more than 1 quantity of a book
SELECT * FROM MORE_THAN_1QTY_ORDERED 

CREATE VIEW MORE_THAN_1QTY_ORDERED AS
SELECT * FROM orders
WHERE quantity >1;


8) Retrieve all orders where the total amount exceeds $20
SELECT FROM total_amount_exceeds_$20 AS

CREATE VIEW total_amount_exceeds_$20 AS
SELECT * FROM Orders
where total_amount >20;

9) List all genres available in the Books table
SELECT * FROM  GENRES_AV

CREATE VIEW GENRES_AV AS
SELECT DISTINCT 'genres' from 
books;

10) Find the book with the lowest stock
SELECT * FROM lowest_stock

CREATE VIEW lowest_stock as
SELECT * FROM Books order by stock limit 1;


11) Calculate the total revenue generated from all orders
SELECT * FROM REVENUE
CREATE VIEW REVENUE AS
SELECT SUM(total_amount) as total_revenue from orders;


Advance Queries


1) Retrieve the total number of books sold for each genre
SELECT b.genre, SUM(o.quantity) as No_of_books
from orders o
join books b on b.book_id = o.book_id
group by b.genre
order by No_of_books desc;

2) Find the average price of books in the "Fantasy" genre
SELECT AVG(price) as AVG_price
from books 
where genre = 'Fantasy';

3) List customers who have placed at least 2 orders

SELECT o.customer_id, c.name, COUNT(o.order_id) as Customers_2_ord
from orders o
join customers c on o.customer_id = c.customer_id
GROUP BY o.customer_id, c.name
having count (o.order_id) >=2;

4) Find the most frequently ordered book

SELECT b.title, o.book_id, count(o.order_id) as Order_count
from orders o
join books b on o.book_id = b.book_id
group by b.title, o.book_id
order by Order_count desc limit 1;


5) Show the top 3 most expensive books of 'Fantasy' Genre
SELECT * FROM Books 
where genre = 'Fantasy'
order by price desc limit 3;


6) Retrieve the total quantity of books sold by each author

SELECT b.author, SUM(o.quantity) as Total_Qty_SOld
from orders o
Join books b ON b.book_id = o.book_id
group by b.author;


7) List the cities where customers who spent over $30 are located
SELECT distinct c.city, o.total_amount 
from orders o
join customers c ON c.customer_id = o.customer_id
WHERE o.total_amount  >30;


8) Find the customer who spent the most on orders
SELECT c.customer_id, c.name, SUM(o.total_amount) as Most_spent
from customers c
Join orders o On o.customer_id = c.customer_id
Group by c.customer_id, c.name
order by Most_spent desc limit 1;

9) Calculate the stock remaining after fulfilling all orders

SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) as order_qty, 
b.stock- COALESCE (SUM(o.quantity),0) as remaining_qty
from books b
left join orders o On b.book_id = o.book_id
group by b.book_id, b.title, b.stock;





