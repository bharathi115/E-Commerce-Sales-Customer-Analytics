CREATE DATABASE ecommerce_analytics;
USE ecommerce_analytics;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    customer_segment VARCHAR(50),
    country VARCHAR(50),
    region VARCHAR(50)
);
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    product_category VARCHAR(100),
    unit_price DECIMAL(10,2)
);
CREATE TABLE orders (
    order_id VARCHAR(20) PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    payment_method VARCHAR(50),

    FOREIGN KEY (customer_id)
		REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(20),
    product_id INT,
    quantity INT,
    unit_price DECIMAL(10,2),
    discount_percent DECIMAL(5,2),
    total_sales DECIMAL(12,2),
    shipping_cost DECIMAL(10,2),
    profit DECIMAL(12,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- Inserting values for customers

INSERT INTO customers
(customer_name, customer_segment, country, region)
VALUES
('Bharathi', 'Consumer', 'India', 'South Asia'),
('Akshaya', 'Corporate', 'India', 'South Asia'),
('Arun Kumar', 'Consumer', 'India', 'South Asia'),
('Priya', 'Home Office', 'India', 'South Asia'),
('Rahul', 'Consumer', 'United States', 'North America'),
('Sneha', 'Corporate', 'United Kingdom', 'Europe'),
('Karthik', 'Consumer', 'Australia', 'Oceania'),
('Divya', 'Home Office', 'India', 'South Asia'),
('Vignesh', 'Corporate', 'Singapore', 'Southeast Asia'),
('Anitha', 'Consumer', 'Canada', 'North America'),
('Suresh', 'Consumer', 'Germany', 'Europe'),
('Meena', 'Corporate', 'France', 'Europe'),
('Ravi', 'Home Office', 'India', 'South Asia'),
('Deepa', 'Consumer', 'Japan', 'East Asia'),
('Manoj', 'Corporate', 'Australia', 'Oceania'),
('Kavya', 'Consumer', 'Brazil', 'South America'),
('Santhosh', 'Home Office', 'India', 'South Asia'),
('Nithya', 'Corporate', 'China', 'East Asia'),
('Vijay', 'Consumer', 'Mexico', 'North America'),
('Harini', 'Consumer', 'Italy', 'Europe');
SELECT * FROM customers;


-- inser into products
INSERT INTO products
(product_name, product_category, unit_price)
VALUES
('Laptop', 'Technology', 75000.00),
('Smartphone', 'Technology', 45000.00),
('Wireless Headphones', 'Technology', 5000.00),
('Bluetooth Speaker', 'Technology', 3500.00),
('Office Chair', 'Furniture', 12000.00),
('Executive Desk', 'Furniture', 25000.00),
('Bookshelf', 'Furniture', 8500.00),
('Dining Table', 'Furniture', 30000.00),
('Printer', 'Office Supplies', 15000.00),
('Notebook Pack', 'Office Supplies', 500.00),
('Stapler', 'Office Supplies', 250.00),
('Printer Paper', 'Office Supplies', 450.00),
('T-Shirt', 'Clothing & Accessories', 800.00),
('Formal Shirt', 'Clothing & Accessories', 1500.00),
('Jeans', 'Clothing & Accessories', 2200.00),
('Sports Shoes', 'Clothing & Accessories', 3500.00),
('Backpack', 'Clothing & Accessories', 1800.00),
('Wrist Watch', 'Clothing & Accessories', 4500.00),
('Tablet', 'Technology', 28000.00),
('Computer Monitor', 'Technology', 18000.00);

SELECT * FROM products;


-- inserting values in orders
INSERT INTO orders
(order_id, order_date, customer_id, payment_method)
VALUES
('ORD1001', '2026-01-05', 1, 'UPI'),
('ORD1002', '2026-01-08', 2, 'Credit Card'),
('ORD1003', '2026-01-12', 3, 'Debit Card'),
('ORD1004', '2026-01-15', 4, 'Cash'),
('ORD1005', '2026-01-20', 5, 'UPI'),
('ORD1006', '2026-01-25', 6, 'Credit Card'),
('ORD1007', '2026-02-02', 7, 'Debit Card'),
('ORD1008', '2026-02-07', 8, 'UPI'),
('ORD1009', '2026-02-12', 9, 'Credit Card'),
('ORD1010', '2026-02-18', 10, 'Cash'),
('ORD1011', '2026-02-22', 11, 'UPI'),
('ORD1012', '2026-03-01', 12, 'Debit Card'),
('ORD1013', '2026-03-05', 13, 'Credit Card'),
('ORD1014', '2026-03-10', 14, 'UPI'),
('ORD1015', '2026-03-15', 15, 'Debit Card'),
('ORD1016', '2026-03-20', 16, 'Credit Card'),
('ORD1017', '2026-03-25', 17, 'UPI'),
('ORD1018', '2026-04-01', 18, 'Cash'),
('ORD1019', '2026-04-05', 19, 'Credit Card'),
('ORD1020', '2026-04-10', 20, 'UPI');
SELECT * FROM orders;



-- inserting values in order_items
-- =========================================================
-- INSERTING 40 VALUES INTO ORDER_ITEMS
-- =========================================================

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price,
 discount_percent, total_sales, shipping_cost, profit)
VALUES

(1,  'ORD1001', 1,  1, 75000.00,  5.00, 71250.00, 500.00, 10000.00),
(2,  'ORD1002', 2,  2, 45000.00, 10.00, 81000.00, 700.00, 12000.00),
(3,  'ORD1003', 3,  1, 5000.00,   5.00, 4750.00,  200.00, 1200.00),
(4,  'ORD1004', 4,  2, 3500.00,   0.00, 7000.00,  300.00, 1800.00),
(5,  'ORD1005', 5,  1, 12000.00,  8.00, 11040.00, 500.00, 2500.00),

(6,  'ORD1006', 6,  1, 25000.00,  5.00, 23750.00, 600.00, 5000.00),
(7,  'ORD1007', 7,  2, 8500.00,   0.00, 17000.00, 400.00, 3500.00),
(8,  'ORD1008', 8,  1, 30000.00, 10.00, 27000.00, 800.00, 6000.00),
(9,  'ORD1009', 9,  1, 15000.00,  5.00, 14250.00, 500.00, 3000.00),
(10, 'ORD1010', 10, 3, 500.00,    0.00, 1500.00,  150.00, 400.00),

(11, 'ORD1011', 11, 2, 250.00,    0.00, 500.00,   100.00, 150.00),
(12, 'ORD1012', 12, 5, 450.00,    5.00, 2137.50,  150.00, 500.00),
(13, 'ORD1013', 13, 2, 800.00,   10.00, 1440.00,  200.00, 400.00),
(14, 'ORD1014', 14, 1, 1500.00,   5.00, 1425.00,  150.00, 350.00),
(15, 'ORD1015', 15, 2, 2200.00,   8.00, 4048.00,  250.00, 900.00),

(16, 'ORD1016', 16, 1, 3500.00,   0.00, 3500.00,  200.00, 800.00),
(17, 'ORD1017', 17, 2, 1800.00,   5.00, 3420.00,  200.00, 750.00),
(18, 'ORD1018', 18, 1, 4500.00,  10.00, 4050.00,  250.00, 900.00),
(19, 'ORD1019', 19, 1, 28000.00,  5.00, 26600.00, 600.00, 5500.00),
(20, 'ORD1020', 20, 2, 18000.00, 10.00, 32400.00, 700.00, 7000.00),

(21, 'ORD1001', 2,  1, 45000.00,  5.00, 42750.00, 500.00, 8000.00),
(22, 'ORD1002', 5,  2, 12000.00,  10.00, 21600.00, 600.00, 4500.00),
(23, 'ORD1003', 8,  1, 30000.00,  5.00, 28500.00, 700.00, 6000.00),
(24, 'ORD1004', 10, 4, 500.00,    0.00, 2000.00,  150.00, 500.00),
(25, 'ORD1005', 13, 3, 800.00,    5.00, 2280.00,  200.00, 600.00),

(26, 'ORD1006', 16, 2, 3500.00,  10.00, 6300.00,  300.00, 1200.00),
(27, 'ORD1007', 1,  1, 75000.00,  5.00, 71250.00, 800.00, 12000.00),
(28, 'ORD1008', 3,  2, 5000.00,   0.00, 10000.00, 300.00, 2500.00),
(29, 'ORD1009', 6,  1, 25000.00,  8.00, 23000.00, 600.00, 5000.00),
(30, 'ORD1010', 9,  2, 15000.00,  5.00, 28500.00, 500.00, 6000.00),

(31, 'ORD1011', 11, 3, 250.00,    0.00, 750.00,   100.00, 200.00),
(32, 'ORD1012', 14, 2, 1500.00,   5.00, 2850.00,  150.00, 700.00),
(33, 'ORD1013', 17, 1, 1800.00,   0.00, 1800.00,  150.00, 450.00),
(34, 'ORD1014', 20, 1, 18000.00, 10.00, 16200.00, 500.00, 3500.00),
(35, 'ORD1015', 7,  2, 8500.00,   5.00, 16150.00, 400.00, 3500.00),

(36, 'ORD1016', 12, 4, 450.00,    0.00, 1800.00,  150.00, 450.00),
(37, 'ORD1017', 15, 2, 2200.00,  10.00, 3960.00,  250.00, 900.00),
(38, 'ORD1018', 18, 1, 4500.00,   5.00, 4275.00,  200.00, 1000.00),
(39, 'ORD1019', 4,  3, 3500.00,   0.00, 10500.00, 300.00, 2500.00),
(40, 'ORD1020', 19, 1, 28000.00,  5.00, 26600.00, 600.00, 5500.00);
SELECT * 
FROM order_items;

CREATE TABLE payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id VARCHAR(20),
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(30),
    payment_amount DECIMAL(12,2),

    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

-- INSERT into values of payments
INSERT INTO payments
(order_id, payment_date, payment_method, payment_status, payment_amount)
VALUES
('ORD1001', '2026-01-05', 'UPI', 'Completed', 71250.00),
('ORD1002', '2026-01-08', 'Credit Card', 'Completed', 81000.00),
('ORD1003', '2026-01-12', 'Debit Card', 'Completed', 4750.00),
('ORD1004', '2026-01-15', 'Cash', 'Completed', 7000.00),
('ORD1005', '2026-01-20', 'UPI', 'Completed', 11040.00),

('ORD1006', '2026-01-25', 'Credit Card', 'Completed', 23750.00),
('ORD1007', '2026-02-02', 'Debit Card', 'Completed', 17000.00),
('ORD1008', '2026-02-07', 'UPI', 'Completed', 27000.00),
('ORD1009', '2026-02-12', 'Credit Card', 'Completed', 14250.00),
('ORD1010', '2026-02-18', 'Cash', 'Completed', 1500.00),

('ORD1011', '2026-02-22', 'UPI', 'Completed', 500.00),
('ORD1012', '2026-03-01', 'Debit Card', 'Completed', 2137.50),
('ORD1013', '2026-03-05', 'Credit Card', 'Completed', 1440.00),
('ORD1014', '2026-03-10', 'UPI', 'Completed', 1425.00),
('ORD1015', '2026-03-15', 'Debit Card', 'Completed', 4048.00),

('ORD1016', '2026-03-20', 'Credit Card', 'Completed', 3500.00),
('ORD1017', '2026-03-25', 'UPI', 'Completed', 3420.00),
('ORD1018', '2026-04-01', 'Cash', 'Completed', 4050.00),
('ORD1019', '2026-04-05', 'Credit Card', 'Completed', 26600.00),
('ORD1020', '2026-04-10', 'UPI', 'Completed', 32400.00);

SELECT * FROM payments;

CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    event_date DATE,
    event_type VARCHAR(50),

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

-- INSERT INTO values in events

INSERT INTO events
(customer_id, product_id, event_date, event_type)
VALUES
(1, 1, '2026-01-03', 'Product View'),
(1, 1, '2026-01-04', 'Add to Cart'),
(1, 1, '2026-01-05', 'Purchase'),

(2, 2, '2026-01-06', 'Product View'),
(2, 2, '2026-01-07', 'Add to Cart'),
(2, 2, '2026-01-08', 'Purchase'),

(3, 3, '2026-01-10', 'Product View'),
(3, 3, '2026-01-11', 'Add to Cart'),
(3, 3, '2026-01-12', 'Purchase'),

(4, 4, '2026-01-13', 'Product View'),
(4, 4, '2026-01-14', 'Add to Cart'),
(4, 4, '2026-01-15', 'Purchase'),

(5, 5, '2026-01-18', 'Product View'),
(5, 5, '2026-01-19', 'Add to Cart'),
(5, 5, '2026-01-20', 'Purchase'),

(6, 6, '2026-01-23', 'Product View'),
(6, 6, '2026-01-24', 'Add to Cart'),
(6, 6, '2026-01-25', 'Purchase'),

(7, 7, '2026-01-30', 'Product View'),
(7, 7, '2026-02-01', 'Add to Cart'),
(7, 7, '2026-02-02', 'Purchase'),

(8, 8, '2026-02-05', 'Product View'),
(8, 8, '2026-02-06', 'Add to Cart'),
(8, 8, '2026-02-07', 'Purchase'),

(9, 9, '2026-02-10', 'Product View'),
(9, 9, '2026-02-11', 'Add to Cart'),
(9, 9, '2026-02-12', 'Purchase'),

(10, 10, '2026-02-16', 'Product View'),
(10, 10, '2026-02-17', 'Add to Cart'),
(10, 10, '2026-02-18', 'Purchase'),

(11, 11, '2026-02-20', 'Product View'),
(11, 11, '2026-02-21', 'Add to Cart'),
(11, 11, 'Purchase'),

(12, 12, '2026-02-27', 'Product View'),
(12, 12, '2026-02-28', 'Add to Cart'),
(12, 12, 'Purchase'),

(13, 13, '2026-03-03', 'Product View'),
(13, 13, 'Add to Cart'),
(13, 13, 'Purchase'),

(14, 14, '2026-03-08', 'Product View'),
(14, 14, 'Add to Cart'),
(14, 14, 'Purchase'),

(15, 15, '2026-03-13', 'Product View'),
(15, 15, 'Add to Cart'),
(15, 15, 'Purchase');

SELECT * FROM events;


-- Total Customers
SELECT COUNT(*) AS total_customers
FROM customers;

-- Total Products
SELECT COUNT(*) AS total_products
FROM products;

-- Total Orders
SELECT COUNT(*) AS total_orders
FROM orders;

-- Total Order Items
SELECT COUNT(*) AS total_order_items
FROM order_items;

-- Total Quantity Sold 
SELECT SUM(quantity) AS total_quantity_sold
FROM order_items;

-- Total sales
SELECT 
    SUM(total_sales) AS total_sales
FROM order_items;

-- Total Profit
SELECT 
    SUM(profit) AS total_profit
FROM order_items;

-- Total Shipping Cost
SELECT 
    SUM(shipping_cost) AS total_shipping_cost
FROM order_items;


-- Sales Analysis - Sales by Product
SELECT
    p.product_id,
    p.product_name,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.total_sales) AS total_sales
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY
    p.product_id,
    p.product_name
