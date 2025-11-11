-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: chandusoft
-- ------------------------------------------------------
-- Server version	8.4.3

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
-- Table structure for table `admin_logs`
--

DROP TABLE IF EXISTS `admin_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `admin_id` int NOT NULL,
  `action` varchar(255) NOT NULL,
  `details` text,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_logs`
--

LOCK TABLES `admin_logs` WRITE;
/*!40000 ALTER TABLE `admin_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catalog`
--

DROP TABLE IF EXISTS `catalog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `catalog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `price` decimal(10,2) DEFAULT '0.00',
  `image` varchar(255) DEFAULT NULL,
  `short_desc` text,
  `status` enum('draft','published','archived') DEFAULT 'draft',
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,'test','test',150.00,'uploads/catalog_1762250856.jpg','','published','2025-10-23 09:27:23','2025-11-04 15:37:36'),(2,'Tech','tech',1253.60,'uploads/catalog_1762250816.webp','Technology','archived','2025-10-23 10:21:25','2025-11-11 12:53:33'),(3,'sample','sample',58.92,'uploads/catalog_1762250807.jpg','sample image','published','2025-10-23 11:43:22','2025-11-04 15:36:47'),(4,'test 1','test-1',125.35,'uploads/catalog_1762250797.png','test','published','2025-10-23 11:43:43','2025-11-04 15:36:37'),(5,'curd','curd',110.45,'uploads/catalog_1762250755.png','dairy product','published','2025-10-23 11:44:08','2025-11-04 15:35:55'),(6,'honey','honey',55.95,'uploads/catalog_1762250786.jpg','forest honey','published','2025-10-23 11:45:00','2025-11-04 15:36:26'),(7,'tech 1','tech-1',24.58,'uploads/catalog_1762250769.jpg','Technical sample','published','2025-10-24 09:27:37','2025-11-04 15:36:09'),(8,'log','log',1523.99,'uploads/catalog_1762250746.png','log check','published','2025-10-24 11:22:23','2025-11-04 15:35:46'),(9,'Hero','hero',1974.21,'uploads/catalog_1762250719.webp','No-1','published','2025-11-04 15:35:19','2025-11-04 15:35:19'),(10,'hero','hero-1',148.24,'uploads/catalog_1762506867.jpg','test','published','2025-11-07 14:44:27','2025-11-07 14:44:27'),(11,'Ghee','jaisai',5991.25,'uploads/catalog_1762507931.jpg','test','published','2025-11-07 15:02:12','2025-11-10 14:45:31');
/*!40000 ALTER TABLE `catalog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enquiries`
--

DROP TABLE IF EXISTS `enquiries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquiries` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `submitted_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiries`
--

LOCK TABLES `enquiries` WRITE;
/*!40000 ALTER TABLE `enquiries` DISABLE KEYS */;
INSERT INTO `enquiries` VALUES (1,'test','jai','jaisai.chintala@chandusoft.com','hi','2025-10-23 09:28:33','2025-10-23 09:28:33'),(2,'Tech','Kristene','alfalf@gmail.com','Require one','2025-10-23 10:22:11','2025-10-23 10:22:11'),(3,'honey','musthafa','alfalf@gmail.com','hello','2025-10-30 14:21:41','2025-10-30 14:21:41'),(4,'tech 1','hari','alfalf@gmail.com','?????????????','2025-10-30 14:52:58','2025-10-30 14:52:58'),(5,'log','drth','alfalf@gmail.com','dfhsh','2025-10-31 13:44:08','2025-10-31 13:44:08'),(6,'log','fjfj','alfalf@gmail.com','sgsgsdg','2025-11-04 11:36:23','2025-11-04 11:36:23');
/*!40000 ALTER TABLE `enquiries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leads`
--

DROP TABLE IF EXISTS `leads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `leads` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES (1,'Jaisai','alfalf@gmail.com','HI Welcome!','2025-10-07 09:15:22'),(2,'Kristene','kris.white@gmail.com','Hello How Are You?','2025-10-07 09:48:42'),(3,'sameer','sameer@gmail.com','Hello\r\n','2025-10-07 11:11:32'),(4,'saleem','saleem@gmail.com','what\'s going on?','2025-10-07 11:11:56'),(5,'Jai','alfalf1@gmail.com','Welcome to the website','2025-10-07 11:12:17'),(6,'musthafa','musthafa@gmail.com','Hello good evening....','2025-10-07 11:12:44'),(7,'musthafa','musthafa.shaik@chandusoft.com','Hi Good Morninig!','2025-10-08 04:06:32'),(8,'musthafa','musthafa.shaik@chandusoft.com','Hi Good Morninig!','2025-10-08 04:06:36'),(9,'musthafa','musthafa.shaik@chandusoft.com','Hi Good Morninig!','2025-10-08 04:06:37'),(10,'Jaisai','musthafa.shaik@chandusoft.com','Hi\r\n','2025-10-08 04:09:58'),(11,'Jaisai','musthafa.shaik@chandusoft.com','Hi\r\n','2025-10-08 04:09:59'),(12,'Jaisai','musthafa.shaik@chandusoft.com','Hi\r\n','2025-10-08 04:10:00'),(13,'Jaisai','musthafa.shaik@chandusoft.com','Hi\r\n','2025-10-08 04:10:00'),(14,'Jaisai','musthafa.shaik@chandusoft.com','Hi\r\n','2025-10-08 04:10:00'),(15,'Jaisai','jaisai.chintala@gmail.com','Hello Good Morning!','2025-10-08 04:12:59'),(16,'Jaisai','cstlte@gmail.com','Hi','2025-10-08 04:29:19'),(17,'Jaisai','jaisai.chintala@chandusoft.com','Hi Hello','2025-10-08 04:47:06'),(18,'Jaisai','jaisai.chintala@chandusoft.com','Hi Hello','2025-10-08 04:47:45'),(19,'Jaisai','jaisai.chintala@gmail.com','Hi Hello','2025-10-08 04:49:47'),(20,'sameer','alfalf@gmail.com','Hello','2025-10-08 04:55:33'),(21,'Hari','test@gmail.com','How are You!','2025-10-08 04:57:20'),(22,'saleem','alfalrf@gmail.com','hELLO','2025-10-08 06:55:49'),(23,'jai','alfalf@gmail.com','dhjfj','2025-10-08 06:56:30'),(24,'Ram','ram@gmail.com','Just Believe!','2025-10-09 06:39:48'),(25,'Ram','ram@gmail.com','Just Believe!','2025-10-09 06:40:12'),(26,'Jaisai','alfalf@gmail.com','hi','2025-10-09 12:30:41'),(27,'Jaisai','alfalf@gmail.com','hi','2025-10-09 12:30:44'),(28,'sal','test@gmail.com','Welcome to Chandusoft.','2025-10-09 12:31:04'),(29,'ram','ram143@gmail.com','Hello!','2025-10-10 10:43:15'),(30,'ram','ram43@gmail.com','gjfhj','2025-10-10 11:00:01'),(31,'ram','ram43@gmail.com','gjfhj','2025-10-10 11:16:34'),(32,'saleem','alfalf@gmail.com','hi','2025-10-10 11:31:48'),(33,'jhfj','hjgk@gmail.com','hi','2025-10-10 11:32:02'),(34,'jhfj','hjgk@gmail.com','hi','2025-10-10 11:32:02'),(35,'saleem','alfalf@gmail.com','hi','2025-10-10 11:33:38'),(36,'sal','alfalf@gmail.com','hi','2025-10-10 11:41:14'),(37,'Kristene','alfalf@gmail.com','sdg','2025-10-28 06:07:51'),(38,'saleem','test2@gmail.com','dfhhf','2025-10-28 06:20:56'),(39,'fjfj','alfalf@gmail.com','hrdg','2025-10-28 06:29:25'),(40,'jai','alfalf@gmail.com','sdg','2025-10-28 06:29:51'),(41,'musthafa','test12@gmail.com','hdfhdf','2025-10-28 06:33:15'),(42,'sameer','alfalf@gmail.com','hello','2025-10-28 06:39:39'),(43,'musthafa','alfalf@gmail.com','sdgs','2025-10-28 06:41:05'),(44,'jai','alfalf@gmail.com','sfh','2025-10-28 08:44:01'),(45,'fjfj','alfalf@gmail.com','srgd','2025-10-30 09:42:06');
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `product_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id` (`order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,12,2,'Tech',35,1253.60,43876.00),(2,12,8,'log',10,1523.99,15239.90),(3,13,8,'log',100,1523.99,152399.00),(4,14,8,'log',100,1523.99,152399.00),(5,15,8,'log',1,1523.99,1523.99),(6,16,8,'log',1,1523.99,1523.99),(7,17,2,'Tech',3,1253.60,3760.80),(8,18,7,'tech 1',3,24.58,73.74),(9,19,2,'Tech',1,1253.60,1253.60),(10,20,2,'Tech',2,1253.60,2507.20),(11,21,8,'log',3,1523.99,4571.97),(12,21,9,'Hero',2,1974.21,3948.42),(13,22,8,'log',1,1523.99,1523.99),(14,23,9,'Hero',1,1974.21,1974.21),(15,24,1,'test',1,150.00,150.00),(16,25,6,'honey',1,55.95,55.95),(17,26,3,'sample',1,58.92,58.92),(18,27,3,'sample',1,58.92,58.92),(19,28,8,'log',1,1523.99,1523.99),(20,29,1,'test',1,150.00,150.00),(21,30,3,'sample',1,58.92,58.92),(22,31,5,'curd',1,110.45,110.45),(23,32,8,'log',1,1523.99,1523.99),(24,33,8,'log',1,1523.99,1523.99),(25,34,1,'test',1,150.00,150.00),(26,35,6,'honey',1,55.95,55.95),(27,36,4,'test 1',1,125.35,125.35),(28,37,4,'test 1',1,125.35,125.35),(29,38,3,'sample',1,58.92,58.92),(30,39,7,'tech 1',1,24.58,24.58),(31,39,8,'log',2,1523.99,3047.98),(32,40,8,'log',2,1523.99,3047.98),(33,41,9,'Hero',1,1974.21,1974.21),(34,42,7,'tech 1',1,24.58,24.58),(35,43,7,'tech 1',1,24.58,24.58),(36,44,8,'log',1,1523.99,1523.99),(37,45,7,'tech 1',1,24.58,24.58),(38,46,8,'log',1,1523.99,1523.99),(39,47,8,'log',1,1523.99,1523.99),(40,48,8,'log',1,1523.99,1523.99),(41,49,8,'log',1,1523.99,1523.99),(42,50,8,'log',1,1523.99,1523.99),(43,51,8,'log',1,1523.99,1523.99),(44,52,6,'honey',1,55.95,55.95),(45,53,11,'Ghee',1,5991.25,5991.25);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `order_ref` varchar(50) NOT NULL,
  `customer_name` varchar(120) NOT NULL,
  `customer_email` varchar(160) NOT NULL,
  `metadata` json DEFAULT NULL,
  `total` decimal(10,2) NOT NULL,
  `payment_gateway` enum('stripe','paypal') NOT NULL DEFAULT 'stripe',
  `payment_status` enum('pending','paid','failed') NOT NULL DEFAULT 'pending',
  `txn_id` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_ref` (`order_ref`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'ORD-1761891225','John Doe','john@example.com','[{\"qty\": 1, \"item\": \"Laptop\", \"price\": 599.99}]',599.99,'stripe','paid',NULL,'2025-10-31 06:13:45','2025-11-04 05:43:57',NULL,NULL,NULL),(2,'ORD-1761893451','Test Buyer','buyer@example.com','[{\"qty\": 1, \"item\": \"Laptop\", \"price\": 599.99}]',599.99,'stripe','pending',NULL,'2025-10-31 06:50:52','2025-11-04 05:43:57',NULL,NULL,NULL),(3,'ORD-1761893738','Test Buyer','buyer@example.com','[{\"qty\": 1, \"item\": \"Laptop\", \"price\": 599.99}]',599.99,'stripe','pending',NULL,'2025-10-31 06:55:39','2025-11-04 05:43:57',NULL,NULL,NULL),(4,'ORD-1761893741','Test Buyer','buyer@example.com','[{\"qty\": 1, \"item\": \"Laptop\", \"price\": 599.99}]',599.99,'stripe','pending',NULL,'2025-10-31 06:55:42','2025-11-04 05:43:57',NULL,NULL,NULL),(5,'ORD-1761893864','Test Buyer','buyer@example.com','[{\"qty\": 1, \"item\": \"Laptop\", \"price\": 599.99}]',599.99,'stripe','pending',NULL,'2025-10-31 06:57:45','2025-11-04 05:43:57',NULL,NULL,NULL),(6,'ORD-1761893867','Test Buyer','buyer@example.com','[{\"qty\": 1, \"item\": \"Laptop\", \"price\": 599.99}]',599.99,'stripe','pending',NULL,'2025-10-31 06:57:49','2025-11-04 05:43:57',NULL,NULL,NULL),(7,'ORD-1761893934','Test Buyer','buyer@example.com','[{\"qty\": 1, \"item\": \"Laptop\", \"price\": 599.99}]',599.99,'stripe','pending',NULL,'2025-10-31 06:58:54','2025-11-04 05:43:57',NULL,NULL,NULL),(8,'ORD-1761893936','Test Buyer','buyer@example.com','[{\"qty\": 1, \"item\": \"Laptop\", \"price\": 599.99}]',599.99,'stripe','pending',NULL,'2025-10-31 06:58:57','2025-11-04 05:43:57',NULL,NULL,NULL),(9,'ORD-1761894064','Test Buyer','buyer@example.com','[{\"qty\": 1, \"item\": \"Laptop\", \"price\": 599.99}]',599.99,'stripe','pending',NULL,'2025-10-31 07:01:05','2025-11-04 05:43:57',NULL,NULL,NULL),(10,'ORD-1761894066','Test Buyer','buyer@example.com','[{\"qty\": 1, \"item\": \"Laptop\", \"price\": 599.99}]',599.99,'stripe','pending',NULL,'2025-10-31 07:01:07','2025-11-04 05:43:57',NULL,NULL,NULL),(11,'ORD-1761906180','hari ch','alfalf@gmail.com','{\"7\": {\"id\": 7, \"qty\": 1, \"image\": \"uploads/catalog_1761567471.jfif\", \"price\": 24.58, \"title\": \"tech 1\"}}',24.58,'stripe','pending',NULL,'2025-10-31 10:23:00','2025-11-04 05:43:57',NULL,NULL,NULL),(12,'9238D40A81E8','hari ch','alfalf@gmail.com',NULL,59115.90,'stripe','failed',NULL,'2025-11-04 06:18:09','2025-11-04 06:18:38','305 park ave','NewYork','11201'),(13,'9B24BEDDEAD4','hari ch','alfalf@gmail.com',NULL,152399.00,'paypal','pending',NULL,'2025-11-04 06:19:18','2025-11-04 06:19:18','305 park ave','NewYork','11201'),(14,'9B6153D0816E','hari ch','alfalf@gmail.com',NULL,152399.00,'paypal','pending',NULL,'2025-11-04 06:20:46','2025-11-04 06:20:46','305 park ave','NewYork','11201'),(15,'4129BBC9602C','ravi','alfalf@gmail.com',NULL,1523.99,'stripe','pending',NULL,'2025-11-04 06:34:58','2025-11-04 06:34:58','305 park ave','NewYork','11201'),(16,'39BDED71620E','hari ch','alfalf@gmail.com',NULL,1523.99,'stripe','paid',NULL,'2025-11-04 07:04:09','2025-11-04 07:05:01','305 park ave','NewYork','11201'),(17,'583B39069D70','sai','alfalf@gmail.com',NULL,3760.80,'stripe','pending',NULL,'2025-11-04 09:44:10','2025-11-04 09:44:10','305 park ave','NewYork','11201'),(18,'350DDBFA496E','hari ch','alfalf@gmail.com',NULL,73.74,'stripe','pending',NULL,'2025-11-04 09:44:26','2025-11-04 09:44:26','305 park ave','NewYork','11201'),(19,'26C93A129A9F','hari ch','alfalf@gmail.com',NULL,1253.60,'paypal','pending',NULL,'2025-11-04 09:44:40','2025-11-04 09:44:40','305 park ave','NewYork','11201'),(20,'435CA8C4ABEB','ramu','alfalf@gmail.com',NULL,2507.20,'stripe','pending',NULL,'2025-11-04 09:47:46','2025-11-04 09:47:46','305 park ave','NewYork','11201'),(21,'FB903312FB8F','hari ch','alfalf@gmail.com',NULL,8520.39,'stripe','pending',NULL,'2025-11-04 12:26:12','2025-11-04 12:26:12','305 park ave','NewYork','11201'),(22,'0CDDABAACC94','hari ch','alfalf@gmail.com',NULL,1523.99,'stripe','pending',NULL,'2025-11-05 08:57:33','2025-11-05 08:57:33','305 park ave','NewYork','11201'),(23,'6098228132D0','hari ch','alfalf@gmail.com',NULL,1974.21,'stripe','pending',NULL,'2025-11-05 09:18:21','2025-11-05 09:18:21','305 park ave','NewYork','11201'),(24,'4014421D7CC1','hari ch','alfalf@gmail.com',NULL,150.00,'stripe','pending',NULL,'2025-11-05 09:40:48','2025-11-05 09:40:48','305 park ave','NewYork','11201'),(25,'691BEA10A5C2','hari ch','alfalf@gmail.com',NULL,55.95,'stripe','pending',NULL,'2025-11-05 09:49:11','2025-11-05 09:49:11','305 park ave','NewYork','11201'),(26,'5D09387A79D9','hari ch','alfalf@gmail.com',NULL,58.92,'stripe','pending',NULL,'2025-11-05 10:04:12','2025-11-05 10:04:12','305 park ave','NewYork','11201'),(27,'3A3FA5E4306B','hari ch','alfalf@gmail.com',NULL,58.92,'stripe','pending',NULL,'2025-11-05 10:22:16','2025-11-05 10:22:16','305 park ave','NewYork','11201'),(28,'426ABC2F2CBC','hari ch','alfalf@gmail.com',NULL,1523.99,'stripe','pending',NULL,'2025-11-05 10:51:56','2025-11-05 10:51:56','305 park ave','NewYork','11201'),(29,'AB69F66A4A5E','hari ch','alfalf@gmail.com',NULL,150.00,'stripe','pending',NULL,'2025-11-05 10:54:35','2025-11-05 10:54:35','305 park ave','NewYork','11201'),(30,'783C1D8C7C07','hari ch','alfalf@gmail.com',NULL,58.92,'stripe','pending',NULL,'2025-11-05 11:10:23','2025-11-05 11:10:23','305 park ave','NewYork','11201'),(31,'545BE69119C1','hari ch','alfalf@gmail.com',NULL,110.45,'stripe','pending',NULL,'2025-11-05 11:22:10','2025-11-05 11:22:10','305 park ave','NewYork','11201'),(32,'D8D4F39FF1B0','hari ch','alfalf@gmail.com',NULL,1523.99,'stripe','pending',NULL,'2025-11-06 04:21:48','2025-11-06 04:21:48','305 park ave','NewYork','11201'),(33,'B7AEC61C1DA2','hari ch','alfalf@gmail.com',NULL,1523.99,'stripe','paid','pi_3SQLY0QTRirNEOsn0lLZW0Em','2025-11-06 05:15:42','2025-11-06 06:15:00','305 park ave','NewYork','11201'),(34,'53DD35D87536','hari ch','alfalf@gmail.com',NULL,150.00,'stripe','paid','pi_3SQLpEQTRirNEOsn1g6hb0Dp','2025-11-06 05:33:27','2025-11-06 06:32:55','305 park ave','NewYork','11201'),(35,'C1A9D3712166','hari ch','alfalf@gmail.com',NULL,55.95,'stripe','paid','pi_3SQLyqQTRirNEOsn1dFYW6kF','2025-11-06 05:43:26','2025-11-06 06:43:14','305 park ave','NewYork','11201'),(36,'921F7EBD3DBB','ravi','alfalf@gmail.com',NULL,125.35,'stripe','paid','pi_3SQMJQQTRirNEOsn1AzBcR5N','2025-11-06 06:04:42','2025-11-06 06:04:50','305 park ave','NewYork','11201'),(37,'ECD10CB47AC7','hari ch','alfalf@gmail.com',NULL,125.35,'stripe','paid','pi_3SQMTuQTRirNEOsn0IGovY2T','2025-11-06 06:14:59','2025-11-06 06:15:40','305 park ave','NewYork','11201'),(38,'3EEE3476059F','hari ch','alfalf@gmail.com',NULL,58.92,'stripe','paid','pi_3SQMVaQTRirNEOsn1p1MHV9L','2025-11-06 06:17:16','2025-11-06 07:10:59','305 park ave','NewYork','11201'),(39,'67AC04182C65','hari ch','alfalf@gmail.com',NULL,3072.56,'stripe','paid','pi_3SQMmRQTRirNEOsn13iM6zF9','2025-11-06 06:34:40','2025-11-06 06:34:49','305 park ave','NewYork','11201'),(40,'8B00894FF9D7','hari ch','alfalf@gmail.com',NULL,3047.98,'stripe','paid','pi_3SQNyVQTRirNEOsn10nLgmSx','2025-11-06 07:51:10','2025-11-06 07:51:22','305 park ave','NewYork','11201'),(41,'D349E79906F8','hari ch','alfalf@gmail.com',NULL,1974.21,'stripe','failed',NULL,'2025-11-06 07:53:05','2025-11-06 07:53:11','305 park ave','NewYork','11201'),(42,'54D2BF74735E','hari ch','alfalf@gmail.com',NULL,24.58,'stripe','failed',NULL,'2025-11-06 07:53:43','2025-11-06 07:53:50','305 park ave','NewYork','11201'),(43,'6138CD0CA681','hari ch','alfalf@gmail.com',NULL,24.58,'stripe','paid','pi_3SQO1ZQTRirNEOsn1NxThgfg','2025-11-06 07:54:23','2025-11-06 07:54:31','305 park ave','NewYork','11201'),(44,'9D62E326CB0F','hari ch','alfalf@gmail.com',NULL,1523.99,'stripe','failed',NULL,'2025-11-06 07:57:50','2025-11-06 07:57:56','305 park ave','NewYork','11201'),(45,'3CCAD1461B95','hari ch','alfalf@gmail.com',NULL,24.58,'stripe','pending',NULL,'2025-11-06 09:06:34','2025-11-06 09:06:34','305 park ave','NewYork','11201'),(46,'F15CD0C03989','sai','alfalf@gmail.com',NULL,1523.99,'stripe','failed',NULL,'2025-11-07 04:57:00','2025-11-07 04:57:13','305 park ave','NewYork','11201'),(47,'95FCDC69EDDE','hari ch','alfalf@gmail.com',NULL,1523.99,'stripe','failed',NULL,'2025-11-07 05:06:05','2025-11-07 05:10:41','305 park ave','NewYork','11201'),(48,'EC612112A235','hari ch','alfalf@gmail.com',NULL,1523.99,'stripe','paid','pi_3SQixmQTRirNEOsn0iqp9pz7','2025-11-07 06:15:39','2025-11-07 06:16:00','305 park ave','NewYork','11201'),(49,'2F7F79FF0AC4','hari ch','alfalf@gmail.com',NULL,1523.99,'stripe','pending',NULL,'2025-11-07 06:40:51','2025-11-07 06:40:51','305 park ave','NewYork','11201'),(50,'F12DA2E48E47','hari ch','alfalf@gmail.com',NULL,1523.99,'stripe','paid','pi_3SQjW7QTRirNEOsn0Thmar6H','2025-11-07 06:50:41','2025-11-07 06:51:28','305 park ave','NewYork','11201'),(51,'39E4411943EB','hari ch','alfalf@gmail.com',NULL,1523.99,'stripe','paid','pi_3SQo3DQTRirNEOsn1q6Dy5kv','2025-11-07 11:36:53','2025-11-07 11:41:58','305 park ave','NewYork','11201'),(52,'62DE9F50F4F8','hari ch','alfalf@gmail.com',NULL,55.95,'stripe','pending',NULL,'2025-11-07 11:42:50','2025-11-07 11:42:50','305 park ave','NewYork','11201'),(53,'2039B62AC598','hari ch','alfalf@gmail.com',NULL,5991.25,'stripe','failed',NULL,'2025-11-10 09:28:45','2025-11-10 09:29:22','305 park ave','NewYork','11201');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_html` text COLLATE utf8mb4_unicode_ci,
  `status` enum('draft','published','archived') COLLATE utf8mb4_unicode_ci DEFAULT 'draft',
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'About Us','about','<p>We are a global IT & BPO company.</p>','archived','2025-10-27 11:59:55'),(2,'Services','services','<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <link rel=\"stylesheet\" href=\"/styles.css\">\r\n    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">\r\n     <meta charset=\"UTF-8\">\r\n     <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Chandusoft</title>\r\n    <link rel=\"stylesheet\" href=\"styles.css\">\r\n</head>\r\n<body>\r\n     <div id=\"header\"></div>\r\n     <?php include(\"header.php\"); ?>\r\n    <main>\r\n<section id=\"Services\">\r\n    <h2 style=\"color: #2d5be3;\">Our Services</h2>\r\n    <div class=\"services-container\">\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-building icon-blue\"></i>\r\n            <h3>Enterprise Application Solution</h3>\r\n            <p>Robust enterprise apps for seamless business operations.</p>\r\n        </div>\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-mobile-alt icon-green\"></i>\r\n            <h3>Mobile Application Solution</h3>\r\n            <p>Cross-platform mobile apps with modern UI/UX.</p>\r\n        </div>\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-laptop icon-black\"></i>\r\n            <h3>Web Portal Design & Solution</h3>\r\n            <p>Custom web portals for business and customer engagement.</p>\r\n        </div>\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-tools icon-yellow\"></i>\r\n            <h3>Web Portal Maintenance & Content Management</h3>\r\n            <p>Continuous support, updates, and content handling.</p>\r\n        </div>\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-vial icon-purple\"></i>\r\n            <h3>QA & Testing</h3>\r\n            <p>Quality assurance and testing for bug-free releases.</p>\r\n        </div>\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-phone icon-red\"></i>\r\n            <h3>Business Process Outsourcing</h3>\r\n            <p>End-to-end BPO services with 24/7 operations.</p>\r\n        </div>\r\n\r\n    </div>\r\n</section>\r\n</main>\r\n    <div id=\"footer\"></div>\r\n    <?php include(\"footer.php\"); ?>\r\n <script src=\"include.js\"></script>\r\n   \r\n</body>\r\n</html>\r\n','draft','2025-10-27 12:00:55'),(3,'Careers','careers','<p>Join our growing tech family!</p>','published','2025-10-27 12:01:24'),(4,'Tourism','tourism','Book Tickets Now!','archived','2025-10-27 11:59:59');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_settings`
--

DROP TABLE IF EXISTS `site_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_settings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `key` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'site_name','Chandusoft Technologies','2025-10-27 11:50:44','2025-11-06 07:38:31'),(2,'site_logo','/uploads/2025/10/logo_1761295441_4e946270.jpg','2025-10-27 11:50:44','2025-10-27 11:50:44'),(5,'logo_path','uploads/logo_1762414711.jpg','2025-10-27 11:51:19','2025-11-06 07:38:31');
/*!40000 ALTER TABLE `site_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` enum('Editor','Admin') COLLATE utf8mb4_unicode_ci DEFAULT 'Editor',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gmail.com','admin','$2y$10$WGX81YGPS6DhKarkgojpkO/wx4olAkpIzfWFokSWxiM4X9RfsuxZ6','Admin','2025-10-07 09:14:04'),(2,'test@gmail.com','tester','$2y$10$.b6NmX0MiTQeTJ46vZfvGOdb8CgdAuMBPdZ3lIdnog7sk3p9grmwy','Editor','2025-10-07 10:03:02'),(3,'rama@gmail.com','rama123','$2y$10$WF0/YR1uLxXBthntM/A9y.1Kp3a.zmpQUUZ6K8hUg780.40X.DtBu','Editor','2025-10-30 09:40:37'),(4,'sai121@gmail.com','sai121','$2y$10$bPk74xI42YquhrchnZQcLe75389nbk7ki2MSOS2qAzIwnhbJkn61y','Editor','2025-10-30 09:50:09'),(5,'musthaffa@gmail.com','musthafa121','$2y$10$ajshHQJjtdt3YX2pfLq8Me0NuS6rWShMv9AxEeQC0.v2f5YcWu/k6','Editor','2025-10-30 09:52:21'),(6,'rama12@gmail.com','rama123','$2y$10$WLl50tP3LMLzwLA.SwP21.h5cTosec1a.q5O9o/22lqBYv9vpJ39i','Editor','2025-11-04 11:11:02'),(7,'sam@gmail.com','sam12','$2y$10$YqhTD0ZOXJeW.LtcJKRRjOCra62Bt24BdFAdbYSk.LQWYpEgl0sbq','Editor','2025-11-04 11:59:41'),(8,'sam1@gmail.com','sam12','$2y$10$ZEyckSyRW0ffCXiq8Zzg4uTzBkFacHL4NN1i4G9qhkFq09shbJBK6','Editor','2025-11-04 12:11:19'),(9,'demo126@gmail.com','sam121','$2y$10$f/52V.EDPmJsPMXuEEMNZexNI3kd52tKSL8tX8du7QXVXl9kPjTRC','Editor','2025-11-05 04:00:36');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-11 16:46:18
