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
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('2utggqqhyet6radu2kk6nssfk9ivwbvu','.eJxVjDsOwjAQBe_iGlnrX2xT0nMGa9fr4ABypDipEHeHSCmgfTPzXiLhtta09bKkicVZKHH63Qjzo7Qd8B3bbZZ5busykdwVedAurzOX5-Vw_w4q9vqtNYNVOAIZYM8IFCiOigcfQ_TBwqBIg2JHVhtGU6KCoCk75yA7g0a8P9M2NyI:1p82sB:y6mWIdgrwWNSpDEs3Mdwx6PJZntdhaX0p10JbaujaPY','2023-01-04 17:27:19.388552'),('h0okwmacjmwyxnyqtbhlsz44yo3tjdwj','.eJxVjMEOwiAQRP-FsyGwFNf16L3f0CywStVAUtqT8d-VpAe9Tea9mZeaeFvztDVZpjmps7Lq8NsFjg8pHaQ7l1vVsZZ1mYPuit5p02NN8rzs7t9B5pb7GkIEZxwKgrOO4OiT90gnh1cQZhaIFAgNeYP8jdGzDWaAAcmKgHp_AMXbNz4:1p7CxC:b6L6htIrzf4r8E32TfOe01JiSZ5g-fHK6hLZUUXqsB4','2023-01-02 10:01:02.765940'),('p5bmfgwbbbomyo6m9lqq1zb4iontf9no','.eJxVjDsOwjAUBO_iGln-21DScwbLz2-FAyiW8qkQdyeRUkC7M7Nvkcu6tLzOmPLA4iK0OP1uVOoT4w74UcZ7l7WPyzSQ3BV50FneOuN1Pdy_g1bmttXeWBcTg0JQBEUuWu9A5EPRXGELWJ0DAB8DQtSJic0Ga9ImwpD4fAHt7zhh:1p7cmz:tg2ptNH8ql6ku0bR22b7PyEeXTt62NbwETxcFVwWZtM','2023-01-03 13:36:13.781980'),('q9kg9lj4faevymlt3al5dripou995evs','.eJxVjDsOwjAQBe_iGln-7GZjSnrOYK1_OIAcKU4qxN0hUgpo38y8l_C8rdVvPS9-SuIstDj9boHjI7cdpDu32yzj3NZlCnJX5EG7vM4pPy-H-3dQuddvDYBA2elgLTMSqGRGi6O1WSPEAuBU1IoQBxwKmRRyoOgcGXCpBOPE-wOtOTbG:1p7GHb:QJwO8zwLTgj99_qZ7tmGK2tSnWDuBd9skJ7TX-e1q58','2023-01-02 13:34:19.822710'),('zsrspml1sxpyxfztwkelozjs8hq0mwur','.eJxVjDsOwjAQBe_iGln-7GZjSnrOYK1_OIAcKU4qxN0hUgpo38y8l_C8rdVvPS9-SuIstDj9boHjI7cdpDu32yzj3NZlCnJX5EG7vM4pPy-H-3dQuddvDYBA2elgLTMSqGRGi6O1WSPEAuBU1IoQBxwKmRRyoOgcGXCpBOPE-wOtOTbG:1p7GB2:UrIy2mQR0IT7qQbLeqWLv9VM8dbOIyDaI0NEEDU8bWc','2023-01-02 13:27:32.827425');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-19 19:12:18