ORDER BY total_sales DESC;
 
 -- Top Customers
 
 SELECT
    p.product_name,
    SUM(oi.quantity) AS quantity_sold,
    SUM(oi.total_sales) AS total_sales
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_sales DESC
LIMIT 5;

-- Sales By Category

SELECT
    p.product_category,
    SUM(oi.quantity) AS quantity_sold,
    SUM(oi.total_sales) AS total_sales
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_category
ORDER BY total_sales DESC;

-- CUSTOMER ANALYSIS - Customer Spending

SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.total_sales) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_spent DESC;

-- Top 5 customers in custome analysis

SELECT
    c.customer_name,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.total_sales) AS total_spent
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_name
ORDER BY total_spent DESC
LIMIT 5;


-- Sales By Customer Segment

SELECT
    c.customer_segment,
    COUNT(DISTINCT c.customer_id) AS customers,
    COUNT(DISTINCT o.order_id) AS orders,
    SUM(oi.total_sales) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_segment
ORDER BY total_sales DESC;

-- REGIONAL ANALYSIS

--  Sales by country 
SELECT
    c.country,
    SUM(oi.total_sales) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.country
ORDER BY total_sales DESC;


-- Sales By region
SELECT
    c.region,
    SUM(oi.total_sales) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.region
ORDER BY total_sales DESC;


