DROP DATABASE saloon;
CREATE DATABASE saloon;
USE saloon;


DROP TABLE IF EXISTS USERS;
CREATE TABLE USERS (
	ID SERIAL PRIMARY KEY,
	firstname VARCHAR(255),
	lastname VARCHAR(255),
	birthday DATE,
	telephone INT(10),
	nick_name VARCHAR(255),
	EMAIL VARCHAR(255), 
	adress VARCHAR(255)
);

ALTER TABLE USERS
ADD index (nick_name);

INSERT INTO `USERS` (`ID`, `firstname`, `lastname`, `birthday`, `telephone`, `nick_name`, `EMAIL`, `adress`) VALUES ('1', 'Antonia', 'Runolfsdottir', '2017-05-18', 440, 'alias', 'seichmann@example.com', 'Iceland');
INSERT INTO `USERS` (`ID`, `firstname`, `lastname`, `birthday`, `telephone`, `nick_name`, `EMAIL`, `adress`) VALUES ('2', 'Nannie', 'Eichmann', '2016-11-20', 24, 'rerum', 'markus12@example.org', 'Saint Barthelemy');
INSERT INTO `USERS` (`ID`, `firstname`, `lastname`, `birthday`, `telephone`, `nick_name`, `EMAIL`, `adress`) VALUES ('3', 'Amani', 'Borer', '2015-05-11', 686736, 'distinctio', 'fromaguera@example.org', 'Turks and Caicos Islands');
INSERT INTO `USERS` (`ID`, `firstname`, `lastname`, `birthday`, `telephone`, `nick_name`, `EMAIL`, `adress`) VALUES ('4', 'Kellen', 'Jast', '2013-05-31', 647, 'autem', 'dconroy@example.net', 'Saint Martin');
INSERT INTO `USERS` (`ID`, `firstname`, `lastname`, `birthday`, `telephone`, `nick_name`, `EMAIL`, `adress`) VALUES ('5', 'Augustus', 'Muller', '2015-11-27', 188, 'ut', 'salma58@example.com', 'Martinique');
INSERT INTO `USERS` (`ID`, `firstname`, `lastname`, `birthday`, `telephone`, `nick_name`, `EMAIL`, `adress`) VALUES ('6', 'Breana', 'Bradtke', '2015-10-02', 602, 'magnam', 'brice@example.net', 'Papua New Guinea');
INSERT INTO `USERS` (`ID`, `firstname`, `lastname`, `birthday`, `telephone`, `nick_name`, `EMAIL`, `adress`) VALUES ('7', 'Reynold', 'Kunze', '2020-04-10', 307370, 'pariatur', 'kreiger.jeromy@example.com', 'Guernsey');
INSERT INTO `USERS` (`ID`, `firstname`, `lastname`, `birthday`, `telephone`, `nick_name`, `EMAIL`, `adress`) VALUES ('8', 'Jess', 'Gulgowski', '2018-03-21', 1, 'ratione', 'drake12@example.com', 'Marshall Islands');
INSERT INTO `USERS` (`ID`, `firstname`, `lastname`, `birthday`, `telephone`, `nick_name`, `EMAIL`, `adress`) VALUES ('9', 'Vito', 'Murphy', '2017-10-25', 335565, 'dicta', 'erobel@example.com', 'Uruguay');
INSERT INTO `USERS` (`ID`, `firstname`, `lastname`, `birthday`, `telephone`, `nick_name`, `EMAIL`, `adress`) VALUES ('10', 'D\'angelo', 'Dickinson', '2013-09-12', 860956, 'dolore', 'kulas.alvera@example.com', 'Christmas Island');

DROP TABLE IF EXISTS masters;
CREATE TABLE masters(
	ID SERIAL PRIMARY KEY,
	adress VARCHAR(255) NOT NULL,
	possible_date date NOT NULL,
	name VARCHAR(255) UNIQUE NOT NULL,
	price INT(100) NOT NULL,
	index(name),
	index(adress)
	);

