CREATE DATABASE IF NOT EXISTS OpticianDB;
USE OpticianDB;

CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    street VARCHAR(255) NOT NULL,
    number VARCHAR(10) NOT NULL,
    floor VARCHAR(10),
    door VARCHAR(10),
    city VARCHAR(100) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(100) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    fax VARCHAR(20),
    nif VARCHAR(20) NOT NULL
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

CREATE TABLE Customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    postal_adress VARCHAR(20) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(255) NOT NULL,
    registration_date DATE NOT NULL,
    recommended_by INT,
    employee_id INT NOT NULL,
    FOREIGN KEY (recommended_by) REFERENCES Customers(customer_id)
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

INSERT INTO Suppliers (name, street, number, floor, door, city, postal_code, country, phone, fax, nif) VALUES
('Optic Suppliers Inc.', 'Carrer Marina', '123', '1', 'A', 'Barcelona', '10001', 'Spain', '111-111-1111', '111-111-1112', 'NIF123A'),
('LensMasters', 'Carrer Sardenya', '456', '2', 'B', 'Barcelona', '94105', 'Spain', '222-222-2222', '222-222-2223', 'NIF456B');

INSERT INTO Glasses (brand, grading_glass, mount_type, mount_color, glass_color, price, supplier_id) VALUES
('Ray-Ban', '1.0', 'floating', 'black', 'clear', 199.99, 1),
('Oakley', '2.0', 'paste', 'white', 'blue', 179.99, 1),
('Gucci', '1.5', 'metallic', 'gray', 'green', 249.99, 2);

INSERT INTO Customers (name, postal_adress, phone, email, registration_date, recommended_by, employee_id) VALUES
('John Doe', '02110', '333-333-3333', 'john.doe@example.com', '2023-01-15', NULL, 2),
('Jane Smith', '60605', '444-444-4444', 'jane.smith@example.com', '2023-02-20', 1, 1);

INSERT INTO Employees (name, phone, email) VALUES
('Alice Johnson', '555-555-5555', 'alice.johnson@example.com'),
('Bob Brown', '666-666-6666', 'bob.brown@example.com');

INSERT INTO Sales (customer_id, glasses_id, employee_id, sale_date) VALUES
(1, 1, 1, '2023-03-01'),
(2, 2, 2, '2023-03-02');