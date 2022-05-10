CREATE DATABASE sgd;
USE sgd;

# -- 1 -- Table Design

CREATE TABLE addresses(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL
);

CREATE TABLE categories(
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(10) NOT NULL
);

CREATE TABLE offices (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`workspace_capacity` INT NOT NULL,
`website` VARCHAR(50),
`address_id` INT NOT NULL,
CONSTRAINT `fk_address_id` FOREIGN KEY (address_id) REFERENCES addresses(id)
);

CREATE TABLE employees (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`first_name` VARCHAR(30) NOT NULL,
`last_name` VARCHAR(30) NOT NULL,
`age` INT NOT NULL,
`salary` DECIMAL(10,2) NOT NULL,
`job_title` VARCHAR(20) NOT NULL,
`happiness_level` CHAR(1) NOT NULL
);

CREATE TABLE teams (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(40) NOT NULL,
`office_id` INT NOT NULL,
`leader_id` INT NOT NULL UNIQUE,
CONSTRAINT `fk_office_id` FOREIGN KEY (office_id) REFERENCES offices(id),
CONSTRAINT `fk_leader_id` FOREIGN KEY (leader_id) REFERENCES employees(id)
);

CREATE TABLE games (
`id` INT PRIMARY KEY AUTO_INCREMENT,
`name` VARCHAR(50) NOT NULL UNIQUE,
`description` TEXT,
`rating` FLOAT DEFAULT 5.5 NOT NULL,
`budget` DECIMAL(10,2) NOT NULL,
`release_date` DATE,
`team_id` INT NOT NULL,
CONSTRAINT `fk_team_id` FOREIGN KEY (team_id) REFERENCES teams(id)
);

CREATE TABLE games_categories (
`game_id` INT NOT NULL,
`category_id` INT NOT NULL,
CONSTRAINT `pk_game_category_id` PRIMARY KEY (game_id, category_id),
CONSTRAINT `fk_game_id` FOREIGN KEY (game_id) REFERENCES games(id),
CONSTRAINT `fk_category_id` FOREIGN KEY (category_id) REFERENCES categories(id)
);

# -- insert into tables --

insert into addresses (`name`) values ('6422 Kenwood Street'),
('263 Glendale Lane'),
('781 Luster Junction'),
('1 Express Parkway'),
('42 Eggendart Trail'),
('3569 Canary Lane'),
('713 Brown Point'),
('253 Carpenter Plaza'),
('78859 Mifflin Place'),
('0 Arkansas Center'),
('8868 Arkansas Parkway'),
('29 Dunning Avenue'),
('5 New Castle Terrace'),
('411 Pankratz Court'),
('75 Harper Way'),
('118 Nelson Plaza'),
('42 Del Sol Court'),
('80315 Sherman Lane'),
('2 Bluejay Parkway'),
('33901 Pond Circle'),
('3 Homewood Circle'),
('6776 Village Green Court'),
('8 Kinsman Avenue'),
('575 Homewood Alley'),
('0938 Vermont Junction'),
('03632 Carey Trail'),
('0922 Stang Circle'),
('1930 Quincy Trail'),
('432 Elka Hill'),
('2 Spaight Alley'),
('4442 Heffernan Drive'),
('53533 Novick Pass'),
('50 Mesta Road'),
('90 Summer Ridge Lane'),
('241 Burning Wood Plaza'),
('6507 Burrows Way'),
('5 8th Avenue'),
('2 Brown Drive'),
('92 Memorial Park'),
('036 Stuart Pass'),
('13 Maryland Road'),
('10 Jenna Park'),
('33097 Rieder Pass'),
('31314 Butterfield Lane'),
('78 Hollow Ridge Junction'),
('008 Heffernan Center'),
('9 Marcy Court'),
('121 Miller Junction'),
('906 Buhler Hill'),
('6 Evergreen Way'),
('86530 Dovetail Park'),
('31 Bartillon Way'),
('88229 Norway Maple Court'),
('5 Sunbrook Point'),
('5667 Brentwood Alley'),
('887 Rieder Way'),
('9324 Shopko Alley'),
('699 Alpine Alley'),
('29 Beilfuss Center'),
('801 Brickson Park Avenue'),
('811 Maywood Parkway'),
('415 2nd Center'),
('46688 Sherman Park'),
('60044 Bayside Pass'),
('43 Schurz Park'),
('20605 Helena Lane'),
('9 Mesta Lane'),
('5 Homewood Trail'),
('33 Prentice Junction'),
('51 Algoma Crossing'),
('22058 Northland Trail'),
('6751 Village Place'),
('67 Twin Pines Center'),
('1 School Court'),
('3696 Elmside Lane'),
('22 Riverside Drive'),
('1018 Manufacturers Court'),
('937 Montana Plaza'),
('266 Dayton Street'),
('1 West Center'),
('8887 Artisan Pass'),
('9131 Everett Alley'),
('1 Nancy Trail'),
('04 La Follette Pass'),
('25 Marquette Point'),
('444 Golden Leaf Place'),
('31773 Spenser Avenue'),
('271 Clemons Hill'),
('0 Service Place'),
('833 Waxwing Drive'),
('32104 Cottonwood Road'),
('4736 Monica Point'),
('6 Namekagon Court'),
('7 Hollow Ridge Hill'),
('50 Texas Crossing'),
('49099 Manitowish Court'),
('49 Parkside Way'),
('000 Tomscot Lane'),
('74 Main Road'),
('260 Sullivan Hill');



