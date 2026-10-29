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
