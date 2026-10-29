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
