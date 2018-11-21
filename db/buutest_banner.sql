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
-- Table structure for table `banner`
--

DROP TABLE IF EXISTS `banner`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `banner` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alt` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bannerLink` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bannerUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `clickCount` bigint(20) NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `extension` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `height` int(11) NOT NULL,
  `medium` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `newTab` bit(1) NOT NULL,
  `ngayBatDau` datetime DEFAULT NULL,
  `ngayHetHan` datetime DEFAULT NULL,
  `small` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soThuTu` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `viewCount` bigint(20) NOT NULL,
  `width` int(11) NOT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6avmwicyx6ra51yg96vk9ngh1` (`nguoiSua_id`),
  KEY `FKf7cx7oskwqcgadk94v3g4vixc` (`nguoiTao_id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `banner`
--

LOCK TABLES `banner` WRITE;
/*!40000 ALTER TABLE `banner` DISABLE KEYS */;
INSERT INTO `banner` VALUES (1,_binary '\0','2018-11-06 08:11:51','2018-11-05 19:12:32','khong_ap_dung','','Banner 1','/hdndfiles/banner/Screenshot_1_1541419949434.png',0,'Banner 1','',0,'','Screenshot_1_1541419949434.png',_binary '',NULL,NULL,'',0,'Banner 1',0,0,1,1),(2,_binary '\0','2018-11-06 08:11:51','2018-11-05 19:13:08','ap_dung','','Banner 2','/hdndfiles/banner/Screenshot_1_1541419982004.png',0,'Banner 2','',0,'','Screenshot_1_1541419982004.png',_binary '',NULL,NULL,'',1,'Banner 2',0,0,1,1),(3,_binary '\0','2018-11-06 08:12:35','2018-11-05 19:15:47','ap_dung','','Banner 3','/hdndfiles/banner/Screenshot_1_1541466740046.png',0,'Banner 3','',0,'','Screenshot_1_1541466740046.png',_binary '',NULL,NULL,'',0,'Banner 3',0,0,1,1),(4,_binary '\0','2018-11-06 11:00:36','2018-11-06 11:00:36','ap_dung','','Banner 4','/hdndfiles/banner/Screenshot_1_1541476326497.png',0,'Banner 4','',0,'','Screenshot_1_1541476326497.png',_binary '',NULL,NULL,'',0,'Banner 4',0,0,1,1);
/*!40000 ALTER TABLE `banner` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 16:07:24
