-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: _ga
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
-- Table structure for table `_ga_courses`
--

DROP TABLE IF EXISTS `_ga_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ga_courses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `cuid` varchar(75) NOT NULL,
  `cn` varchar(100) NOT NULL,
  `cf` varchar(100) NOT NULL,
  `createdby` varchar(75) DEFAULT NULL,
  `updatedby` varchar(75) DEFAULT NULL,
  `rdate` varchar(100) DEFAULT NULL,
  `cdesc` text,
  `cimg` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ga_courses`
--

LOCK TABLES `_ga_courses` WRITE;
/*!40000 ALTER TABLE `_ga_courses` DISABLE KEYS */;
INSERT INTO `_ga_courses` VALUES (1,'CUID10000001','Java Programming','20','UUID10000001',NULL,'2023-07-20 04:25 PM','Complete Java Course','https://galool.net/img/java.png'),(2,'CUID10000002','Graphic Designing','20','UUID10000001',NULL,'2023-07-20 04:26 PM','Complete Video Editing Course Complete Video Editing Course','https://galool.net/img/videoediting.png');
/*!40000 ALTER TABLE `_ga_courses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ga_user_types`
--

DROP TABLE IF EXISTS `_ga_user_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ga_user_types` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ga_user_types`
--

LOCK TABLES `_ga_user_types` WRITE;
/*!40000 ALTER TABLE `_ga_user_types` DISABLE KEYS */;
INSERT INTO `_ga_user_types` VALUES (1,'admin'),(2,'user'),(3,'student');
/*!40000 ALTER TABLE `_ga_user_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ga_users`
--

DROP TABLE IF EXISTS `_ga_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ga_users` (
  `uuid` varchar(75) NOT NULL,
  `fn` varchar(20) NOT NULL,
  `ln` varchar(20) NOT NULL,
  `em` varchar(50) NOT NULL,
  `ps` text NOT NULL,
  `mo` varchar(13) NOT NULL,
  `rdate` varchar(75) DEFAULT NULL,
  `type` int NOT NULL,
  PRIMARY KEY (`uuid`),
  KEY `type` (`type`),
  CONSTRAINT `_ga_users_ibfk_1` FOREIGN KEY (`type`) REFERENCES `_ga_user_types` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ga_users`
--

LOCK TABLES `_ga_users` WRITE;
/*!40000 ALTER TABLE `_ga_users` DISABLE KEYS */;
INSERT INTO `_ga_users` VALUES ('UUID10000001','Said','Boos','said@gmail.com','test','5566','2023-07-20 11:41 AM',1),('UUID10000002','Ahmed','Nuur','nuur@gmail.com','test','4466','2023-07-20 12:11 PM',1),('UUID10000003','Salma','Abdirahman','aydrus@gmail.com','test','2233','2023-07-20 05:28 PM',3),('UUID10000004','Shaakir','Abdinaasir','shakir@gmail.com','test','1133','2023-07-20 06:27 PM',3);
/*!40000 ALTER TABLE `_ga_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `_ga_videos`
--

DROP TABLE IF EXISTS `_ga_videos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_ga_videos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vuid` varchar(75) NOT NULL,
  `vtitle` varchar(200) NOT NULL,
  `vurl` text,
  `cuid` varchar(75) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_ga_videos`
--

LOCK TABLES `_ga_videos` WRITE;
/*!40000 ALTER TABLE `_ga_videos` DISABLE KEYS */;
INSERT INTO `_ga_videos` VALUES (1,'VUID10000001','How to install Java','https://www.youtube.com/embed/Nea_nlpiYQs','CUID10000001'),(2,'VUID10000002','How to install Intellij with Java','https://www.youtube.com/embed/2NvjNJxMD38','CUID10000001'),(3,'VUID10000003','Introduction to Java','https://www.youtube.com/embed/tDCn68US3Ik','CUID10000001'),(4,'VUID10000004','Syntax of Java','https://www.youtube.com/embed/k8l1loq7Tr8','CUID10000001');
/*!40000 ALTER TABLE `_ga_videos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ga_student_courses`
--

DROP TABLE IF EXISTS `ga_student_courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ga_student_courses` (
  `suid` varchar(75) NOT NULL,
  `cuid` varchar(75) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ga_student_courses`
--

LOCK TABLES `ga_student_courses` WRITE;
/*!40000 ALTER TABLE `ga_student_courses` DISABLE KEYS */;
INSERT INTO `ga_student_courses` VALUES ('UUID10000003','CUID10000002'),('UUID10000003','CUID10000001'),('UUID10000004','CUID10000002');
/*!40000 ALTER TABLE `ga_student_courses` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-21 22:06:26
