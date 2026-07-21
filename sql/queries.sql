-- Retail Store SQLite Database
-- SQL Queries
--
-- This file contains example SQL queries used to retrieve
-- and summarise information after creating the retail database.
-- It was done to confirm that the database is functioning correctly
-- and the tables are related as expected.



-- 1. Customer Transaction Summary
-- Returns customer age, transaction amount and satisfaction
-- level by joining the Customers and Transactions tables.
SELECT
    age,
    total_amount_GBP,
    customer_id,
    satisfaction_level
FROM Customers
JOIN Transactions
USING (customer_id);


-- 2. Total Number of Customers
-- Counts the total number of customer records.
SELECT
    COUNT(*) AS total_customers
FROM Customers;


-- 3. Customer Distribution by Loyalty Tier
-- Returns the number of customers in each loyalty tier.
SELECT
    loyalty_tier,
    COUNT(*) AS num_customers
FROM Customers
GROUP BY loyalty_tier;


-- 4. Total Number of Products
-- Counts the total number of products in the database.
SELECT
    COUNT(*) AS total_products
FROM Products;


-- 5. Product Distribution by Category
-- Returns the number of products in each category.
SELECT
    category,
    COUNT(*) AS num_products
FROM Products
GROUP BY category;


-- 6. Products with Low Stock
-- Returns products with a stock quantity below 27 units.
SELECT
    product_id,
    product_name,
    stock_quantity
FROM Products
WHERE stock_quantity < 27;


-- 7. Total Number of Transactions
-- Counts the total number of recorded transactions.
SELECT
    COUNT(*) AS total_transactions
FROM Transactions;


-- 8. Transactions by Payment Method
-- Returns the number of transactions completed using each
-- payment method.
SELECT
    payment_method,
    COUNT(*) AS num_transactions
FROM Transactions
GROUP BY payment_method;




-- Further queries can be added below to explore additional 
-- information from the retail store database.