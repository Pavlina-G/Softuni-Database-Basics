SET SQL_SAFE_UPDATES=0;
UPDATE `employees` 
SET `salary` = `salary` * 1.1;
SET SQL_SAFE_UPDATES=1;

SELECT `salary` FROM `employees`;

DELETE FROM `occupancies`;