insert into offices (workspace_capacity, website, address_id) 
values 
(12, 'https://noaa.com', 1),
(13, 'https://123-reg.co.uk', 72),
(11, 'http://barnesandnoble.com', 96),
(3, 'https://dyndns.org', 85),
(6, 'https://rambler.ru', 53),
(13, NULL, 90),
(8, 'http://rakuten.co.jp', 51),
(4, 'https://icq.com', 16),
(12, 'https://csmonitor.com', 22),
(12, 'http://fotki.com', 2),
(18, 'http://sourceforge.net', 42),
(7, 'https://narod.ru', 100),
(16, 'https://engadget.com', 43),
(20, 'http://marriott.com', 70),
(13, 'https://squarespace.com', 52),
(10, 'http://salon.com', 38),
(15, 'https://home.pl', 53),
(7, 'https://narod.ru', 76),
(17, 'http://java.com', 36),
(1, 'https://amazon.com', 52),
(15, 'https://issuu.com', 51),
(7, 'https://google.co.jp', 44),
(13, 'http://yale.edu', 93),
(7, NULL, 80),
(11, 'https://china.com.cn', 93),
(3, 'https://ucla.edu', 98),
(14, 'https://mail.ru', 50),
(9, 'http://time.com', 10),
(5, 'http://jugem.jp', 72),
(2, NULL, 34),
(13, 'http://mediafire.com', 53),
(5, 'http://cbsnews.com', 27),
(3, 'https://ebay.com', 75),
(9, 'https://msu.edu', 39),
(16, 'http://woothemes.com', 96),
(19, NULL, 96),
(20, 'http://wunderground.com', 29),
(7, 'http://google.com.hk', 96),
(12, 'http://un.org', 70),
(2, 'http://hc360.com', 11),
(18, 'https://microsoft.com', 70),
(11, 'https://dell.com', 4),
(5, 'https://nbcnews.com', 21),
(16, 'https://smugmug.com', 78),
(4, NULL, 38),
(12, 'https://google.nl', 74),
(5, 'https://disqus.com', 7),
(17, 'http://ucoz.com', 54),
(5, 'http://alibaba.com', 5),
(6, 'http://so-net.ne.jp', 87),
(16, 'https://yolasite.com', 14),
(17, 'https://list-manage.com', 75),
(7, 'http://miibeian.com.cn', 63),
(2, 'http://prnewswire.com', 34),
(8, 'http://google.es', 5),
(7, 'http://themeforest.net', 65),
(20, 'https://census.com', 61),
(7, NULL, 81),
(9, 'https://google.com.hk', 35),
(10, 'https://telegraph.co.uk', 86),
(13, 'https://edublogs.org', 25),
(16, 'http://addthis.com', 16),
(19, 'https://sogou.com', 18),
(11, 'https://hc360.com', 13),
(5, 'http://bing.com', 2),
(1, 'http://economist.com', 15),
(17, NULL, 74),
(4, 'https://google.com.br', 30),
(20, 'http://ca.com', 62),
(15, 'https://aboutads.info', 55),
(6, 'https://networksolutions.com', 36),
(11, 'https://arstechnica.com', 72),
(2, 'http://vimeo.com', 32),
(20, 'https://last.fm', 13),
(19, 'http://squidoo.com', 84),
(4, 'http://1und1.de', 45),
(4, 'http://thetimes.co.uk', 69),
(4, 'https://rediff.com', 6),
(18, 'https://nyu.edu', 86),
(6, 'http://cbslocal.com', 45),
(6, 'http://who.int', 68),
(20, 'http://miibeian.com.cn', 95),
(20, 'https://ucoz.ru', 92),
(3, NULL, 54),
(18, 'https://state.tx.us', 69),
(6, 'http://ucoz.ru', 23),
(20, 'http://pcworld.com', 82),
(4, 'https://tmall.com', 96),
(7, 'http://friendfeed.com', 96),
(16, 'https://bandcamp.com', 32),
(2, 'http://opensource.org', 66),
(14, 'http://xrea.com', 97),
(11, 'http://ftc.com', 40),
(1, 'https://virginia.edu', 29),
(15, 'http://github.io', 88),
(6, NULL, 35),
(5, 'https://businessinsider.com', 42),
(10, 'https://chicagotribune.com', 74),
(9, 'http://engadget.com', 40),
(19, 'https://ted.com', 2);


