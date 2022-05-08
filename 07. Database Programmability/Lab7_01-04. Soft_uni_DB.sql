# -- 1 --
DELIMITER *** # by default is ;
CREATE FUNCTION ufn_count_employees_by_town(town_name VARCHAR(50))
RETURNS INT
DETERMINISTIC

BEGIN
		DECLARE e_count INT;
        SET e_count := 
		(SELECT COUNT(*) FROM towns AS t
		LEFT JOIN addresses AS a ON t.town_id = a.town_id
		JOIN employees AS e ON e.address_id = a.address_id
		WHERE t.name = town_name);
        RETURN e_count;
END;

SELECT udf_count_empl_town('Sofia');

# -- Procedure --

DELIMITER $$
CREATE PROCEDURE usp_select_employees_by_seniority() 
BEGIN
  SELECT * 
  FROM employees
  WHERE ROUND((DATEDIFF(NOW(), hire_date) / 365.25)) < 15;
END $$

CALL usp_select_employees_by_seniority();

DROP PROCEDURE usp_select_employees_by_seniority;

DELIMITER &&&
CREATE PROCEDURE udp_test()
BEGIN
	SELECT * FROM towns
    WHERE town_id = 5;
END
&&&

CALL udp_test();

DROP PROCEDURE `udp_test`;

# -- Parameterized Stored Procedures --

DELIMITER $$
CREATE PROCEDURE usp_select_employees_by_seniority(min_years_at_work INT)
BEGIN
  SELECT first_name, last_name, hire_date,
    ROUND(DATEDIFF(NOW(),DATE(hire_date)) / 365.25,0) AS 'years'
  FROM employees
  WHERE ROUND(DATEDIFF(NOW(),DATE(hire_date)) / 365.25,0) > min_years_at_work
  ORDER BY hire_date;
END $$

CALL usp_select_employees_by_seniority(15);

DROP PROCEDURE `usp_select_employees_by_seniority`;

# -- 2 --

DELIMITER ***
CREATE PROCEDURE usp_raise_salaries(department_name VARCHAR(50))
BEGIN
	UPDATE employees AS e
    JOIN departments AS d ON e.department_id = d.department_id
    SET salary = salary * 1.05
    WHERE department_name = d.name;
END***

CALL usp_raise_salaries('Finance');

# -- 3 --

DELIMITER ***

CREATE PROCEDURE usp_raise_salary_by_id(id INT) 
BEGIN
	UPDATE employees AS e
    SET salary = salary * 1.05
    WHERE e.employee_id = id;
END***

CALL usp_raise_salaries(17);

# -- Transactions --

CREATE PROCEDURE usp_raise_salary_by_id(id int)
BEGIN
	START TRANSACTION;
	IF((SELECT count(employee_id) FROM employees WHERE employee_id like id) != 1) THEN
	ROLLBACK;
	ELSE
		UPDATE employees AS e SET salary = salary + salary*0.05 
		WHERE e.employee_id = id;
	END IF; 
END;

# -----

DELIMITER ***
CREATE PROCEDURE usp_raise_salary_by_id(id int)
BEGIN
	IF((SELECT count(employee_id) FROM employees WHERE employee_id = id) > 0) 
    THEN
		UPDATE employees AS e SET salary = salary + salary*0.05 
		WHERE e.employee_id = id;
	END IF; 
END
***
# -- Transaction --

START TRANSACTION;
	UPDATE employees SET salary = salary - 1000 WHERE employee_id = 1;
	UPDATE employees SET salary = salary + 1000 WHERE employee_id = 2;
COMMIT;

# -- 4 Triggers --

CREATE TABLE `deleted_employees` (
  `employee_id` INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(50) NOT NULL,
  `last_name` VARCHAR(50) NOT NULL,
  `middle_name` VARCHAR(50) NULL DEFAULT NULL,
  `job_title` VARCHAR(50) NOT NULL,
  `department_id` INT NOT NULL,
  `salary` DECIMAL(19,4) NOT NULL);

DROP TRIGGER tr_deleted_employees;


CREATE TRIGGER tr_deleted_employees AFTER DELETE
ON employees
	FOR EACH ROW
    
# BEGIN  # BEGIN & END CAN BE SKIPPED
    INSERT INTO deleted_employees
		(first_name, last_name, middle_name, job_title, department_id, salary) 
	VALUES (OLD.first_name, OLD.last_name, OLD.middle_name, OLD.job_title, OLD.department_id, OLD.salary);
# END

SET FOREIGN_KEY_CHECKS = 0;
DELETE FROM employees WHERE employee_id IN (1);





