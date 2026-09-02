# E-Commerce-Sales-Customer-Analytics
E-Commerce Sales &amp; Customer Analytics is a MySQL-based SQL project analyzing sales, customers, products, orders, payments, profitability, and customer behavior. It uses relational database design, JOINs, aggregations, CASE statements, subqueries, and funnel analysis to generate actionable insights and support Power BI dashboard development. wisely.



## 📌 Project Overview

**E-Commerce Sales & Customer Analytics** is a MySQL-based SQL project designed to analyze e-commerce sales, customers, products, orders, payments, profitability, and customer behavior.

The project uses a relational database structure and SQL queries to convert transactional data into meaningful business insights.

## 🎯 Objectives

* Analyze overall e-commerce sales performance.
* Identify top-performing products and customers.
* Analyze sales and profit by product category.
* Understand customer segments and regional performance.
* Analyze payment methods and payment status.
* Track customer behavior through events.
* Analyze the customer purchase funnel.
* Generate business-ready SQL queries for reporting.

## 🗄️ Database Structure

The project contains **6 main tables**:

| Table         | Description                                           |
| ------------- | ----------------------------------------------------- |
| `customers`   | Customer information, segment, country and region     |
| `products`    | Product name, category and unit price                 |
| `orders`      | Order date, customer and payment method               |
| `order_items` | Quantity, price, discount, sales, shipping and profit |
| `payments`    | Payment method, status and payment amount             |
| `events`      | Product View, Add to Cart and Purchase activities     |

### 🔗 Relationships

```text
Customers
    │
    ▼
Orders ───────────► Payments
    │
    ▼
Order Items
    │
    ▼
Products

Customers
    │
    ▼
Events
```

## 📊 Dataset

The sample database contains:

* 20 Customers
* 20 Products
* 20 Orders
* 40 Order Items
* 20 Payment Records
* 60 Event Records

## 🔍 Business Questions

The project answers important business questions such as:

1. What are the total sales and total profit?
2. Who are the top 5 customers by revenue?
3. Which products generate the highest sales?
4. Which product category performs best?
5. Which region generates the highest revenue?
6. Which customer segment contributes the most revenue?
7. What is the monthly sales and profit trend?
8. Which products have the highest profit margin?
9. Which payment method is used most frequently?
10. How many customers move from Product View to Add to Cart to Purchase?

## 🧮 SQL Concepts Used

```text
CREATE DATABASE
CREATE TABLE
PRIMARY KEY
FOREIGN KEY
INSERT
SELECT
WHERE
JOIN
GROUP BY
ORDER BY
COUNT
COUNT(DISTINCT)
SUM
CASE
ROUND
DATE_FORMAT
LIMIT
Subqueries
UNION ALL
```

## 📈 Key Analysis

### Sales Analysis

* Total revenue
* Total quantity sold
* Monthly sales
* Sales by category
* Sales by region

### Customer Analysis

* Customer segments
* Top customers
* Customer revenue
* Unique customers

### Product Analysis

* Top-selling products
* Product profitability
* Profit margin
* Category performance

### Payment Analysis

* Payment methods
* Completed payments
* Payment amount
* Transaction analysis

### Customer Funnel

```text
Product View
      ↓
Add to Cart
      ↓
Purchase
```

## 🛠️ Tools & Technologies

* MySQL
* MySQL Workbench
* SQL
* Relational Database
* Data Analytics

## 🚀 Future Enhancement

The MySQL database can be connected to **Microsoft Power BI** to create an interactive 3-page dashboard:

* **Page 1:** Executive Sales Overview
* **Page 2:** Product & Sales Analysis
* **Page 3:** Customer & Funnel Analysis

## 👩‍💻 Author

**Bharathi**

### Project Title

**E-Commerce Sales & Customer Analytics using SQL**
