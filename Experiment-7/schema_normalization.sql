SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS SaleLine;
DROP TABLE IF EXISTS SaleHeader;
DROP TABLE IF EXISTS Product_3NF;
DROP TABLE IF EXISTS Product_2NF;
DROP TABLE IF EXISTS Supplier;
DROP TABLE IF EXISTS Customer_2NF;
DROP TABLE IF EXISTS Sales_1NF;
SET FOREIGN_KEY_CHECKS = 1;

DROP TABLE IF EXISTS Sales_1NF;

CREATE TABLE Sales_1NF (
    SaleID INT NOT NULL,
    SaleDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerCity VARCHAR(60) NOT NULL,
    ProductID INT NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT NOT NULL,
    SupplierName VARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (SaleID, ProductID)
);

INSERT INTO Sales_1NF VALUES
(1001, '2026-10-01', 1, 'Aarav Sharma', 'Chandigarh', 501, 'Wireless Mouse', 20, 'TechSource', 699.00, 2),
(1001, '2026-10-01', 1, 'Aarav Sharma', 'Chandigarh', 502, 'Mechanical Keyboard', 21, 'KeyWorld', 2499.00, 1),
(1002, '2026-10-02', 2, 'Diya Verma', 'Mohali', 501, 'Wireless Mouse', 20, 'TechSource', 699.00, 1),
(1003, '2026-10-03', 3, 'Kabir Singh', 'Chandigarh', 503, 'USB-C Hub', 20, 'TechSource', 1299.00, 2),
(1004, '2026-10-04', 1, 'Aarav Sharma', 'Chandigarh', 504, 'Gaming Monitor', 22, 'VisionTech', 14999.00, 1),
(1004, '2026-10-04', 1, 'Aarav Sharma', 'Chandigarh', 502, 'Mechanical Keyboard', 21, 'KeyWorld', 2499.00, 1),
(1005, '2026-10-05', 4, 'Ananya Gupta', 'Panchkula', 505, 'Noise Cancelling Headphones', 23, 'AudioPro', 7999.00, 1),
(1005, '2026-10-05', 4, 'Ananya Gupta', 'Panchkula', 501, 'Wireless Mouse', 20, 'TechSource', 699.00, 3);

SELECT * FROM Sales_1NF ORDER BY SaleID, ProductID;

DROP TABLE IF EXISTS SaleLine;
DROP TABLE IF EXISTS SaleHeader;
DROP TABLE IF EXISTS Product_2NF;
DROP TABLE IF EXISTS Customer_2NF;

CREATE TABLE Customer_2NF (
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(100) NOT NULL,
    CustomerCity VARCHAR(60) NOT NULL
);

CREATE TABLE SaleHeader (
    SaleID INT PRIMARY KEY,
    SaleDate DATE NOT NULL,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer_2NF(CustomerID)
);

CREATE TABLE Product_2NF (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT NOT NULL,
    SupplierName VARCHAR(100) NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL
);

CREATE TABLE SaleLine (
    SaleID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (SaleID, ProductID),
    FOREIGN KEY (SaleID) REFERENCES SaleHeader(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Product_2NF(ProductID)
);

INSERT INTO Customer_2NF
SELECT DISTINCT CustomerID, CustomerName, CustomerCity FROM Sales_1NF;

INSERT INTO SaleHeader
SELECT DISTINCT SaleID, SaleDate, CustomerID FROM Sales_1NF;

INSERT INTO Product_2NF
SELECT DISTINCT ProductID, ProductName, SupplierID, SupplierName, UnitPrice FROM Sales_1NF;

INSERT INTO SaleLine
SELECT SaleID, ProductID, Quantity FROM Sales_1NF;

SELECT * FROM Customer_2NF;
SELECT * FROM SaleHeader;
SELECT * FROM Product_2NF;
SELECT * FROM SaleLine;

DROP TABLE IF EXISTS SaleLine;
DROP TABLE IF EXISTS Product_3NF;
DROP TABLE IF EXISTS Supplier;

CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY,
    SupplierName VARCHAR(100) NOT NULL
);

CREATE TABLE Product_3NF (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    SupplierID INT NOT NULL,
    UnitPrice DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID)
);

CREATE TABLE SaleLine (
    SaleID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    PRIMARY KEY (SaleID, ProductID),
    FOREIGN KEY (SaleID) REFERENCES SaleHeader(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Product_3NF(ProductID)
);

INSERT INTO Supplier
SELECT DISTINCT SupplierID, SupplierName FROM Product_2NF;

INSERT INTO Product_3NF
SELECT DISTINCT ProductID, ProductName, SupplierID, UnitPrice FROM Product_2NF;

INSERT INTO SaleLine
SELECT SaleID, ProductID, Quantity FROM Sales_1NF;

SELECT * FROM Supplier;
SELECT * FROM Product_3NF;
SELECT * FROM SaleLine;

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
