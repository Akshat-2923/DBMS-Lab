SELECT emp_id, first_name, last_name, salary
FROM Employee
WHERE salary > 70000;

SELECT first_name, last_name, hire_date
FROM Employee
WHERE dept_id = 2;

SELECT COUNT(*) AS total_employees, AVG(salary) AS avg_salary, MAX(salary) AS max_salary
FROM Employee;

SELECT dept_id, COUNT(*) AS num_employees
FROM Employee
GROUP BY dept_id;

SELECT dept_id, COUNT(*) AS num_employees, AVG(salary) AS avg_salary
FROM Employee
GROUP BY dept_id
HAVING AVG(salary) > 60000;

SELECT first_name, last_name, salary,
    CASE
        WHEN salary >= 100000 THEN 'High Earner'
        WHEN salary >= 60000 AND salary < 100000 THEN 'Medium Earner'
        ELSE 'Entry Level'
    END AS salary_bracket
FROM Employee;

SELECT first_name, last_name, salary, hire_date
FROM Employee
ORDER BY salary DESC, hire_date ASC;
