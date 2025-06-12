-- Create Database
CREATE DATABASE ishrat;
USE ishrat;


-- Create Countries Table
CREATE TABLE countries (
    country_code VARCHAR(10) PRIMARY KEY,
    country_name VARCHAR(100) UNIQUE
);


-- Create Users Table
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    date_of_birth DATE,
    country_code VARCHAR(10),
    FOREIGN KEY (country_code) REFERENCES countries(country_code)
);

-- Create Merchants Table
CREATE TABLE merchants (
    merchant_id INT AUTO_INCREMENT PRIMARY KEY,
    merchant_name VARCHAR(100),
    admin_id INT,
    country_code VARCHAR(10),
    FOREIGN KEY (admin_id) REFERENCES users(user_id),
    FOREIGN KEY (country_code) REFERENCES countries(country_code)
);

-- Create Products Table
CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    merchant_id INT,
    category VARCHAR(50),
    FOREIGN KEY (merchant_id) REFERENCES merchants(merchant_id)
);

-- Create Orders Table
CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20),
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

-- Create Order_Items Table
CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- ** PART-2: DATA INJECTING **

-- table-1: COUNTRY TABLE
 SHOW COLUMNS FROM countries;
 
 INSERT INTO countries (country_code, country_name) VALUES
('US', 'United States'),
('CA', 'Canada'),
('UK', 'United Kingdom'),
('AU', 'Australia'),
('DE', 'Germany');

-- table-2: Users TABLE
SHOW COLUMNS FROM users;
INSERT INTO users (full_name, email, date_of_birth, country_code) VALUES
('John Doe', 'john.doe@email.com', '1990-05-15', 'US'),
('Jane Smith', 'jane.smith@email.com', '1985-08-22', 'CA'),
('Alice Johnson', 'alice.j@email.com', '1992-03-10', 'UK'),
('Bob Brown', 'bob.brown@email.com', '1988-11-30', 'AU'),
('Emma Wilson', 'emma.w@email.com', '1995-07-25', 'DE'),
('Michael Lee', 'michael.lee@email.com', '1993-09-12', 'US'),
('Sarah Davis', 'sarah.d@email.com', '1987-04-18', 'CA'),
('David Kim', 'david.kim@email.com', '1991-12-05', 'UK'),
('Laura Adams', 'laura.adams@email.com', '1989-06-20', 'AU'),
('Chris Evans', 'chris.e@email.com', '1994-02-14', 'DE');

-- table-3: MERCHANTS TABLE
 SHOW COLUMNS FROM merchants;
 
 INSERT INTO merchants (merchant_name, admin_id, country_code) VALUES
('TechTrend', 1, 'US'),
('FashionHub', 2, 'CA'),
('GadgetZone', 3, 'UK');

-- table-4: PRODUCTS TABLE
SHOW COLUMNS FROM products_tab;

-- TechTrend (merchant_id=1)
INSERT INTO products (product_name, price, merchant_id, category) VALUES
('Laptop', 999.99, 1, 'Electronics'),
('Smartphone', 699.99, 1, 'Electronics'),
('Headphones', 149.99, 1, 'Accessories'),
('Tablet', 499.99, 1, 'Electronics'),
('Smartwatch', 249.99, 1, 'Accessories'),
('Charger', 29.99, 1, 'Accessories'),
('Mouse', 39.99, 1, 'Accessories'),
('Keyboard', 59.99, 1, 'Accessories'),
('Monitor', 299.99, 1, 'Electronics'),
('Speaker', 89.99, 1, 'Accessories');

-- FashionHub (merchant_id=2)
INSERT INTO products (product_name, price, merchant_id, category) VALUES
('T-Shirt', 19.99, 2, 'Clothing'),
('Jeans', 49.99, 2, 'Clothing'),
('Jacket', 89.99, 2, 'Clothing'),
('Sneakers', 79.99, 2, 'Footwear'),
('Hat', 24.99, 2, 'Accessories'),
('Scarf', 14.99, 2, 'Accessories'),
('Dress', 59.99, 2, 'Clothing'),
('Belt', 29.99, 2, 'Accessories'),
('Sunglasses', 39.99, 2, 'Accessories'),
('Shirt', 34.99, 2, 'Clothing');

