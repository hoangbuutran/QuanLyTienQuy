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
-- Table structure for table `donvi`
--

DROP TABLE IF EXISTS `donvi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `donvi` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `moTa` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ten` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  `cha_id` bigint(20) DEFAULT NULL,
  `donViHanhChinh_id` bigint(20) DEFAULT NULL,
  `phuong_id` bigint(20) DEFAULT NULL,
  `quan_id` bigint(20) DEFAULT NULL,
  `thanhPho_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDXjw1175gl550f83o99s12awtw3` (`ten`),
  KEY `IDX50ul6o2ddsvklj79l00eohr33` (`moTa`),
  KEY `FKqo1cbpspkivr6nmmtlb71wo4e` (`nguoiSua_id`),
  KEY `FKh4r0e2r8rma8vovk8w8cvdtcs` (`nguoiTao_id`),
  KEY `FK4saeiwnoyj07bj78orro80ugq` (`cha_id`),
  KEY `FKifledvs7rmot8gcvr9wr8a6h5` (`donViHanhChinh_id`),
  KEY `FKbpc4j3s8d3xwglod4348jnpux` (`phuong_id`),
  KEY `FK8nja4eruot7rg9jcbbjcuyrqs` (`quan_id`),
  KEY `FKp7af8hp706c7rm51v2ayfkqsh` (`thanhPho_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donvi`
--

LOCK TABLES `donvi` WRITE;
/*!40000 ALTER TABLE `donvi` DISABLE KEYS */;
INSERT INTO `donvi` VALUES (1,_binary '\0','2018-11-09 09:23:13','2018-11-09 09:23:13','ap_dung','','Đơn vị 1',1,1,NULL,54,54,NULL,1),(2,_binary '','2018-11-09 09:23:44','2018-11-09 09:23:44','da_xoa','','Đơn vị 1 1',1,1,1,1,54,NULL,1),(3,_binary '\0','2018-11-09 09:24:06','2018-11-09 09:24:06','ap_dung','','Đơn vị 1 1',1,1,1,54,54,NULL,1);
/*!40000 ALTER TABLE `donvi` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 16:07:25