insert into employees (first_name, last_name, age, salary, job_title, happiness_level) 
values 
('Garrett', 'Jocelyn', 30, 1378.71, 'Marketing Specialist', 'L'),
('Brent', 'Juschke', 49, 7354.62, 'Quality Assurance', 'L'),
('Roddie', 'Keenor', 33, 8149.56, 'Designer', 'L'),
('Mendy', 'Wallsam', 21, 2729.75, 'Sales Manager', 'L'),
('Craig', 'Rouzet', 32, 5740.32, 'Designer', 'L'),
('Yancy', 'Driutti', 51, 5488.8, 'Designer', 'H'),
('Abie', 'Gedling', 42, 3554.27, 'Developer', 'H'),
('Ximenez', 'Adair', 60, 2709.99, 'Developer', 'H'),
('Hube', 'Doxey', 48, 4689.4, 'Designer', 'N'),
('Euell', 'Braferton', 41, 6023.58, 'Quality Assurance', 'L'),
('Say', 'Kennally', 31, 6555.27, 'Sales Manager', 'H'),
('Cosimo', 'Sains', 45, 5248.58, 'Designer', 'N'),
('Robbert', 'Dumphry', 58, 7015.62, 'Developer', 'N'),
('Baron', 'Sange', 20, 8866.37, 'Developer', 'H'),
('Thayne', 'Cleave', 19, 6339.87, 'Marketing Specialist', 'H'),
('Killie', 'Messager', 46, 2040.65, 'Designer', 'L'),
('Zachery', 'Pennyman', 39, 3643.7, 'Quality Assurance', 'L'),
('Braden', 'Kropp', 47, 2387.78, 'Quality Assurance', 'L'),
('Boigie', 'Mitchenson', 49, 4294.42, 'Developer', 'H'),
('Eldon', 'Dot', 46, 1321.13, 'Quality Assurance', 'N'),
('Urbain', 'Gosenell', 48, 4685.49, 'Developer', 'N'),
('Merv', 'Flegg', 21, 2552.65, 'Marketing Specialist', 'H'),
('Morie', 'Bocking', 48, 6157.99, 'Marketing Specialist', 'N'),
('Erl', 'Prise', 50, 3391.95, 'Sales Manager', 'N'),
('Jeremiah', 'Fenning', 39, 2321.64, 'Marketing Specialist', 'H'),
('Rodge', 'Wyleman', 55, 4643.7, 'Sales Manager', 'L'),
('Flory', 'Iacoviello', 25, 2661.84, 'Designer', 'N'),
('Ernesto', 'Longfellow', 55, 3879.13, 'Sales Manager', 'L'),
('Curry', 'Saph', 50, 6238.83, 'Designer', 'N'),
('Panchito', 'McGavigan', 44, 3533.3, 'Designer', 'L'),
('Godwin', 'Seares', 35, 8148.57, 'Marketing Specialist', 'N'),
('Luther', 'Doohey', 52, 2548.86, 'Sales Manager', 'N'),
('Norman', 'Digby', 30, 2173.33, 'Marketing Specialist', 'H'),
('Yul', 'Boulger', 31, 6338.81, 'Developer', 'L'),
('Rodolphe', 'Qualtro', 53, 7519.98, 'Quality Assurance', 'H'),
('Bartie', 'Havers', 60, 2362.16, 'Designer', 'H'),
('Alasdair', 'Gellert', 57, 7767.34, 'Sales Manager', 'N'),
('Carleton', 'McDonough', 46, 8575.86, 'Marketing Specialist', 'H'),
('Shaun', 'Attaway', 54, 3391.57, 'Designer', 'N'),
('Ewart', 'Divis', 46, 3011.93, 'Designer', 'H'),
('Horacio', 'Bullough', 30, 4104.59, 'Designer', 'H'),
('Hilton', 'Prosek', 27, 8019.54, 'Quality Assurance', 'N'),
('Corney', 'Bradberry', 27, 4158.55, 'Designer', 'L'),
('Rourke', 'Gibby', 23, 1898.14, 'Quality Assurance', 'H'),
('Harris', 'Coger', 36, 8006.17, 'Marketing Specialist', 'H'),
('Danny', 'Tourner', 51, 7644.67, 'Designer', 'H'),
('Homerus', 'Spurway', 32, 4939.19, 'Marketing Specialist', 'N'),
('Tyler', 'Claeskens', 32, 2765.31, 'Designer', 'N'),
('Zack', 'Renvoys', 44, 3792.32, 'Quality Assurance', 'H'),
('Quinlan', 'Sill', 51, 8685.01, 'Sales Manager', 'L'),
('Waite', 'Ferrotti', 54, 4054.63, 'Designer', 'H'),
('Eldredge', 'Pitcaithly', 53, 7891.94, 'Quality Assurance', 'N'),
('Will', 'Stoner', 60, 6765.47, 'Quality Assurance', 'N'),
('Tybalt', 'Date', 57, 4437.35, 'Developer', 'H'),
('Herbert', 'Vedeneev', 36, 1949.03, 'Quality Assurance', 'H'),
('Addie', 'O''Crigane', 23, 3348.03, 'Quality Assurance', 'N'),
('Barron', 'Zanneli', 48, 1572.28, 'Quality Assurance', 'L'),
('Zelig', 'MacCaughen', 33, 8218.11, 'Marketing Specialist', 'H'),
('Elston', 'Lote', 30, 2991.39, 'Marketing Specialist', 'H'),
('Roley', 'Robertz', 45, 8987.87, 'Marketing Specialist', 'L'),
('Rustin', 'Ozelton', 49, 8687.97, 'Sales Manager', 'L'),
('Hanson', 'Goricke', 27, 5950.6, 'Developer', 'L'),
('Janos', 'Middlewick', 27, 5743.85, 'Developer', 'H'),
('Sylvester', 'Lorens', 55, 2766.35, 'Designer', 'L'),
('Mannie', 'Caizley', 19, 5027.7, 'Designer', 'H'),
('Reilly', 'Coady', 22, 5420.82, 'Developer', 'N'),
('Aldo', 'Winslade', 57, 3272.52, 'Designer', 'L'),
('Vittorio', 'Clamo', 35, 3898.16, 'Developer', 'H'),
('Dino', 'Haimes', 54, 2915.28, 'Developer', 'N'),
('Sly', 'Doggerell', 48, 8349.05, 'Developer', 'L'),
('Cole', 'Bernhardt', 41, 5388.68, 'Designer', 'L'),
('Kristo', 'Kornacki', 42, 6015.71, 'Quality Assurance', 'L'),
('Montague', 'Vasilyev', 44, 6106.15, 'Marketing Specialist', 'H'),
('Esteban', 'Tayler', 53, 4239.94, 'Marketing Specialist', 'N'),
('Gasparo', 'Housbie', 60, 5326.48, 'Designer', 'N'),
('Brook', 'Pochon', 40, 5824.02, 'Sales Manager', 'L'),
('Hodge', 'Merioth', 38, 2497.54, 'Designer', 'L'),
('Kelbee', 'Rubinsky', 56, 8523.78, 'Sales Manager', 'H'),
('Mario', 'Cartmill', 50, 2451.53, 'Developer', 'N'),
('Josias', 'Fawltey', 60, 6085.74, 'Developer', 'L'),
('Hilly', 'Hastilow', 45, 3028.38, 'Quality Assurance', 'N'),
('Mateo', 'Hartill', 40, 1496.71, 'Quality Assurance', 'N'),
('Grady', 'Sukbhans', 29, 2101.56, 'Sales Manager', 'L'),
('Lorrie', 'Dowbiggin', 55, 3597.91, 'Sales Manager', 'N'),
('Jarrod', 'Manilo', 19, 7157.66, 'Sales Manager', 'L'),
('Jerome', 'Rickardsson', 46, 6490.99, 'Designer', 'H'),
('Garey', 'Bowry', 59, 8518.95, 'Developer', 'H'),
('Isidro', 'enzley', 33, 8784.27, 'Sales Manager', 'H'),
('Lorrie', 'Macenzy', 42, 3417.03, 'Developer', 'H'),
('Bartolemo', 'Falla', 21, 6535.56, 'Quality Assurance', 'L'),
('Archambault', 'Robak', 34, 5091.71, 'Marketing Specialist', 'L'),
('Bondon', 'Toquet', 20, 1289.9, 'Quality Assurance', 'H'),
('Errick', 'Jerrems', 59, 2586.39, 'Developer', 'L'),
('Sergeant', 'Markushkin', 53, 1882.6, 'Marketing Specialist', 'H'),
('Rustin', 'Grievson', 21, 1853.72, 'Quality Assurance', 'L'),
('Lombard', 'Preedy', 53, 5258.89, 'Developer', 'H'),
('Gaylor', 'Umbert', 46, 2532.08, 'Marketing Specialist', 'L'),
('Gare', 'Handy', 54, 7763.83, 'Developer', 'L'),
('Dick', 'Bard', 20, 5193.83, 'Sales Manager', 'N'),
('Lesley', 'Drinan', 42, 4602.99, 'Sales Manager', 'N');


