USE Pizzeria;

SELECT COUNT(od.quantity) AS total_beverages_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
JOIN pizza_category pc ON p.product_id = pc.pizza_id
JOIN category c ON pc.category_id = c.category_id
JOIN orders o ON od.order_id = o.order_id
JOIN customer cust ON o.customer_id = cust.customer_id
JOIN locality l ON cust.location_id = l.location_id
WHERE c.name = 'Beverages'
AND l.location_name = 'Locality 1';

SELECT COUNT(o.order_id) AS total_orders_placed
FROM orders o
JOIN delivery d ON o.order_id = d.order_id
JOIN employee emp ON d.employee_id = emp.employee_id
WHERE emp.employee_id = 2;
