-- MySQL dump 10.13  Distrib 8.2.0, for macos14.0 (x86_64)
--
-- Host: 127.0.0.1    Database: biav01
-- ------------------------------------------------------
-- Server version	8.2.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `cart_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `last_modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cart_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=887 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (841,NULL,'2023-12-28 14:21:29'),(842,NULL,'2023-12-28 14:21:34'),(843,NULL,'2023-12-28 14:21:45'),(844,NULL,'2023-12-28 14:21:51'),(845,NULL,'2023-12-28 14:21:53'),(846,NULL,'2023-12-28 14:21:55'),(847,NULL,'2023-12-28 14:21:56'),(848,NULL,'2023-12-28 14:21:57'),(849,NULL,'2023-12-28 14:21:58'),(850,NULL,'2023-12-30 14:11:57'),(851,NULL,'2023-12-30 14:12:04'),(852,NULL,'2023-12-30 14:12:07'),(853,NULL,'2023-12-30 14:12:15'),(854,NULL,'2023-12-30 14:12:19'),(855,NULL,'2023-12-30 14:12:20'),(856,NULL,'2023-12-30 14:12:22'),(857,NULL,'2023-12-30 14:12:24'),(858,NULL,'2023-12-30 14:12:40'),(859,NULL,'2023-12-30 14:12:43'),(860,NULL,'2023-12-30 14:12:45'),(861,NULL,'2023-12-30 14:12:53'),(862,NULL,'2023-12-30 14:12:54'),(863,NULL,'2023-12-30 14:12:55'),(864,NULL,'2023-12-30 14:12:57'),(865,NULL,'2023-12-30 14:12:59'),(866,NULL,'2023-12-30 14:13:14'),(867,NULL,'2023-12-30 14:13:15'),(868,NULL,'2023-12-30 14:13:16'),(869,3,'2023-12-31 00:04:38'),(870,NULL,'2023-12-30 21:39:46'),(871,NULL,'2023-12-30 21:39:46'),(872,NULL,'2023-12-30 21:40:08'),(873,NULL,'2023-12-30 22:10:24'),(874,NULL,'2023-12-30 22:10:28'),(875,NULL,'2023-12-30 22:10:30'),(876,NULL,'2023-12-30 22:35:53'),(877,NULL,'2023-12-30 22:44:55'),(878,NULL,'2023-12-30 22:44:57'),(879,NULL,'2023-12-30 22:47:35'),(880,NULL,'2023-12-30 22:47:37'),(881,NULL,'2023-12-30 22:47:42'),(882,NULL,'2023-12-30 22:47:44'),(883,NULL,'2023-12-30 22:48:05'),(884,NULL,'2023-12-30 22:48:06'),(885,NULL,'2023-12-31 00:04:42'),(886,NULL,'2023-12-31 00:04:44');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `cart_item_id` int NOT NULL AUTO_INCREMENT,
  `product_id` int NOT NULL,
  `cart_id` int NOT NULL,
  `count` int NOT NULL,
  PRIMARY KEY (`cart_item_id`),
  UNIQUE KEY `product_id` (`product_id`,`cart_id`),
  KEY `cart_id` (`cart_id`),
  CONSTRAINT `cart_item_ibfk_1` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cart_item_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (31,3,869,2);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category_id` smallint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(100) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` varchar(500) COLLATE utf8mb4_czech_ci NOT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Kategorie poznámek';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,'Amazon Kindle','Čtečka knih Amazon Kindle vám umožní vzít si celou domácí knihovnu s sebou na cesty, a to vše v jediném lehoučkém kompaktním zařízení. Celou sbírku svých oblíbených titulů tak můžete nosit stále u sebe, čímž odpadá těžké rozhodování, kterou knihu přibalit do již přeplněných zavazadel. '),(2,'PocketBook','Pokud se chystáte pořídit Ebook čtečky PocketBook, je zde pár aspektů, které pomohou ke zvolení toho správného produktu.'),(3,'S podsvíceným displejem','Čtečky knih s podsvíceným displejem.'),(4,'Příslušenství','Příslušenství ke čtečkám elektronických knih.');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `forgotten_password`
--

