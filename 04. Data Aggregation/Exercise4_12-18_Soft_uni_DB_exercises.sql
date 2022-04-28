SELECT department_id, min(salary) FROM employees
WHERE department_id in (2,5,7) and DATE(hire_date) > 2000-01-01
GROUP BY department_id
ORDER BY department_id;


CREATE TABLE `new_table` AS SELECT * FROM employees WHERE salary > 30000;

DELETE FROM new_table `new_table` WHERE manager_id = 42;

UPDATE new_table SET salary = salary + 5000
WHERE department_id = 1;

SELECT department_id, avg(salary) FROM new_table
GROUP BY department_id
ORDER BY department_id;

SELECT department_id, max(salary) FROM employees
GROUP BY department_id
HAVING max(salary) not between 30000 and 70000
ORDER BY department_id;

SELECT COUNT(salary) FROM employees 
WHERE manager_id is NULL;

SELECT department_id, (
	SELECT DISTINCT salary FROM employees AS e1 
    WHERE e1.department_id = e2.department_id
    ORDER BY salary DESC LIMIT 2,1) AS 'third_highest_salary' 
FROM employees AS e2
GROUP BY department_id
HAVING third_highest_salary IS NOT NULL
ORDER BY department_id;

SELECT DISTINCT department_id, salary AS 'third_highest_salary' FROM 
(SELECT department_id, salary, 
DENSE_RANK() OVER(PARTITION BY department_id
ORDER BY salary DESC) 'salary_rank' FROM employees) `table1`
WHERE salary_rank = 3;

SELECT 
    first_name, last_name, department_id
FROM
    employees AS e1
WHERE salary > (SELECT avg(salary) FROM employees AS e2
WHERE e1.department_id = e2.department_id)
ORDER BY department_id, employee_id 
LIMIT 10;

SELECT 
    first_name, last_name, e1.department_id
FROM
    employees as e1
    JOIN (SELECT e2.department_id, avg(e2.salary)  AS 'salary' 
    FROM employees as e2 GROUP BY e2.department_id) AS department_average_salary
    ON e1.department_id = department_average_salary.department_id
WHERE e1.salary > department_average_salary.salary
ORDER BY e1.department_id, e1.employee_id 
LIMIT 10;

SELECT department_id, sum(salary) AS 'total_salary' FROM employees
GROUP BY department_id
ORDER BY department_id;



