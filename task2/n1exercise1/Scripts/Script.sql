USE Manufacturers;

CREATE TABLE IF NOT EXISTS manufacturer (
    code INT PRIMARY KEY,
    number INT NOT NULL
);

CREATE TABLE IF NOT EXISTS product (
    code INT PRIMARY KEY,
    number INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    codigo_manufacturer INT,
    FOREIGN KEY (codigo_manufacturer) REFERENCES manufacturer(code)
);
