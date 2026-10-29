# Experiment 6: Stored Procedures, Triggers, and Transactions

This directory demonstrates procedural database logic, transactional integrity, data validation, and automated auditing.

## Files
- `procedures_and_triggers.sql`: Complete, self-contained, run-ready script for online compilers (e.g. OneCompiler, DB Fiddle) and local MySQL.

## Contents of `procedures_and_triggers.sql`
1. **Schema & Audit Setup:** Drops objects idempotently, creates organizational tables and the `EmployeeAudit` tracking table.
2. **Stored Procedure (`transfer_employee(emp_id, new_dept_id)`):**
   - **Validation:** Verifies employee existence, department existence, and prevents duplicate department transfers.
   - **Transaction Management:** Uses `START TRANSACTION`, `COMMIT`, and `ROLLBACK` within an `EXIT HANDLER FOR SQLEXCEPTION` with `RESIGNAL`.
3. **Database Triggers:**
   - `before_employee_insert`: Enforces business rules rejecting negative salary entries (`SIGNAL SQLSTATE '45000'`).
   - `before_employee_update`: Rejects any update attempting to assign a negative salary.
   - `after_employee_update`: Automatically logs historical salary adjustments and department reassignments into `EmployeeAudit`.
4. **Execution & Audit Trail:**
   - Transfers Employee 1 to Department 2 via stored procedure.
   - Updates employee compensation.
   - Retrieves the populated audit trail from `EmployeeAudit` verifying both procedure and trigger actions.

## Online Compiler Usage
1. Open an online MySQL compiler (such as [OneCompiler MySQL](https://onecompiler.com/mysql) or [DB Fiddle](https://www.db-fiddle.com/)).
2. Copy and paste the entire contents of `procedures_and_triggers.sql` into the editor.
3. Click **Run** to execute the procedure, triggers, and inspect the audit trail.

## Optional Manual Edge-Case Testing
The main script executes successful transitions so that online compiler batch executions complete smoothly. To verify exception handling individually, run these error-testing statements one at a time:
- `CALL transfer_employee(999, 1);` $\rightarrow$ Throws `45000: Invalid Employee ID`.
- `CALL transfer_employee(1, 999);` $\rightarrow$ Throws `45000: Invalid Department ID`.
- `CALL transfer_employee(1, 1);` $\rightarrow$ Throws `45000: Employee is already in the specified department`.
- `INSERT INTO Employee (first_name, last_name, salary, dept_id, hire_date) VALUES ('Test', 'User', -50000, 1, '2023-01-01');` $\rightarrow$ Trigger throws `Salary cannot be negative`.
- `UPDATE Employee SET salary = -10000 WHERE emp_id = 2;` $\rightarrow$ Trigger throws `Salary cannot be negative`.
