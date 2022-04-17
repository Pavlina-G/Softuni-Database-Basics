CREATE DATABASE `car_rental`;
USE `car_rental`;

CREATE TABLE `categories`(
`id` INT PRIMARY KEY AUTO_INCREMENT, 
`category`VARCHAR(20) NOT NULL, 
`daily_rate` DOUBLE, 
`weekly_rate` DOUBLE, 
`monthly_rate` DOUBLE, 
`weekend_rate` DOUBLE
);

INSERT INTO `categories` (`category`)
VALUES ('red'), ('green'), ('white');

CREATE TABLE `cars`(
`id` INT PRIMARY KEY AUTO_INCREMENT not null, 
`plate_number`VARCHAR(20) NOT NULL, 
`make` VARCHAR(20), 
`model`VARCHAR(20), 
`car_year` YEAR, 
`category_id` INT, 
`doors` INT, 
`picture` BLOB, 
`car_condition` VARCHAR(30), 
`available` BOOLEAN
);

INSERT INTO `cars` (`plate_number`)
VALUES ('test1'),('test2'),('test3');

CREATE TABLE `employees`(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(45), 
`last_name`VARCHAR(45), 
`title` VARCHAR(45), 
`notes` TEXT
);

INSERT INTO `employees` (`first_name`, `last_name`)
VALUES ('Ivan', 'Ivanov'), ('Iva', 'Ivanova'), ('Ivon', 'Ivanova');

CREATE TABLE `customers`(
`id` INT PRIMARY KEY AUTO_INCREMENT, 
`driver_licence_number` VARCHAR(30), 
`full_name`VARCHAR(30), 
`address`VARCHAR(50), 
`city`VARCHAR(20), 
`zip_code`VARCHAR(10), 
`notes` TEXT
);

INSERT INTO `customers` (`city`)
VALUES ('Varna'), ('Sofia'), ('Burgas');

CREATE TABLE `rental_orders`(
`id` INT PRIMARY KEY AUTO_INCREMENT, 
`employee_id` INT, 
`customer_id` INT, 
`car_id`INT, 
`car_condition` VARCHAR(30), 
`tank_level` VARCHAR(20), 
`kilometrage_start` INT, 
`kilometrage_end` INT, 
`total_kilometrage` INT, 
`start_date` DATE, 
`end_date` DATE, 
`total_days` INT, 
`rate_applied` DOUBLE, 
`tax_rate` DOUBLE, 
`order_status` VARCHAR(20), 
`notes` TEXT
);

INSERT INTO `rental_orders` (`employee_id`, `customer_id`)
VALUES (1, 2), (2, 3), (3, 1);