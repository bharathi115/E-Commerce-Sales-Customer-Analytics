CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
-- create customers table and insert values
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(150),
    city VARCHAR(50),
    state VARCHAR(50),
    signup_date DATE
);

-- create customers table and insert values
INSERT INTO customers
(customer_id, customer_name, email, city, state, signup_date)
VALUES
(1, 'Bharathi', 'bharathi@gmail.com', 'Mumbai', 'Tamil Nadu', '2024-01-15'),
(2, 'Pradeepa', 'pradeepa@gmail.com', 'Bangalore', 'Karnataka', '2024-02-10'),
(3, 'Vishnu', 'vishnu@gmail.com', 'Mumbai', 'chennai', '2024-02-25'),
(4, 'Harishkumar', 'harishkumar@gmail.com', 'Chennai', 'Tamil Nadu', '2024-03-12'),
(5, 'Karthick', 'karthick@gmail.com', 'Hyderabad', 'Telangana', '2024-04-05'),
(6, 'Megavarshini', 'megavarshini@gmail.com', 'Chennai', 'Tamil Nadu', '2024-04-06'),
(7, 'Banu', 'banu@gmail.com', 'Chennai', 'Tamil Nadu', '2024-07-05'),
(8, 'Brindha', 'brindha@gmail.com', 'Chennai', 'Tamil Nadu', '2024-08-05'),
(9, 'Soundharya', 'soundharya@gmail.com', 'Chennai', 'Tamil Nadu', '2024-09-15'),
(10, 'Sheeba', 'sheeba@gmail.com', 'Chennai', 'Tamil Nadu', '2024-12-05');

SELECT * FROM customers;

-- create products table and insert values

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2),
    cost DECIMAL(10,2)
);
-- create products table and insert values
INSERT INTO products
(product_id, product_name, category, price, cost)
VALUES
(101, 'Laptop', 'Electronics', 65000, 50000),
(102, 'Smartphone', 'Electronics', 30000, 22000),
(103, 'Headphones', 'Electronics', 2500, 1500),
(104, 'T-Shirt', 'Fashion', 999, 500),
(105, 'Jeans', 'Fashion', 1999, 1000),
(106, 'Running Shoes', 'Footwear', 2999, 1700),
(107, 'Backpack', 'Accessories', 1499, 800),
(108, 'Smart Watch', 'Electronics', 4999, 3000);
SELECT* FROM products;
-- create orders table and insert values
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    FOREIGN KEY (customer_id)
REFERENCES customers(customer_id)
);
-- create orders table and insert values
INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES
(1001, 1, '2024-05-01', 'Completed'),
(1002, 2, '2024-05-03', 'Completed'),
(1003, 3, '2024-05-05', 'Completed'),
(1004, 4, '2024-05-10', 'Completed'),
(1005, 5, '2024-05-12', 'Cancelled'),
(1006, 6, '2024-05-15', 'Completed'),
(1007, 7, '2024-06-01', 'Completed'),
(1008, 8, '2024-06-05', 'Completed');
INSERT INTO orders
(order_id, customer_id, order_date, order_status)
VALUES
(1009, 9, '2024-08-05', 'Completed'),
(1010, 10, '2024-06-15', 'Completed'),
(1011, 3, '2024-07-20', 'Completed'),
(1012, 6, '2024-09-10', 'Pending');
SELECT * FROM orders;

-- create Order Items table and insert values

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),

    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1, 1001, 101, 1, 65000),
(2, 1002, 102, 1, 30000),
(3, 1003, 103, 2, 2500),
(4, 1004, 104, 3, 999),
(5, 1005, 105, 1, 1999),
(6, 1006, 106, 2, 2999),
(7, 1007, 107, 1, 1499),
(8, 1008, 108, 1, 4999),
(9, 1009, 101, 1, 65000),
(10, 1010, 102, 2, 30000),
(11, 1011, 106, 1, 2999),
(12, 1012, 104, 2, 999);

-- Total payments table and insert values
CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_date DATE,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);

-- Total payments table and insert values
INSERT INTO payments
(payment_id, order_id, payment_date, payment_method, payment_status)
VALUES
(501, 1001, '2024-05-01', 'UPI', 'Paid'),
(502, 1002, '2024-05-03', 'Credit Card', 'Paid'),
(503, 1003, '2024-05-05', 'UPI', 'Paid'),
(504, 1004, '2024-05-10', 'Debit Card', 'Paid'),
(505, 1005, '2024-05-12', 'UPI', 'Refunded'),
(506, 1006, '2024-05-15', 'Credit Card', 'Paid'),
(507, 1007, '2024-06-01', 'UPI', 'Paid'),
(508, 1008, '2024-06-05', 'Net Banking', 'Paid');

-- Alter The Payment sesion insert to the values
INSERT INTO payments
(payment_id, order_id, payment_date, payment_method, payment_status)
VALUES
(509, 1008, '2024-06-05', 'Net Banking', 'Paid'),
(510, 1006, '2024-05-15', 'Credit Card', 'Paid');

SELECT* FROM PAYMENTS;

