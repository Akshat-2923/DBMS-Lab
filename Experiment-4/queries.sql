SELECT e.first_name, e.last_name, d.dept_name
FROM Employee e
INNER JOIN Department d ON e.dept_id = d.dept_id;

SELECT d.dept_name, p.project_name
FROM Department d
LEFT JOIN Project p ON d.dept_id = p.dept_id;

SELECT e1.first_name AS Employee_First, e1.last_name AS Employee_Last, 
       e2.first_name AS Manager_First, e2.last_name AS Manager_Last
FROM Employee e1
LEFT JOIN Employee e2 ON e1.manager_id = e2.emp_id;

SELECT e.first_name, e.last_name, d.dept_name, p.project_name
FROM Employee e
INNER JOIN EmployeeProject ep ON e.emp_id = ep.emp_id
INNER JOIN Project p ON ep.project_id = p.project_id
INNER JOIN Department d ON e.dept_id = d.dept_id;

SELECT e.first_name, e.last_name, e.salary, e.dept_id
FROM Employee e
WHERE e.salary > (
    SELECT AVG(salary) 
    FROM Employee 
    WHERE dept_id = e.dept_id
);

SELECT d.dept_name
FROM Department d
WHERE EXISTS (
    SELECT 1 
    FROM Employee e 
    WHERE e.dept_id = d.dept_id AND e.salary > 100000
);

SELECT emp_id 
FROM Employee 
WHERE dept_id = 1
AND emp_id IN (SELECT emp_id FROM EmployeeProject);

SELECT e.emp_id 
FROM Employee e
LEFT JOIN EmployeeProject ep ON e.emp_id = ep.emp_id
WHERE ep.project_id IS NULL;
