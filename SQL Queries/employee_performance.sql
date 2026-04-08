-- 1. How many employees have processed orders?
select COUNT(DISTINCT emp_id) AS employees_processed_orders
from orders;

-- 2. Which employees have handled the most orders?
select e.emp_id, e.emp_name, COUNT(o.ord_id) AS orders_handled
from orders o
JOIN employees e ON o.emp_id = e.emp_id
group by e.emp_id, e.emp_name
order by orders_handled DESC;

-- 3. What is the total sales value processed by each employee?
select e.emp_id, e.emp_name, SUM(ord.total_price) AS total_sales_value
FROM employees e
JOIN orders o ON e.emp_id = o.emp_id
JOIN order_details ord ON o.ord_id = ord.ord_id
group by e.emp_id, e.emp_name
order by total_sales_value DESC;

-- 4. What is the average order value handled per employee?
SELECT 
    e.emp_id, 
    e.emp_name, 
    COUNT(o.ord_id) AS orders_handled,
    ROUND(SUM(ord.total_price) / COUNT(o.ord_id), 2) AS avg_order_value
from employees e
JOIN orders o ON e.emp_id = o.emp_id
JOIN order_details ord ON o.ord_id = ord.ord_id
group by e.emp_id, e.emp_name
order by avg_order_value DESC;