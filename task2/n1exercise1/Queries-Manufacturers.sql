-- 1. List the name of all the products in the product table.
SELECT name
FROM product;

-- 2. List the names and prices of all the products in the product table.
SELECT name, price
FROM product;

-- 3. List all columns of the product table.
SELECT *
FROM product;

-- 4.List the name of the products, the price in euros and the price in US dollars (USD).

SELECT 
    name,
    price AS price_in_euros,
    price * 1.10 AS price_in_usd
FROM product;

-- 5.List the name of the products, the price in euros and the price in US dollars (USD). 
-- Use the following aliases for the columns: product name, euros, dollars.

SELECT 
    name,
    price AS euros,
    ROUND(price * 1.10, 2) AS dollars
FROM product;

-- 6. List the names and prices of all products in the product table, converting the names to uppercase.

SELECT 
    UPPER(name),
    price
FROM product;

-- 7. List the names and prices of all products in the product table, converting the names to lowercase.
SELECT 
    LOWER(name),
    price
FROM product;

-- 8. List the name of all manufacturers in one column, and in another column capitalize the first two characters of the manufacturer's name.
SELECT 
    name,
    CONCAT(UPPER(LEFT(name, 1)), UPPER(SUBSTRING(name, 2))) AS capitalized_name
FROM manufacturer;

-- 9. List the names and prices of all products in the product table, rounding the price value.
SELECT 
    name,
    ROUND(price) AS rounded_price
FROM product;

-- 10. Lists the names and prices of all products in the product table, truncating the price value to display it without any decimal places.
SELECT 
    name,
    TRUNCATE(price, 0) AS truncated_price
FROM product;

-- 13. List manufacturer names in ascending order.
SELECT name
FROM manufacturer
ORDER BY name ASC;

-- 14. List manufacturer names in descending order.
SELECT name
FROM manufacturer
ORDER BY name DESC;

-- 15. Lists product names sorted first by name in ascending order and second by price in descending order.
SELECT name, price
FROM product
ORDER BY name ASC, price DESC;

-- 16. Returns a list with the first 5 rows of the manufacturer table.
SELECT *
FROM manufacturer
LIMIT 5;

-- 17. Returns a list with 2 rows starting from the fourth row of the manufacturer table. The fourth row must also be included in the answer.
SELECT *
FROM manufacturer
LIMIT 2 OFFSET 3;

-- 18. List the cheapest product name and price. (Use only the ORDER BY and LIMIT clauses). NOTE: I could not use MIN(price) here, I would need GROUP BY.
SELECT name, price
FROM product
ORDER BY price ASC
LIMIT 1;

-- 19. List the name and price of the most expensive product. (Use only the ORDER BY and LIMIT clauses). NOTE : I could not use MAX(price) here, I would need GROUP BY.
SELECT name, price
FROM product
ORDER BY price DESC 
LIMIT 1;

-- 20. List the name of all products from the manufacturer whose manufacturer code is equal to 2.
SELECT p.name
FROM product p
JOIN manufacturer m ON p.code_manufacturer = m.code
WHERE m.code = 2;
