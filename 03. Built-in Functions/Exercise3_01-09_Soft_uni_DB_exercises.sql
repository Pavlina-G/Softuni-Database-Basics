SELECT first_name, last_name FROM `employees`
WHERE first_name LIKE 'Sa%'
ORDER BY employee_id;

SELECT first_name, last_name FROM `employees`
WHERE last_name LIKE '%ei%'
ORDER BY employee_id;

SELECT first_name, last_name FROM `employees`
WHERE instr(last_name, 'ei')
ORDER BY employee_id;

SELECT first_name FROM `employees`
WHERE department_id in (3, 10) 
and year(hire_date) between 1995 and 2005
ORDER BY employee_id;

SELECT first_name FROM `employees`
WHERE (department_id = 3 or department_id = 10) 
and (YEAR(hire_date) between 1995 and 2005)
ORDER BY employee_id;

SELECT first_name, last_name FROM `employees`
# WHERE NOT instr(job_title, 'engineer')
WHERE NOT job_title LIKE '%engineer%'
ORDER BY employee_id;

SELECT `name` FROM towns
WHERE length(`name`)BETWEEN 5 and 6
ORDER BY `name`;

SELECT * FROM towns
WHERE `name` REGEXP '^[MmKkBbEe]'
ORDER BY `name`;

SELECT * from towns
WHERE upper(substr(`name`,1,1)) in ('M','K','B','E')
ORDER BY `name`;

SELECT * from towns
WHERE upper(substr(`name`,1,1)) not in ('D','R','B')
ORDER BY `name`;

SELECT * from towns
WHERE not `name` RLIKE '^[DdBbRr]'
ORDER BY `name`;

CREATE VIEW `v_employees_hired_after_2000` AS
SELECT `first_name`, `last_name` 
FROM `employees`
WHERE YEAR(hire_date) > 2000;
SELECT * from `v_employees_hired_after_2000`;

SELECT `first_name`, `last_name` FROM `employees`
WHERE length(last_name) = 5;

	