-- GadgetZone (merchant_id=3)
INSERT INTO products (product_name, price, merchant_id, category) VALUES
('Drone', 499.99, 3, 'Electronics'),
('Camera', 799.99, 3, 'Electronics'),
('Tripod', 59.99, 3, 'Accessories'),
('Lens', 299.99, 3, 'Accessories'),
('Battery Pack', 49.99, 3, 'Accessories'),
('VR Headset', 399.99, 3, 'Electronics'),
('Game Controller', 69.99, 3, 'Accessories'),
('Smart Light', 29.99, 3, 'Electronics'),
('Router', 129.99, 3, 'Electronics'),
('Earphones', 99.99, 3, 'Accessories');

-- table-5: orders TABLE

-- Example for user_id=1 (5 orders)
INSERT INTO orders (user_id, created_at, status) VALUES
-- User 1: John Doe
(1, '2025-01-10 10:00:00', 'delivered'),
(1, '2025-02-15 12:30:00', 'shipped'),
(1, '2025-03-20 09:15:00', 'pending'),
(1, '2025-04-05 14:45:00', 'delivered'),
(1, '2025-05-10 16:20:00', 'shipped'),
-- User 2: Jane Smith
(2, '2025-01-12 11:00:00', 'delivered'),
(2, '2025-02-17 13:00:00', 'shipped'),
(2, '2025-03-22 10:30:00', 'pending'),
(2, '2025-04-07 15:00:00', 'delivered'),
(2, '2025-05-12 17:00:00', 'shipped'),
-- User 3: Alice Johnson
(3, '2025-01-14 09:30:00', 'delivered'),
(3, '2025-02-19 14:15:00', 'shipped'),
(3, '2025-03-24 11:45:00', 'pending'),
(3, '2025-04-09 16:30:00', 'delivered'),
(3, '2025-05-14 18:00:00', 'shipped'),
-- User 4: Bob Brown
(4, '2025-01-16 10:45:00', 'delivered'),
(4, '2025-02-21 15:30:00', 'shipped'),
(4, '2025-03-26 12:00:00', 'pending'),
(4, '2025-04-11 17:15:00', 'delivered'),
(4, '2025-05-16 19:00:00', 'shipped'),
-- User 5: Emma Wilson
(5, '2025-01-18 11:15:00', 'delivered'),
(5, '2025-02-23 16:00:00', 'shipped'),
(5, '2025-03-28 13:30:00', 'pending'),
(5, '2025-04-13 18:00:00', 'delivered'),
(5, '2025-05-18 20:00:00', 'shipped'),
-- User 6: Michael Lee
(6, '2025-01-20 12:00:00', 'delivered'),
(6, '2025-02-25 17:00:00', 'shipped'),
(6, '2025-03-30 14:00:00', 'pending'),
(6, '2025-04-15 19:00:00', 'delivered'),
(6, '2025-05-20 21:00:00', 'shipped'),
-- User 7: Sarah Davis
(7, '2025-01-22 13:00:00', 'delivered'),
(7, '2025-02-27 18:00:00', 'shipped'),
(7, '2025-04-01 15:00:00', 'pending'),
(7, '2025-04-17 20:00:00', 'delivered'),
(7, '2025-05-22 22:00:00', 'shipped'),
-- User 8: David Kim
(8, '2025-01-24 14:00:00', 'delivered'),
(8, '2025-03-01 19:00:00', 'shipped'),
(8, '2025-04-03 16:00:00', 'pending'),
(8, '2025-04-19 21:00:00', 'delivered'),
(8, '2025-05-24 23:00:00', 'shipped'),
-- User 9: Laura Adams
(9, '2025-01-26 15:00:00', 'delivered'),
(9, '2025-03-03 20:00:00', 'shipped'),
(9, '2025-04-05 17:00:00', 'pending'),
(9, '2025-04-21 22:00:00', 'delivered'),
(9, '2025-05-26 00:00:00', 'shipped'),
-- User 10: Chris Evans
(10, '2025-01-28 16:00:00', 'delivered'),
(10, '2025-03-05 21:00:00', 'shipped'),
(10, '2025-04-07 18:00:00', 'pending'),
(10, '2025-04-23 23:00:00', 'delivered'),
(10, '2025-05-28 01:00:00', 'shipped');

