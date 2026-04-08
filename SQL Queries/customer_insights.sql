-- 1. How many unique customers have placed orders?
select count(distinct(cust_id)) as unique_customers_who_placed_orders
from grocery_store_management.orders;
    
-- 2. Which customers have placed the highest number of orders?
select cust_id, count(ord_id) as no_of_orders
from orders
group by cust_id
order by no_of_orders DESC;

-- 3. What is the total and average purchase value per customer?
select o.cust_id, cust_name, sum(total_price) as total_purchase_value, 
	avg(total_price) as average_purchase_value
from order_details od
LEFT JOIN orders o ON o.ord_id = od.ord_id
LEFT JOIN customers c ON c.cust_id = o.cust_id
group by o.cust_id, c.cust_name
order by total_purchase_value desc;

-- 4. Who are the top 5 customers by total purchase amount?
select o.cust_id, cust_name, sum(total_price) as total_purchase_amount
from order_details od
LEFT JOIN orders o ON o.ord_id = od.ord_id
LEFT JOIN customers c ON c.cust_id = o.cust_id
group by o.cust_id, c.cust_name
order by total_purchase_amount desc limit 5;

