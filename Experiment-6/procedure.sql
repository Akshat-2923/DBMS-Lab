DELIMITER //

CREATE PROCEDURE transfer_employee(IN p_emp_id INT, IN p_new_dept_id INT)
BEGIN
    DECLARE emp_exists INT DEFAULT 0;
    DECLARE dept_exists INT DEFAULT 0;
    DECLARE current_dept INT;
    
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        RESIGNAL;
    END;

    START TRANSACTION;

    SELECT COUNT(*) INTO emp_exists FROM Employee WHERE emp_id = p_emp_id;
    IF emp_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Employee ID';
    END IF;

    SELECT COUNT(*) INTO dept_exists FROM Department WHERE dept_id = p_new_dept_id;
    IF dept_exists = 0 THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Invalid Department ID';
    END IF;

    SELECT dept_id INTO current_dept FROM Employee WHERE emp_id = p_emp_id;
    IF current_dept = p_new_dept_id THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Employee is already in the specified department';
    END IF;

    UPDATE Employee
    SET dept_id = p_new_dept_id
    WHERE emp_id = p_emp_id;

    COMMIT;
END //

DELIMITER ;
