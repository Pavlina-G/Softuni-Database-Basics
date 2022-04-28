USE gringotts;
SELECT 
    COUNT(id) AS 'count'
FROM
    wizzard_deposits;
    
SELECT 
    MAX(magic_wand_size) AS 'longest_magic_wand'
FROM
    wizzard_deposits;
    
SELECT 
    deposit_group, MAX(magic_wand_size) AS 'longest_magic_wand'
FROM
    wizzard_deposits
GROUP BY deposit_group
ORDER BY `longest_magic_wand`, deposit_group;

SELECT 
    deposit_group
FROM
    wizzard_deposits
GROUP BY deposit_group
HAVING min(magic_wand_size) LIMIT 1;

SELECT 
    deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM
    wizzard_deposits
GROUP BY deposit_group
ORDER BY total_sum;

SELECT 
    deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM
    wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
ORDER BY deposit_group;

SELECT 
    deposit_group, SUM(deposit_amount) AS 'total_sum'
FROM
    wizzard_deposits
WHERE magic_wand_creator = 'Ollivander family'
GROUP BY deposit_group
HAVING total_sum < 150000
ORDER BY total_sum DESC;

SELECT 
    deposit_group,
    magic_wand_creator,
    MIN(deposit_charge) AS 'min_deposit_charge'
FROM
    wizzard_deposits
GROUP BY deposit_group , magic_wand_creator
ORDER BY magic_wand_creator, deposit_group;

SELECT 
CASE
	WHEN age between 0 and 10 THEN '[0-10]'
	WHEN age between 11 and 20 THEN '[11-20]'
	WHEN age between 21 and 30 THEN '[21-30]'
	WHEN age between 31 and 40 THEN '[31-40]'
	WHEN age between 41 and 50 THEN '[41-50]'
	WHEN age between 51 and 60 THEN '[51-60]'
	WHEN age > 60 THEN '[61+]'
END AS 'age_group',
    COUNT(id) AS 'wizard_count'
FROM
    wizzard_deposits
GROUP BY age_group
ORDER BY age_group;

SELECT 
    SUBSTR(first_name, 1, 1) AS 'first_letter'
FROM
    wizzard_deposits
WHERE
    deposit_group = 'Troll Chest'
GROUP BY first_letter
ORDER BY first_letter;

SELECT 
    deposit_group,
    is_deposit_expired,
    AVG(deposit_interest) AS 'average_interest'
FROM
    wizzard_deposits
WHERE deposit_start_date > '1985-01-01'
GROUP BY deposit_group, is_deposit_expired
ORDER BY deposit_group DESC, is_deposit_expired;

