CREATE TABLE EmployeeAudit (
    audit_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT NOT NULL,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    old_dept_id INT,
    new_dept_id INT,
    action_type VARCHAR(20) NOT NULL,
    action_timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
);

DELIMITER //

CREATE TRIGGER before_employee_insert
BEFORE INSERT ON Employee
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

CREATE TRIGGER before_employee_update
BEFORE UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Salary cannot be negative';
    END IF;
END //

CREATE TRIGGER after_employee_update
AFTER UPDATE ON Employee
FOR EACH ROW
BEGIN
    IF OLD.salary != NEW.salary OR OLD.dept_id != NEW.dept_id THEN
        INSERT INTO EmployeeAudit (emp_id, old_salary, new_salary, old_dept_id, new_dept_id, action_type)
        VALUES (NEW.emp_id, OLD.salary, NEW.salary, OLD.dept_id, NEW.dept_id, 'UPDATE');
    END IF;
END //

DELIMITER ;
