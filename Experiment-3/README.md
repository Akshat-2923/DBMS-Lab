# Experiment 3: Employee-Department-Project Schema and Basic Queries

This directory contains the schema, sample data, and basic SQL queries demonstrating fundamental DML operations on an Employee-Department-Project database.

## Files
- `run.sql`: Self-contained script for online compilers. Drops existing tables, creates the schema, inserts sample data (30 employees, 5 departments, 8 projects), and runs all 7 required query types.
- `schema.sql`: Creates the `Department`, `Employee`, `Project`, and `EmployeeProject` tables.
- `sample_data.sql`: Populates the tables with 30 employees, 5 departments, 8 projects, and project assignments.
- `queries.sql`: Contains basic queries demonstrating:
  - Selection (filtering rows based on conditions)
  - Projection (selecting specific columns)
  - Aggregate functions (COUNT, AVG, MAX)
  - `GROUP BY` and `HAVING` clauses
  - `CASE` expressions for conditional logic
  - `ORDER BY` for sorting results

## Online Compiler Usage
Copy and paste the entire contents of `run.sql` into an online MySQL compiler (such as OneCompiler or DB Fiddle) and click **Run**.
