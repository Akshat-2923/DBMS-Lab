# Experiment 3: Employee-Department-Project Schema and Basic Queries

This directory contains the schema, sample data, and SQL queries demonstrating fundamental DML operations on an organizational database.

## Files
- `employee_management.sql`: Complete, self-contained, run-ready script for online compilers (e.g. OneCompiler, DB Fiddle) and local MySQL.

## Contents of `employee_management.sql`
1. **Schema Initialization:** Drops existing tables with foreign key checks toggled safely.
2. **Table Definitions:**
   - `Department`: 5 departments (`dept_id`, `dept_name`, `location`).
   - `Employee`: 30 employees (`emp_id`, `first_name`, `last_name`, `salary`, `dept_id`, `manager_id`, `hire_date`).
   - `Project`: 8 corporate projects (`project_id`, `project_name`, `budget`, `dept_id`).
   - `EmployeeProject`: Many-to-many relationship tracking project allocations and hours worked.
3. **Sample Dataset:** Realistic records including management hierarchies, department allocations, and project assignments.
4. **Queries Demonstrated:**
   - **Selection:** Filtering employee rows based on salary conditions (`salary > 70000`).
   - **Projection:** Selecting specific attributes (`first_name`, `last_name`, `hire_date`).
   - **Aggregate Functions:** Computing summary metrics (`COUNT(*)`, `AVG(salary)`, `MAX(salary)`).
   - **GROUP BY:** Grouping employee counts by department.
   - **HAVING Clause:** Filtering grouped department results by average compensation (`HAVING AVG(salary) > 60000`).
   - **CASE Expression:** Classifying employees into salary tiers (`High Earner`, `Medium Earner`, `Entry Level`).
   - **ORDER BY:** Multi-level sorting by compensation descending and hire date ascending.

## Online Compiler Usage
1. Open an online MySQL compiler (such as [OneCompiler MySQL](https://onecompiler.com/mysql) or [DB Fiddle](https://www.db-fiddle.com/)).
2. Copy and paste the entire contents of `employee_management.sql` into the editor.
3. Click **Run** to execute the script and view all output tables.
