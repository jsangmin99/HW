-- MariaDB dump 10.19-11.3.2-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: eazy-pn.jsangmin.co.kr    Database: public
-- ------------------------------------------------------
-- Server version	11.3.2-MariaDB-1:11.3.2+maria~ubu2204

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `author`
--

DROP TABLE IF EXISTS `author`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `author` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `adress` varchar(255) DEFAULT NULL,
  `age` tinyint(3) unsigned DEFAULT NULL,
  `role` enum('user','admin') NOT NULL,
  `date` date DEFAULT NULL,
  `created_time` datetime DEFAULT current_timestamp(),
  `post_count` int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `author`
--

LOCK TABLES `author` WRITE;
/*!40000 ALTER TABLE `author` DISABLE KEYS */;
INSERT INTO `author` VALUES
(1,'abc','abc@test.com',NULL,NULL,30,'user',NULL,NULL,0),
(2,'ddd','add@test.com',NULL,NULL,25,'user',NULL,'2024-05-20 01:50:12',0),
(3,'ㅂㅂ','ㅇㅇ@gmail.com',NULL,NULL,20,'user',NULL,NULL,0),
(4,'jack','acs@google.com',NULL,NULL,25,'admin',NULL,NULL,0),
(5,'boo','test@gmail.com',NULL,NULL,30,'user','2023-11-01',NULL,0),
(6,'헤임달','geaeg@gmakle.com',NULL,NULL,15,'user',NULL,'2000-11-01 12:00:56',0),
(7,'da','hello@naver.com',NULL,NULL,40,'user',NULL,'2024-05-17 07:19:33',0),
(8,'kim','kim@gmail.com',NULL,NULL,35,'user',NULL,'2024-05-20 06:39:12',0),
(9,'kim','kim12@gmail.com',NULL,NULL,20,'user',NULL,'2024-05-20 06:42:03',0);
/*!40000 ALTER TABLE `author` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `post` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `contents` varchar(3000) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `price` decimal(10,3) DEFAULT NULL,
  `profile_image` blob DEFAULT NULL,
  `created_time` datetime DEFAULT NULL,
  `user_id` char(36) DEFAULT uuid(),
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `post_author_fk` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES
(1,'제목입니다.','내용1',1,2000.000,NULL,NULL,'02c96bb9-141f-11ef-8275-02420a000140'),
(2,'제목2','내용2',2,3000.000,NULL,NULL,'02c96cd4-141f-11ef-8275-02420a000140'),
(3,'제목555','내용3',2,5000.000,NULL,'2024-11-01 12:00:56','02c96d2b-141f-11ef-8275-02420a000140'),
(4,'HELLO','내용4',4,1500.000,NULL,NULL,'02c96d63-141f-11ef-8275-02420a000140'),
(5,'제목입니다.','내용5',4,2500.000,NULL,'2000-11-01 12:00:56','02c96d8f-141f-11ef-8275-02420a000140'),
(6,'HELLO','내용6',4,3400.000,NULL,'2024-11-01 12:00:56','02c96db8-141f-11ef-8275-02420a000140'),
(7,'abv','내용7',7,6000.000,NULL,'2024-01-01 00:00:00','177cecd1-141f-11ef-8275-02420a000140');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-22  7:48:46