-- table-6: ORDER_ITEM -- Insert 10 order items for existing orders (IDs 1 to 10)

-- Example for order_id=1 (5 items)
INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 2), -- Laptop
(1, 3, 1), -- Headphones
(1, 5, 1), -- Smartwatch
(1, 7, 3), -- Mouse
(1, 9, 1); -- Monitor
-- Repeat for each order_id (2 to 50) with different product_id and quantity combinations
-- Insert into order_items for order_id 2 to 50
INSERT INTO order_items (order_id, product_id, quantity) VALUES
-- order_id = 2 (User 1)
(2, 2, 1), (2, 4, 2), (2, 11, 3), (2, 13, 1), (2, 21, 2),
-- order_id = 3 (User 1)
(3, 6, 2), (3, 8, 1), (3, 12, 4), (3, 15, 2), (3, 22, 1),
-- order_id = 4 (User 1)
(4, 10, 3), (4, 14, 2), (4, 16, 1), (4, 23, 2), (4, 25, 1),
-- order_id = 5 (User 1)
(5, 1, 1), (5, 17, 3), (5, 19, 2), (5, 24, 1), (5, 27, 2),
-- order_id = 6 (User 2)
(6, 3, 2), (6, 5, 1), (6, 18, 3), (6, 20, 1), (6, 26, 2),
-- order_id = 7 (User 2)
(7, 7, 3), (7, 9, 1), (7, 11, 2), (7, 14, 2), (7, 28, 1),
-- order_id = 8 (User 2)
(8, 2, 1), (8, 12, 4), (8, 15, 2), (8, 21, 1), (8, 29, 2),
-- order_id = 9 (User 2)
(9, 4, 2), (9, 16, 1), (9, 19, 3), (9, 22, 2), (9, 30, 1),
-- order_id = 10 (User 2)
(10, 6, 1), (10, 17, 2), (10, 23, 1), (10, 25, 2), (10, 27, 3),
-- order_id = 11 (User 3)
(11, 8, 2), (11, 10, 1), (11, 13, 3), (11, 18, 1), (11, 24, 2),
-- order_id = 12 (User 3)
(12, 1, 1), (12, 14, 2), (12, 20, 1), (12, 26, 2), (12, 28, 1),
-- order_id = 13 (User 3)
(13, 3, 3), (13, 15, 2), (13, 21, 1), (13, 27, 2), (13, 29, 1),
-- order_id = 14 (User 3)
(14, 5, 1), (14, 16, 3), (14, 22, 2), (14, 24, 1), (14, 30, 2),
-- order_id = 15 (User 3)
(15, 7, 2), (15, 17, 1), (15, 19, 2), (15, 25, 1), (15, 28, 3),
-- order_id = 16 (User 4)
(16, 9, 1), (16, 11, 3), (16, 18, 2), (16, 23, 1), (16, 26, 2),
-- order_id = 17 (User 4)
(17, 2, 2), (17, 12, 1), (17, 14, 2), (17, 20, 1), (17, 29, 3),
-- order_id = 18 (User 4)
(18, 4, 1), (18, 15, 2), (18, 21, 3), (18, 24, 1), (18, 27, 2),
-- order_id = 19 (User 4)
(19, 6, 2), (19, 16, 1), (19, 19, 2), (19, 22, 1), (19, 30, 1),
-- order_id = 20 (User 4)
(20, 8, 3), (20, 17, 2), (20, 23, 1), (20, 25, 2), (20, 28, 1),
-- order_id = 21 (User 5)
(21, 1, 1), (21, 11, 2), (21, 18, 1), (21, 26, 2), (21, 29, 3),
-- order_id = 22 (User 5)
(22, 3, 2), (22, 12, 3), (22, 14, 1), (22, 20, 2), (22, 27, 1),
-- order_id = 23 (User 5)
(23, 5, 1), (23, 15, 2), (23, 21, 2), (23, 24, 1), (23, 30, 2),
-- order_id = 24 (User 5)
(24, 7, 2), (24, 16, 1), (24, 19, 3), (24, 22, 2), (24, 28, 1),
-- order_id = 25 (User 5)
(25, 9, 1), (25, 17, 2), (25, 23, 1), (25, 25, 2), (25, 29, 3),
-- order_id = 26 (User 6)
(26, 2, 2), (26, 11, 1), (26, 18, 2), (26, 24, 1), (26, 27, 2),
-- order_id = 27 (User 6)
(27, 4, 1), (27, 12, 2), (27, 14, 3), (27, 20, 1), (27, 30, 2),
-- order_id = 28 (User 6)
(28, 6, 2), (28, 15, 1), (28, 21, 2), (28, 23, 1), (28, 28, 3),
-- order_id = 29 (User 6)
(29, 8, 1), (29, 16, 2), (29, 19, 1), (29, 22, 2), (29, 29, 1),
-- order_id = 30 (User 6)
(30, 10, 2), (30, 17, 1), (30, 24, 2), (30, 25, 1), (30, 27, 3),
-- order_id = 31 (User 7)
(31, 1, 1), (31, 11, 2), (31, 18, 3), (31, 23, 1), (31, 26, 2),
-- order_id = 32 (User 7)
(32, 3, 2), (32, 12, 1), (32, 14, 2), (32, 20, 1), (32, 28, 3),
-- order_id = 33 (User 7)
(33, 5, 1), (33, 15, 2), (33, 21, 1), (33, 24, 2), (33, 30, 1),
-- order_id = 34 (User 7)
(34, 7, 2), (34, 16, 3), (34, 19, 1), (34, 22, 2), (34, 27, 1),
-- order_id = 35 (User 7)
(35, 9, 1), (35, 17, 2), (35, 23, 1), (35, 25, 2), (35, 29, 3),
-- order_id = 36 (User 8)
(36, 2, 2), (36, 11, 1), (36, 18, 2), (36, 24, 1), (36, 28, 2),
-- order_id = 37 (User 8)
(37, 4, 1), (37, 12, 2), (37, 14, 3), (37, 20, 1), (37, 30, 2),
-- order_id = 38 (User 8)
(38, 6, 2), (38, 15, 1), (38, 21, 2), (38, 23, 1), (38, 27, 3),
-- order_id = 39 (User 8)
(39, 8, 1), (39, 16, 2), (39, 19, 1), (39, 22, 2), (39, 29, 1),
-- order_id = 40 (User 8)
(40, 10, 2), (40, 17, 1), (40, 24, 2), (40, 25, 1), (40, 28, 3),
-- order_id = 41 (User 9)
(41, 1, 1), (41, 11, 2), (41, 18, 3), (41, 23, 1), (41, 26, 2),
-- order_id = 42 (User 9)
(42, 3, 2), (42, 12, 1), (42, 14, 2), (42, 20, 1), (42, 30, 2),
-- order_id = 43 (User 9)
(43, 5, 1), (43, 15, 2), (43, 21, 1), (43, 24, 2), (43, 27, 3),
-- order_id = 44 (User 9)
(44, 7, 2), (44, 16, 3), (44, 19, 1), (44, 22, 2), (44, 29, 1),
-- order_id = 45 (User 9)
(45, 9, 1), (45, 17, 2), (45, 23, 1), (45, 25, 2), (45, 28, 3),
-- order_id = 46 (User 10)
(46, 2, 2), (46, 11, 1), (46, 18, 2), (46, 24, 1), (46, 30, 2),
-- order_id = 47 (User 10)
(47, 4, 1), (47, 12, 2), (47, 14, 3), (47, 20, 1), (47, 27, 2),
-- order_id = 48 (User 10)
(48, 6, 2), (48, 15, 1), (48, 21, 2), (48, 23, 1), (48, 29, 3),
-- order_id = 49 (User 10)
(49, 8, 1), (49, 16, 2), (49, 19, 1), (49, 22, 2), (49, 28, 1),
-- order_id = 50 (User 10)
(50, 10, 2), (50, 17, 1), (50, 24, 2), (50, 25, 1), (50, 30, 3);

