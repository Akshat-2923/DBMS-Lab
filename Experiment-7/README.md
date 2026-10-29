# Experiment 7: Normalization of a Sales Table from UNF to 3NF and BCNF

## Aim
Given a denormalized Sales table, identify candidate keys and functional dependencies, and normalize the data step-by-step from Unnormalized Form (UNF) to First Normal Form (1NF), Second Normal Form (2NF), Third Normal Form (3NF), and Boyce–Codd Normal Form (BCNF). Verify lossless join decomposition and dependency preservation using SQL queries.

---

## Files in this Directory
- `schema_normalization.sql`: Complete, self-contained, run-ready script for online MySQL compilers (e.g., OneCompiler, DB Fiddle) and local MySQL. Creates tables, inserts sample data, performs 2NF/3NF/BCNF decompositions, and runs lossless join verification queries.

---

## Theory & Normalization Steps

### 1. Unnormalized Form (UNF)
In UNF, each sales record contains repeating groups of products purchased within a single sale:
- `SaleID, SaleDate, CustomerID, CustomerName, CustomerCity, ProductItems[(ProductID, ProductName, SupplierID, SupplierName, UnitPrice, Quantity)]`

### 2. Functional Dependencies Identified
1. `SaleID -> SaleDate, CustomerID`
2. `CustomerID -> CustomerName, CustomerCity`
3. `ProductID -> ProductName, SupplierID, UnitPrice`
4. `SupplierID -> SupplierName`
5. `(SaleID, ProductID) -> Quantity`

**Candidate Key for Line Item:** `(SaleID, ProductID)`

---

### 3. First Normal Form (1NF)
- **Condition:** All column values must be atomic; no repeating groups or nested arrays.
- **Action:** Flatten the repeating product items into individual rows.
- **Relation:** `Sales_1NF(SaleID, SaleDate, CustomerID, CustomerName, CustomerCity, ProductID, ProductName, SupplierID, SupplierName, UnitPrice, Quantity)`
- **Primary Key:** `(SaleID, ProductID)`
- **Anomalies in 1NF:**
  - *Insertion Anomaly:* Cannot add a new product or supplier without an existing sale.
  - *Update Anomaly:* Updating a customer city or supplier name requires changing multiple duplicate rows.
  - *Deletion Anomaly:* Deleting a sale removes the only record of a product if it was only sold once.

---

### 4. Second Normal Form (2NF)
- **Condition:** Must be in 1NF and have **no partial dependencies** (every non-prime attribute must depend on the whole candidate key, not a subset).
- **Identified Partial Dependencies:**
  - `SaleID -> SaleDate, CustomerID` (depends only on `SaleID`, not `ProductID`)
  - `ProductID -> ProductName, SupplierID, SupplierName, UnitPrice` (depends only on `ProductID`, not `SaleID`)
- **Action:** Decompose into 4 relations:
  1. `Customer_2NF(CustomerID [PK], CustomerName, CustomerCity)`
  2. `SaleHeader(SaleID [PK], SaleDate, CustomerID [FK])`
  3. `Product_2NF(ProductID [PK], ProductName, SupplierID, SupplierName, UnitPrice)`
  4. `SaleLine(SaleID [PK, FK], ProductID [PK, FK], Quantity)`

---

### 5. Third Normal Form (3NF) & Boyce–Codd Normal Form (BCNF)
- **3NF Condition:** Must be in 2NF and have **no transitive dependencies** (non-key attributes must not depend on other non-key attributes: $X \rightarrow Y$ must not have non-prime $Y$ depending on non-prime $X$).
- **Identified Transitive Dependency in `Product_2NF`:**
  - `ProductID -> SupplierID` and `SupplierID -> SupplierName`
  - `SupplierName` depends transitively on `ProductID` via `SupplierID`.
- **Action:** Separate supplier details into a dedicated relation:
  1. `Supplier(SupplierID [PK], SupplierName)`
  2. `Product_3NF(ProductID [PK], ProductName, SupplierID [FK], UnitPrice)`
- **BCNF Condition:** For every non-trivial functional dependency $X \rightarrow Y$, determinant $X$ must be a superkey.
  - `Customer_2NF`: Determinant `CustomerID` is a candidate key. (Satisfies BCNF)
  - `SaleHeader`: Determinant `SaleID` is a candidate key. (Satisfies BCNF)
  - `Supplier`: Determinant `SupplierID` is a candidate key. (Satisfies BCNF)
  - `Product_3NF`: Determinant `ProductID` is a candidate key. (Satisfies BCNF)
  - `SaleLine`: Determinant `(SaleID, ProductID)` is a candidate key. (Satisfies BCNF)
- The resulting 3NF decomposition is already in BCNF.

---

## Verification

### Lossless Join Property
A multi-table join across `SaleHeader`, `Customer_2NF`, `SaleLine`, `Product_3NF`, and `Supplier` reconstructs the original `Sales_1NF` dataset without losing or inventing rows:
```sql
SELECT 
    (SELECT COUNT(*) FROM Sales_1NF) AS original_1nf_row_count,
    (SELECT COUNT(*) 
     FROM SaleHeader sh
     JOIN Customer_2NF c ON c.CustomerID = sh.CustomerID
     JOIN SaleLine sl ON sl.SaleID = sh.SaleID
     JOIN Product_3NF p ON p.ProductID = sl.ProductID
     JOIN Supplier s ON s.SupplierID = p.SupplierID) AS reconstructed_bcnf_row_count;
```
Result: `original_1nf_row_count = 8`, `reconstructed_bcnf_row_count = 8`.

### Dependency Preservation
Every identified functional dependency is preserved within individual relations:
- `SaleID -> SaleDate, CustomerID` in `SaleHeader`
- `CustomerID -> CustomerName, CustomerCity` in `Customer_2NF`
- `ProductID -> ProductName, SupplierID, UnitPrice` in `Product_3NF`
- `SupplierID -> SupplierName` in `Supplier`
- `(SaleID, ProductID) -> Quantity` in `SaleLine`

---

## Online Compiler Usage
1. Open an online MySQL compiler (e.g. [OneCompiler MySQL](https://onecompiler.com/mysql) or [DB Fiddle](https://www.db-fiddle.com/)).
2. Copy and paste the entire contents of `schema_normalization.sql` into the editor.
3. Click **Run**.
4. The script executes the entire normalization lifecycle and prints all tables and verification checks directly to the console.
