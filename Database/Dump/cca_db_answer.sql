CREATE DATABASE  IF NOT EXISTS `cca_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cca_db`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: cca_db
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `answer`
--

DROP TABLE IF EXISTS `answer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answer` (
  `ans_id` int NOT NULL AUTO_INCREMENT,
  `content` text,
  `ans_like` int DEFAULT NULL,
  `ans_dislike` int DEFAULT NULL,
  `pic` blob,
  `post_dt` datetime DEFAULT CURRENT_TIMESTAMP,
  `post_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  PRIMARY KEY (`ans_id`),
  KEY `post_id` (`post_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `answer_ibfk_1` FOREIGN KEY (`post_id`) REFERENCES `post` (`post_id`),
  CONSTRAINT `answer_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answer`
--

LOCK TABLES `answer` WRITE;
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
INSERT INTO `answer` VALUES (11,'join it guys it will be interesting !!',0,0,NULL,'2022-12-21 17:11:34',35,3),(12,'The course was very good, there are some 100-150 computers in the computer labs with a good air conditioning system, yes there are lots of research activities happening in the college from all the departments\r\n\r\nWe have a very good placement cell, they try to get maximum placement for us and also they push us and prepare us to crack it.\r\nThe campus hiring process, and then pore over to find students who best match the requirements of the placement opportunities through on/off campus hiring, internships or projects.\r\n\r\nWe have some of the best faculties in the city and some being iit graduates adds an impetus to the learning.\r\n\r\nEvery student wishes to have a wonderful postal experience.\r\nYes we play sports like eveydoay alslo we conduct some of the sports events even we give some prizies to the winner it was an wonderful experience playig sports at lur college weekly we will be having a spoet hr',0,0,NULL,'2022-12-22 00:09:15',53,3),(13,'1. It Can Help Boost Your Resume\r\n2. You\'ll Get to Meet New People\r\n3. You Can Find or Build a Community\r\n4. You\'ll Develop New Skills\r\n5. You\'ll Get to Work With Diverse Groups of People\r\n6. You Can Build a Network\r\n7. It\'s Fun!',0,0,NULL,'2022-12-22 00:14:41',54,1),(14,'Hi friend join our club',1,0,NULL,'2022-12-22 00:18:10',14,3),(15,'good',0,0,NULL,'2022-12-22 14:15:38',35,1),(16,'hi ',0,0,NULL,'2022-12-22 15:51:39',51,1),(17,'like',0,0,NULL,'2023-01-02 10:59:33',61,1),(18,'like',0,0,NULL,'2023-01-02 11:01:46',52,3),(19,'No',0,0,NULL,'2023-04-10 20:00:50',55,1),(20,'Thanks, it helped me to crack campus placement .\r\n',0,0,NULL,'2023-05-07 19:15:43',48,1);
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 19:12:19
