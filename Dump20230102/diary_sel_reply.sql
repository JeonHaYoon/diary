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
-- Table structure for table `sel_reply`
--

DROP TABLE IF EXISTS `sel_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sel_reply` (
  `rno` int NOT NULL AUTO_INCREMENT,
  `select_pk` int NOT NULL,
  `reply` text NOT NULL,
  `replyer` varchar(55) NOT NULL,
  `replydate` datetime DEFAULT CURRENT_TIMESTAMP,
  `updatedate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rno`),
  KEY `fk_reply_select_pk_idx` (`select_pk`),
  CONSTRAINT `fk_reply_select_pk` FOREIGN KEY (`select_pk`) REFERENCES `selectone` (`select_pk`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sel_reply`
--

LOCK TABLES `sel_reply` WRITE;
/*!40000 ALTER TABLE `sel_reply` DISABLE KEYS */;
INSERT INTO `sel_reply` VALUES (15,17,'ㅎㅎ','admin99','2022-12-23 14:30:16','2022-12-23 14:30:16'),(16,17,'ㅜㅜㅜ','admin99','2022-12-23 14:31:09','2022-12-30 10:55:36'),(17,17,'ㅎㅎ','admin99','2022-12-23 14:32:55','2022-12-23 14:32:55'),(18,17,'ㅌㅌㅋㅋㅋ','admin99','2022-12-23 15:02:09','2022-12-30 10:34:26'),(19,17,'ㅎㅎㅎ','admin99','2022-12-23 15:02:54','2022-12-23 15:02:54'),(20,17,'ㅋㅋㅋㅋㅋㅋㅋㅋㅋ','admin99','2022-12-23 15:10:07','2022-12-23 15:10:07'),(21,17,'dd','admin99','2022-12-23 16:20:45','2022-12-23 16:20:45'),(22,17,'ㅎㅎㅎㅎ','admin99','2022-12-23 16:31:49','2022-12-23 16:31:49'),(23,17,'안녕','admin99','2022-12-23 16:32:02','2022-12-23 16:32:02'),(24,17,'nn','admin99','2022-12-26 11:51:49','2022-12-26 11:51:49'),(31,17,'hh','admin99','2022-12-29 14:03:07','2022-12-29 14:03:07'),(32,17,'ㅜㅜㅜㅜㅜ','admin99','2022-12-30 09:32:57','2022-12-30 10:16:33'),(33,17,'bbbb','','2022-12-30 09:49:32','2022-12-30 09:49:32'),(34,17,'안녕하세요반갑습니다ㅇㅇ','admin90','2022-12-30 09:51:01','2022-12-30 10:30:54'),(39,11,'댓글테스트','','2022-12-30 12:47:12','2022-12-30 12:47:12'),(40,11,'댓글테스트','','2022-12-30 12:47:14','2022-12-30 12:47:14'),(41,11,'댓글테스트','','2022-12-30 12:47:16','2022-12-30 12:47:16'),(42,11,'댓글테스트','','2022-12-30 12:47:26','2022-12-30 12:47:26');
/*!40000 ALTER TABLE `sel_reply` ENABLE KEYS */;
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