INSERT INTO `masters` (`ID`, `adress`, `possible_date`, `name`, `price`) VALUES ('1', 'UAO', '2021-02-15', 'Josefina', 1000);
INSERT INTO `masters` (`ID`, `adress`, `possible_date`, `name`, `price`) VALUES ('2', 'ZAO', '2021-03-09', 'Angelita', 999);
INSERT INTO `masters` (`ID`, `adress`, `possible_date`, `name`, `price`) VALUES ('3', 'VAO', '2021-02-14', 'Opal', 1500);
INSERT INTO `masters` (`ID`, `adress`, `possible_date`, `name`, `price`) VALUES ('4', 'TSAO', '2021-02-13', 'Janet', 2000);
INSERT INTO `masters` (`ID`, `adress`, `possible_date`, `name`, `price`) VALUES ('5', 'SAO', '2021-02-16', 'Ocie', 2300);
INSERT INTO `masters` (`ID`, `adress`, `possible_date`, `name`, `price`) VALUES ('6', 'SVAO', '2021-02-23', 'Twila', 300);
INSERT INTO `masters` (`ID`, `adress`, `possible_date`, `name`, `price`) VALUES ('7', 'SZAO', '2021-02-13', 'Ivah', 500);
INSERT INTO `masters` (`ID`, `adress`, `possible_date`, `name`, `price`) VALUES ('8', 'UVAO', '2021-02-18', 'Everette', 5000);
INSERT INTO `masters` (`ID`, `adress`, `possible_date`, `name`, `price`) VALUES ('9', 'UZAO', '2021-02-17', 'Daniela', 3000);
INSERT INTO `masters` (`ID`, `adress`, `possible_date`, `name`, `price`) VALUES ('10', 'Zelenograd', '2021-02-19', 'Berenice', 1700);

DROP TABLE IF EXISTS profiles;
CREATE TABLE profiles (
	ID SERIAL PRIMARY KEY,
	account INT(250),
	history_order INT(12),
	user_level INT(12),
	future_order INT(12),
	FOREIGN KEY (ID) REFERENCES  USERS(ID)
	);

INSERT INTO `profiles` VALUES 
('1','20000','5','2','4'),
('2','50000','5','3','4'),
('3','10000','5','2','4'),
('4','90000','5','5','8'),
('5','250000','5','1','6'),
('6','80000','5','4','7'),
('7','60000','5','2','6'),
('8','70000','5','2','5'),
('9','150000','5','2','0'),
('10','20000','5','0','8'); 
	
DROP TABLE IF EXISTS preferences;
CREATE TABLE preferences (
	ID SERIAL PRIMARY KEY,
	reviews tinyint(1) default NULL,
	`level` int(5),
	CONSTRAINT `which_users_pref` FOREIGN KEY (`ID`) REFERENCES `USERS` (`ID`),
	CONSTRAINT `which_masters` FOREIGN KEY (`ID`) REFERENCES `masters` (`ID`)
	);


INSERT INTO `preferences` VALUES
('1','1','1'),
('2','0','2'),
('3','1','1'),
('4','0','2'),
('5','1','3'),
('6','0','2'),
('7','1','1'),
('8','0','3'),
('9','1','2'),
('10','0','1'); 
	
	

DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`(
	ID SERIAL PRIMARY KEY,
	manicure tinyint(1) default NULL,
	pedicure tinyint(1) default NULL,
	haircut tinyint(1) default NULL,
	painting tinyint(1) default NULL,
	CONSTRAINT `which_kind_masters` FOREIGN KEY (`ID`) REFERENCES `masters` (`ID`)
	);

INSERT INTO `types` VALUES 
('1','2','3','2','1'),
('2','1','2','3','2'),
('3','2','3','4','4'),
('4','2','3','1','1'),
('5','1','2','3','3'),
('6','2','2','1','1'),
('7','2','1','3','4'),
('8','5','5','5','5'),
('9','5','5','5','5'),
('10','1','1','1','1'); 

--


	
DROP TABLE IF EXISTS details_masters;
CREATE TABLE details_masters(
	ID SERIAL PRIMARY KEY,
	freedom_today INT(100) NOT NULL,
	freedom_tomorrow INT(100) NOT NULL,
	freedom_after_tomorrow INT(100) NOT NULL,
	smoke CHAR(1),
	positive CHAR(1),
	reviews CHAR(1),
	`level` int(1),
	FOREIGN KEY (ID) REFERENCES  `types`(ID),
	FOREIGN KEY (`ID`) REFERENCES `masters` (`ID`)
	);

INSERT INTO `details_masters` (`ID`, `freedom_today`, `freedom_tomorrow`, `freedom_after_tomorrow`, `smoke`, `positive`, `reviews`, `level`) VALUES ('1', '0', '2', '0', '0', '1', '1', '4');
INSERT INTO `details_masters` (`ID`, `freedom_today`, `freedom_tomorrow`, `freedom_after_tomorrow`, `smoke`, `positive`, `reviews`, `level`) VALUES ('2', '1', '2', '1', '1', '1', '0', '5');
INSERT INTO `details_masters` (`ID`, `freedom_today`, `freedom_tomorrow`, `freedom_after_tomorrow`, `smoke`, `positive`, `reviews`, `level`) VALUES ('3', '2', '3', '0','0', '1', '1', '4');
INSERT INTO `details_masters` (`ID`, `freedom_today`, `freedom_tomorrow`, `freedom_after_tomorrow`, `smoke`, `positive`, `reviews`, `level`) VALUES ('4', '3', '4','1', '1', '1', '0', '3');
INSERT INTO `details_masters` (`ID`, `freedom_today`, `freedom_tomorrow`, `freedom_after_tomorrow`, `smoke`, `positive`, `reviews`, `level`) VALUES ('5', '1', '2', '0', '0', '1', '1', '4');
INSERT INTO `details_masters` (`ID`, `freedom_today`, `freedom_tomorrow`, `freedom_after_tomorrow`, `smoke`, `positive`, `reviews`, `level`) VALUES ('6', '2', '5', '1', '1', '1', '0', '3');
INSERT INTO `details_masters` (`ID`, `freedom_today`, `freedom_tomorrow`, `freedom_after_tomorrow`, `smoke`, `positive`, `reviews`, `level`) VALUES ('7', '3', '3', '0', '0', '0', '1', '5');
INSERT INTO `details_masters` (`ID`, `freedom_today`, `freedom_tomorrow`, `freedom_after_tomorrow`, `smoke`, `positive`, `reviews`, `level`) VALUES ('8', '4', '3', '1','1', '0', '0', '3');
INSERT INTO `details_masters` (`ID`, `freedom_today`, `freedom_tomorrow`, `freedom_after_tomorrow`, `smoke`, `positive`, `reviews`, `level`) VALUES ('9', '1', '3', '0', '1', '0', '0', '4');
INSERT INTO `details_masters` (`ID`, `freedom_today`, `freedom_tomorrow`, `freedom_after_tomorrow`, `smoke`, `positive`, `reviews`, `level`) VALUES ('10', '1', '2', '1', '0', '0', '1', '3');


DROP TABLE IF EXISTS orders;
CREATE TABLE orders(
	ID SERIAL PRIMARY KEY,
	user_name VARCHAR(255),
	master_id bigint(20) unsigned NOT NULL,
	date_order date,
	pay_info CHAR(1) NOT NULL,
	FOREIGN KEY (`ID`) REFERENCES `USERS` (`ID`),
	FOREIGN KEY (`ID`) REFERENCES `masters` (`ID`)
	);



INSERT INTO `orders` (`ID`, `user_name`, `master_id`, `date_order`, `pay_info`) VALUES 
('1','alias','7','2023-04-22','1'),
('2','rerum','5','2020-08-08','1'),
('3','distinctio','5','2020-05-12','1'),
('4','autem','3','2021-02-06','1'),
('5','ut','4','2020-03-05','1'),
('6','magnam','1','2020-10-25','0'),
('7','pariatur','8','2021-05-26','1'),
('8','ratione','6','2020-02-08','1'),
('9','dicta','2','2020-01-18','0'),
('10','dolore','7','2022-06-28','0');


DROP TABLE IF EXISTS revievs;
CREATE TABLE revievs(
    ID SERIAL PRIMARY KEY,
	reviev_text VARCHAR(255),
	master_scale INT(1),
	recomends INT(1),
	CONSTRAINT `which_users` FOREIGN KEY (`ID`) REFERENCES `users` (`ID`),
	CONSTRAINT `which_masters_about` FOREIGN KEY (`ID`) REFERENCES `masters` (`ID`)
	);

INSERT INTO `revievs` VALUES 
('1','Good.','4','2'),
('2','Very good.','9','5'),
('3','Good good.','9','5'),
('4','So so.','6','2'),
('5','The best.','4','9'),
('6','Middle.','8','6'),
('7','Happy.','1','6'),
('8','The worst.','3','4'),
('9','Great.','9','9'),
('10','Bored.','6','4'); 




DROP TABLE IF EXISTS services;
CREATE TABLE services(
	masters_id_services SERIAL PRIMARY KEY,
	washing tinyint(1) default NULL,
	clear tinyint(1) default NULL,
	sell tinyint(1) default NULL,
	massage tinyint(1) default NULL,
	talking tinyint(1) default NULL,
	CONSTRAINT `which_masters_services` FOREIGN KEY (`masters_id_services`) REFERENCES `masters`(`ID`)
	);

INSERT INTO `services` VALUES 
('1','1','1','1','1','0'),
('2','1','0','0','1','0'),
('3','0','1','1','0','0'),
('4','1','0','1','1','0'),
('5','0','1','1','0','0'),
('6','1','0','0','1','0'),
('7','0','0','1','0','0'),
('8','1','1','0','1','0'),
('9','0','1','0','0','0'),
('10','0','1','0','0','0');

DROP TABLE IF EXISTS salon;
CREATE TABLE salon(
	ID SERIAL PRIMARY KEY,
	name_salon VARCHAR(255),
	text_about_salon VARCHAR(2550),
	`created_at` datetime DEFAULT current_timestamp(),
	country VARCHAR(255),
	city VARCHAR(255),
	CONSTRAINT `which_masters_adress` FOREIGN KEY (ID) REFERENCES `masters`(ID),
	CONSTRAINT `which_user_recomend` FOREIGN KEY (ID) REFERENCES USERS(ID)
	);

INSERT INTO `salon` VALUES 
('1','debitis','Qualitatively, quickly, despite the difficulties that have arisen due to non-standard furniture sizes. Everything works fine) thanks a lot.','1997-06-17 07:19:10','UAO','Binsview'),
('2','sunt','I am very grateful for the conscientious, accurate and high-quality work! Alexey installed an entrance steel door and two interior doors. Everywhere there were their own peculiarities 
and difficulties, the master quickly and competently found reasonable solutions without quality and appearance, for which special thanks! Polite, responsible specialist. I will definitely apply again!.','1972-08-19 03:47:59','ZAO','Pacochaside'),
('3','asperiores','Neat, polite master. Work done, thank you very much for your help!.','1988-06-13 19:51:58','VAO','Runolfssonhaven'),
('4','ut','A competent specialist, he did everything neatly and quickly.','2007-05-25 12:48:35','TSAO','Alverastad'),
('5','officiis','Fast. Good. I happy with everything','2013-02-13 20:45:57','SAO','Jonesside'),
('6','labore','A wonderful master with golden hands! I will recommend it to everyone with a clear conscience!','2009-04-04 13:14:40','SVAO','Imeldachester'),
('7','ipsam','Hardworking and attentive masters of their craft!','1991-06-22 19:19:58','SZAO','Hassanport'),
('8','temporibus','A good master, he arrived quickly, he did the job with high quality.','2017-01-28 16:59:16','UVAO','Justiceville'),
('9','temporibus','I liked the master, no comments, but the price turned out to be more expensive..','1995-05-04 10:47:50','UZAO','North Kelton'),
('10','quaerat','All is well. I am pleased with the work of the master. Everything was fine.','2002-12-26 10:36:08','Zelenograd','Margaretestad'); 

