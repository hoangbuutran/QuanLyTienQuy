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
-- Table structure for table `chitietphieuchi`
--

DROP TABLE IF EXISTS `chitietphieuchi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `chitietphieuchi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soTien` double NOT NULL,
  `tenMuc` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  `phieuChi_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKjn7cc397c3htttubrw8j0xyt3` (`nguoiSua_id`),
  KEY `FKckx5mi7ynxcp0y41050x01odg` (`nguoiTao_id`),
  KEY `FK5dnmoy5xtb3xm432afppigf3t` (`phieuChi_id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chitietphieuchi`
--

LOCK TABLES `chitietphieuchi` WRITE;
/*!40000 ALTER TABLE `chitietphieuchi` DISABLE KEYS */;
INSERT INTO `chitietphieuchi` VALUES (15,_binary '\0','2018-11-20 08:33:21','2018-11-19 13:31:37','ap_dung',30000,'Nước ngọt',1,1,4),(14,_binary '\0','2018-11-20 08:33:21','2018-11-19 13:29:17','ap_dung',40000,'Rượu vang',1,1,4),(13,_binary '\0','2018-11-20 08:33:21','2018-11-19 13:29:17','ap_dung',10000,'Nến',1,1,4),(12,_binary '\0','2018-11-20 08:33:21','2018-11-19 13:29:17','ap_dung',20000,'Pháo hoa',1,1,4),(11,_binary '','2018-11-19 13:29:17','2018-11-19 13:29:17','da_xoa',15000,'Bánh kem',1,1,4),(16,_binary '\0','2018-11-21 11:13:51','2018-11-19 15:57:05','ap_dung',20000,'mua bánh cá',1,1,5),(17,_binary '\0','2018-11-20 08:34:22','2018-11-19 16:05:54','ap_dung',10,'tên khoản ưewfefwef',1,1,6),(18,_binary '\0','2018-11-20 08:34:22','2018-11-19 16:05:54','ap_dung',10,'tên khoản chiưefwef',1,1,6),(19,_binary '\0','2018-11-19 16:20:50','2018-11-19 16:18:11','ap_dung',10000,'Mua gì đó',1,1,7),(20,_binary '\0','2018-11-21 11:13:51','2018-11-21 11:13:51','ap_dung',5000,'Mua cà chua',1,1,5);
/*!40000 ALTER TABLE `chitietphieuchi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 16:07:23
