-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: diary
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
-- Table structure for table `member_auth`
--

DROP TABLE IF EXISTS `member_auth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_auth` (
  `memberId` varchar(55) NOT NULL,
  `auth` varchar(50) NOT NULL,
  PRIMARY KEY (`memberId`,`auth`),
  CONSTRAINT `fk_auth_memberid` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_auth`
--

LOCK TABLES `member_auth` WRITE;
/*!40000 ALTER TABLE `member_auth` DISABLE KEYS */;
INSERT INTO `member_auth` VALUES ('','ROLE_USER'),('admin90','ROLE_ADMIN'),('admin91','ROLE_ADMIN'),('admin92','ROLE_ADMIN'),('admin93','ROLE_ADMIN'),('admin94','ROLE_ADMIN'),('admin95','ROLE_ADMIN'),('admin96','ROLE_ADMIN'),('admin97','ROLE_ADMIN'),('admin98','ROLE_ADMIN'),('admin99','ROLE_ADMIN'),('admin99qwe','ROLE_USER'),('idid','ROLE_USER'),('idid2','ROLE_USER'),('jpage','ROLE_USER'),('manager80','ROLE_MEMBER'),('manager81','ROLE_MEMBER'),('manager82','ROLE_MEMBER'),('manager83','ROLE_MEMBER'),('manager84','ROLE_MEMBER'),('manager85','ROLE_MEMBER'),('manager86','ROLE_MEMBER'),('manager87','ROLE_MEMBER'),('manager88','ROLE_MEMBER'),('manager89','ROLE_MEMBER'),('member0','ROLE_USER'),('member1','ROLE_USER'),('member10','ROLE_USER'),('member11','ROLE_USER'),('member12','ROLE_USER'),('member13','ROLE_USER'),('member14','ROLE_USER'),('member15','ROLE_USER'),('member16','ROLE_USER'),('member17','ROLE_USER'),('member18','ROLE_USER'),('member19','ROLE_USER'),('member2','ROLE_USER'),('member20','ROLE_USER'),('member21','ROLE_USER'),('member22','ROLE_USER'),('member23','ROLE_USER'),('member24','ROLE_USER'),('member25','ROLE_USER'),('member26','ROLE_USER'),('member27','ROLE_USER'),('member28','ROLE_USER'),('member29','ROLE_USER'),('member3','ROLE_USER'),('member30','ROLE_USER'),('member31','ROLE_USER'),('member32','ROLE_USER'),('member33','ROLE_USER'),('member34','ROLE_USER'),('member35','ROLE_USER'),('member36','ROLE_USER'),('member37','ROLE_USER'),('member38','ROLE_USER'),('member39','ROLE_USER'),('member4','ROLE_USER'),('member40','ROLE_USER'),('member41','ROLE_USER'),('member42','ROLE_USER'),('member43','ROLE_USER'),('member44','ROLE_USER'),('member45','ROLE_USER'),('member46','ROLE_USER'),('member47','ROLE_USER'),('member48','ROLE_USER'),('member49','ROLE_USER'),('member5','ROLE_USER'),('member50','ROLE_USER'),('member51','ROLE_USER'),('member52','ROLE_USER'),('member53','ROLE_USER'),('member54','ROLE_USER'),('member55','ROLE_USER'),('member56','ROLE_USER'),('member57','ROLE_USER'),('member58','ROLE_USER'),('member59','ROLE_USER'),('member6','ROLE_USER'),('member60','ROLE_USER'),('member61','ROLE_USER'),('member62','ROLE_USER'),('member63','ROLE_USER'),('member64','ROLE_USER'),('member65','ROLE_USER'),('member66','ROLE_USER'),('member67','ROLE_USER'),('member68','ROLE_USER'),('member69','ROLE_USER'),('member7','ROLE_USER'),('member70','ROLE_USER'),('member71','ROLE_USER'),('member72','ROLE_USER'),('member73','ROLE_USER'),('member74','ROLE_USER'),('member75','ROLE_USER'),('member76','ROLE_USER'),('member77','ROLE_USER'),('member78','ROLE_USER'),('member79','ROLE_USER'),('member8','ROLE_USER'),('member9','ROLE_USER');
/*!40000 ALTER TABLE `member_auth` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-06 15:11:42
