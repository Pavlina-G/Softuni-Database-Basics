SELECT `name`, DATE(`start`) as 'start' FROM games
WHERE year(start) BETWEEN 2011 and 2012
ORDER BY start, `name` LIMIT 50;

SELECT `name`, substr(`start`, 1, 10) FROM games
WHERE year(start) BETWEEN 2011 and 2012
ORDER BY start, `name` LIMIT 50;

SELECT user_name, substr(email, locate('@', email) + 1) as email_provider from users
ORDER BY email_provider, user_name;

SELECT user_name, ip_address FROM users
WHERE ip_address LIKE '___.1%.%.___'
ORDER BY user_name;

SELECT `name` as 'game',
CASE
	WHEN (hour(start) between 0 and 11) THEN 'Morning'
	WHEN (hour(start) between 12 and 17) THEN 'Afternoon'
	ELSE 'Evening'
END AS 'Part of the Day',
CASE
	WHEN duration <= 3 THEN 'Extra Short'
    WHEN duration between 4 and 6 THEN 'Short'
    WHEN duration between 7 and 10 THEN 'Long'
    ELSE 'Extra Long'
END AS 'Duration' FROM games;

