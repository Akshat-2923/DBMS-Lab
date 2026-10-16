SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS Delivery;
DROP TABLE IF EXISTS Payment;
DROP TABLE IF EXISTS OrderItem;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Clothing;
DROP TABLE IF EXISTS Electronics;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Seller;
DROP TABLE IF EXISTS Category;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS CustomerPhone;
DROP TABLE IF EXISTS Customer;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE CustomerPhone (
    phone_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE Address (
    address_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    zip VARCHAR(10) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE Category (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT
);

CREATE TABLE Seller (
    seller_id INT PRIMARY KEY AUTO_INCREMENT,
    seller_name VARCHAR(100) NOT NULL,
    gst_number VARCHAR(15) UNIQUE NOT NULL
);

CREATE TABLE Product (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    category_id INT,
    seller_id INT,
    FOREIGN KEY (category_id) REFERENCES Category(category_id) ON DELETE SET NULL,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id) ON DELETE CASCADE
);

CREATE TABLE Electronics (
    product_id INT PRIMARY KEY,
    brand VARCHAR(50) NOT NULL,
    warranty_months INT,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);

CREATE TABLE Clothing (
    product_id INT PRIMARY KEY,
    size VARCHAR(10) NOT NULL,
    fabric VARCHAR(50) NOT NULL,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE CASCADE
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    order_date DATETIME NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id) ON DELETE CASCADE
);

CREATE TABLE OrderItem (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL,
    product_id INT,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id) ON DELETE SET NULL
);

CREATE TABLE Payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL UNIQUE,
    payment_method VARCHAR(50) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE
);

CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL UNIQUE,
    estimated_delivery DATE NOT NULL,
    delivery_status VARCHAR(20) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE
);

INSERT INTO Customer (first_name, last_name, email) VALUES
('Ramesh', 'Kumar', 'ramesh.kumar@example.com'),
('Suresh', 'Singh', 'suresh.singh@example.com'),
('Priya', 'Sharma', 'priya.sharma@example.com');

INSERT INTO CustomerPhone (customer_id, phone_number) VALUES
(1, '9876543210'),
(1, '9123456780'),
(2, '8765432109'),
(3, '7654321098');

INSERT INTO Address (customer_id, street, city, state, zip) VALUES
(1, 'MG Road', 'Bengaluru', 'Karnataka', '560001'),
(2, 'Connaught Place', 'New Delhi', 'Delhi', '110001'),
(3, 'Linking Road', 'Mumbai', 'Maharashtra', '400050');

INSERT INTO Category (category_name, description) VALUES
('Electronics', 'Gadgets and electronic devices'),
('Apparel', 'Clothing and fashion accessories');

INSERT INTO Seller (seller_name, gst_number) VALUES
('TechWorld India', '29ABCDE1234F1Z5'),
('FashionHub', '27ABCDE5678F1Z5');

INSERT INTO Product (product_name, price, category_id, seller_id) VALUES
('Smartphone X', 29999.00, 1, 1),
('Laptop Pro', 75000.00, 1, 1),
('Cotton T-Shirt', 499.00, 2, 2),
('Jeans', 1299.00, 2, 2);

INSERT INTO Electronics (product_id, brand, warranty_months) VALUES
(1, 'BrandX', 12),
(2, 'BrandY', 24);

INSERT INTO Clothing (product_id, size, fabric) VALUES
(3, 'M', 'Cotton'),
(4, '32', 'Denim');

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(1, '2023-10-01 10:30:00', 30498.00),
(2, '2023-10-02 11:45:00', 75000.00),
(3, '2023-10-03 14:15:00', 1299.00);

INSERT INTO OrderItem (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 29999.00),
(1, 3, 1, 499.00),
(2, 2, 1, 75000.00),
(3, 4, 1, 1299.00);

INSERT INTO Payment (order_id, payment_method, status) VALUES
(1, 'Credit Card', 'Completed'),
(2, 'UPI', 'Completed'),
(3, 'Net Banking', 'Pending');

INSERT INTO Delivery (order_id, estimated_delivery, delivery_status) VALUES
(1, '2023-10-05', 'Shipped'),
(2, '2023-10-07', 'Processing'),
(3, '2023-10-08', 'Pending');

SELECT * FROM Customer;
SELECT * FROM CustomerPhone;
SELECT * FROM Address;
SELECT * FROM Category;
SELECT * FROM Seller;
SELECT * FROM Product;
SELECT * FROM Electronics;
SELECT * FROM Clothing;
SELECT * FROM Orders;
SELECT * FROM OrderItem;
SELECT * FROM Payment;
SELECT * FROM Delivery;
DELETE FROM Orders WHERE order_id = 3;
SELECT * FROM Orders;
SELECT * FROM OrderItem;
DELETE FROM Category WHERE category_id = 2;
SELECT * FROM Product;
