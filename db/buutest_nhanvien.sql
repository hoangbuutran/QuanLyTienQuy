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
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nhanvien` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `checkKichHoat` bit(1) NOT NULL,
  `chucVu` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `diaChi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hinhDaiDien` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `hoVaTen` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `matKhau` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ngaySinh` datetime DEFAULT NULL,
  `salkey` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `selectedDV` bit(1) NOT NULL,
  `soDienThoai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tenDangNhap` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  `donVi_id` bigint(20) DEFAULT NULL,
  `donViCha_id` bigint(20) DEFAULT NULL,
  `donViCon_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDXpbtiobsvhoak3busiju29kdrl` (`chucVu`),
  KEY `IDXifc2u2g9aaoxebbrhu28khgrg` (`diaChi`),
  KEY `IDXnaovjgd0me2kq5i2p6wc8mn5n` (`email`),
  KEY `IDXb3fd518mmufpxfn453ha7qvun` (`hinhDaiDien`),
  KEY `IDXgrwti0611jexc97cq78yv9arn` (`hoVaTen`),
  KEY `IDXr1wpsuf8hfm5eqen3y3mm7c69` (`ngaySinh`),
  KEY `IDXbfh5pht4nkgqs2dyk82o4d8bx` (`soDienThoai`),
  KEY `IDXbchnpvuj9kgjs180ts6ei79nc` (`tenDangNhap`),
  KEY `IDX1jiy9mw8xt5qulpi72qknxofe` (`checkKichHoat`),
  KEY `FKea6is3f6do1ybghqu5uo8xiap` (`nguoiSua_id`),
  KEY `FKlyyrr2uas0f50iupka9ergm8x` (`nguoiTao_id`),
  KEY `FK7i4ev9b3v0elf399c0k9nywa2` (`donVi_id`),
  KEY `FKbn1wk0pdppq074uj3c5fes5hg` (`donViCha_id`),
  KEY `FKmot6667bs6nfitltdt53ocyt2` (`donViCon_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
INSERT INTO `nhanvien` VALUES (1,_binary '\0','2018-11-05 15:05:21','2018-11-05 15:05:21','ap_dung',_binary '\0','','','','','Super Admin','CULx3tSjwKQwWpB+HRcv7WkWjmbUsiYl',NULL,'U5Z6IEPdbYzzrsN8HonUgGghmzdCDAkE',_binary '\0','','admin',NULL,NULL,NULL,NULL,NULL),(2,_binary '\0','2018-11-09 15:51:48','2018-11-09 15:51:48','ap_dung',_binary '\0','','','tranhoangbuu66@gmail.com','','Trần Hoàng Bửu','FM03raiZEiKOJC6FxkoNYSVxP+ktZVY0',NULL,'STRj7EW6JsORfzYTLDRuEm7HxTY6XL3D',_binary '\0','0869610406','123',1,1,3,1,3),(3,_binary '\0','2018-11-14 09:44:31','2018-11-14 09:44:31','ap_dung',_binary '\0','','','vanphuoc369@gmail.com','','Văn Phước','PkLp8SrC4silOV1ZwDB4GndxyW1PMRTO',NULL,'l9t0jWgl+pWEjkaVOpbQUFNe+M7zxg3V',_binary '\0','123456789','phuoc',1,1,3,1,3);
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
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
