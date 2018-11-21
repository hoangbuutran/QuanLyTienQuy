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
-- Table structure for table `vaitro`
--

DROP TABLE IF EXISTS `vaitro`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `vaitro` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkKichHoat` bit(1) NOT NULL,
  `soThuTu` int(11) NOT NULL,
  `tenVaiTro` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UKh5nr4ds4p644a4lr7aicqyedy` (`tenVaiTro`),
  KEY `IDXcmrfq32k80bedobmb03xl79ev` (`alias`),
  KEY `IDXh5nr4ds4p644a4lr7aicqyedy` (`tenVaiTro`),
  KEY `FK5qixi7fouimmv3r9fau58tk2q` (`nguoiSua_id`),
  KEY `FK9b0cfnlecgosjvuq6lkxe8fy9` (`nguoiTao_id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vaitro`
--

LOCK TABLES `vaitro` WRITE;
/*!40000 ALTER TABLE `vaitro` DISABLE KEYS */;
INSERT INTO `vaitro` VALUES (1,_binary '\0','2018-11-05 15:07:30','2018-11-05 15:07:30','ap_dung','quantrivien',_binary '\0',0,'Quản trị viên',1,1),(2,_binary '\0','2018-11-05 15:07:31','2018-11-05 15:07:31','ap_dung','tongbientap',_binary '\0',0,'Tổng biên tập',1,1),(3,_binary '\0','2018-11-05 15:07:31','2018-11-05 15:07:31','ap_dung','bientapvien',_binary '\0',0,'Biên tập viên',1,1),(4,_binary '\0','2018-11-05 15:07:31','2018-11-05 15:07:31','ap_dung','donvi',_binary '\0',0,'Đơn vị',1,1),(5,_binary '\0','2018-11-05 15:07:31','2018-11-05 15:07:31','ap_dung','daibieu',_binary '\0',0,'Đại biểu',1,1),(6,_binary '\0','2018-11-16 16:23:37','2018-11-09 15:50:38','ap_dung','',_binary '\0',0,'Thành viên java',1,1);
/*!40000 ALTER TABLE `vaitro` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 16:07:20