-- PAYMENT ANALYSIS
-- Sales by Payment Method

SELECT
    payment_method,
    COUNT(*) AS transactions,
    SUM(payment_amount) AS total_amount
FROM payments
GROUP BY payment_method
ORDER BY total_amount DESC;

-- PAYMENT STATUS
SELECT
    payment_status,
    COUNT(*) AS total_transactions,
    SUM(payment_amount) AS total_amount
FROM payments
GROUP BY payment_status;

-- MONTHLY SALES

SELECT
    DATE_FORMAT(o.order_date, '%Y-%m') AS month,
    SUM(oi.total_sales) AS total_sales,
    SUM(oi.profit) AS total_profit
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY DATE_FORMAT(o.order_date, '%Y-%m')
ORDER BY month;



-- PROFIT ANALYSIS
-- PROFIT BY PRODUCT
SELECT
    p.product_name,
    SUM(oi.total_sales) AS total_sales,
    SUM(oi.profit) AS total_profit
FROM products p
JOIN order_items oi
    ON p.product_id = oi.product_id
GROUP BY p.product_name
ORDER BY total_profit DESC;


-- PROFIT MARGIN

SELECT
    SUM(total_sales) AS total_sales,
    SUM(profit) AS total_profit,
    ROUND(
        SUM(profit) / SUM(total_sales) * 100,
        2
    ) AS profit_margin_percent
