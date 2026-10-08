# Experiment 6: Stored Procedures and Triggers

This directory demonstrates procedural logic, transaction control, validation, and auditing using MySQL stored procedures and triggers.

## Files
- `procedure.sql`: Contains the `transfer_employee` stored procedure with input validation, transaction management, and rollback mechanisms.
- `triggers.sql`: Contains the table definition for `EmployeeAudit` and three triggers for the `Employee` table (salary validation on insert/update and audit logging on update).
- `test_cases.sql`: Contains SQL statements testing edge cases and standard execution of the procedure and triggers.

## Test Cases Expected Behavior

When executing the `test_cases.sql` file sequentially, be aware that some statements are designed to fail to test constraints and validations:

1. `CALL transfer_employee(999, 1);`
   **Fails:** Generates an error 'Invalid Employee ID'.

2. `CALL transfer_employee(1, 999);`
   **Fails:** Generates an error 'Invalid Department ID'.

3. `CALL transfer_employee(1, 1);`
   **Fails:** Generates an error 'Employee is already in the specified department' (assuming Employee 1 is in Department 1; if not, modify test appropriately).

4. `CALL transfer_employee(1, 2);`
   **Succeeds:** Successfully updates the employee's department and logs it in the audit table.

5. `INSERT INTO Employee ... VALUES (..., -50000, ...);`
   **Fails:** Blocked by the `before_employee_insert` trigger which raises 'Salary cannot be negative'.

6. `UPDATE Employee SET salary = -10000 WHERE emp_id = 2;`
   **Fails:** Blocked by the `before_employee_update` trigger which raises 'Salary cannot be negative'.

7. `UPDATE Employee SET salary = salary + 5000 WHERE emp_id = 3;`
   **Succeeds:** Updates the salary and generates a new record in the `EmployeeAudit` table.

8. `SELECT * FROM EmployeeAudit;`
   **Succeeds:** Retrieves the audit trail showing the successful department transfer and salary update.
