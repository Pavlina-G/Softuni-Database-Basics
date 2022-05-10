USE soft_uni;

# -- 1 --

DELIMITER ***
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
	SELECT first_name, last_name FROM employees 
	WHERE salary > 35000 
	ORDER BY first_name, last_name, employee_id;
END ***
DELIMITER ;

CALL usp_get_employees_salary_above_35000();

# -- 2 --

DELIMITER ***
CREATE PROCEDURE usp_get_employees_salary_above(num DECIMAL(11.4) UNSIGNED)
BEGIN
	SELECT first_name, last_name FROM employees 
	WHERE salary >= num
	ORDER BY first_name, last_name, employee_id;
END ***
DELIMITER ;

CALL usp_get_employees_salary_above(45000);

# -- 3 --

DELIMITER **
CREATE PROCEDURE usp_get_towns_starting_with(text VARCHAR(10))
BEGIN
	SELECT t.name FROM towns AS t
    WHERE LEFT(t.name, length(text)) = text
    ORDER BY t.name;
END
**

DELIMITER ;

CALL usp_get_towns_starting_with('b');

# -- 4 --

DELIMITER **
CREATE PROCEDURE usp_get_employees_from_town(town_name VARCHAR(30))
BEGIN
	SELECT e.first_name, e.last_name FROM employees AS e
    JOIN addresses AS a ON e.address_id = a.address_id
    JOIN towns AS t ON a.town_id = t.town_id
    WHERE t.name = town_name
    ORDER BY e.first_name ,e.last_name, e.employee_id;
END
**
DELIMITER ;

CALL usp_get_employees_from_town('Sofia');

# -- 5 --

DELIMITER **
CREATE FUNCTION ufn_get_salary_level(salary DECIMAL)
RETURNS VARCHAR(8)
DETERMINISTIC

BEGIN
	DECLARE result VARCHAR(8);
    SET result := (
    CASE
		WHEN salary < 30000 THEN 'Low'
		WHEN salary BETWEEN 30000 and 50000 THEN 'Average'
		WHEN 50000 < salary THEN 'High'
	END);
	RETURN result;
END
**

SELECT ufn_get_salary_level(125500.00);

# -- 6 --

CREATE FUNCTION ufn_get_salary_level(salary DECIMAL)
RETURNS VARCHAR(8)
RETURN(
    CASE
		WHEN salary < 30000 THEN 'Low'
		WHEN salary BETWEEN 30000 and 50000 THEN 'Average'
		WHEN 50000 < salary THEN 'High'
	END);

DELIMITER $$
CREATE PROCEDURE `usp_get_employees_by_salary_level`(salary_level VARCHAR(8))
BEGIN
	SELECT e.first_name,e.last_name FROM employees AS e
    WHERE ufn_get_salary_level(e.salary) = salary_level
    ORDER BY e.first_name DESC, e.last_name DESC;
END
$$
DELIMITER ;
CALL usp_get_employees_by_salary_level('High');

# -- 7 --


CREATE FUNCTION ufn_is_word_comprised(set_of_letters varchar(50), word varchar(50))
RETURNS BIT
DETERMINISTIC
RETURN REGEXP_LIKE (word, concat('^[', set_of_letters, ']+$'));

SELECT ufn_is_word_comprised('oistmiahf','Sofia');
SELECT ufn_is_word_comprised('oistmiahf','halves');
SELECT ufn_is_word_comprised('bobr','Rob');
SELECT ufn_is_word_comprised('pppp','Guy');

# -- 8 --

DELIMITER **
CREATE PROCEDURE usp_get_holders_full_name()
BEGIN
	SELECT concat(ah.first_name, ' ', ah.last_name) AS full_name FROM account_holders AS ah
    ORDER BY full_name, ah.id;
END
**
DELIMITER ;

CALL usp_get_holders_full_name();

# -- 9 --

DELIMITER **
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(number DECIMAL)
BEGIN
	SELECT ah.first_name, ah.last_name FROM account_holders AS ah
    JOIN accounts AS ac ON ac.account_holder_id = ah.id
    GROUP BY ac.account_holder_id
    HAVING sum(ac.balance) > number
    ORDER BY ac.account_holder_id;
END
**
DELIMITER ;

CALL usp_get_holders_with_balance_higher_than(7000);

# -- 10 --

DELIMITER **
CREATE FUNCTION ufn_calculate_future_value
	(sum DECIMAL(14,4), yearly_interest_rate DOUBLE, number_of_years INT)
RETURNS DECIMAL(14,4)
DETERMINISTIC
BEGIN
	DECLARE future_value DECIMAL(14,4);
    SET future_value := sum * POW((1 + yearly_interest_rate), number_of_years);
    RETURN future_value;
END
**
DELIMITER ;

SELECT ufn_calculate_future_value(123.1200, 0.1, 5);

# -- 11 --

