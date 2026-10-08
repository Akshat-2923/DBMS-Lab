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
