USE OpticianDB;

-- 1. Lists a customer's total invoices in a given period.
SELECT c.name AS customer_name, COUNT(s.sale_id) AS total_invoices
FROM Customers c
JOIN Sales s ON c.customer_id = s.customer_id
WHERE s.sale_date BETWEEN '2024-01-01' AND CURDATE()
GROUP BY c.name;

-- 2.List the different models of glasses that an employee has sold during a year.
SELECT DISTINCT g.brand AS glasses_model
FROM Glasses g
JOIN Sales s ON g.glasses_id = s.glasses_id
JOIN Employees e ON s.employee_id = e.employee_id
WHERE YEAR(s.sale_date) = '2024'
AND e.name = 'John Doe'; 

-- 3.List the different suppliers who have supplied glasses sold successfully by the optician.
SELECT DISTINCT sup.name AS supplier_name
FROM Suppliers sup
JOIN Glasses g ON sup.supplier_id = g.supplier_id
JOIN Sales s ON g.glasses_id = s.glasses_id;
