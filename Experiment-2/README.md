# Experiment 2: Relational Schema & Integrity Constraints

This directory contains the relational database implementation of the Indian e-commerce platform.

## Files
- `ecommerce_schema.sql`: Complete, self-contained, run-ready script for online compilers (e.g. OneCompiler, DB Fiddle) and MySQL servers.

## Contents of `ecommerce_schema.sql`
1. **Schema Initialization:** Drops existing tables with foreign key checks toggled safely for idempotent execution.
2. **Table Definitions (12 Tables):** `Customer`, `CustomerPhone`, `Address`, `Category`, `Seller`, `Product`, `Electronics`, `Clothing`, `Orders`, `OrderItem`, `Payment`, and `Delivery`.
3. **Constraints Implemented:**
   - `PRIMARY KEY` and `AUTO_INCREMENT` on all major entities.
   - `FOREIGN KEY` references linking related tables.
   - `NOT NULL` on mandatory columns.
   - `UNIQUE` constraints on emails, GST numbers, and 1:1 payment/delivery bindings.
   - `ON DELETE CASCADE` on parent-child dependencies (e.g., deleting an order cascades to its items, payment, and delivery).
   - `ON DELETE SET NULL` on optional associations (e.g., deleting a category sets product `category_id` to NULL).
4. **Sample Data:** Realistic Indian e-commerce customer, seller, product, and transaction records.
5. **Verification & Cascading DML:** Demonstrates table retrieval and verifies cascading delete and set null actions.

## Online Compiler Usage
1. Open an online MySQL compiler (such as [OneCompiler MySQL](https://onecompiler.com/mysql) or [DB Fiddle](https://www.db-fiddle.com/)).
2. Copy and paste the entire contents of `ecommerce_schema.sql` into the editor.
3. Click **Run** to execute the schema, populate data, and view output tables.
