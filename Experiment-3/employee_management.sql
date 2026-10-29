SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS EmployeeProject;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE Department (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(100) NOT NULL UNIQUE,
    location VARCHAR(100)
);

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL,
    dept_id INT,
    manager_id INT,
    hire_date DATE NOT NULL,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE SET NULL,
    FOREIGN KEY (manager_id) REFERENCES Employee(emp_id) ON DELETE SET NULL
);

CREATE TABLE Project (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL UNIQUE,
    budget DECIMAL(12,2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Department(dept_id) ON DELETE CASCADE
);

CREATE TABLE EmployeeProject (
    emp_id INT,
    project_id INT,
    hours_worked INT DEFAULT 0,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES Project(project_id) ON DELETE CASCADE
);

INSERT INTO Department (dept_name, location) VALUES
('HR', 'Bangalore'),
('Engineering', 'Bangalore'),
('Marketing', 'Hyderabad'),
('Sales', 'Delhi'),
('Finance', 'Delhi');

INSERT INTO Employee (first_name, last_name, salary, dept_id, manager_id, hire_date) VALUES
('Priya', 'Singh', 100250, 1, NULL, '2020-01-01'),
('Shaurya', 'Mishra', 117807, 2, NULL, '2020-01-01'),
('Shaurya', 'Verma', 94843, 3, NULL, '2020-01-01'),
('Kian', 'Roy', 119236, 4, NULL, '2020-01-01'),
('Rishi', 'Mishra', 107203, 5, NULL, '2020-01-01'),
('Darsh', 'Roy', 62576, 2, 2, '2023-04-01'),
('Darsh', 'Sharma', 58005, 2, 2, '2022-01-10'),
('Krishna', 'Reddy', 49607, 4, 4, '2022-02-12'),
('Priya', 'Verma', 52478, 4, 4, '2022-06-21'),
('Neha', 'Das', 73708, 1, 1, '2022-02-22'),
('Rudra', 'Choudhury', 69730, 4, 4, '2022-04-05'),
('Ishaan', 'Singh', 51839, 5, 5, '2023-07-14'),
('Priya', 'Verma', 41394, 5, 5, '2023-02-13'),
('Kian', 'Gupta', 41066, 2, 2, '2023-11-26'),
('Aisha', 'Patel', 46537, 4, 4, '2021-04-12'),
('Rishi', 'Agarwal', 87602, 5, 5, '2022-02-04'),
('Darsh', 'Verma', 79139, 4, 4, '2022-11-02'),
('Krishna', 'Das', 57647, 2, 2, '2022-05-01'),
('Vivaan', 'Das', 74105, 5, 5, '2022-04-19'),
('Aditya', 'Das', 63489, 2, 2, '2021-10-14'),
('Reyansh', 'Kumar', 47399, 4, 4, '2023-05-13'),
('Ishaan', 'Rao', 60365, 1, 1, '2023-05-08'),
('Rishi', 'Joshi', 58487, 1, 1, '2021-09-13'),
('Neha', 'Jain', 67614, 3, 3, '2023-04-04'),
('Vivaan', 'Singh', 57031, 3, 3, '2023-08-18'),
('Rudra', 'Gupta', 81753, 5, 5, '2021-10-04'),
('Ananya', 'Choudhury', 71412, 2, 2, '2023-08-20'),
('Atharv', 'Choudhury', 64622, 1, 1, '2021-10-01'),
('Kabir', 'Patel', 56725, 1, 1, '2023-01-08'),
('Rishi', 'Choudhury', 88193, 4, 4, '2021-09-20');

INSERT INTO Project (project_name, budget, dept_id) VALUES
('Alpha', 90166, 5),
('Beta', 485238, 4),
('Gamma', 421407, 2),
('Delta', 450373, 3),
('Epsilon', 441720, 1),
('Zeta', 451288, 4),
('Eta', 442624, 3),
('Theta', 171858, 2);

INSERT INTO EmployeeProject (emp_id, project_id, hours_worked) VALUES
(1, 6, 69),
(2, 2, 12),
(2, 4, 10),
(3, 1, 93),
(4, 7, 100),
(4, 8, 88),
(5, 7, 23),
(6, 3, 95),
(6, 7, 56),
(7, 2, 95),
(8, 2, 30),
(8, 4, 20),
(9, 1, 99),
(9, 6, 47),
(10, 4, 96),
(10, 7, 17),
(10, 6, 24),
(11, 3, 56),
(11, 5, 96),
(11, 6, 48),
(12, 3, 39),
(12, 7, 95),
(13, 1, 98),
(13, 6, 59),
(14, 1, 55),
(14, 4, 68),
(14, 3, 56),
(15, 3, 34),
(15, 6, 12),
(15, 8, 90),
(16, 4, 85),
(16, 6, 45),
(16, 5, 79),
(17, 3, 69),
(17, 7, 66),
(18, 6, 42),
(18, 4, 62),
(19, 8, 43),
(20, 7, 68),
(20, 4, 21),
(21, 5, 92),
(21, 6, 94),
(21, 4, 57),
(22, 6, 36),
(22, 3, 49),
(23, 2, 16),
(23, 8, 30),
(24, 2, 31),
(25, 4, 18),
(25, 6, 33),
(26, 2, 93),
(27, 7, 62),
(28, 2, 74),
(29, 1, 10),
(29, 6, 40),
(29, 5, 95),
(30, 4, 78),
(30, 3, 22);

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