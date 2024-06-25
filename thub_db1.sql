-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: thub
-- ------------------------------------------------------
-- Server version	8.0.30

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `thub_students`
--

DROP TABLE IF EXISTS `thub_students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thub_students` (
  `id` int NOT NULL AUTO_INCREMENT,
  `suuid` varchar(75) NOT NULL,
  `fn` varchar(20) NOT NULL,
  `ln` varchar(20) NOT NULL,
  `em` varchar(50) NOT NULL,
  `mo` varchar(13) NOT NULL,
  `createdby` varchar(75) DEFAULT NULL,
  `cn` varchar(100) NOT NULL,
  `sh` varchar(13) NOT NULL,
  `rdate` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thub_students`
--

LOCK TABLES `thub_students` WRITE;
/*!40000 ALTER TABLE `thub_students` DISABLE KEYS */;
INSERT INTO `thub_students` VALUES (1,'UID7690000001','Muna','Said','muna.osman@gmail.com','252907417769','UID1110000001','Web App Development','Morning','2023-07-08 12:21 PM');
/*!40000 ALTER TABLE `thub_students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thub_users`
--

DROP TABLE IF EXISTS `thub_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `thub_users` (
  `uuid` varchar(75) NOT NULL,
  `fn` varchar(20) NOT NULL,
  `ln` varchar(20) NOT NULL,
  `em` varchar(50) NOT NULL,
  `ps` text NOT NULL,
  `mo` varchar(13) NOT NULL,
  `rdate` varchar(75) DEFAULT NULL,
  `type` int DEFAULT NULL,
  PRIMARY KEY (`uuid`),
  KEY `type` (`type`),
  CONSTRAINT `thub_users_ibfk_1` FOREIGN KEY (`type`) REFERENCES `user_type` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thub_users`
--

LOCK TABLES `thub_users` WRITE;
/*!40000 ALTER TABLE `thub_users` DISABLE KEYS */;
INSERT INTO `thub_users` VALUES ('UID1110000001','nuur','ahmed','nuur@gmail.com','test','1111','2023-07-05 01:29:40',NULL),('UID2220000002','said','hussein','said@gmail.com','test','2222','2023-07-05 01:30:08',1);
/*!40000 ALTER TABLE `thub_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_type`
--

DROP TABLE IF EXISTS `user_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_type`
--

LOCK TABLES `user_type` WRITE;
/*!40000 ALTER TABLE `user_type` DISABLE KEYS */;
INSERT INTO `user_type` VALUES (1,'admin'),(2,'user');
/*!40000 ALTER TABLE `user_type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-08 12:22:15
