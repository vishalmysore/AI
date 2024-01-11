# ************************************************************
# Sequel Pro SQL dump
# Version 5446
#
# https://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.7.30)
# Database: cookgpt
# Generation Time: 2023-04-16 23:38:52 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
SET NAMES utf8mb4;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table recipes
# ------------------------------------------------------------

DROP TABLE IF EXISTS `recipes`;

CREATE TABLE `recipes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `recipe_name` varchar(20) DEFAULT '',
  `contributor_name` varchar(20) DEFAULT NULL,
  `recipe_ingredients` varchar(10) DEFAULT NULL,
  `number_of_people` int(11) unsigned DEFAULT 1,
  `type` varchar(20) DEFAULT 'LUNCH',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `recipes` WRITE;
/*!40000 ALTER TABLE `recipes` DISABLE KEYS */;

INSERT INTO `recipes` (`id`, `recipe_name`, `contributor_name`, `recipe_ingredients`, `number_of_people`, `type`)
VALUES
	(1,'Paneer Butter Masala','Vishal Mysore','1 cup panner, 10 cups butter, and masala',4,'Dinner'),
	(2,'Aloo Gobhi','Ankush Hadap','10 Potato, 2 Gobhi and garam masala',2,'Dinner'),
	(3,'Onion Sambhar','Shabbir Khan','Small onion peeled, and sambhar powder',3,'Lunch'),
	(5,'masala dosa','Preeti Karan','Dosa, Potato, onion',10,'Breakfast');

/*!40000 ALTER TABLE `recipes` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  `score` int(11) DEFAULT NULL,
  `special_req` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;

INSERT INTO `users` (`id`, `name`, `score`, `special_req`)
VALUES
	(1,'Vishal Mysore',100,'Vishal is a vegetarian and he usually likes vegan food.'),
	(2,'Madhumeet Singh',70,'Madhu likes chicken Masala'),
	(3,'Stephen M',75,'Likes Non Veg food occasionaly but he is mostly vegetarin.'),
	(4,'Nitya Prakash Lanjewar',0,'Likes good breakfast mostly brunch skips lunch for gym.'),
	(5,'Arwind Wasnik',60,'Likes Potato curry.');

/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;