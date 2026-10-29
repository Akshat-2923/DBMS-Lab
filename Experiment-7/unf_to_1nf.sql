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
