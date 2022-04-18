USE hotel;

SELECT id, first_name, last_name, job_title from `employees`
ORDER BY id;

SELECT id, concat(`first_name`, ' ', `last_name`) AS 'full_name',
`job_title`, `salary` from `employees`
WHERE salary > 1000
ORDER BY id;

UPDATE `employees`
SET `salary` = `salary` + 100
WHERE `job_title` = 'Manager';
SELECT `salary` FROM `employees`;

CREATE VIEW `view_top_paid_employee` AS
	SELECT * FROM `employees`
    ORDER BY `salary` DESC LIMIT 1;
SELECT * FROM `view_top_paid_employee`;

SELECT * FROM `employees`
WHERE `department_id` = 4 AND `salary`>= 1000
ORDER BY `id`;

DELETE FROM `employees`
WHERE `department_id` BETWEEN 1 AND 2;
SELECT * FROM `employees`
ORDER BY `id`;