FROM order_items;

-- EVENTS ANALYSIS
-- Event by date

SELECT
    event_date,
    event_type,
    COUNT(*) AS total_events
FROM events
GROUP BY event_date, event_type
ORDER BY event_date;

-- Evrnt by product

SELECT
    p.product_name,
    e.event_type,
    COUNT(*) AS total_events
FROM events e
JOIN products p
    ON e.product_id = p.product_id
GROUP BY p.product_name, e.event_type
ORDER BY total_events DESC;


-- Most product-viewed Products from Events
SELECT
    p.product_name,
    COUNT(*) AS total_views
FROM events e
JOIN products p
    ON e.product_id = p.product_id
WHERE e.event_type = 'Product View'
GROUP BY p.product_name
ORDER BY total_views DESC;
  
  
  -- Most Product-viewed Products from Events
SELECT
    p.product_name,
    COUNT(*) AS total_add_to_cart
FROM events e
JOIN products p
    ON e.product_id = p.product_id
WHERE e.event_type = 'Add to Cart'
GROUP BY p.product_name
ORDER BY total_add_to_cart DESC;

-- Most Purchased Products from Events
SELECT
    p.product_name,
    COUNT(*) AS total_purchases
FROM events e
JOIN products p
    ON e.product_id = p.product_id
