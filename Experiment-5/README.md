# Experiment 5: Views and Recursive Common Table Expressions (CTEs)

This directory contains the implementation of SQL views, view updatability analysis, and a Recursive CTE for hierarchical reporting chains.

## Files
- `views_and_recursive_cte.sql`: Complete, self-contained, run-ready script for online compilers (e.g. OneCompiler, DB Fiddle) and local MySQL.

## Contents of `views_and_recursive_cte.sql`
1. **Schema & Data Setup:** Tables and employee hierarchy records.
2. **Views Created:**
   - `DeptSalarySummary`: Aggregate view computing department headcount, total payroll, and average salary.
   - `EmployeeHierarchy`: Relational view presenting employees along with their assigned reporting manager.
   - `EmployeeSalaryView`: Updatable 1:1 projection view on the `Employee` table.
3. **View Updatability Verification:**
   - Executes an `UPDATE` on `EmployeeSalaryView` and verifies the modification propagates to the underlying base table.
   - Queries `information_schema.views` to programmatically verify updatability status (`IS_UPDATABLE` flag):
     - `DeptSalarySummary`: `NO` (contains aggregate functions and `GROUP BY`).
     - `EmployeeHierarchy`: `NO` (contains a self-join across multiple table instances).
     - `EmployeeSalaryView`: `YES` (simple single-table projection).
4. **Recursive Common Table Expression (CTE):**
   - Implements `WITH RECURSIVE EmployeeReportingChain AS (...)` to traverse the reporting graph from root managers (`manager_id IS NULL`) down through all supervisory tiers, constructing the full hierarchical path string (`Priya -> Neha`).

## Online Compiler Usage
1. Open an online MySQL compiler (such as [OneCompiler MySQL](https://onecompiler.com/mysql) or [DB Fiddle](https://www.db-fiddle.com/)).
2. Copy and paste the entire contents of `views_and_recursive_cte.sql` into the editor.
3. Click **Run** to execute the script and observe view queries, updatability flags, and the recursive tree.
