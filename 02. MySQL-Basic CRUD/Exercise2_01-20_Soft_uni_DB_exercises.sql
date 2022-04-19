SELECT * FROM `departments`
ORDER BY `department_id`;

SELECT `name` FROM `departments`
ORDER BY `department_id`;

SELECT `first_name`, `last_name`, `salary` FROM `employees`
ORDER BY `employee_id`;

SELECT `first_name`, `middle_name`, `last_name` FROM `employees`
ORDER BY `employee_id`;

SELECT concat(`first_name`, '.', `last_name`, '@', 'softuni.bg') 
AS 'full_ email_address'
FROM `employees`;

SELECT DISTINCT `salary` FROM `employees`;

SELECT * FROM `employees`
WHERE `job_title`= 'Sales Representative'
ORDER BY `employee_id`;

SELECT `first_name`, `last_name`,`job_title` FROM `employees`
WHERE `salary` BETWEEN 20000 AND 30000
ORDER BY `employee_id`;

SELECT concat_ws(' ',`first_name`, `middle_name`, `last_name`) AS 'Full Name' FROM `employees`
WHERE `salary` IN (25000, 14000, 12500, 23600);

SELECT `first_name`, `last_name` FROM `employees`
WHERE `manager_id` IS NULL;

SELECT `first_name`, `last_name`, `salary` FROM `employees`
WHERE `salary` > 50000
ORDER BY `salary` DESC;

SELECT `first_name`, `last_name` FROM `employees`
ORDER BY `salary` DESC LIMIT 5;

SELECT `first_name`, `last_name` FROM `employees`
WHERE NOT `department_id` = 4;

SELECT * FROM `employees`
ORDER BY `salary` DESC, `first_name` ASC, `last_name` DESC, `middle_name` ASC, `employee_id`;

CREATE VIEW `v_employees_salaries` AS
	SELECT `first_name`,`last_name`, `salary` FROM `employees`;
SELECT * FROM `v_employees_salaries`;

# DROP VIEW `v_employees_job_titles`;
CREATE VIEW `v_employees_job_titles` AS
	SELECT concat_ws(' ', `first_name`, `middle_name`, `last_name`) AS 'full_name', job_title FROM `employees`;
SELECT * FROM `v_employees_job_titles`;

SELECT DISTINCT `job_title` FROM `employees`
ORDER BY `job_title`;

SELECT * FROM `projects`
ORDER BY `start_date`, `name`, `project_id` LIMIT 10;

SELECT `first_name`, `last_name`, `hire_date` FROM `employees`
ORDER BY `hire_date` DESC LIMIT 7;

# SELECT `department_id` FROM `departments`
# WHERE `name` in ('Engineering', 'Tool Design', 'Marketing', 'Information Services');

UPDATE `employees`
SET `salary` = `salary` * 1.12
WHERE `department_id` in (11, 4, 2, 1);
SELECT `salary` FROM `employees`;

