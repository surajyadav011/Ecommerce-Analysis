CREATE DATABASE ecommerce;
show databases;

use ecommerce;
select * from orders;

select count(*) as Total_orders from orders;

-- Total Sales
select sum(Net_amount) as Total_Sales from orders;

-- Top products
select 
product,sum(net_amount) as sales
from orders
group by product
order by sales desc;

-- Top cities
select city,sum(net_amount) as sales
from orders group by city
order by sales desc;

-- Monthly Sales
select month,sum(net_amount) as Sales
from orders
group by month;

-- Highest Profit Products
select product,
round(sum(profit),1) as profit
from orders
group by product
order by profit desc;

-- payment mode distribution
select payment_mode,count(*) as Total_orders
from orders
group by payment_mode;

-- Cancelled orders
SELECT *
FROM orders
WHERE Order_Status = 'Cancelled';