-- Create Table Events and insert values
CREATE TABLE events ( 
event_id SERIAL PRIMARY KEY,
    user_id VARCHAR(50) NOT NULL,
    session_id VARCHAR(50) NOT NULL,
    event_time TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    event_type VARCHAR(30) NOT NULL,
    product_id VARCHAR(50)
);
INSERT INTO events (user_id, session_id, event_time, event_type, product_id) VALUES
('USR105', 'SESS_992E', '2026-08-31 12:05:00', 'view_item', 'PROD_001'),
('USR105', 'SESS_992E', '2026-08-31 12:07:30', 'add_to_cart', 'PROD_001'),
('USR105', 'SESS_992E', '2026-08-31 12:09:15', 'view_item', 'PROD_004'),
('USR105', 'SESS_992E', '2026-08-31 12:11:00', 'add_to_cart', 'PROD_004'),
('USR105', 'SESS_992E', '2026-08-31 12:15:00', 'purchase', 'PROD_001');

-- Count Total Coloumns

SELECT COUNT(*) FROM customers;
SELECT COUNT(*) FROM products;
SELECT COUNT(*) FROM orders;
SELECT COUNT(*) FROM order_items;
SELECT COUNT(*) FROM payments;
SELECT COUNT(*) FROM events;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_products
FROM products;

SELECT COUNT(*) AS total_orders
FROM orders;

SELECT COUNT(*) AS total_order_items
FROM order_items;

SELECT COUNT(*) AS total_payments
FROM payments;

SELECT COUNT(*) AS total_events
FROM events;

-- Count Total completed Orders
SELECT COUNT(*) AS completed_orders
FROM orders
WHERE order_status ='completed';


-- All Tables Show
SHOW TABLES;

-- SUM of the total Sales in Order_items
SELECT
    SUM(quantity * unit_price) AS total_sales
FROM order_items;

-- SALES BY PRODUCT
-- oi-order_items, products-p, orders-o
SELECT 
    p.product_name, 
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.product_name
ORDER BY total_revenue DESC;


-- SALES BY CATEGORY
SELECT 
    p.category, 
    SUM(oi.quantity * oi.unit_price) AS total_revenue,
    SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY total_revenue DESC;

-- Monthly Sales Performance
SELECT 
    DATE_FORMAT(o.order_date, '%Y-%m') AS sales_month,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS units_sold,
    SUM(oi.quantity * oi.unit_price) AS monthly_revenue
FROM orders o
JOIN order_items oi ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY sales_month ASC;


-- TOP 10 Products and category

SELECT p.product_name,p.category,
SUM(oi.quantity * oi.unit_price) AS total_revenue,
    SUM(oi.quantity) AS total_units_sold
FROM order_items oi
JOIN products p ON oi.product_id = p.product_id
JOIN orders o ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category,
         p.product_name
ORDER BY total_revenue DESC
LIMIT 7;



-- CUSTOMER ANALYTICS
SELECT
    c.customer_id,
    c.customer_name,
    c.city,
    c.state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity) AS total_units_purchased,
    SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name,
    c.city,
    c.state
ORDER BY total_spent DESC;
-- TOP 5 IN CUSTOMER

SELECT 
     c.customer_name,
     COUNT(DISTINCT o.order_id) AS total_orders,
     SUM(oi.quantity * oi.unit_price) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id= o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_name,
    c.customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- Average order value
SELECT
    ROUND(SUM(oi.quantity * oi.unit_price) / COUNT(DISTINCT o.order_id), 2 ) AS average_order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed';

-- PROFIT BY CATEGORY
SELECT
    p.category,
    SUM(oi.quantity * oi.unit_price) AS revenue,
    SUM(oi.quantity * p.cost) AS total_cost,
    SUM(
        oi.quantity * (oi.unit_price - p.cost)
    ) AS total_profit
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
JOIN orders o
    ON oi.order_id = o.order_id
WHERE o.order_status = 'Completed'
GROUP BY p.category
ORDER BY total_profit DESC;

-- ORDER STATUS ANALYSIS

SELECT order_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY order_status;

-- PAYMENT METHOD ANALYSIS
SELECT
    payment_method,
    COUNT(*) AS total_transactions
FROM payments
WHERE payment_status = 'Paid'
GROUP BY payment_method
ORDER BY total_transactions DESC;

-- PAYMENT STATUS
SELECT 
    payment_status,
    COUNT(*) AS total_payments
FROM payments
GROUP BY payment_status;

-- SALES BY CITY
SELECT
    c.city,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
WHERE o.order_status = 'Completed'
GROUP BY c.city
ORDER BY total_revenue DESC;

-- Repeat Customers

SELECT
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_status = 'Completed'
GROUP BY
    c.customer_id,
    c.customer_name
HAVING COUNT(DISTINCT o.order_id) > 1
ORDER BY total_orders DESC;

-- EVENT ANALYSIS

SELECT
    COUNT(*) AS product_views
FROM events
WHERE event_type = 'view_item';

SELECT
    COUNT(*) AS add_to_cart
FROM events
WHERE event_type = 'add_to_cart';

SELECT
    COUNT(*) AS purchase
FROM events
WHERE event_type = 'purchase';

SELECT
    event_type,
    COUNT(*) AS total_events
FROM events
GROUP BY event_type
ORDER BY total_events DESC;

