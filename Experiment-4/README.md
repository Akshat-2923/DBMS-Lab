# Experiment 4: Advanced Joins, Subqueries, and Execution Plans

This directory demonstrates advanced relational query techniques using the Employee-Department-Project schema.

## Files
- `joins_and_subqueries.sql`: Complete, self-contained, run-ready script for online compilers (e.g. OneCompiler, DB Fiddle) and local MySQL.

## Contents of `joins_and_subqueries.sql`
1. **Schema & Data Setup:** Idempotent table setup and dataset insertion.
2. **Advanced Relational Queries:**
   - **INNER JOIN:** Combining employee records with matching department details.
   - **LEFT JOIN:** Listing departments and associated projects, retaining departments with zero project allocations.
   - **SELF JOIN:** Recursive join on the `Employee` table linking subordinates to managers.
   - **3-Way JOIN:** Joining `Employee`, `EmployeeProject`, `Project`, and `Department` simultaneously.
   - **Correlated Subquery:** Identifying employees whose salary exceeds their specific department's average compensation.
   - **EXISTS Clause:** Finding departments with high earners (`salary > 100000`).
   - **Simulated INTERSECT:** Emulating set intersection using `IN` subqueries to locate department employees active on projects.
   - **Simulated EXCEPT (MINUS):** Emulating set difference using `LEFT JOIN` and `IS NULL` to locate employees unassigned to projects.
   - **EXPLAIN Analysis:** Analyzing query execution plans, indexes utilized, and access types (cost, rows, JSON plan).

## Online Compiler Usage
1. Open an online MySQL compiler (such as [OneCompiler MySQL](https://onecompiler.com/mysql) or [DB Fiddle](https://www.db-fiddle.com/)).
2. Copy and paste the entire contents of `joins_and_subqueries.sql` into the editor.
3. Click **Run** to execute all joins, subqueries, and view execution plan outputs.
