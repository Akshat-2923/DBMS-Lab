EXPLAIN SELECT e.first_name, e.last_name, d.dept_name
FROM Employee e
INNER JOIN Department d ON e.dept_id = d.dept_id;

EXPLAIN FORMAT=JSON
SELECT e.first_name, e.last_name, e.salary, e.dept_id
FROM Employee e
WHERE e.salary > (
    SELECT AVG(salary) 
    FROM Employee 
    WHERE dept_id = e.dept_id
);

EXPLAIN SELECT d.dept_name
FROM Department d
WHERE EXISTS (
    SELECT 1 
    FROM Employee e 
    WHERE e.dept_id = d.dept_id AND e.salary > 100000
);