DROP TABLE IF EXISTS `forgotten_password`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `forgotten_password` (
  `forgotten_password_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `code` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`forgotten_password_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `forgotten_password_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `forgotten_password`
--

LOCK TABLES `forgotten_password` WRITE;
/*!40000 ALTER TABLE `forgotten_password` DISABLE KEYS */;
INSERT INTO `forgotten_password` VALUES (1,1,'k1lgd81ugt','2023-12-25 16:02:37'),(2,1,'8fq8eluobd','2023-12-25 16:03:17');
/*!40000 ALTER TABLE `forgotten_password` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `role_id` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `resource_id` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  `action` varchar(100) COLLATE utf8mb4_czech_ci NOT NULL,
  `type` set('allow','deny') COLLATE utf8mb4_czech_ci NOT NULL DEFAULT 'allow',
  PRIMARY KEY (`permission_id`),
  UNIQUE KEY `role_id` (`role_id`,`resource_id`,`action`,`type`),
  KEY `permission_ibfk_1` (`resource_id`),
  CONSTRAINT `permission_ibfk_1` FOREIGN KEY (`resource_id`) REFERENCES `resource` (`resource_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `permission_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
INSERT INTO `permission` VALUES (22,'admin','Admin:Category','','allow'),(21,'admin','Admin:Dashboard','','allow'),(24,'admin','Admin:Product','','allow'),(12,'admin','Category','','allow'),(23,'admin','Product','','allow'),(28,'authenticated','Admin:Product','','allow'),(38,'authenticated','Front:About','','allow'),(39,'authenticated','Front:Cart','','allow'),(36,'authenticated','Front:Contact','','allow'),(4,'authenticated','Front:Error','','allow'),(5,'authenticated','Front:Error4xx','','allow'),(6,'authenticated','Front:Homepage','','allow'),(41,'authenticated','Front:Order','','allow'),(34,'authenticated','Front:Product','','allow'),(9,'authenticated','Front:User','login','allow'),(10,'authenticated','Front:User','logout','allow'),(27,'authenticated','Product','','allow'),(26,'guest','Admin:Product','','allow'),(37,'guest','Front:About','','allow'),(40,'guest','Front:Cart','','allow'),(35,'guest','Front:Contact','','allow'),(1,'guest','Front:Error','','allow'),(2,'guest','Front:Error4xx','','allow'),(3,'guest','Front:Homepage','','allow'),(42,'guest','Front:Order','','allow'),(33,'guest','Front:Product','','allow'),(15,'guest','Front:User','facebookLogin','allow'),(13,'guest','Front:User','forgottenPassword','allow'),(7,'guest','Front:User','login','allow'),(8,'guest','Front:User','logout','allow'),(11,'guest','Front:User','register','allow'),(14,'guest','Front:User','renewPassword','allow'),(25,'guest','Product','','allow');
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `product_id` int NOT NULL AUTO_INCREMENT,
  `category_id` smallint unsigned DEFAULT NULL,
  `title` varchar(100) COLLATE utf8mb4_czech_ci NOT NULL,
  `url` varchar(100) COLLATE utf8mb4_czech_ci NOT NULL,
  `description` text COLLATE utf8mb4_czech_ci NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `photo_extension` varchar(10) COLLATE utf8mb4_czech_ci NOT NULL,
  `recommend` tinyint(1) NOT NULL DEFAULT '0',
  `stock` int DEFAULT '0',
  PRIMARY KEY (`product_id`),
  UNIQUE KEY `url` (`url`),
  KEY `category_id` (`category_id`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka s nabízenými produkty';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (2,2,'PocketBook 700 Era Stardust Silver','pocketbook700','Elektronická čtečka knih - 7\" podsvícený dotykový E Ink displej, rozlišení Full HD 1680 × 1264, vnitřní paměť 16 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 1700mAh baterie, reproduktor součástí, s možností přehrávání hudby, s webovým prohlížečem, stupeň krytí IPX8',4499.00,'jpeg',1,0),(3,3,'ONYX BOOX PAGE, černá, 7\", 32GB','onyxbookpage','Elektronická čtečka knih - 7\" podsvícený dotykový E Ink displej, rozlišení Full HD 1680 × 1264, vnitřní paměť 32 GB, WiFi a Bluetooth, micro SD a micro SDHC paměťová karta, konektor USB-C, 2300mAh baterie, reproduktor, mikrofon součástí, s možností přehrávání hudby, s webovým prohlížečem.',6499.00,'jpeg',1,5),(4,3,'ONYX BOOX TAB MINI C, černá, 7,8\", 64GB','onyxbooktab','Elektronická čtečka knih - 7,8\" podsvícený dotykový E Ink displej, rozlišení QHD 1872 × 1404, vnitřní paměť 64 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 5000mAh baterie, reproduktor, mikrofon a stylus součástí, s možností přehrávání hudby, s webovým prohlížečem.',10990.00,'jpeg',0,7),(5,2,'PocketBook 743C InkPad Color 2 Moon Silver, stříbrný','pocketbook743c','Elektronická čtečka knih - 7,80\" podsvícený dotykový E Ink displej, rozlišení QHD 1872 × 1404, vnitřní paměť 31,25 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 2900mAh baterie, reproduktor součástí, s možností přehrávání hudby, s webovým prohlížečem, stupeň krytí IPX8.',7499.00,'jpeg',1,12),(6,1,'Amazon Kindle Paperwhite 5 2021 32GB Signature Edition (bez reklamy)','amazonkindlepaperwhite2021','Elektronická čtečka knih - 6,8\" podsvícený dotykový displej, vnitřní paměť 32 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, stupeň krytí IPX8.',4990.00,'jpeg',0,23),(7,1,'Amazon Kindle 2022, 16GB, černý, bez reklam','amazonkindle2022','Elektronická čtečka knih - 6\" podsvícený dotykový E Ink displej, rozlišení Full HD 1448 × 1072, vnitřní paměť 15,625 GB, WiFi a Bluetooth, bez paměťové karty, konektor USB-C, 1040mAh baterie',2990.00,'jpeg',1,3),(8,4,'FIXED GaN s 2xUSB-C a USB výstupem podpora PD 65W bílá','fixedgan65w','Nabíječka do sítě - s podporou rychlého nabíjení, celkový výkon 65 W (1× USB-C až 45 W, 1× USB-C až 45 W, 1× USB-A až 15 W), technologie USB Power Delivery, Qualcomm Quick Charge 3.0 a Qualcomm Quick Charge 4.0+, přepěťová a podpěťová ochrana, indikace nabíjení, regulace teploty, s technologií GaN, pro Android a iPhone.',700.00,'jpeg',0,12),(9,4,'Apple USB 5W napájecí adaptér','appleadapter','Nabíječka do sítě pro jakékoliv modely iPhone a iPad. Bez napájecího kabelu.',199.00,'jpeg',0,3);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resource`
--

DROP TABLE IF EXISTS `resource`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `resource` (
  `resource_id` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka obsahující seznam zdrojů';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resource`
--

LOCK TABLES `resource` WRITE;
/*!40000 ALTER TABLE `resource` DISABLE KEYS */;
INSERT INTO `resource` VALUES ('Admin:Category'),('Admin:Dashboard'),('Admin:Error4xx'),('Admin:Product'),('Category'),('Front:About'),('Front:Cart'),('Front:Contact'),('Front:Error'),('Front:Error4xx'),('Front:Homepage'),('Front:Order'),('Front:Product'),('Front:User'),('Product');
/*!40000 ALTER TABLE `resource` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` varchar(50) COLLATE utf8mb4_czech_ci NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES ('admin'),('authenticated'),('guest');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(40) COLLATE utf8mb4_czech_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_czech_ci NOT NULL,
  `facebook_id` varchar(100) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `role_id` varchar(50) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_czech_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `facebook_id` (`facebook_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_czech_ci COMMENT='Tabulka s daty uživatelů';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'test','test@vse.cz',NULL,'admin','$2y$10$xJYPkow4DuysC3nh6X0O3.GNqK5G1R1FAWL2s8MmfflntTWaPH3tm'),(3,'Vlad Biastinov','vladikbyastinov@gmail.com',NULL,'admin','$2y$10$XqO023oU.5gp6xKPm5umaO47by8Fq.D1yeEQZ/SoNEypaQdZGStKa');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-31  1:05:11
