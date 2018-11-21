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
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `settings` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `canBoQuanLy` bit(1) NOT NULL,
  `dacDiemNhanDang` bit(1) NOT NULL,
  `dem` bigint(20) NOT NULL,
  `diaChiHienNay` bit(1) NOT NULL,
  `diaChiHienNayHuyen` bit(1) NOT NULL,
  `diaChiHienNayTinh` bit(1) NOT NULL,
  `diaChiHienNayToDanPho` bit(1) NOT NULL,
  `diaChiHienNayXa` bit(1) NOT NULL,
  `diaChiThuongTru` bit(1) NOT NULL,
  `diaChiThuongTruHuyen` bit(1) NOT NULL,
  `diaChiThuongTruTinh` bit(1) NOT NULL,
  `diaChiThuongTruToDanPho` bit(1) NOT NULL,
  `diaChiThuongTruXa` bit(1) NOT NULL,
  `donViCanBoQuanLy` bit(1) NOT NULL,
  `email` bit(1) NOT NULL,
  `ngayCapCMND` bit(1) NOT NULL,
  `ngayQuanLySauKhiRaTrungTam` int(11) NOT NULL,
  `ngheNghiep` bit(1) NOT NULL,
  `noiCapCMND` bit(1) NOT NULL,
  `soCMND` bit(1) NOT NULL,
  `soDTCanBoQuanLy` bit(1) NOT NULL,
  `soDienThoai` bit(1) NOT NULL,
  `soDinhDanh` bit(1) NOT NULL,
  `tenKhac` bit(1) NOT NULL,
  `thangQuanLySauCai` int(11) NOT NULL,
  `thangQuanLySauViPham` int(11) NOT NULL,
  `thanhPhanDoiTuong` bit(1) NOT NULL,
  `tinhTrangViecLam` bit(1) NOT NULL,
  `trinhDoHocVan` bit(1) NOT NULL,
  `widthMedium` int(11) NOT NULL,
  `widthSmall` int(11) NOT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp204jwnv8cjfxoni9c3s81ap1` (`nguoiSua_id`),
  KEY `FK3u6flv7dh5v0048tsnv4jtefd` (`nguoiTao_id`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (1,_binary '\0','2018-11-05 17:06:27','2018-11-05 17:06:27','ap_dung',_binary '\0',_binary '\0',0,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,0,_binary '\0',_binary '\0',_binary '\0',0,0,1,1);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-21 16:07:28
