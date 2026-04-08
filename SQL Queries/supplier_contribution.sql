-- 1. How many suppliers are there in the database?
select count(sup_id) as no_of_suppliers
from supplier;

-- 2. Which supplier provides the most products?
select s.sup_id, s.sup_name, count(prod_id) as no_of_products
from products p
JOIN supplier s ON s.sup_id = p.sup_id
group by s.sup_id, s.sup_name
order by no_of_products desc;

-- 3. What is the average price of products from each supplier?
select s.sup_id, s.sup_name, AVG(p.price) AS avg_product_price
from products p
JOIN supplier s ON s.sup_id = p.sup_id
group by s.sup_id, s.sup_name
order by avg_product_price DESC;

-- 4. Which suppliers contribute the most to total product sales (by revenue)?
select s.sup_id, s.sup_name, SUM(ord.total_price) AS total_sales_revenue
from supplier s
JOIN products p ON s.sup_id = p.sup_id
JOIN order_details ord ON p.prod_id = ord.prod_id
JOIN orders o ON o.ord_id = ord.ord_id
group by s.sup_id, s.sup_name
order by total_sales_revenue DESC;