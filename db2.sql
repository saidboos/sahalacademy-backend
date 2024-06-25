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
  `updatedby` varchar(75) DEFAULT NULL,
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
INSERT INTO `thub_students` VALUES (1,'SUID6550000001','Xassan','Ducaale','ducaale@gmail.com','776655','UID2220000002',NULL,'english','morning','2023-07-10 05:11 PM');
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
INSERT INTO `thub_users` VALUES ('UID2220000002','said','hussein','said@gmail.com','test','2222','2023-07-08 02:17 PM',1),('UID2340000001','Said','Abdulqadir Mohamoud','shay@gmail.com','test','252907600234','2023-07-08 12:50 PM',2);
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

--
-- Dumping routines for database 'thub'
--
/*!50003 DROP PROCEDURE IF EXISTS `sp_thub_create_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_thub_create_student`(
in userid varchar(75),
in firstname varchar(20),
in lastname varchar(20),
in email varchar(50),
in mobile varchar(13),
in coursename varchar(100),
in shift varchar(13)
)
BEGIN
declare usercode varchar(75);
if exists(select uuid from thub_users where uuid = userid) then

set usercode = (select max(substring(suuid, 7, 15))+1 from thub_students);
if exists(select em, mo from thub_students  where em = email or mo = mobile) then
select 'Student is already registered' message, '103' code;
else if(usercode is null or usercode = '' )then
set usercode = '0000001';
end if;
set usercode = concat('SUID', RIGHT(mobile, 3), repeat('0', 7 - char_length(usercode)), usercode);

insert into 
thub_students(suuid, fn, ln, em, mo, cn, sh, rdate, createdby) 
values(usercode, firstname,lastname,email,mobile, coursename,shift,concat(curdate(), ' ',DATE_FORMAT(now(),'%h:%i %p')), userid);

select 'Successfully registered' message, '100' code;
end if;

else

select 'Not registered' message, '105' code;

end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_thub_students` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_thub_students`(
in uuid varchar(75)
)
BEGIN
if exists(select t.uuid from thub_users t where t.uuid = uuid) then
select suuid studentId, fn firstname, ln lastname, em email, mo mobile, cn coursename, sh shift, rdate registerDate  from thub_students;
else
select '102' code, 'No records found' message;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_thub_update_student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_thub_update_student`(
in userid varchar(75),
in studentId varchar(75),
in firstname varchar(20),
in lastname varchar(20),
in email varchar(50),
in mobile varchar(13),
in coursename varchar(100),
in shift varchar(13)
)
BEGIN
if exists(select uuid from thub_users where uuid = userid) then
if exists(select suuid from thub_students  where suuid = studentId) then
update thub_students set fn = firstname, ln = lastname, em = email, mo = mobile, cn = coursename, sh = shift, updatedby = userid where suuid = studentId; 
select 'Successfully updated' message, '100' code;
else
select 'Student not exist' message, '103' code;
end if;
else
select 'Not Updated' message, '106' code;
end if;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update student` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update student`(in userid varchar(75),
in firstname varchar(20),
in lastname varchar(20),
in email varchar(50),
in mobile varchar(13),
in coursename varchar(100),
in shift varchar(13)
)
BEGIN
if exists(select uuid from thub_users where uuid = userid) then
if exists(select em, mo from thub_students  where em = email or mo = mobile) then
update thub_students set fn = firstname, ln = lastname, em = email, mo = mobile, cn = coursename, sh = shift;
select 'Successfully updated' message, '100' code;
else
select 'Student not exist' message, '103' code;
end if;
else
select 'Not Updated' message, '106' code;
end if;
End ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userprofile` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userprofile`(
in uuid varchar(75)
)
BEGIN

if exists(select t.uuid from thub_users t where t.uuid = uuid) then
select uuid userId, fn firstname, ln lastname, em email, mo mobile, rdate registerDate from thub_users t where t.uuid = uuid;
select fn firstname, ln lastname, em email, mo mobile, cn courseName, sh shift, rdate registerDate  from thub_students;


select count(*) activeStudents from thub_students;
else
select '102' code, 'No records found' message;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_login` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`saidboos`@`localhost` PROCEDURE `user_login`(

in email varchar(50),
in password text
)
BEGIN
if exists(select em from thub_users where em = email and ps = password) THEN
BEGIN
select '100' code, 'Successfully login' message;
select uuid userId from thub_users  where em = email;
end;
else
select '101' code, 'Invalid credentials' message;
END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `user_register` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_unicode_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `user_register`(
in fn varchar(20),
in ln varchar(20),
in em varchar(50),
in ps text,
in mo varchar(13),
in ty char(1)
)
BEGIN
declare usercode varchar(75);
set usercode = (select max(substring(uuid, 7, 15))+1 from thub_users);

if exists(select t.em, t.mo from thub_users t where t.em = em or t.mo = mo) then
select 'User is already registered' message, '103' code;
else if(usercode is null or usercode = '' )then
set usercode = '0000001';
end if;
set usercode = concat('UID', RIGHT(mo, 3), repeat('0', 7 - char_length(usercode)), usercode);

insert into thub_users(uuid, fn, ln, em, ps, mo, rdate, type) 
values(usercode, fn, ln, em, ps, mo,  concat(curdate(), ' ',DATE_FORMAT(now(),'%h:%i %p')), ty);

select 'Successfully registered' message, '100' code;
end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-10 17:20:21
