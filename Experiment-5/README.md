# Experiment 5: Views and Recursive CTEs

This directory contains the implementation of SQL views, view updatability testing, and a Recursive Common Table Expression (CTE).

## Files
- `run.sql`: Self-contained script for online compilers. Sets up schema and data, creates views, tests updatability, and runs the recursive CTE reporting chain.
- `views.sql`: Contains the creation of `DeptSalarySummary`, `EmployeeHierarchy`, and `EmployeeSalaryView` views, followed by updatability tests and inspection via `information_schema.views`.
- `recursive_cte.sql`: Contains a recursive CTE to traverse the employee hierarchy and display the reporting chain from top-level managers down to entry-level employees.

## Online Compiler Usage
Copy and paste the entire contents of `run.sql` into an online MySQL compiler (such as OneCompiler or DB Fiddle) and click **Run**.

## View Updatability Explanation
- In MySQL, views with aggregate functions (`SUM`, `AVG`, `COUNT`) or `GROUP BY` (such as `DeptSalarySummary`) and views with multi-table joins (such as `EmployeeHierarchy`) are inherently **non-updatable**. Querying `information_schema.views` confirms `IS_UPDATABLE = 'NO'`.
- Single-table projection views (such as `EmployeeSalaryView`) are **updatable**. Updating `EmployeeSalaryView` updates the underlying `Employee` table. Querying `information_schema.views` confirms `IS_UPDATABLE = 'YES'`.
