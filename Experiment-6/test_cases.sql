CALL transfer_employee(999, 1);

CALL transfer_employee(1, 999);

CALL transfer_employee(1, 1);

CALL transfer_employee(1, 2);

INSERT INTO Employee (first_name, last_name, salary, dept_id, hire_date) 
VALUES ('John', 'Doe', -50000, 1, '2023-01-01');

UPDATE Employee SET salary = -10000 WHERE emp_id = 2;

UPDATE Employee SET salary = salary + 5000 WHERE emp_id = 3;

SELECT * FROM EmployeeAudit;
