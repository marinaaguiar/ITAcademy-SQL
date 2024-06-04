CREATE DATABASE IF NOT EXISTS Pizzeria;
USE Pizzeria;

CREATE TABLE province (
    province_id INT PRIMARY KEY,
    province_name VARCHAR(100) NOT NULL
)

CREATE TABLE locality (
    location_id INT PRIMARY KEY,
    location_name VARCHAR(100) NOT NULL,
    province_id INT,
    FOREIGN KEY (province_id) REFERENCES province(province_id)
)

CREATE TABLE customer (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
	first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    address VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20),
    location_id INT,
    province_id INT,
    phone_number VARCHAR(20),
    FOREIGN KEY (location_id) REFERENCES locality(location_id),
    FOREIGN KEY (province_id) REFERENCES province(province_id)
)

CREATE TABLE products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    image VARCHAR(255),
    price DECIMAL(10,2) NOT NULL,
    product_type ENUM('pizza', 'hamburger', 'drink') NOT NULL
);

CREATE TABLE orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    date_time DATETIME NOT NULL,
    delivery_type ENUM('home', 'pickup') NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    store_id INT NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
)

CREATE TABLE order_details (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


CREATE TABLE stores (
    store_id INT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    location_id INT NOT NULL,
    FOREIGN KEY (location_id) REFERENCES locality(location_id)
);

CREATE TABLE category (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE pizza_category (
    pizza_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (pizza_id, category_id),
    FOREIGN KEY (pizza_id) REFERENCES products(product_id),
    FOREIGN KEY (category_id) REFERENCES category(category_id)
);

CREATE TABLE employee (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    surname VARCHAR(255) NOT NULL,
    NIF VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    role ENUM('cook', 'delivery_person') NOT NULL,
    store_id INT NOT NULL,
    FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

CREATE TABLE delivery (
    delivery_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    employee_id INT NOT NULL,
    delivery_time DATETIME NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (employee_id) REFERENCES employee(employee_id)
);






