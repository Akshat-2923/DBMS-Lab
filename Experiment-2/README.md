# Experiment 2: Relational Schema

This directory contains the SQL implementation of the e-commerce ER diagram.

## Files
- `schema.sql`: Contains the `CREATE TABLE` statements with primary keys, foreign keys, and constraints (NOT NULL, UNIQUE, ON DELETE CASCADE, ON DELETE SET NULL).
- `sample_data.sql`: Contains `INSERT` statements to populate the tables with realistic sample data.
- `referential_integrity.sql`: Contains SQL statements that demonstrate referential integrity rules.

## Referential Integrity Demonstrations

The file `referential_integrity.sql` demonstrates how the schema enforces constraints:

1. **Foreign Key Violation (INSERT)**:
   Attempting to insert an `OrderItem` with a non-existent `order_id` (e.g., 999) will fail because `order_id` must exist in the `Orders` table.

2. **ON DELETE CASCADE**:
   Deleting an order from the `Orders` table will automatically delete the corresponding records in the `OrderItem`, `Payment`, and `Delivery` tables. This ensures no orphaned child records remain. (This statement will succeed and demonstrate the cascade).

3. **ON DELETE SET NULL**:
   Deleting a category from the `Category` table will not delete the associated products. Instead, the `category_id` in the `Product` table for those products will be set to `NULL`. (This statement will succeed and demonstrate the set null behavior).
