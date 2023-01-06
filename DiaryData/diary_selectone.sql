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
-- Table structure for table `selectone`
--

DROP TABLE IF EXISTS `selectone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `selectone` (
  `select_pk` int NOT NULL AUTO_INCREMENT,
  `select_writer` varchar(55) DEFAULT NULL,
  `select_title` varchar(200) NOT NULL,
  `select_category` varchar(100) DEFAULT NULL,
  `select_content` text NOT NULL,
  `select_itemA` varchar(50) NOT NULL,
  `select_itemB` varchar(50) NOT NULL,
  `select_hit` int DEFAULT '0',
  `select_regdate` datetime DEFAULT CURRENT_TIMESTAMP,
  `select_update` datetime DEFAULT CURRENT_TIMESTAMP,
  `select_replyCnt` int DEFAULT '0',
  `itemA_count` int DEFAULT '0',
  `itemB_count` int DEFAULT '0',
  PRIMARY KEY (`select_pk`),
  KEY `select_fk_idx` (`select_writer`),
  CONSTRAINT `select_fk` FOREIGN KEY (`select_writer`) REFERENCES `member` (`memberId`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `selectone`
--

LOCK TABLES `selectone` WRITE;
/*!40000 ALTER TABLE `selectone` DISABLE KEYS */;
INSERT INTO `selectone` VALUES (3,NULL,'ㅋㅋ(수정)','가수','2000년대 아이돌','동방신기','ss501',35,'2022-12-19 14:24:15','2022-12-19 14:24:15',0,0,0),(6,NULL,'ㅇㅇ','dd','ddd','동방신기','짜파게티',4,'2022-12-19 15:15:32','2022-12-19 15:15:32',0,0,0),(10,NULL,'라면고 ㅏ짜파게티','음식','라면이냐 짜파게티냐','라면','짜파게티',0,'2022-12-20 13:39:25','2022-12-20 13:39:25',0,0,0),(11,NULL,'라면 짜장','음식','라면이냐 짜장이냐','ㅋㅋ','ㅎㅎ',8,'2022-12-20 13:53:49','2022-12-30 12:50:19',4,0,0),(12,NULL,'라면','음식','라면 짜장?','라면 ','짜장',1,'2022-12-20 14:02:20','2022-12-20 14:02:20',0,0,0),(13,NULL,'ㅋㅋ','음식','ㅋㅋㅋ','라면','짜파게티',0,'2022-12-20 14:53:54','2022-12-20 14:53:54',0,0,0),(14,NULL,'ㅋㅋ','음식','ㅇㅇ','라면','짜파게티',0,'2022-12-20 14:59:37','2022-12-20 14:59:37',0,0,0),(15,NULL,'ㅋㅋ','ㅋㅋ','ㅋㅋ','ㅋㅋ','ㅋㅋ',0,'2022-12-20 15:08:45','2022-12-20 15:08:45',0,0,0),(16,NULL,'ㅠㅠ','ㅠㅠ','ㅠㅠ','ㅠㅠ','ㅠㅠ',57,'2022-12-20 15:09:01','2022-12-20 15:09:01',0,0,0),(17,NULL,'ㅋ','ㅋㅋ','ㅋ','ㅋㅋ','ㅋㅋ',615,'2022-12-20 15:10:45','2022-12-20 15:10:45',-7,0,0);
/*!40000 ALTER TABLE `selectone` ENABLE KEYS */;
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