insert into teams (`name`, office_id, leader_id) 
values 
('Lemke and Sons', 55, 80),
('Thiel', 8, 59),
('Kulas-Hansen', 21, 100),
('Oberbrunner-Christiansen', 16, 35),
('Ortiz, Kunze and Kovacek', 40, 56),
('Pfannerstill and Sons', 97, 55),
('Rodriguez Group', 68, 66),
('Bayer and Sons', 62, 5),
('Cummings, Torphy and Schuster', 34, 90),
('Orn, Beahan and Wisozk', 75, 99),
('Hirthe-Schiller', 53, 63),
('Stracke-Greenfelder', 34, 38),
('Emmerich-Jacobs', 74, 29),
('Hessel, Hammes and Goldner', 32, 46),
('McLaughlin', 5, 68),
('Swift-Boehm', 98, 28),
('McClure, Terry and Hudson', 98, 41),
('Ondricka-Borer', 57, 98),
('Legros-Braun', 66, 97),
('O''Kon-Mosciski', 78, 67),
('Jacobi, Gleason and Swift', 79, 13),
('Deckow Group', 80, 73),
('Boyer-Langworth', 34, 42),
('Pagac-Keebler', 82, 85),
('Padberg-Armstrong', 80, 71),
('Collier', 81, 61),
('Dickinson', 7, 48),
('Shields Group', 93, 27),
('Goldner', 53, 11),
('Gaylord, Watsica and Dare', 73, 30),
('Gulgowski, Smith and Ward', 91, 54),
('Bartoletti-King', 11, 86),
('Kessler-Denesik', 24, 88),
('Jenkins-Kiehn', 57, 96),
('Boyer, Stamm and Schinner', 100, 10),
('Koss-Bauch', 57, 40),
('Schowalter', 10, 26),
('Koch-Lemke', 90, 72),
('Nienow and Sons', 33, 52),
('O''Hara', 29, 89),
('Langworth-Wisoky', 20, 1),
('Kiehn, Olson and Hessel', 71, 84),
('Kuhic-Lebsack', 71, 2),
('Homenick-Miller', 28, 15),
('Erdman, Hauck and Jaskolski', 36, 3),
('Medhurst-Kihn', 14, 12),
('Kuhic-Rippin', 66, 47),
('Harber', 97, 6),
('Wintheiser', 65, 4),
('Yundt', 60, 93),
('Rohan Group', 37, 7),
('Crona, Raynor and Kemmer', 45, 95),
('Bauch-Ledner', 54, 78),
('Schulist-Bednar', 85, 74),
('Hayes-Crooks', 92, 8),
('Rempel-O''Kon', 34, 9),
('Lueilwitz-Mertz', 55, 14),
('Roob, Mann and Goldner', 87, 16),
('Weissnat-Wolf', 85, 23),
('Hoeger Group', 38, 94),
('Walsh, Trantow and Torphy', 75, 53),
('Hills Group', 43, 17),
('Lowe Group', 53, 18),
('Flatley Group', 89, 19),
('Heaney, Rempel and Moen', 67, 79),
('Heidenreich, Legros and Swift', 66, 20),
('Langworth and Sons', 84, 36),
('Kohler, Kiehn and Fadel', 84, 21),
('Hessel-Grady', 41, 22),
('Stokes, Schmidt and Trantow', 80, 24),
('O''Reilly-Blick', 47, 25),
('Oberbrunner-Dibbert', 92, 31),
('Watsica Group', 81, 32),
('Kautzer, Lakin and Pollich', 91, 33),
('Cole, Homenick and Jacobson', 76, 92),
('Morar, Smitham and Hermann', 3, 37),
('Metz, Jacobi and Koepp', 72, 43),
('Abbott, Deckow and Goyette', 91, 34),
('Hammes and Sons', 41, 39),
('DuBuque-Johnson', 48, 44),
('Dibbert', 48, 45),
('Feeney, Sauer and Tremblay', 74, 49),
('Trantow', 47, 62),
('Wehner-Nienow', 14, 50),
('Armstrong', 35, 51),
('Spencer and Sons', 78, 57),
('Simonis-Hermann', 82, 58),
('Williamson-Dietrich', 97, 60),
('Reilly', 23, 64),
('Johnson', 18, 65),
('Romaguera, Bernhard and Gislason', 93, 69),
('Toy, Ruecker and Treutel', 65, 70),
('Kuphal', 74, 75),
('Donnelly and Sons', 18, 76),
('Smith-Fisher', 43, 77),
('Yost Group', 22, 81),
('Haag-Kovacek', 88, 82),
('Schulist', 66, 83),
('Conroy, Hettinger and Yost', 87, 87),
('Bergnaum', 32, 91);


