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
-- Table structure for table `todolist`
--

DROP TABLE IF EXISTS `todolist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `todolist` (
  `todo_pk` int NOT NULL AUTO_INCREMENT,
  `todo_regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `todo_content` varchar(120) NOT NULL,
  `todo_deadline` datetime DEFAULT NULL,
  `todo_importance` int DEFAULT '3',
  `todo_ok` char(5) DEFAULT 'none',
  PRIMARY KEY (`todo_pk`),
  UNIQUE KEY `todo_pk_UNIQUE` (`todo_pk`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `todolist`
--

LOCK TABLES `todolist` WRITE;
/*!40000 ALTER TABLE `todolist` DISABLE KEYS */;
INSERT INTO `todolist` VALUES (1,'2022-12-15 00:00:00','ㅋㅋㅋ','2022-12-15 00:00:00',5,'done'),(2,'2022-12-15 00:00:00','집에가기','2022-12-16 00:00:00',9,'done'),(3,'2022-12-13 00:00:00','ㅇㅇ','2022-12-13 00:00:00',5,'none'),(4,'2022-12-13 00:00:00','앙꼬산책하기','2022-12-16 14:45:59',5,'done'),(5,'2022-12-13 00:00:00','집에가기','2022-12-16 14:45:59',99,'done'),(6,'2022-12-16 14:45:59','앙꼬산책하기','2022-12-17 00:00:00',99,'done'),(7,'2022-12-22 12:10:59','집에가기',NULL,5,'done'),(8,'2022-12-22 12:59:37','집에가기',NULL,5,'done'),(9,'2022-12-22 13:04:53','자기소개서',NULL,5,'none'),(10,'2022-12-22 13:05:01','책읽기',NULL,100,'none'),(11,'2022-12-22 13:17:09','ㅋㅋㅋㅋ',NULL,3,'none'),(12,'2022-12-22 13:23:07','ㅎㅎㅎㅎ',NULL,4,'done'),(13,'2022-12-22 13:23:21','2222',NULL,22,'done'),(14,'2022-12-22 13:24:52','ㅋㅋㅋㅋ',NULL,2,'done'),(15,'2022-12-22 13:25:04','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ',NULL,555,'done'),(16,'2022-12-26 14:43:13','ㅎㅎㅎ',NULL,5,'none'),(17,'2022-12-26 14:44:17','1,2',NULL,1,'none'),(18,'2022-12-26 14:44:29','11,1',NULL,22,'none'),(19,'2022-12-26 16:06:11','오늘의 할일',NULL,99,'done'),(20,'2022-12-30 11:29:50','산책하기',NULL,5,'done');
/*!40000 ALTER TABLE `todolist` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-02 15:34:42
