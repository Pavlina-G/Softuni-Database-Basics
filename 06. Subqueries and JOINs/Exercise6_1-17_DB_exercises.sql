# -- 1 --

USE soft_uni;

SELECT 
    e.employee_id, e.job_title, e.address_id, a.address_text
FROM
    employees AS e
        JOIN
    addresses AS a USING (address_id)
ORDER BY address_id
LIMIT 5;

# -- 2 --

SELECT 
    e.first_name, e.last_name, t.name AS town, a.address_text
FROM
    employees AS e
        INNER JOIN
    addresses AS a ON e.address_id = a.address_id
        JOIN
    towns AS t USING (town_id)
    ORDER BY e.first_name, e.last_name
    LIMIT 5;

# -- 3 --

SELECT 
    employee_id,
    first_name,
    last_name,
    d.name AS department_name
FROM
    employees AS e
        JOIN
    departments AS d USING (department_id)
WHERE
    d.name = 'Sales'
ORDER BY employee_id DESC;

# -- 4 --

SELECT 
    employee_id,
    first_name,
    salary,
    d.name AS department_name
FROM
    employees AS e
        JOIN
    departments AS d USING (department_id)
WHERE
    e.salary > 15000
ORDER BY d.department_id DESC
LIMIT 5;

# -- 5 --

SELECT 
    e.employee_id, e.first_name
FROM
    employees AS e
        LEFT JOIN
    employees_projects AS ep USING (employee_id)
WHERE ep.employee_id is NULL
ORDER BY e.employee_id DESC
LIMIT 3;

# -- 6 --

SELECT 
    e.first_name, e.last_name, e.hire_date, d.name AS dept_name
FROM
    employees AS e
        JOIN
    departments AS d USING (department_id)
WHERE DATE(hire_date) > '1999-01-01' AND d.name in ('Finance', 'Sales')
ORDER BY hire_date;

# -- 7 --

SELECT 
    e.employee_id, e.first_name, p.name
FROM
    employees AS e
        JOIN
    employees_projects AS ep ON ep.employee_id = e.employee_id
        JOIN
    projects AS p ON p.project_id = ep.project_id
WHERE DATE(p.start_date) > '2002-08-13' AND p.end_date is NULL
ORDER BY e.first_name, p.name
LIMIT 5;

# -- 8 --

SELECT 
    e.employee_id,
    e.first_name,
    CASE
        WHEN YEAR(start_date) >= '2005' THEN NULL
        ELSE p.name
    END AS project_name
FROM
    employees AS e
        JOIN
    employees_projects AS ep ON ep.employee_id = e.employee_id
        JOIN
    projects AS p ON p.project_id = ep.project_id
WHERE
    e.employee_id = 24
ORDER BY project_name
LIMIT 5;

# -- 9 --

SELECT 
    e.employee_id,
    e.first_name,
    e.manager_id,
    m.first_name AS 'manager_name'
FROM
    employees AS e
JOIN employees as m ON e.manager_id = m.employee_id
WHERE e.manager_id in (3,7)
ORDER BY e.first_name;

# -- 10 --

SELECT 
    e.employee_id,
    concat(e.first_name, ' ', e.last_name) AS 'employee_name',
    concat(m.first_name, ' ', m.last_name) AS 'manager_name',
    d.name AS 'department_name'
FROM
    employees AS e
JOIN employees as m ON e.manager_id = m.employee_id
JOIN departments as d ON e.department_id = d.department_id
# WHERE e.manager_id is not NULL
ORDER BY e.employee_id
LIMIT 5;

# -- 11 --

SELECT 
    AVG(salary) AS min_avg_salary
FROM
    employees
GROUP BY department_id
ORDER BY min_avg_salary
LIMIT 1;

# -- 12 --

USE geography;

SELECT 
    mc.country_code, 
    m.mountain_range, 
    p.peak_name, 
    p.elevation
FROM
    peaks AS p
JOIN mountains as m ON m.id = p.mountain_id
JOIN mountains_countries as mc USING (mountain_id)
WHERE mc.country_code = 'BG' and p.elevation > 2835
ORDER BY p.elevation DESC;

# -- 13 --

SELECT 
    country_code, 
    COUNT(mountain_id) AS 'mountain_range'
FROM
    mountains_countries
GROUP BY country_code
HAVING country_code in ('US','RU','BG')
ORDER BY `mountain_range` DESC;

# -- 14 --

SELECT 
    c.country_name, r.river_name
FROM
    countries AS c
        LEFT JOIN
    countries_rivers AS cr USING (country_code)
        LEFT JOIN
    rivers AS r ON r.id = cr.river_id
WHERE
    c.continent_code = 'AF'
ORDER BY c.country_name
LIMIT 5;

# -- 15 --

SELECT 
    c.continent_code,
    c.currency_code,
    COUNT(c.currency_code) AS 'currency_usage'
FROM
    countries AS c
GROUP BY c.continent_code , c.currency_code
HAVING `currency_usage` > 1
    AND `currency_usage` = (SELECT 
        COUNT(*) AS 'most_used_currency'
    FROM
        countries AS c2
	WHERE c2.continent_code = c.continent_code
    GROUP BY c2.currency_code
    ORDER BY most_used_currency DESC
    LIMIT 1)
ORDER BY c.continent_code , c.currency_code;

# -- 16 --

SELECT COUNT(c.country_code) AS 'country_count' FROM countries as c 
LEFT JOIN mountains_countries as mc USING (country_code)
WHERE mc.mountain_id is NULL;

# -- 17 --

SELECT 
    c.country_name,
    MAX(p.elevation) AS 'highest_peak_elevation',
    MAX(r.length) AS 'longest_river_length'
FROM
    countries AS c
        LEFT JOIN
    mountains_countries AS mc ON c.country_code = mc.country_code
        LEFT JOIN
    peaks AS p ON mc.mountain_id = p.mountain_id
        LEFT JOIN
    countries_rivers AS cr ON cr.country_code = c.country_code
        LEFT JOIN
    rivers AS r ON r.id = cr.river_id
GROUP BY c.country_code
ORDER BY highest_peak_elevation DESC , longest_river_length DESC , c.country_name
LIMIT 5;

