CREATE FUNCTION ufn_calculate_future_value
	(sum DECIMAL(14,4), yearly_interest_rate DOUBLE, number_of_years INT)
RETURNS DECIMAL(14,4)
DETERMINISTIC
	RETURN sum * POW((1 + yearly_interest_rate), number_of_years);

DELIMITER **
CREATE PROCEDURE usp_calculate_future_value_for_account
	(account_id INT UNSIGNED, interest_rate DECIMAL(14,4))
BEGIN
	SELECT 
    ac.id AS account_id,
    ah.first_name,
    ah.last_name,
    ac.balance AS current_balance,
    UFN_CALCULATE_FUTURE_VALUE(ac.balance, interest_rate, 5) AS balance_in_5_years
	FROM
    account_holders AS ah
        JOIN
    accounts AS ac ON ac.account_holder_id = ah.id
    WHERE account_id = ac.id;
END
**
DELIMITER ;

CALL usp_calculate_future_value_for_account(1, 0.1);

# -- 12 --

DELIMITER **
CREATE PROCEDURE usp_deposit_money(account_id INT UNSIGNED, money_amount DECIMAL(19,4))
BEGIN
	
	IF money_amount > 0 THEN START TRANSACTION;
        UPDATE `accounts` AS ac
        SET ac.balance = ac.balance + money_amount
        WHERE ac.id = account_id;
        
        IF (SELECT ac.balance FROM `accounts` AS ac
            WHERE ac.id = account_id) < 0
            THEN ROLLBACK;
        ELSE
            COMMIT;
        END IF;
	END IF;
END
**
DELIMITER ;

CALL usp_deposit_money(1,10);

# -- 13 --

DELIMITER **
CREATE PROCEDURE usp_withdraw_money(account_id INT UNSIGNED, money_amount DECIMAL(19,4))
BEGIN
	
	IF money_amount > 0 THEN START TRANSACTION;
        UPDATE `accounts` AS ac
        SET ac.balance = ac.balance - money_amount
        WHERE ac.id = account_id;
        
        IF (SELECT ac.balance FROM `accounts` AS ac
            WHERE ac.id = account_id) < 0
            THEN ROLLBACK;
        ELSE
            COMMIT;
        END IF;
	END IF;
END
**
DELIMITER ;

CALL usp_withdraw_money(1, 10);

# -- 14 --
DELIMITER **
CREATE procedure usp_transfer_money(from_account_id INT, to_account_id INT, amount DECIMAL(19,4))
BEGIN
	IF amount > 0
		AND (SELECT ac.id FROM accounts AS ac WHERE ac.id = from_account_id) IS NOT NULL
        AND (SELECT ac.id FROM accounts AS ac WHERE ac.id = to_account_id) IS NOT NULL
        AND from_account_id != to_account_id
        AND (SELECT ac.balance FROM accounts AS ac WHERE ac.id = from_account_id) >= amount
        THEN START TRANSACTION;
        
        UPDATE accounts AS ac
        SET ac.balance = ac.balance - amount
        WHERE ac.id = from_account_id;
        
        UPDATE accounts AS ac
        SET ac.balance = ac.balance + amount
        WHERE ac.id = to_account_id;
        
        IF (SELECT ac.balance FROM accounts AS ac WHERE ac.id = from_account_id) < 0
			THEN ROLLBACK;
        ELSE
			COMMIT;
		END IF;
	END IF;
END
**
DELIMITER ;

CALL usp_transfer_money(1,2,10);

# -- 15 --

CREATE TABLE `logs` (
    log_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    account_id INT(11) NOT NULL,
    old_sum DECIMAL(19, 4) NOT NULL,
    new_sum DECIMAL(19, 4) NOT NULL
);

DELIMITER **
CREATE TRIGGER tr_balance_changes
AFTER UPDATE ON accounts
FOR EACH ROW

BEGIN
	IF old.balance != new.balance THEN 
		INSERT INTO `logs`(account_id, old_sum, new_sum) VALUES(old.id, old.balance, new.balance);
	END IF;
END
**
DELIMITER ;

CALL usp_deposit_money(1, 10);

# -- 16 --

CREATE TABLE `notification_emails` (
    `id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `recipient` INT(11) NOT NULL,
    `subject` VARCHAR(50) NOT NULL,
    `body` TEXT NOT NULL
);

DELIMITER **
CREATE TRIGGER tr_email_notification
AFTER INSERT ON `logs`
FOR EACH ROW

BEGIN
	INSERT INTO `notification_emails`(`recipient`, `subject`, `body`)
		VALUES (
        new.account_id,
        concat('Balance change for account: ', new.account_id),
        concat('On ', DATE_FORMAT(NOW(), '%b %d %Y at %r'), 
			' your balance was changed from ', new.old_sum, ' to ', new.new_sum,'.'));
END
**
DELIMITER ;