WHERE e.event_type = 'Purchase'
GROUP BY p.product_name
ORDER BY total_purchases DESC;

-- Event Activity by Customer Segment

SELECT
    c.customer_segment,
    e.event_type,
    COUNT(*) AS total_events
FROM events e
JOIN customers c
    ON e.customer_id = c.customer_id
GROUP BY c.customer_segment, e.event_type
ORDER BY total_events DESC;

-- AFter DELETE events works in perfect
TRUNCATE TABLE events;
INSERT INTO events
(customer_id, product_id, event_date, event_type)
VALUES

-- Customer 1
(1, 1, '2026-01-03', 'Product View'),
(1, 1, '2026-01-04', 'Add to Cart'),
(1, 1, '2026-01-05', 'Purchase'),

-- Customer 2
(2, 2, '2026-01-06', 'Product View'),
(2, 2, '2026-01-07', 'Add to Cart'),
(2, 2, '2026-01-08', 'Purchase'),

-- Customer 3
(3, 3, '2026-01-10', 'Product View'),
(3, 3, '2026-01-11', 'Add to Cart'),
(3, 3, '2026-01-12', 'Purchase'),

-- Customer 4
(4, 4, '2026-01-13', 'Product View'),
(4, 4, '2026-01-14', 'Add to Cart'),
(4, 4, '2026-01-15', 'Purchase'),