-- ** Part-3: Performing Queries **

-- Query 1: Display the total number of orders made by each user
SELECT u.user_id, u.full_name, COUNT(o.order_id) AS order_count
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.full_name;

-- Query 2: Display the names of products that have been ordered at least once

SELECT DISTINCT p.product_name
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id;

-- Query 3: :Retrieve the details of all users who are from the same country as the merchant

SELECT u.user_id, u.full_name, u.country_code
FROM users u
WHERE u.country_code IN (SELECT country_code FROM merchants);

 -- ** Task- 4: Aggregate Functions**
 -- Query 1: Total quantity of products ordered by each user
 
 SELECT u.user_id, u.full_name, SUM(oi.quantity) AS total_quantity
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY u.user_id, u.full_name;

-- Query 2: Average order quantity for each product

SELECT p.product_id, p.product_name, AVG(oi.quantity) AS avg_quantity
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

--  Query 3: Min and Max prices of products

SELECT MIN(price) AS min_price, MAX(price) AS max_price
FROM products;

-- Query 4: Count number of merchants per country
 SELECT c.country_code, c.country_name, COUNT(m.merchant_id) AS merchant_count
FROM countries c
LEFT JOIN merchants m ON c.country_code = m.country_code
GROUP BY c.country_code, c.country_name;

