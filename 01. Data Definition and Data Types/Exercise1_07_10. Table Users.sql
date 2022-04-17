CREATE TABLE `users` (
`id` INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
`username` VARCHAR(30) NOT NULL,
`password` VARCHAR(26) NOT NULL,
`profile_picture` VARBINARY(900), 
`last_login_time` DATETIME,
`is_deleted` BOOLEAN
);

INSERT INTO `users` (`username`, `password`)
VALUES ('Test1', 'Pass'), ('Test2', 'Pass'),('Test3', 'Pass'),
('Test4', 'Pass'), ('Test5', 'Pass');

ALTER TABLE `users`
DROP PRIMARY KEY,
ADD CONSTRAINT pk_2 PRIMARY KEY `users` (`id`,`username`);

ALTER TABLE `users`
CHANGE COLUMN `last_login_time` `last_login_time` DATETIME DEFAULT NOW();

ALTER TABLE `users`
DROP PRIMARY KEY, 
ADD CONSTRAINT pk_users PRIMARY KEY `users`(`id`), 
CHANGE COLUMN `username` `username` VARCHAR(30) UNIQUE NOT NULL;




