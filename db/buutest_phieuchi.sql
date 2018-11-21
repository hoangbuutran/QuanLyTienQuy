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
-- Table structure for table `phieuchi`
--

DROP TABLE IF EXISTS `phieuchi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `phieuchi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lyDo` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lyDoKeyWord` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tongSoTien` double NOT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  `nguoiChi_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKhvbkam0lexi236jxsiue5o7fm` (`nguoiSua_id`),
  KEY `FKpi5vipt4nri5363bxa6p2y2wx` (`nguoiTao_id`),
  KEY `FKmo3mlgtss30ytilt5dkjwnwav` (`nguoiChi_id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieuchi`
--

LOCK TABLES `phieuchi` WRITE;
/*!40000 ALTER TABLE `phieuchi` DISABLE KEYS */;
INSERT INTO `phieuchi` VALUES (4,_binary '\0','2018-11-20 08:33:21','2018-11-19 13:29:16','ap_dung','Sinh nhật Trần Hoàng Bửu','ly-do-1542677600730',100000,1,1,3),(5,_binary '\0','2018-11-21 11:13:50','2018-11-19 15:57:05','ap_dung','thích thì chi thôi','ly-do-1542773629579',25000,1,1,2),(6,_binary '\0','2018-11-20 08:34:22','2018-11-19 16:05:53','ap_dung','11','ly-do-1542677661692',20,1,1,1),(7,_binary '\0','2018-11-19 16:20:50','2018-11-19 16:18:06','ap_dung','Mua chơi','ly-do-1542619249780',10000,1,1,2);
/*!40000 ALTER TABLE `phieuchi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 16:07:29
