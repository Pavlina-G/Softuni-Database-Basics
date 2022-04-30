CREATE TABLE `passports` (
    `passport_id` INT PRIMARY KEY AUTO_INCREMENT UNIQUE,
    `passport_number` VARCHAR(8) NOT NULL UNIQUE
);

CREATE TABLE `people` (
    `person_id` INT AUTO_INCREMENT UNIQUE,
    `first_name` VARCHAR(20) NOT NULL,
    `salary` DECIMAL(10 , 2 ) NOT NULL DEFAULT 0,
    `passport_id` INT UNIQUE NOT NULL
);

INSERT INTO passports (passport_id, passport_number)
VALUES 
(101, 'N34FG21B'),
(102, 'K65LO4R7'),
(103, 'ZE657QP2');

INSERT INTO people(first_name, salary, passport_id)
VALUES 
('Roberto', 43300.00, 102),
('Tom', 56100.00, 103),
('Yana', 60200.00, 101);

ALTER table `people`
ADD CONSTRAINT pk_people PRIMARY KEY (person_id),
ADD CONSTRAINT fk_passport_id FOREIGN KEY (passport_id) REFERENCES `passports`(passport_id);

CREATE TABLE `manufacturers` (
    `manufacturer_id` INT AUTO_INCREMENT UNIQUE NOT NULL,
    `name` VARCHAR(25) NOT NULL,
    `established_on` DATE NOT NULL
);

CREATE TABLE `models` (
    `model_id` INT AUTO_INCREMENT UNIQUE NOT NULL,
    `name` VARCHAR(25) NOT NULL,
    `manufacturer_id` INT NOT NULL
)  AUTO_INCREMENT=101;

INSERT INTO manufacturers (`name`, `established_on`)
	VALUES 
	('BMW', '1916-03-01'),
	('Tesla', '2003-01-01'),
	('Lada', '1966-05-01');
    
INSERT INTO models (`name`, `manufacturer_id`)
	VALUES 
	('X1', 1),
	('i6', 1),
	('Model S', 2),
	('Model X', 2),
	('Model 3', 2),
	('Nova', 3);

ALTER TABLE `manufacturers`
ADD CONSTRAINT pk_manufacturer_id PRIMARY KEY (manufacturer_id);

ALTER TABLE `models`
ADD CONSTRAINT pk_model_id PRIMARY KEY (model_id),
ADD CONSTRAINT fk_manufacturer_id FOREIGN KEY (manufacturer_id) 
REFERENCES `manufacturers`(manufacturer_id);
 
CREATE TABLE `students` (
    `student_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(25) NOT NULL
);

CREATE TABLE `exams` (
    `exam_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
)  AUTO_INCREMENT=101;

CREATE TABLE `students_exams` (
    `student_id` INT,
    `exam_id` INT,
    CONSTRAINT pk_students_exam PRIMARY KEY (student_id , exam_id),
    CONSTRAINT fk_student_id FOREIGN KEY (student_id)
        REFERENCES `students` (student_id),
    CONSTRAINT fk_exam_id FOREIGN KEY (exam_id)
        REFERENCES `exams` (exam_id)
);

INSERT INTO students (`name`)
VALUES 
('Mila'),
('Toni'),
('Ron');

INSERT INTO exams (`name`)
VALUES 
('Spring MVC'),
('Neo4j'),
('Oracle 11g');

INSERT INTO students_exams (student_id, exam_id)
VALUES
(1, 101),
(1, 102),
(2, 101),
(3, 103),
(2, 102),
(2, 103);

CREATE TABLE `teachers` (
    `teacher_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(20) NOT NULL,
    `manager_id` INT DEFAULT NULL
)  AUTO_INCREMENT=101;

INSERT INTO `teachers` (`name`, `manager_id`)
VALUES
('John', NULL),
('Maya',106),
('Silvia',106),
('Ted',105),
('Mark',101),
('Greta',101);

ALTER TABLE teachers
ADD CONSTRAINT fk_manager_teacher_id FOREIGN KEY (manager_id)  REFERENCES teachers (teacher_id);

# -- 5

CREATE DATABASE `online_store`;
USE online_store;

CREATE TABLE `item_types` (
    `item_type_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `items` (
    `item_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `item_type_id` INT,
    CONSTRAINT fk_item_type_id FOREIGN KEY (item_type_id)
        REFERENCES item_types (item_type_id)
);

CREATE TABLE `cities` (
    `city_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `customers` (
    `customer_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL,
    `birthday` DATE,
    `city_id` INT,
    CONSTRAINT fk_city_id FOREIGN KEY (city_id)
        REFERENCES cities (city_id)
);

CREATE TABLE `orders` (
    `order_id` INT PRIMARY KEY AUTO_INCREMENT,
    `customer_id` INT,
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
);

CREATE TABLE `order_items` (
    `order_id` INT,
    `item_id` INT,
    CONSTRAINT pk_order_item PRIMARY KEY (order_id , item_id),
    CONSTRAINT fk_item_id FOREIGN KEY (item_id)
        REFERENCES items (item_id),
    CONSTRAINT fk_order_id FOREIGN KEY (order_id)
        REFERENCES orders (order_id)
);

# -- 6

CREATE DATABASE `university`;
USE university;

CREATE TABLE `subjects` (
    `subject_id` INT PRIMARY KEY AUTO_INCREMENT,
    `subject_name` VARCHAR(50) NOT NULL
);

CREATE TABLE `majors` (
    `major_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(50) NOT NULL
);

CREATE TABLE `students` (
    `student_id` INT PRIMARY KEY AUTO_INCREMENT,
    `student_number` VARCHAR(12) NOT NULL UNIQUE,
    `student_name` VARCHAR(50) NOT NULL,
    `major_id` INT,
    CONSTRAINT fk_majors FOREIGN KEY (major_id)
        REFERENCES majors (major_id)
);

CREATE TABLE `agenda` (
    `student_id` INT,
    `subject_id` INT,
    CONSTRAINT pk_agenda PRIMARY KEY (student_id , subject_id),
    CONSTRAINT fk_student_id FOREIGN KEY (student_id)
        REFERENCES students (student_id),
    CONSTRAINT fk_subject_id FOREIGN KEY (subject_id)
        REFERENCES subjects (subject_id)
);

CREATE TABLE `payments` (
    `payment_id` INT PRIMARY KEY AUTO_INCREMENT,
    `payment_date` DATE DEFAULT (CURRENT_DATE) ,
    `payment_amount` DECIMAL(8 , 2 ) NOT NULL,
    `student_id` INT,
    CONSTRAINT fk_payment_students FOREIGN KEY (student_id)
        REFERENCES students (student_id)
);

# -- 9

USE geography;

SELECT 
    mountain_range, peak_name, elevation
FROM
    peaks AS p
        JOIN
    mountains AS m ON p.mountain_id = m.id
WHERE mountain_range = 'Rila'
ORDER BY elevation DESC;






