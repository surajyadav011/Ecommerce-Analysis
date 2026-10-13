-- E-Commerce Sales Performance Analysis
-- Database: MySQL
-- Expected table: orders, loaded by the Python notebook.

CREATE DATABASE IF NOT EXISTS ecommerce;
USE ecommerce;

-- Inspect sample rows and count table records
SELECT * FROM orders LIMIT 20;
SELECT COUNT(*) AS total_records FROM orders;

-- Total net sales
SELECT ROUND(SUM(Net_Amount), 2) AS total_net_sales
FROM orders;

-- Product sales ranking
SELECT Product, ROUND(SUM(Net_Amount), 2) AS net_sales
FROM orders
GROUP BY Product
ORDER BY net_sales DESC;

-- City sales ranking
SELECT City, ROUND(SUM(Net_Amount), 2) AS net_sales
FROM orders
GROUP BY City
ORDER BY net_sales DESC;

-- Monthly sales, separated by year
SELECT Year, Month, ROUND(SUM(Net_Amount), 2) AS net_sales
FROM orders
GROUP BY Year, Month
ORDER BY Year, MIN(Order_Date);

-- Estimated profit ranking
-- Important: the notebook currently models profit as 20% of Net_Amount.
SELECT Product, ROUND(SUM(Profit), 2) AS estimated_profit
FROM orders
GROUP BY Product
ORDER BY estimated_profit DESC;

-- Payment mode distribution
SELECT Payment_Mode, COUNT(*) AS total_records
FROM orders
GROUP BY Payment_Mode
ORDER BY total_records DESC;

-- Cancelled orders
SELECT *
FROM orders
WHERE Order_Status = 'Cancelled';