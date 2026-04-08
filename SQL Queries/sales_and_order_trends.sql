-- 1. How many orders have been placed in total?
select count(ord_id) as total_orders_placed
from orders;

-- 2. What is the average value per order?
select o.ord_id, avg(p.price) as average_value_per_order
from orders o
JOIN order_details ord ON ord.ord_id = o.ord_id
JOIN products p ON p.prod_id = ord.prod_id
group by ord_id;

-- 3. On which dates were the most orders placed?
select order_date, ord_id
from orders
order by ord_id desc;

-- 4. What are the monthly trends in order volume and revenue?
select p.prod_id, 
	p.prod_name, 
    month(str_to_date(o.order_date, '%m/%d/%Y')) as order_month,
    sum(quantity) as order_volume, 
    sum(total_price) as order_revenue
from order_details ord
JOIN orders o ON o.ord_id = ord.ord_id
JOIN products p ON p.prod_id = ord.prod_id
group by p.prod_id, p.prod_name, month(str_to_date(o.order_date, '%m/%d/%Y'))
order by order_month asc, order_revenue desc;

-- 5. How do order patterns vary across weekdays and weekends?
select p.prod_id, 
	p.prod_name,
    CASE 
		WHEN weekday(str_to_date(o.order_date, '%m/%d/%Y')) between 1 and 5 then "Weekday"
        ELSE "Weekend"
	END AS day_type,
    sum(quantity) as order_volume, 
    sum(total_price) as order_revenue
from order_details ord
JOIN orders o ON o.ord_id = ord.ord_id
JOIN products p ON p.prod_id = ord.prod_id
group by p.prod_id, p.prod_name, day_type
order by day_type asc, order_revenue desc;