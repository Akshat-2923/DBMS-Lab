WITH RECURSIVE EmployeeReportingChain AS (
    SELECT 
        emp_id, 
        first_name, 
        last_name, 
        manager_id, 
        1 AS level,
        CAST(first_name AS CHAR(255)) AS reporting_path
    FROM Employee
    WHERE manager_id IS NULL

    UNION ALL

    SELECT 
        e.emp_id, 
        e.first_name, 
        e.last_name, 
        e.manager_id, 
        erc.level + 1,
        CONCAT(erc.reporting_path, ' -> ', e.first_name)
    FROM Employee e
    INNER JOIN EmployeeReportingChain erc ON e.manager_id = erc.emp_id
)
SELECT 
    emp_id, 
    first_name, 
    last_name, 
    manager_id, 
    level, 
    reporting_path 
FROM EmployeeReportingChain
ORDER BY level, manager_id;