--  Task 5: GROUP BY & HAVING Clauses
-- Query 1: Group orders by status and count them

SELECT status, COUNT(order_id) AS order_count
FROM orders
GROUP BY status;

-- Query 2: Group products by merchant and count them

SELECT m.merchant_id, m.merchant_name, COUNT(p.product_id) AS product_count
FROM merchants m
LEFT JOIN products p ON m.merchant_id = p.merchant_id
GROUP BY m.merchant_id, m.merchant_name;

-- Query 3: Show users who have placed more than 3 orders
SELECT u.user_id, u.full_name, COUNT(o.order_id) AS order_count
FROM users u
JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.full_name
HAVING COUNT(o.order_id) > 3;

-- Task-6: SQL Joins
-- Query 1: Inner Join Between Orders and Users

SELECT o.order_id, o.created_at, o.status, u.full_name
FROM orders o
INNER JOIN users u ON o.user_id = u.user_id;

-- Query 2: Left Join to Get All Products (Including Unordered Ones)
 
SELECT p.product_id, p.product_name, o.order_id
FROM products p
LEFT JOIN order_items oi ON p.product_id = oi.product_id
LEFT JOIN orders o ON oi.order_id = o.order_id;

-- Query 3: Self Join – Find Users Who Share the Same Country
SELECT u1.user_id, u1.full_name, u1.country_code, u2.full_name AS other_user
FROM users u1
JOIN users u2 ON u1.country_code = u2.country_code AND u1.user_id != u2.user_id;

-- Task-7: Window Functions
-- Query 1: Total number of orders per user using a window function

SELECT u.user_id, u.full_name, o.order_id,
       COUNT(o.order_id) OVER (PARTITION BY u.user_id) AS total_orders
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id;

-- Query 2: Average price of products across all orders using a window function

SELECT p.product_id, p.product_name, p.price,
       AVG(p.price) OVER () AS avg_price_all
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id;

-- Query 3: Rank users by quantity of products ordered using

SELECT u.user_id, u.full_name, SUM(oi.quantity) AS total_quantity,
       ROW_NUMBER() OVER (ORDER BY SUM(oi.quantity) DESC) AS quantity_rank
FROM users u
JOIN orders o ON u.user_id = o.user_id
JOIN order_items oi ON o.order_id = oi.order_id
GROUP BY u.user_id, u.full_name;

-- Query 4: Rank products by price within each merchant using RANK()

SELECT p.product_id, p.product_name, p.price, m.merchant_name,
       RANK() OVER (PARTITION BY p.merchant_id ORDER BY p.price DESC) AS price_rank
FROM products p
JOIN merchants m ON p.merchant_id = m.merchant_id;

-- Query 5: Use DENSE_RANK() to rank orders by created date

SELECT order_id, created_at,
       DENSE_RANK() OVER (ORDER BY created_at) AS date_rank
FROM orders;

-- Query 6: Use PERCENT_RANK() to find relative position of order quantities

-- Task 7 (Value/Analytic): Advanced Window Functions
-- Query 1: Use LEAD() to find the next order date for each user

SELECT user_id, order_id, created_at,
       LEAD(created_at) OVER (PARTITION BY user_id ORDER BY created_at) AS next_order_date
FROM orders;

-- Query 2: Use LAG() to determine the previous order for each product

SELECT p.product_id, p.product_name, o.order_id, o.created_at,
LAG(o.order_id) OVER (PARTITION BY p.product_id ORDER BY o.created_at) AS prev_order
FROM products p
JOIN order_items oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id;

