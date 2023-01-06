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
-- Table structure for table `journal`
--

DROP TABLE IF EXISTS `journal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journal` (
  `journal_pk` int NOT NULL AUTO_INCREMENT,
  `journal_title` varchar(200) NOT NULL,
  `journal_content` text NOT NULL,
  `journal_weather` varchar(55) DEFAULT NULL,
  `journal_regdate` varchar(20) NOT NULL,
  `journal_writer` varchar(55) DEFAULT NULL,
  `journal_hit` int DEFAULT '0',
  `journal_update` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`journal_pk`),
  UNIQUE KEY `journal_pk_UNIQUE` (`journal_pk`),
  KEY `fk_journal_id_idx` (`journal_writer`),
  CONSTRAINT `fk_journal_id` FOREIGN KEY (`journal_writer`) REFERENCES `member` (`memberId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journal`
--

LOCK TABLES `journal` WRITE;
/*!40000 ALTER TABLE `journal` DISABLE KEYS */;
INSERT INTO `journal` VALUES (1,'일기','일기',NULL,'2022-12-13','admin99',0,'2022-12-13 10:09:02'),(2,'일기2','일기2',NULL,'2022-12-13','admin99',0,'2022-12-13 10:09:20'),(3,'일기222','2222',NULL,'2022-12-13','admin99',0,'2022-12-13 10:12:12'),(4,'일기3','3',NULL,'2022-12-13','admin99',0,'2022-12-13 10:15:57'),(6,'일기5','일기5','바람','2022-12-13','admin99',0,'2022-12-13 10:27:06'),(7,'일기6','일기6','흐림','2022-12-13','admin99',0,'2022-12-13 10:29:05'),(8,'일기7','일기7','흐림','2022-12-11','admin99',0,'2022-12-13 10:37:06'),(10,'일기','일기','맑음','2022-12-14','admin99',0,'2022-12-15 09:59:33'),(11,'일기','일기','맑음','2022-12-17','admin99',0,'2022-12-15 09:59:44'),(12,'일기','일기','흐림','2022-12-09','admin99',0,'2022-12-15 09:59:49'),(21,'날씨가 너무춥다','완전춥다','추움','2022-12-15','admin99',0,'2022-12-15 10:28:05'),(27,'zzz','zzz','추움','2022-12-30','admin90',0,'2022-12-30 13:08:44'),(28,'zzz','zz','맑음','2022-12-30','admin99',0,'2022-12-30 16:51:03'),(29,'일기','ㅋㅋ','바람','2023-01-03','admin99',0,'2023-01-03 15:17:00'),(30,'일기수정','ㅇㅁㅎ','추움','2023-01-12','admin99',0,'2023-01-03 15:26:02'),(31,'날짜수정','ㅋㅋㅋㅋㅋㅋㅋㅋㅋㅋ','바람','2023-01-03','admin99',0,'2023-01-03 15:26:30'),(32,'zz','zz','바람','2022-12-29','admin99',0,'2023-01-03 15:27:21');
/*!40000 ALTER TABLE `journal` ENABLE KEYS */;
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
