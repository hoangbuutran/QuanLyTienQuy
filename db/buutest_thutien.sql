-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: buutest
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `thutien`
--

DROP TABLE IF EXISTS `thutien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `thutien` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `xacNhan` bit(1) NOT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  `lyDoThu_id` bigint(20) DEFAULT NULL,
  `nguoiNop_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKik1klk6ogfue1a6uu6w70ng3x` (`nguoiSua_id`),
  KEY `FKg30et2y7e71n0yja2f43x127y` (`nguoiTao_id`),
  KEY `FK5l5f0bwfigepeqr0phbowy623` (`lyDoThu_id`),
  KEY `FKosmhcgew3x6cwqxanjc44c4n7` (`nguoiNop_id`)
) ENGINE=MyISAM AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thutien`
--

LOCK TABLES `thutien` WRITE;
/*!40000 ALTER TABLE `thutien` DISABLE KEYS */;
INSERT INTO `thutien` VALUES (20,_binary '\0','2018-11-20 09:02:59','2018-11-16 12:41:55','ap_dung',_binary '',1,1,18,1),(21,_binary '\0','2018-11-20 09:02:59','2018-11-16 12:41:55','ap_dung',_binary '',1,1,18,2),(22,_binary '\0','2018-11-20 09:02:59','2018-11-16 12:41:55','ap_dung',_binary '',1,1,18,3),(23,_binary '\0','2018-11-16 12:42:58','2018-11-16 12:42:58','ap_dung',_binary '',1,1,19,1),(24,_binary '\0','2018-11-20 09:04:25','2018-11-18 18:35:52','ap_dung',_binary '',1,1,20,1),(25,_binary '\0','2018-11-20 09:04:25','2018-11-18 18:35:52','ap_dung',_binary '\0',1,1,20,2),(26,_binary '\0','2018-11-20 09:04:25','2018-11-18 18:35:52','ap_dung',_binary '\0',1,1,20,3),(27,_binary '\0','2018-11-20 13:03:53','2018-11-19 08:15:27','ap_dung',_binary '',1,1,21,1),(28,_binary '\0','2018-11-20 13:03:53','2018-11-19 08:15:27','ap_dung',_binary '',1,1,21,2),(29,_binary '\0','2018-11-20 13:03:53','2018-11-19 08:15:27','ap_dung',_binary '',1,1,21,3),(30,_binary '\0','2018-11-19 14:56:12','2018-11-19 14:56:12','ap_dung',_binary '\0',1,1,22,1),(31,_binary '\0','2018-11-19 14:56:12','2018-11-19 14:56:12','ap_dung',_binary '\0',1,1,22,2),(32,_binary '\0','2018-11-19 14:56:12','2018-11-19 14:56:12','ap_dung',_binary '\0',1,1,22,3),(33,_binary '\0','2018-11-19 14:56:30','2018-11-19 14:56:30','ap_dung',_binary '',1,1,23,1),(34,_binary '\0','2018-11-21 10:38:30','2018-11-21 10:38:30','ap_dung',_binary '\0',1,1,24,1),(35,_binary '\0','2018-11-21 10:38:30','2018-11-21 10:38:30','ap_dung',_binary '\0',1,1,24,2),(36,_binary '\0','2018-11-21 10:38:30','2018-11-21 10:38:30','ap_dung',_binary '\0',1,1,24,3);
/*!40000 ALTER TABLE `thutien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 16:07:22
