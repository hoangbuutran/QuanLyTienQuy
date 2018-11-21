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
-- Table structure for table `baiviet`
--

DROP TABLE IF EXISTS `baiviet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `baiviet` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ckEditorPopup` bit(1) NOT NULL,
  `trangThaiSoan` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `alias` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `countImage` int(11) NOT NULL,
  `description` varchar(750) COLLATE utf8_unicode_ci DEFAULT NULL,
  `friendlyUrl` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metaDescription` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `metaKeyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `noiBat` bit(1) NOT NULL,
  `publishBeginTime` datetime DEFAULT NULL,
  `publishEndTime` datetime DEFAULT NULL,
  `publishStatus` bit(1) NOT NULL,
  `readCount` int(11) NOT NULL,
  `soThuTu` int(11) NOT NULL,
  `subTitle` varchar(1000) COLLATE utf8_unicode_ci DEFAULT NULL,
  `tieuDiem` bit(1) NOT NULL,
  `title` varchar(750) COLLATE utf8_unicode_ci DEFAULT NULL,
  `trangThaiHienThi` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  `author_id` bigint(20) DEFAULT NULL,
  `avatarImage_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDXcqrnmqf6w4jqs8t3e9okjv4my` (`countImage`),
  KEY `IDXptoqmw2cgne15a6jmhvx6kp3i` (`friendlyUrl`),
  KEY `IDXhjj031mtx336pw8u9ng8rrna1` (`metaDescription`),
  KEY `IDXfxw4e3b3b9s1k6djxbocou5cp` (`metaKeyword`),
  KEY `IDX5rkh3j0yptkd0polk1dh4co4a` (`publishBeginTime`),
  KEY `IDX4py9aqaahjpg0uc0p95u6pr4s` (`publishEndTime`),
  KEY `IDX9rwucjynwni96eq2n5n9io8j7` (`readCount`),
  KEY `IDX4o4yw6oybgxhhmrplxiex4nkx` (`publishStatus`),
  KEY `IDXbw994in05r1fq0vsq9ip20k4i` (`trangThaiHienThi`),
  KEY `FKln99gjl97reka8wq6ckce6a9h` (`nguoiSua_id`),
  KEY `FKdmol097t3vkqf25vpgag71kei` (`nguoiTao_id`),
  KEY `FKh5w5u6tu9ktg1ssvxorxt2dix` (`author_id`),
  KEY `FKdyvhntv90p2asntjh3o1bwv7s` (`avatarImage_id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baiviet`
--

LOCK TABLES `baiviet` WRITE;
/*!40000 ALTER TABLE `baiviet` DISABLE KEYS */;
INSERT INTO `baiviet` VALUES (1,_binary '\0','2018-11-05 17:06:27','2018-11-05 17:06:27','ap_dung',_binary '\0','dang_soan','qweqweqweqeq','<p>&nbsp;we ằ aer aerawerfwaer&nbsp;gergaregabrf ajhf a à aerfaj iraiegjae rjgikae rgjerg iaerjgaergjerg eg</p>\n',0,'qư eqwr erwafrtea rae aer aer aergt aer aera eraer ','','','',_binary '',NULL,NULL,_binary '\0',0,0,'',_binary '\0','qwe qwe qwe qeq ','',1,1,1,1),(2,_binary '\0','2018-11-09 08:18:36','2018-11-05 17:06:44','ap_dung',_binary '\0','da_duyet','qweqweqweqeqcopy','<p>&nbsp;we ằ aer aerawerfwaer&nbsp;gergaregabrf ajhf a à aerfaj iraiegjae rjgikae rgjerg iaerjgaergjerg eg</p>\n',0,'qư eqwr erwafrtea rae aer aer aergt aer aera eraer ','','','',_binary '','2018-11-05 19:10:42','2019-04-25 08:18:00',_binary '',0,0,'',_binary '\0','qwe qwe qwe qeq  Copy','',1,1,1,2),(3,_binary '\0','2018-11-05 17:06:49','2018-11-05 17:06:49','ap_dung',_binary '\0','dang_soan','qweqweqweqeqcopy','<p>&nbsp;we ằ aer aerawerfwaer&nbsp;gergaregabrf ajhf a à aerfaj iraiegjae rjgikae rgjerg iaerjgaergjerg eg</p>\n',0,'qư eqwr erwafrtea rae aer aer aergt aer aera eraer ','','','',_binary '',NULL,NULL,_binary '\0',0,0,'',_binary '\0','qwe qwe qwe qeq  Copy','',1,1,1,3),(4,_binary '\0','2018-11-20 10:14:34','2018-11-06 16:12:39','ap_dung',_binary '\0','dang_soan','qweqweqweqeqcopycopy','<p>&nbsp;we ằ aer aerawerfwaer&nbsp;gergaregabrf ajhf a à aerfaj iraiegjae rjgikae rgjerg iaerjgaergjerg eg</p>\n',0,'qư eqwr erwafrtea rae aer aer aergt aer aera eraer ','','','',_binary '\0',NULL,NULL,_binary '\0',0,0,'',_binary '\0','qwe qwe qwe qeq  Copy Copy','',1,1,1,4),(5,_binary '\0','2018-11-06 16:12:42','2018-11-06 16:12:42','ap_dung',_binary '\0','dang_soan','qweqweqweqeqcopycopycopy','<p>&nbsp;we ằ aer aerawerfwaer&nbsp;gergaregabrf ajhf a à aerfaj iraiegjae rjgikae rgjerg iaerjgaergjerg eg</p>\n',0,'qư eqwr erwafrtea rae aer aer aergt aer aera eraer ','','','',_binary '',NULL,NULL,_binary '\0',0,0,'',_binary '\0','qwe qwe qwe qeq  Copy Copy Copy','',1,1,1,5);
/*!40000 ALTER TABLE `baiviet` ENABLE KEYS */;
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
