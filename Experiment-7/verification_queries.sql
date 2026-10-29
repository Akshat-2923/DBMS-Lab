SELECT 
    sh.SaleID, 
    sh.SaleDate, 
    c.CustomerID, 
    c.CustomerName, 
    c.CustomerCity, 
    p.ProductID, 
    p.ProductName, 
    s.SupplierID,
    s.SupplierName, 
    p.UnitPrice, 
    sl.Quantity
FROM SaleHeader sh
JOIN Customer_2NF c ON c.CustomerID = sh.CustomerID
JOIN SaleLine sl ON sl.SaleID = sh.SaleID
JOIN Product_3NF p ON p.ProductID = sl.ProductID
JOIN Supplier s ON s.SupplierID = p.SupplierID
ORDER BY sh.SaleID, p.ProductID;

SELECT 
    (SELECT COUNT(*) FROM Sales_1NF) AS original_1nf_row_count,
    (SELECT COUNT(*) 
     FROM SaleHeader sh
     JOIN Customer_2NF c ON c.CustomerID = sh.CustomerID
     JOIN SaleLine sl ON sl.SaleID = sh.SaleID
     JOIN Product_3NF p ON p.ProductID = sl.ProductID
     JOIN Supplier s ON s.SupplierID = p.SupplierID) AS reconstructed_bcnf_row_count;

UPDATE Supplier
SET SupplierName = 'TechSource Global'
WHERE SupplierID = 20;

SELECT p.ProductID, p.ProductName, s.SupplierID, s.SupplierName
FROM Product_3NF p
JOIN Supplier s ON p.SupplierID = s.SupplierID
WHERE s.SupplierID = 20;
