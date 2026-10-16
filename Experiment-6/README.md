# Experiment 6: Stored Procedures and Triggers

This directory demonstrates procedural logic, transaction control, validation, and auditing using MySQL stored procedures and triggers.

## Files
- `run.sql`: Self-contained script for online compilers. Drops existing objects, sets up schema and data, creates the `transfer_employee` stored procedure with rollback handlers, creates salary validation and audit triggers, and runs successful transfer and salary update tests showing audit trail logs.
- `procedure.sql`: Contains the `transfer_employee` stored procedure with input validation, transaction management, and rollback mechanisms.
- `triggers.sql`: Contains the table definition for `EmployeeAudit` and three triggers for the `Employee` table (salary validation on insert/update and audit logging on update).
- `test_cases.sql`: Contains SQL statements testing edge cases and standard execution of the procedure and triggers.

## Online Compiler Usage
Copy and paste the entire contents of `run.sql` into an online MySQL compiler (such as OneCompiler or DB Fiddle) and click **Run**.

## Testing Error Edge Cases
In `run.sql`, successful transfers and salary updates are run to demonstrate procedural logic and trigger logging without causing the online compiler batch runner to abort.
To test individual error edge cases that raise SQL exception signals, execute each statement individually:
1. `CALL transfer_employee(999, 1);` -> Raises error 'Invalid Employee ID'.
2. `CALL transfer_employee(1, 999);` -> Raises error 'Invalid Department ID'.
3. `CALL transfer_employee(1, 1);` -> Raises error 'Employee is already in the specified department'.
4. `INSERT INTO Employee (first_name, last_name, salary, dept_id, hire_date) VALUES ('Test', 'User', -50000, 1, '2023-01-01');` -> Trigger raises 'Salary cannot be negative'.
5. `UPDATE Employee SET salary = -10000 WHERE emp_id = 2;` -> Trigger raises 'Salary cannot be negative'.
