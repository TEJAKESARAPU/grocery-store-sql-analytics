-- 1. What is the relationship between quantity ordered and total price?
select quantity, total_price
from order_details;

-- 2. What is the average quantity ordered per product?
select p.prod_id, p.prod_name, ROUND(AVG(ord.quantity), 2) AS avg_quantity_ordered
from order_details ord
JOIN products p ON p.prod_id = ord.prod_id
group by p.prod_id, p.prod_name
order by avg_quantity_ordered DESC;

-- 3. How does the unit price vary across products and orders?
select 
    p.prod_id, 
    p.prod_name, 
    ord.ord_id,
    ROUND(ord.total_price / ord.quantity, 2) AS unit_price,
    ord.quantity,
    ord.total_price
from order_details ord
JOIN products p ON p.prod_id = ord.prod_id
order by p.prod_id, unit_price DESC;
