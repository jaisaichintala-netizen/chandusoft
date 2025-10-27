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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalog`
--

LOCK TABLES `catalog` WRITE;
/*!40000 ALTER TABLE `catalog` DISABLE KEYS */;
INSERT INTO `catalog` VALUES (1,'test','test',150.00,'uploads/catalog_1761278598.jpg','','published','2025-10-23 09:27:23','2025-10-27 11:22:00'),(2,'Tech','tech',1253.60,'uploads/catalog_1761278569.png','Technology','published','2025-10-23 10:21:25','2025-10-27 11:10:17'),(3,'sample','sample',58.92,'uploads/catalog_1761278547.png','sample image','published','2025-10-23 11:43:22','2025-10-27 11:25:04'),(4,'test 1','test-1',125.35,'uploads/catalog_1761278533.jpg','test','published','2025-10-23 11:43:43','2025-10-24 09:32:13'),(5,'curd','curd',110.45,'uploads/catalog_1761278513.png','dairy product','published','2025-10-23 11:44:08','2025-10-24 09:31:53'),(6,'honey','honey',55.95,'uploads/catalog_1761278495.png','forest honey','published','2025-10-23 11:45:00','2025-10-24 09:31:35'),(7,'tech 1','tech-1',24.58,'uploads/2025/10/catalog_1761278256_4876f4.webp','Technical sample','published','2025-10-24 09:27:37','2025-10-27 10:10:54'),(8,'log','log',1523.99,'uploads/2025/10/catalog_1761285142_81cfd6.webp','log check','published','2025-10-24 11:22:23','2025-10-24 14:10:50');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquiries`
--

