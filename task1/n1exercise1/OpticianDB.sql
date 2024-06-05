CREATE DATABASE IF NOT EXISTS OpticianDB;
USE OpticianDB;

CREATE TABLE Addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(10) NOT NULL,
    floor VARCHAR(10),
    door VARCHAR(10),
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    entity_id INT,
    entity_table ENUM('Supplier', 'Customer')
);

CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    fax VARCHAR(20),
    nif VARCHAR(20) NOT NULL,
    address_id INT NOT NULL,
    FOREIGN KEY (address_id) REFERENCES Addresses(address_id)
);

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL,
    recommended_by INT,
    employee_id INT NOT NULL,
    address_id INT NOT NULL,
    FOREIGN KEY (recommended_by) REFERENCES Customers(customer_id),
    FOREIGN KEY (address_id) REFERENCES Addresses(address_id)
);

CREATE TABLE Glasses (
    glasses_id INT AUTO_INCREMENT PRIMARY KEY,
    brand VARCHAR(100) NOT NULL,
    grading_glass FLOAT NOT NULL,
    mount_type ENUM('floating', 'paste', 'metallic') NOT NULL,
    mount_color VARCHAR(50) NOT NULL,
    glass_color VARCHAR(50) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    supplier_id INT NOT NULL,
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

CREATE TABLE Employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    phone VARCHAR(20),
    email VARCHAR(255)
);

CREATE TABLE Sales (
    sale_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    glasses_id INT,
    employee_id INT,
    sale_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (glasses_id) REFERENCES Glasses(glasses_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)
);


INSERT INTO Addresses (street, number, city, postal_code, country, entity_id, entity_table) 
VALUES 
('Carrer Marina', '123', 'Barcelona', '08001', 'Spain', 1, 'Supplier'),
('Carrer Sardenya', '456', 'Barcelona', '08002', 'Spain', 2, 'Supplier'),
('Carrer Mallorca', '789', 'Barcelona', '08003', 'Spain', 1, 'Customer');

INSERT INTO Suppliers (name, postal_code, phone, fax, nif, address_id)
VALUES 
('Supplier A', '08001', '123456789', '', '12345678A', 1),
('Supplier B', '08002', '987654321', '', '87654321B', 2);

INSERT INTO Glasses (brand, grading_glass, mount_type, mount_color, glass_color, price, supplier_id)
VALUES 
('Brand X', 1.5, 'floating', 'Silver', 'Clear', 50.00, 1),
('Brand Y', 2.0, 'paste', 'Black', 'Tinted', 75.00, 2);

INSERT INTO Customers (name, postal_code, phone, email, registration_date, recommended_by, employee_id, address_id)
VALUES 
('Customer A', '08001', '123456789', 'customerA@example.com', NOW(), NULL, 1, 3),
('Customer B', '08002', '987654321', 'customerB@example.com', NOW(), NULL, 2, 3);

INSERT INTO Employees (name, phone, email)
VALUES 
('John Doe', '987654321', 'john.doe@example.com'),
('Jane Smith', '123456789', 'jane.smith@example.com');

INSERT INTO Sales (customer_id, glasses_id, employee_id, sale_date)
VALUES 
(1, 1, 1, CURDATE()),
(2, 2, 2, CURDATE());