INSERT INTO `categories` (`name`)
VALUES
('Action'),
('Adventure'),
('MMORPG'),
('Simulation'),
('Strategy'),
('Sports'),
('Puzzle');


insert into games (name, description, rating, budget, release_date, team_id) 
values 
('Latlux', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.', 3.7, 89401.46, '2022-01-29', 72),
('Quo Lux', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.', 9.6, 23384.32, '2022-06-26', 65),
('Lotstring', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 6.8, 79821.47, NULL, 79),
('Wrapsafe', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 6.6, 92971.73, '2020-09-17', 51),
('Sub-Ex', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 5.6, 35350.5, NULL, 36),
('Fixflex', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.', 5.5, 34951.86, '2020-03-22', 37),
('Ventosanzap 2', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 3.2, 73846.64, '2020-02-20', 42),
('Lotlux', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.
Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 6.3, 61331.39, NULL, 35),
('Fix San 2', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 5.2, 16242.79, '2021-05-30', 81),
('Sonsing', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.
In congue. Etiam justo. Etiam pretium iaculis justo.', 6.1, 50685.01, '2022-01-16', 23),
('Fintone', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.
Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 8.7, 91340.04, '2020-03-28', 87),
('Voyatouch', 'Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 1.7, 23080.08, '2020-10-07', 16),
('Fix San', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 5.0, 44287.39, '2021-01-09', 98),
('Trippledex', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 6.5, 66920.31, '2021-03-29', 57),
('Flowdesk', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.
In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 5.5, 33708.36, '2022-02-08', 89),
('Aerified', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.
Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 4.9, 45226.05, '2021-06-30', 46),
('Veribet', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 5.8, 65446.8, '2020-11-19', 82),
('Kanlam 2', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio. Curabitur convallis.
Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 4.1, 40325.42, NULL, 85),
('Alpha', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 3.8, 91970.55, '2021-05-17', 77),
('Kanlam', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.
Sed ante. Vivamus tortor. Duis mattis egestas metus.', 7.0, 49514.29, '2021-04-04', 19),
('Rank', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.
Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1.7, 24439.28, '2022-06-13', 14),
('Zaam-Dox', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 6.4, 63646.72, '2020-08-20', 77),
('Mat Lam Tam 2', 'Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.
Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 7.9, 96580.86, '2022-08-21', 58),
('Bitwolf', 'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.
Maecenas ut massa quis augue luctus tincidunt. Nulla mollis molestie lorem. Quisque ut erat.', 8.1, 26587.93, '2022-12-25', 56),
('Tempsoft', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 5.3, 35542.85, '2021-08-14', 3),
('Stringtough', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 4.8, 37570.46, '2020-01-25', 85),
('Mat Lam Tam 3', 'Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 4.5, 37002.59, NULL, 15),
('Ventosanzap', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.', 6.2, 34920.9, '2021-07-12', 71),
('Ronstring', 'Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 4.7, 49057.54, '2022-08-09', 62),
('Mat Lam Tam', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 6.8, 74530.22, '2022-09-22', 18),
('Y-find', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.
Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.', 7.3, 11469.36, '2020-10-22', 42),
('Bitwolf 2', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.
Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 3.9, 22118.41, NULL, 64),
('Greenlam', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 7.0, 44811.09, '2022-01-31', 25),
('Y-Solowarm', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.
Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.', 1.0, 15455.15, '2020-11-03', 46),
('Daltfresh', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 9.4, 86012.38, '2021-06-17', 7),
('Kanlam 3', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.
Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.', 1.8, 54112.65, '2021-04-28', 29),
('Regrant', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.
Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 7.2, 13300.82, NULL, 20),
('Tin', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Mauris viverra diam vitae quam. Suspendisse potenti.
Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 3.7, 83951.94, '2022-04-09', 34),
('Voyatouch 2', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.', 6.4, 26354.83, '2022-12-26', 59),
('Bamity', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.
Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 3.2, 12389.81, '2020-11-01', 61),
('Solarbreeze', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.
Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 2.8, 91561.91, '2022-04-12', 8),
('Stim', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.
Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 3.9, 57537.81, '2020-11-17', 34),
('It', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.', 9.5, 18162.56, '2021-03-10', 33),
('Duobam', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 2.6, 99478.02, '2022-06-02', 63),
('Hatity', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.
Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 4.3, 14793.8, '2020-01-15', 75),
('Tin 2', 'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Proin risus. Praesent lectus.', 8.2, 78460.12, NULL, 81),
('Wrapsafe 2', 'Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.
In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.', 8.4, 14563.41, '2021-02-14', 39),
('Sub-Ex 2', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 7.7, 32161.45, '2020-01-12', 80),
('Regrant 2', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 1.0, 34530.92, '2021-05-04', 98),
('Veribet 2', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.', 9.8, 19327.3, '2020-12-11', 62),
('Sonair', 'Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.
Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 5.9, 30698.57, '2021-08-22', 34),
('Tampflex', 'Phasellus in felis. Donec semper sapien a libero. Nam dui.
Proin leo odio, porttitor id, consequat in, consequat ut, nulla. Sed accumsan felis. Ut at dolor quis odio consequat varius.', 8.1, 53882.32, '2020-06-25', 67),
('Latlux 2', 'Sed ante. Vivamus tortor. Duis mattis egestas metus.
Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 8.0, 69112.72, '2021-09-26', 22),
('Y-find 2', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.
Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 7.5, 29648.75, '2022-03-01', 22),
('Latlux 3', 'Quisque porta volutpat erat. Quisque erat eros, viverra eget, congue eget, semper rutrum, nulla. Nunc purus.', 8.5, 48845.5, '2020-11-12', 67),
('Latlux 4', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 7.5, 34692.45, NULL, 61),
('Subin', 'Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 6.5, 32393.43, '2021-09-12', 83),
('Zontrax', 'Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 4.7, 26980.72, '2022-09-18', 87),
('Cookley', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 3.0, 87434.27, '2022-09-25', 15),
('Sonsing 2', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.
Duis bibendum. Morbi non quam nec dui luctus rutrum. Nulla tellus.', 5.8, 40325.29, '2021-11-22', 16),
('Span', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 8.5, 47468.36, '2022-06-05', 20),
('Hatity 2', 'Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.
Curabitur at ipsum ac tellus semper interdum. Mauris ullamcorper purus sit amet nulla. Quisque arcu libero, rutrum ac, lobortis vel, dapibus at, diam.', 7.4, 22380.21, '2020-08-03', 43),
('Job', 'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.
Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum. Integer a nibh.', 2.2, 90943.27, '2021-07-25', 28),
('Home Ing', 'Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.
Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 8.0, 48997.55, '2020-08-14', 20),
('Sub-Ex 3', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.
Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 2.5, 60085.4, '2020-12-27', 34),
('Lotlux 2', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.
Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.', 2.5, 54971.31, NULL, 93),
('Temp', 'Vestibulum quam sapien, varius ut, blandit non, interdum in, ante. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Duis faucibus accumsan odio. Curabitur convallis.
Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 9.7, 98442.72, '2020-01-14', 62),
('Veribet 3', 'Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 9.4, 64838.29, '2022-11-05', 27),
('Y-Solowarm 2', 'In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 2.4, 39963.99, '2022-02-28', 34),
('Sub-Ex 4', 'Quisque id justo sit amet sapien dignissim vestibulum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Nulla dapibus dolor vel est. Donec odio justo, sollicitudin ut, suscipit a, feugiat et, eros.', 4.2, 42446.16, '2021-10-18', 53),
('Home Ing 2', 'Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.
In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 6.8, 47152.28, '2020-03-25', 56),
('Treeflex', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 1.7, 12621.76, '2022-08-16', 78),
('Regrant 3', 'Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.
Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.', 3.8, 82009.35, '2022-02-10', 47),
('Tin 3', 'Sed sagittis. Nam congue, risus semper porta volutpat, quam pede lobortis ligula, sit amet eleifend pede libero quis orci. Nullam molestie nibh in lectus.
Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.', 2.3, 48816.73, '2022-06-08', 49),
('Ventosanzap 3', 'Proin eu mi. Nulla ac enim. In tempor, turpis nec euismod scelerisque, quam turpis adipiscing lorem, vitae mattis nibh ligula nec sem.
Duis aliquam convallis nunc. Proin at turpis a pede posuere nonummy. Integer non velit.', 8.0, 62099.85, '2022-01-26', 2),
('Quo Lux 2', 'Integer ac leo. Pellentesque ultrices mattis odio. Donec vitae nisi.
Nam ultrices, libero non mattis pulvinar, nulla pede ullamcorper augue, a suscipit nulla elit ac nulla. Sed vel enim sit amet nunc viverra dapibus. Nulla suscipit ligula in lacus.', 8.0, 98591.25, '2020-03-13', 100),
('Hatity 3', 'Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.
Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 1.2, 64615.49, '2020-04-17', 44),
('Tin 4', 'In congue. Etiam justo. Etiam pretium iaculis justo.
In hac habitasse platea dictumst. Etiam faucibus cursus urna. Ut tellus.', 6.3, 60442.72, '2021-08-11', 96),
('Regrant 4', 'Fusce consequat. Nulla nisl. Nunc nisl.', 4.3, 47770.13, '2021-07-22', 52),
('Y-find 3', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.
Sed ante. Vivamus tortor. Duis mattis egestas metus.', 6.8, 33607.04, '2022-12-07', 16),
('Temp 2', 'Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.
Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.', 4.2, 56005.14, '2021-12-31', 29),
('Stringtough 2', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
Etiam vel augue. Vestibulum rutrum rutrum neque. Aenean auctor gravida sem.', 1.6, 98149.78, NULL, 60),
('Aerified 2', 'In sagittis dui vel nisl. Duis ac nibh. Fusce lacus purus, aliquet at, feugiat non, pretium quis, lectus.
Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst.', 7.7, 37922.17, '2021-01-26', 16),
('Zontrax 2', 'Aliquam quis turpis eget elit sodales scelerisque. Mauris sit amet eros. Suspendisse accumsan tortor quis turpis.
Sed ante. Vivamus tortor. Duis mattis egestas metus.', 7.6, 21210.55, '2020-12-12', 62),
('Andalax', 'Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.
Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 4.4, 44996.23, '2022-05-27', 13),
('Zathin', 'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est.
Phasellus sit amet erat. Nulla tempus. Vivamus in felis eu sapien cursus vestibulum.', 3.5, 86746.64, '2022-01-27', 21),
('Bitchip', 'Aenean fermentum. Donec ut mauris eget massa tempor convallis. Nulla neque libero, convallis eget, eleifend luctus, ultricies eu, nibh.', 2.4, 96216.14, '2020-01-06', 57),
('Asoka', 'Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.', 4.0, 44916.45, '2022-11-21', 7),
('Lotstring 2', 'In hac habitasse platea dictumst. Morbi vestibulum, velit id pretium iaculis, diam erat fermentum justo, nec condimentum neque sapien placerat ante. Nulla justo.', 5.5, 43876.68, '2022-05-15', 97),
('Overhold', 'Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.
Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.', 2.8, 38945.85, '2021-08-31', 58),
('Keylex', 'Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae, Mauris viverra diam vitae quam. Suspendisse potenti.
Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.', 3.6, 99474.85, '2021-09-26', 88),
('Kanlam 4', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.', 3.8, 75933.36, '2021-11-05', 74),
('Viva', 'In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.
Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 3.2, 27744.26, '2020-04-08', 7),
('Zamit', 'Curabitur gravida nisi at nibh. In hac habitasse platea dictumst. Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem.
Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.', 9.6, 25908.12, NULL, 6),
('Gembucket', 'Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.', 2.7, 94054.61, '2020-08-29', 81),
('Y-find 4', 'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.
Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim. Lorem ipsum dolor sit amet, consectetuer adipiscing elit.', 2.7, 71189.17, '2021-10-24', 4),
('Y-find 5', 'Praesent blandit. Nam nulla. Integer pede justo, lacinia eget, tincidunt eget, tempus vel, pede.', 3.6, 68297.33, '2021-01-12', 86),
('Stim 2', 'Fusce consequat. Nulla nisl. Nunc nisl.', 4.4, 92278.5, '2021-01-10', 2),
('Konklux', 'Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.
Fusce consequat. Nulla nisl. Nunc nisl.', 1.5, 97409.64, '2021-12-30', 77),
('Cardguard', 'Aenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.', 6.0, 33193.16, '2020-12-19', 48);


insert into games_categories (game_id, category_id) values (50, 7),
(24, 7),
(42, 6),
(12, 4),
(50, 6),
(100, 6),
(78, 4),
(56, 3),
(18, 4),
(71, 5),
(9, 1),
(3, 2),
(66, 6),
(87, 4),
(98, 3),
(4, 2),
(65, 6),
(9, 5),
(76, 7),
(36, 3),
(85, 2),
(26, 3),
(62, 1),
(16, 1),
(95, 7),
(92, 7),
(1, 3),
(58, 5),
(55, 4),
(74, 1),
(47, 2),
(88, 5),
(100, 3),
(79, 7),
(31, 6),
(52, 6),
(49, 7),
(77, 2),
(28, 6),
(100, 1),
(25, 1),
(22, 6),
(7, 7),
(62, 7),
(79, 1),
(94, 7),
(54, 4),
(94, 1),
(40, 6),
(31, 7),
(68, 3),
(11, 3),
(93, 5),
(91, 4),
(67, 7),
(3, 1),
(5, 7),
(99, 4),
(85, 6),
(59, 7),
(77, 4),
(64, 4),
(81, 1),
(1, 1),
(58, 3),
(30, 2),
(22, 5),
(98, 4),
(4, 7),
(51, 5),
(5, 1),
(17, 2),
(81, 6),
(89, 7),
(42, 5),
(55, 2),
(38, 3),
(25, 7),
(47, 3),
(14, 2),
(48, 6),
(23, 4),
(23, 2),
(41, 3),
(60, 2),
(43, 3),
(55, 1),
(91, 2),
(12, 5),
(17, 1),
(36, 7),
(96, 4),
(98, 2),
(94, 5),
(60, 5),
(68, 2),
(17, 3),
(86, 5),
(36, 5),
(31, 5);

# -- 2 -- Insert

INSERT INTO games (`name`, rating, budget, team_id) 
SELECT lower(reverse(substr(t.name, 2))), t.id , (t.leader_id * 1000), t.id 
FROM teams AS t
WHERE t.id BETWEEN 1 and 9;

# -- 3 -- Update

UPDATE `employees` AS e
JOIN teams AS t ON t.leader_id = e.id
SET salary = salary + 1000
WHERE age < 40 AND salary < 5000 AND e.id = t.leader_id;

# -- 4 -- Delete


DELETE FROM games AS g
WHERE g.release_date is NULL and g.id not in (SELECT gc.game_id FROM games_categories AS gc);

# -- 5 -- Employees

SELECT first_name, last_name, age, salary, happiness_level FROM employees
ORDER BY salary, id;

# -- 6 -- Addresses of the teams

SELECT t.name, a.name, length(a.name) FROM teams AS t
JOIN offices AS o ON t.office_id = o.id
JOIN addresses AS a ON a.id =  o.address_id
WHERE o.website IS NOT NULL
ORDER BY t.name, a.name;

# -- 7 -- Categories Info

SELECT 
	c.name, 
    COUNT(gc.game_id) AS games_count,
    round(avg(g.budget),2) AS avg_budget,
    max(g.rating) AS max_rating
FROM categories AS c
JOIN games_categories AS gc ON c.id = gc.category_id
JOIN games AS g on g.id = gc.game_id
GROUP BY c.name
HAVING max_rating >= 9.5
ORDER BY games_count DESC, c.name;

# -- 8 -- Games of 2022

SELECT
	g.name, 
    release_date, 
    concat(substr(description, 1, 10),'...' ) AS summary, 
    concat('Q',quarter(g.release_date)) AS `quarter`, 
    t.name AS team_name
FROM games AS g
JOIN teams as t ON g.team_id = t.id
WHERE year(release_date) = 2022 AND month(release_date) IN (2,4,6,8,10,12) AND g.name LIKE '%2'
ORDER BY quarter;

# -- 9 -- Full info for games

SELECT
	g.name,
    if(budget < 50000, 'Normal budget', 'Insufficient budget') AS budget_level,
    t.name AS team_name,
    a.name AS address_name 
FROM games as g
JOIN teams as t ON g.team_id = t.id
JOIN offices as o ON o.id = t.office_id
JOIN addresses as a ON a.id = o.address_id
LEFT JOIN games_categories as gc on gc.game_id = g.id
WHERE g.release_date IS NULL and g.id not in (SELECT gc.game_id FROM games_categories AS gc)
ORDER BY g.name;

# -- 10 -- Find all basic information for a game
CREATE FUNCTION udf_game_info_by_name(game_name VARCHAR(20))
RETURNS TEXT
DETERMINISTIC
RETURN 
	concat_ws(' ', 'The', (SELECT g.name FROM games AS g WHERE g.name = game_name
    ), 'is developed by a', (SELECT t.name FROM teams AS t
    JOIN games AS g on g.team_id = t.id
    JOIN offices as o ON o.id = t.office_id
	JOIN addresses as a ON a.id = o.address_id
    WHERE g.name = game_name), 'in an office with an address', (SELECT a.name FROM addresses AS a
    JOIN offices as o ON o.address_id = a.id
    JOIN teams AS t on o.id = t.office_id
    JOIN games AS g ON g.team_id = t.id
    WHERE g.name = game_name));

SELECT udf_game_info_by_name('Bitwolf');
SELECT udf_game_info_by_name('Fix San') AS info;
SELECT udf_game_info_by_name('Job') AS info;

# -- 11 -- Update budget of the games

DELIMITER **
CREATE PROCEDURE udp_update_budget(min_game_rating FLOAT)
BEGIN
	UPDATE games AS g
    SET
		g.budget = g.budget + 100000,
        g.release_date = ADDDATE(g.release_date, INTERVAL 1 YEAR)
	WHERE g.id not in (SELECT gc.game_id FROM games_categories AS gc)
		AND g.release_date IS NOT NULL and g.rating > min_game_rating;
END
**
DELIMITER ;

CALL udp_update_budget (8);

