CREATE VIEW DeptSalarySummary AS
SELECT 
    d.dept_id, 
    d.dept_name, 
    COUNT(e.emp_id) AS total_employees, 
    SUM(e.salary) AS total_salary, 
    AVG(e.salary) AS average_salary
FROM Department d
LEFT JOIN Employee e ON d.dept_id = e.dept_id
GROUP BY d.dept_id, d.dept_name;

CREATE VIEW EmployeeHierarchy AS
SELECT 
    e1.emp_id, 
    e1.first_name, 
    e1.last_name, 
    e2.emp_id AS manager_id, 
    e2.first_name AS manager_first_name, 
    e2.last_name AS manager_last_name
FROM Employee e1
LEFT JOIN Employee e2 ON e1.manager_id = e2.emp_id;

CREATE VIEW EmployeeSalaryView AS
SELECT emp_id, first_name, last_name, salary
FROM Employee;

SELECT * FROM DeptSalarySummary;

SELECT * FROM EmployeeHierarchy;

UPDATE EmployeeSalaryView
SET salary = salary + 1000
WHERE emp_id = 6;

SELECT emp_id, first_name, salary 
FROM Employee 
WHERE emp_id = 6;

SELECT table_name, is_updatable
FROM information_schema.views
WHERE table_schema = DATABASE();