-- Customer 5
(5, 5, '2026-01-18', 'Product View'),
(5, 5, '2026-01-19', 'Add to Cart'),
(5, 5, '2026-01-20', 'Purchase'),

-- Customer 6
(6, 6, '2026-01-23', 'Product View'),
(6, 6, '2026-01-24', 'Add to Cart'),
(6, 6, '2026-01-25', 'Purchase'),

-- Customer 7
(7, 7, '2026-01-30', 'Product View'),
(7, 7, '2026-02-01', 'Add to Cart'),
(7, 7, '2026-02-02', 'Purchase'),

-- Customer 8
(8, 8, '2026-02-05', 'Product View'),
(8, 8, '2026-02-06', 'Add to Cart'),
(8, 8, '2026-02-07', 'Purchase'),

-- Customer 9
(9, 9, '2026-02-10', 'Product View'),
(9, 9, '2026-02-11', 'Add to Cart'),
(9, 9, '2026-02-12', 'Purchase'),

-- Customer 10
(10, 10, '2026-02-16', 'Product View'),
(10, 10, '2026-02-17', 'Add to Cart'),
(10, 10, '2026-02-18', 'Purchase'),

-- Customer 11
(11, 11, '2026-02-20', 'Product View'),
(11, 11, '2026-02-21', 'Add to Cart'),
(11, 11, '2026-02-22', 'Purchase'),

-- Customer 12
(12, 12, '2026-02-27', 'Product View'),
(12, 12, '2026-02-28', 'Add to Cart'),
(12, 12, '2026-03-01', 'Purchase'),

-- Customer 13
(13, 13, '2026-03-03', 'Product View'),
(13, 13, '2026-03-04', 'Add to Cart'),
(13, 13, '2026-03-05', 'Purchase'),

-- Customer 14
(14, 14, '2026-03-08', 'Product View'),
(14, 14, '2026-03-09', 'Add to Cart'),
(14, 14, '2026-03-10', 'Purchase'),

-- Customer 15
(15, 15, '2026-03-13', 'Product View'),
(15, 15, '2026-03-14', 'Add to Cart'),
(15, 15, '2026-03-15', 'Purchase'),

-- Customer 16
(16, 16, '2026-03-18', 'Product View'),
(16, 16, '2026-03-19', 'Add to Cart'),
(16, 16, '2026-03-20', 'Purchase'),

-- Customer 17
(17, 17, '2026-03-23', 'Product View'),
(17, 17, '2026-03-24', 'Add to Cart'),
(17, 17, '2026-03-25', 'Purchase'),

-- Customer 18
(18, 18, '2026-03-29', 'Product View'),
(18, 18, '2026-03-30', 'Add to Cart'),
(18, 18, '2026-04-01', 'Purchase'),

-- Customer 19
(19, 19, '2026-04-02', 'Product View'),
(19, 19, '2026-04-03', 'Add to Cart'),
(19, 19, '2026-04-05', 'Purchase'),

-- Customer 20
(20, 20, '2026-04-07', 'Product View'),
(20, 20, '2026-04-08', 'Add to Cart'),
(20, 20, '2026-04-10', 'Purchase');

SELECT * FROM events;

SELECT
    event_type,
    COUNT(*) AS total_events
FROM events
GROUP BY event_type
ORDER BY total_events DESC;

SELECT COUNT(*) AS total_events
FROM events;


