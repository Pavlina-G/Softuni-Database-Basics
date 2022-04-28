SELECT 
    department_id, COUNT(id) AS 'Number of employees'
FROM
    employees 
GROUP BY department_id
ORDER BY department_id, `Number of employees`;

SELECT 
    department_id, round(avg(salary), 2) AS 'Average Salary'
FROM
    employees 
GROUP BY department_id
ORDER BY department_id;

SELECT 
    department_id, round(min(salary), 2) AS 'Min Salary'
FROM employees
GROUP BY department_id
HAVING min(salary) > 800;

SELECT COUNT(category_id) FROM products
WHERE price > 8 and category_id = 2;

SELECT 
    category_id, 
    round(avg(price),2) AS 'Average Price',
    round(min(price),2) AS 'Cheapest Product', 
    round(max(price),2) AS 'Most Expensive Product'
FROM
    products
GROUP BY category_id;
