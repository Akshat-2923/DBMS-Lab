CREATE DATABASE IF NOT EXISTS ecommerce_db;
USE ecommerce_db;

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255) NOT NULL
);

CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(255) NOT NULL,
    email VARCHAR(255),
    phone VARCHAR(20)
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    product_type ENUM('Clothing', 'Electronics', 'Grocery') NOT NULL,
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

CREATE TABLE Seller_Product (
    seller_id INT,
    product_id INT,
    PRIMARY KEY (seller_id, product_id),
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    email VARCHAR(255)
);

CREATE TABLE Address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    address_line VARCHAR(255) NOT NULL,
    city VARCHAR(100) NOT NULL,
    state VARCHAR(100) NOT NULL,
    pincode VARCHAR(20) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_name VARCHAR(255),
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_Item (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    order_id INT,
    amount DECIMAL(10, 2) NOT NULL,
    method VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    address_id INT,
    delivery_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (address_id) REFERENCES Address(address_id)
);

INSERT INTO Category (category_id, category_name) VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Grocery');

INSERT INTO Seller (seller_id, seller_name, email, phone) VALUES
(101, 'Tech Haven', 'contact@techhaven.com', '1234567890'),
(102, 'Fashion Point', 'sales@fashionpoint.com', '0987654321'),
(103, 'Fresh Mart', 'info@freshmart.com', '1122334455');

INSERT INTO Product (product_id, product_name, price, category_id, product_type) VALUES
(201, 'Smartphone', 699.99, 1, 'Electronics'),
(202, 'T-Shirt', 19.99, 2, 'Clothing'),
(203, 'Organic Apples', 4.99, 3, 'Grocery');

INSERT INTO Seller_Product (seller_id, product_id) VALUES
(101, 201),
(102, 202),
(103, 203);

INSERT INTO Customer (customer_id, first_name, last_name, phone, email) VALUES
(301, 'John', 'Doe', '5551112222', 'john.doe@example.com'),
(302, 'Jane', 'Smith', '5553334444', 'jane.smith@example.com');

INSERT INTO Address (customer_id, address_line, city, state, pincode) VALUES
(301, '123 Elm Street', 'Springfield', 'IL', '62701'),
(302, '456 Oak Avenue', 'Metropolis', 'NY', '10001');

INSERT INTO Orders (order_id, order_name, customer_id) VALUES
(401, 'Order 401', 301),
(402, 'Order 402', 302);

INSERT INTO Order_Item (order_id, product_id, quantity) VALUES
(401, 201, 1),
(401, 203, 2),
(402, 202, 3);

INSERT INTO Payment (payment_id, order_id, amount, method) VALUES
(501, 401, 709.97, 'Credit Card'),
(502, 402, 59.97, 'PayPal');

INSERT INTO Delivery (delivery_id, order_id, address_id, delivery_date, status) VALUES
(601, 401, 1, '2026-08-22', 'Shipped'),
(602, 402, 2, '2026-08-23', 'Processing');