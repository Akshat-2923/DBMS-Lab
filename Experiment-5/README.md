# Experiment 5: Views and Recursive CTEs

This directory contains the implementation of SQL views and a Recursive Common Table Expression (CTE).

## Files
- `views.sql`: Contains the creation of `DeptSalarySummary` and `EmployeeHierarchy` views. It also includes `UPDATE` statements to test view updatability.
- `recursive_cte.sql`: Contains a recursive CTE to traverse the employee hierarchy and display the reporting chain from top-level managers down to entry-level employees.

## View Updatability Note

The `views.sql` file contains two `UPDATE` statements to test if the views are updatable. 
- The `UPDATE` on `EmployeeHierarchy` will succeed because it maps directly to a single base table row without aggregation, meaning the view is updatable in MySQL.
- The `UPDATE` on `DeptSalarySummary` will **fail** because the view uses aggregate functions (`SUM`, `AVG`) and `GROUP BY`, which inherently makes the view non-updatable in MySQL.
