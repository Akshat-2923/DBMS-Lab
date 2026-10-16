# Experiment 4: Advanced Joins and Subqueries

This directory demonstrates advanced querying techniques using the Employee-Department-Project schema created in Experiment 3.

## Files
- `run.sql`: Self-contained script for online compilers. Creates tables, inserts sample data, and runs all 8 join/subquery types along with EXPLAIN plans.
- `queries.sql`: Contains the implementations for the requested query types.
- `explain_plans.sql`: Contains `EXPLAIN` statements used to analyze the execution plans of selected queries.

## Online Compiler Usage
Copy and paste the entire contents of `run.sql` into an online MySQL compiler (such as OneCompiler or DB Fiddle) and click **Run**.

## Query Techniques Demonstrated
1. **INNER JOIN**: Combining employee and department data.
2. **LEFT JOIN**: Finding all departments and any projects they have (including departments with no projects).
3. **SELF JOIN**: Linking employees to their managers within the same table.
4. **3-way JOIN**: Fetching employee, project, and department data together.
5. **Correlated Subquery**: Finding employees who earn more than their department's average salary.
6. **EXISTS**: Fetching departments that have at least one employee earning over 100,000.
7. **Simulated INTERSECT**: Using `IN` to find employees who are in a specific department AND are assigned to at least one project.
8. **Simulated EXCEPT**: Using `LEFT JOIN` and `IS NULL` to find employees who are NOT assigned to any project.
