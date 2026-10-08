INSERT INTO OrderItem (order_id, product_id, quantity, unit_price) VALUES
(999, 1, 1, 29999.00);

DELETE FROM Orders WHERE order_id = 1;

DELETE FROM Category WHERE category_id = 1;