SELECT
    COUNT(DISTINCT CASE
        WHEN event_type = 'Product View'
        THEN customer_id
    END) AS viewed_products,

    COUNT(DISTINCT CASE
        WHEN event_type = 'Add to Cart'
        THEN customer_id
    END) AS added_to_cart,

    COUNT(DISTINCT CASE
        WHEN event_type = 'Purchase'
        THEN customer_id
    END) AS purchased
FROM events;

-- percentage rate in events of (product view, add-to-cart,  purchase)

SELECT
    COUNT(DISTINCT CASE
        WHEN event_type = 'Product View'
        THEN customer_id
    END) AS viewed_products,

    COUNT(DISTINCT CASE
        WHEN event_type = 'Add to Cart'
        THEN customer_id
    END) AS added_to_cart,

    COUNT(DISTINCT CASE
        WHEN event_type = 'Purchase'
        THEN customer_id
    END) AS purchased,

    ROUND(
        COUNT(DISTINCT CASE
            WHEN event_type = 'Add to Cart'
            THEN customer_id
        END)
        /
        COUNT(DISTINCT CASE
            WHEN event_type = 'Product View'
            THEN customer_id
        END) * 100, 2
    ) AS view_to_cart_percent,

    ROUND(
        COUNT(DISTINCT CASE
            WHEN event_type = 'Purchase'
            THEN customer_id
        END)
        /
        COUNT(DISTINCT CASE
            WHEN event_type = 'Add to Cart'
            THEN customer_id
        END) * 100, 2
    ) AS cart_to_purchase_percent,

    ROUND(
        COUNT(DISTINCT CASE
            WHEN event_type = 'Purchase'
            THEN customer_id
        END)
        /
        COUNT(DISTINCT CASE
            WHEN event_type = 'Product View'
            THEN customer_id
        END) * 100, 2
    ) AS overall_conversion_percent

FROM events;


-- FINAL TOTAL RECORDS

SELECT 'Customers' AS table_name, COUNT(*) AS total_records
FROM customers

UNION ALL

SELECT 'Products', COUNT(*)
FROM products

UNION ALL

SELECT 'Orders', COUNT(*)
FROM orders

UNION ALL

SELECT 'Order Items', COUNT(*)
FROM order_items

UNION ALL

SELECT 'Payments', COUNT(*)
FROM payments

UNION ALL

SELECT 'Events', COUNT(*)
FROM events;



-- E-COMMERCE SALES & CUSTOMER ANALYTICS

-- BUSINESS QUESTIONS


-- CUSTOMERS TABLE

-- Q1. How many total customers are registered in the e-commerce business?

-- Q2. How many customers belong to each customer segment?

-- Q3. Which customer segment generates the highest sales?

-- Q4. Which customers have the highest total spending?

-- Q5. Which countries have the highest number of customers?


-- PRODUCTS TABLE

-- Q1. How many products are available in the product catalog?

-- Q2. Which products generate the highest total sales?

-- Q3. Which product category generates the highest revenue?

-- Q4. Which products have the highest quantity sold?

-- Q5. Which products generate the highest profit?



-- ORDERS TABLE

-- Q1. How many total orders have been placed?

-- Q2. What is the monthly order trend?

-- Q3. Which customers have placed the highest number of orders?

-- Q4. Which payment methods are most commonly used for orders?

-- Q5. Which customer segments generate the highest number of orders?



-- ORDER_ITEMS TABLE

-- Q1. What is the total quantity of products sold?

-- Q2. What is the total sales revenue generated from order items?

-- Q3. Which products have the highest sales quantity?

-- Q4. What is the total profit generated from order items?

-- Q5. What is the overall profit margin of the business?




-- PAYMENTS TABLE 

-- Q1. How many payment transactions have been completed?

-- Q2. Which payment method generates the highest transaction value?

-- Q3. Which payment method is used for the highest number of transactions?

-- Q4. What is the total payment amount received?

-- Q5. What is the distribution of payment status?


--  EVENTS TABLE – 5

-- Q1. How many customers viewed products?

-- Q2. How many customers added products to their cart?

-- Q3. How many customers completed a purchase?

-- Q4. What is the View-to-Cart conversion rate?

-- Q5. What is the overall customer conversion rate from Product View to Purchase?