LOCK TABLES `enquiries` WRITE;
/*!40000 ALTER TABLE `enquiries` DISABLE KEYS */;
INSERT INTO `enquiries` VALUES (1,'test','jai','jaisai.chintala@chandusoft.com','hi','2025-10-23 09:28:33','2025-10-23 09:28:33'),(2,'Tech','Kristene','alfalf@gmail.com','Require one','2025-10-23 10:22:11','2025-10-23 10:22:11');
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leads`
--

LOCK TABLES `leads` WRITE;
/*!40000 ALTER TABLE `leads` DISABLE KEYS */;
INSERT INTO `leads` VALUES (1,'Jaisai','alfalf@gmail.com','HI Welcome!','2025-10-07 09:15:22'),(2,'Kristene','kris.white@gmail.com','Hello How Are You?','2025-10-07 09:48:42'),(3,'sameer','sameer@gmail.com','Hello\r\n','2025-10-07 11:11:32'),(4,'saleem','saleem@gmail.com','what\'s going on?','2025-10-07 11:11:56'),(5,'Jai','alfalf1@gmail.com','Welcome to the website','2025-10-07 11:12:17'),(6,'musthafa','musthafa@gmail.com','Hello good evening....','2025-10-07 11:12:44'),(7,'musthafa','musthafa.shaik@chandusoft.com','Hi Good Morninig!','2025-10-08 04:06:32'),(8,'musthafa','musthafa.shaik@chandusoft.com','Hi Good Morninig!','2025-10-08 04:06:36'),(9,'musthafa','musthafa.shaik@chandusoft.com','Hi Good Morninig!','2025-10-08 04:06:37'),(10,'Jaisai','musthafa.shaik@chandusoft.com','Hi\r\n','2025-10-08 04:09:58'),(11,'Jaisai','musthafa.shaik@chandusoft.com','Hi\r\n','2025-10-08 04:09:59'),(12,'Jaisai','musthafa.shaik@chandusoft.com','Hi\r\n','2025-10-08 04:10:00'),(13,'Jaisai','musthafa.shaik@chandusoft.com','Hi\r\n','2025-10-08 04:10:00'),(14,'Jaisai','musthafa.shaik@chandusoft.com','Hi\r\n','2025-10-08 04:10:00'),(15,'Jaisai','jaisai.chintala@gmail.com','Hello Good Morning!','2025-10-08 04:12:59'),(16,'Jaisai','cstlte@gmail.com','Hi','2025-10-08 04:29:19'),(17,'Jaisai','jaisai.chintala@chandusoft.com','Hi Hello','2025-10-08 04:47:06'),(18,'Jaisai','jaisai.chintala@chandusoft.com','Hi Hello','2025-10-08 04:47:45'),(19,'Jaisai','jaisai.chintala@gmail.com','Hi Hello','2025-10-08 04:49:47'),(20,'sameer','alfalf@gmail.com','Hello','2025-10-08 04:55:33'),(21,'Hari','test@gmail.com','How are You!','2025-10-08 04:57:20'),(22,'saleem','alfalrf@gmail.com','hELLO','2025-10-08 06:55:49'),(23,'jai','alfalf@gmail.com','dhjfj','2025-10-08 06:56:30'),(24,'Ram','ram@gmail.com','Just Believe!','2025-10-09 06:39:48'),(25,'Ram','ram@gmail.com','Just Believe!','2025-10-09 06:40:12'),(26,'Jaisai','alfalf@gmail.com','hi','2025-10-09 12:30:41'),(27,'Jaisai','alfalf@gmail.com','hi','2025-10-09 12:30:44'),(28,'sal','test@gmail.com','Welcome to Chandusoft.','2025-10-09 12:31:04'),(29,'ram','ram143@gmail.com','Hello!','2025-10-10 10:43:15'),(30,'ram','ram43@gmail.com','gjfhj','2025-10-10 11:00:01'),(31,'ram','ram43@gmail.com','gjfhj','2025-10-10 11:16:34'),(32,'saleem','alfalf@gmail.com','hi','2025-10-10 11:31:48'),(33,'jhfj','hjgk@gmail.com','hi','2025-10-10 11:32:02'),(34,'jhfj','hjgk@gmail.com','hi','2025-10-10 11:32:02'),(35,'saleem','alfalf@gmail.com','hi','2025-10-10 11:33:38'),(36,'sal','alfalf@gmail.com','hi','2025-10-10 11:41:14');
/*!40000 ALTER TABLE `leads` ENABLE KEYS */;
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
INSERT INTO `pages` VALUES (1,'About Us','about','<p>We are a global IT & BPO company.</p>','draft','2025-10-09 16:14:57'),(2,'Services','services','<!DOCTYPE html>\r\n<html lang=\"en\">\r\n<head>\r\n    <link rel=\"stylesheet\" href=\"/styles.css\">\r\n    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css\">\r\n     <meta charset=\"UTF-8\">\r\n     <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\r\n    <title>Chandusoft</title>\r\n    <link rel=\"stylesheet\" href=\"styles.css\">\r\n</head>\r\n<body>\r\n     <div id=\"header\"></div>\r\n     <?php include(\"header.php\"); ?>\r\n    <main>\r\n<section id=\"Services\">\r\n    <h2 style=\"color: #2d5be3;\">Our Services</h2>\r\n    <div class=\"services-container\">\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-building icon-blue\"></i>\r\n            <h3>Enterprise Application Solution</h3>\r\n            <p>Robust enterprise apps for seamless business operations.</p>\r\n        </div>\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-mobile-alt icon-green\"></i>\r\n            <h3>Mobile Application Solution</h3>\r\n            <p>Cross-platform mobile apps with modern UI/UX.</p>\r\n        </div>\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-laptop icon-black\"></i>\r\n            <h3>Web Portal Design & Solution</h3>\r\n            <p>Custom web portals for business and customer engagement.</p>\r\n        </div>\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-tools icon-yellow\"></i>\r\n            <h3>Web Portal Maintenance & Content Management</h3>\r\n            <p>Continuous support, updates, and content handling.</p>\r\n        </div>\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-vial icon-purple\"></i>\r\n            <h3>QA & Testing</h3>\r\n            <p>Quality assurance and testing for bug-free releases.</p>\r\n        </div>\r\n\r\n        <div class=\"service-card\">\r\n            <i class=\"fas fa-phone icon-red\"></i>\r\n            <h3>Business Process Outsourcing</h3>\r\n            <p>End-to-end BPO services with 24/7 operations.</p>\r\n        </div>\r\n\r\n    </div>\r\n</section>\r\n</main>\r\n    <div id=\"footer\"></div>\r\n    <?php include(\"footer.php\"); ?>\r\n <script src=\"include.js\"></script>\r\n   \r\n</body>\r\n</html>\r\n','published','2025-10-13 18:13:42'),(3,'Careers','careers','<p>Join our growing tech family!</p>','published','2025-10-13 18:13:36'),(4,'Tourism','tourism','Book Tickets Now!','draft','2025-10-09 15:11:50');
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
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `name_2` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_settings`
--

LOCK TABLES `site_settings` WRITE;
/*!40000 ALTER TABLE `site_settings` DISABLE KEYS */;
INSERT INTO `site_settings` VALUES (1,'site_name','Chandusoft Technologies','2025-10-24 14:14:01'),(6,'site_logo','/uploads/2025/10/logo_1761295441_4e946270.jpg','2025-10-24 14:14:01');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@gmail.com','admin','$2y$10$WGX81YGPS6DhKarkgojpkO/wx4olAkpIzfWFokSWxiM4X9RfsuxZ6','Admin','2025-10-07 09:14:04'),(2,'test@gmail.com','tester','$2y$10$.b6NmX0MiTQeTJ46vZfvGOdb8CgdAuMBPdZ3lIdnog7sk3p9grmwy','Editor','2025-10-07 10:03:02');
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

-- Dump completed on 2025-10-27 11:56:19
