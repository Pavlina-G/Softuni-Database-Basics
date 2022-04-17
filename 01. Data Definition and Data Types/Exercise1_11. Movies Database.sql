CREATE DATABASE `movies`;
USE `movies`;

CREATE TABLE `directors`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
`director_name` VARCHAR(45) NOT NULL, 
`notes` TEXT
);

INSERT INTO `directors`(`director_name`, `notes`)
VALUES 
('TestName1', 'TestNotes'),
('TestName2', 'TestNotes'),
('TestName3', 'TestNotes'),
('TestName4', 'TestNotes'),
('TestName5', 'TestNotes');

CREATE TABLE `genres`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
`genre_name` VARCHAR(25) NOT NULL, 
`notes` TEXT
);

INSERT INTO `genres`(`genre_name`, `notes`)
VALUES 
('TestName1', 'TestNotes'),
('TestName2', 'TestNotes'),
('TestName3', 'TestNotes'),
('TestName4', 'TestNotes'),
('TestName5', 'TestNotes');

CREATE TABLE `categories`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
`category_name` VARCHAR(25) NOT NULL, 
`notes` TEXT
);

INSERT INTO `categories`(`category_name`, `notes`)
VALUES 
('TestName1', 'TestNotes'),
('TestName2', 'TestNotes'),
('TestName3', 'TestNotes'),
('TestName4', 'TestNotes'),
('TestName5', 'TestNotes');

CREATE TABLE `movies`(
`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL, 
`title` VARCHAR(45) NOT NULL,
`director_id` INT,
`copyright_year` YEAR,
`length` TIME,
`genre_id` INT,
`category_id`INT,
`rating` DECIMAL(2,1),
`notes` TEXT
);

INSERT INTO `movies` (`title`)
VALUES 
('TestMovie1'),
('TestMovie2'),
('TestMovie3'),
('TestMovie4'),
('TestMovie5');
 