-- Query 3: Retrieve FIRST_VALUE() and LAST_VALUE() of order statuses for each user

SELECT u.user_id, u.full_name, o.order_id, o.status,
       FIRST_VALUE(o.status) OVER (PARTITION BY u.user_id ORDER BY o.created_at) AS first_status,
       LAST_VALUE(o.status) OVER (PARTITION BY u.user_id ORDER BY o.created_at 
                                 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_status
FROM users u
JOIN orders o ON u.user_id = o.user_id;

-- Query 4: Find FIRST_VALUE() and LAST_VALUE() of prices in each product category

SELECT p.product_id, p.product_name, p.price, p.category,
       FIRST_VALUE(p.price) OVER (PARTITION BY p.category ORDER BY p.price) AS first_price,
       LAST_VALUE(p.price) OVER (PARTITION BY p.category ORDER BY p.price 
                                 ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) AS last_price
FROM products p;

-- Task 8: Subqueries
-- Query 1: Find users who have placed orders but have not ordered a particular product

SELECT u.user_id, u.full_name
FROM users u
WHERE u.user_id NOT IN (
    SELECT o.user_id
    FROM orders o
    JOIN order_items oi ON o.order_id = oi.order_id
    WHERE oi.product_id = 1
);

-- Query 2: Find users who have placed orders but have not ordered a particular product

SELECT u.user_id, u.full_name
FROM users u
WHERE (
    SELECT COUNT(*) 
    FROM orders o 
    WHERE o.user_id = u.user_id
) > (
    SELECT AVG(order_count)
    FROM (
        SELECT COUNT(*) AS order_count
        FROM orders
        GROUP BY user_id
    ) sub
);

--  Task 9: Case Statements
-- Query 1: Categorize Products by Price

SELECT product_id, product_name, price,
       CASE 
           WHEN price < 50 THEN 'Low Price'
           WHEN price BETWEEN 50 AND 200 THEN 'Medium Price'
           ELSE 'High Price'
       END AS price_category
FROM products;

--  Query 2: Categorize Users Based on Number of Orders

SELECT u.user_id, u.full_name, COUNT(o.order_id) AS order_count,
       CASE 
           WHEN COUNT(o.order_id) = 1 THEN 'New'
           WHEN COUNT(o.order_id) BETWEEN 2 AND 4 THEN 'Regular'
           ELSE 'VIP'
       END AS user_category
FROM users u
LEFT JOIN orders o ON u.user_id = o.user_id
GROUP BY u.user_id, u.full_name;

-- Task 10: Date and Time Functions
-- Query 1: Extract year and month from created_at column in orders

SELECT order_id, created_at,
       EXTRACT(YEAR FROM created_at) AS order_year,
       EXTRACT(MONTH FROM created_at) AS order_month
FROM orders;

-- Query 2: Calculate day difference between first and last order per user

SELECT user_id,
       MIN(created_at) AS first_order,
       MAX(created_at) AS last_order,
       DATEDIFF(MAX(created_at), MIN(created_at)) AS days_difference
FROM orders
GROUP BY user_id;

-- Query 3: Use DATE_PART() to extract the day of the week


-- Task 11: Common Table Expressions (CTEs)
--  Query 1: CTE to calculate cumulative total of products ordered by each user

WITH UserOrderQuantities AS (
    SELECT u.user_id, u.full_name, o.order_id, SUM(oi.quantity) AS order_quantity
    FROM users u
    JOIN orders o ON u.user_id = o.user_id
    JOIN order_items oi ON o.order_id = oi.order_id
    GROUP BY u.user_id, u.full_name, o.order_id
)
SELECT user_id, full_name, order_id, order_quantity,
       SUM(order_quantity) OVER (PARTITION BY user_id ORDER BY order_id) AS cumulative_quantity
FROM UserOrderQuantities;

-- Query 2: CTE to find top 5 users by number of orders

WITH UserOrderCounts AS (
    SELECT u.user_id, u.full_name, COUNT(o.order_id) AS order_count
    FROM users u
    LEFT JOIN orders o ON u.user_id = o.user_id
    GROUP BY u.user_id, u.full_name
)

SELECT user_id, full_name, order_count
FROM UserOrderCounts
ORDER BY order_count DESC
LIMIT 5;