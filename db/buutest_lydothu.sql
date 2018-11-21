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
-- Table structure for table `lydothu`
--

DROP TABLE IF EXISTS `lydothu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lydothu` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `daXoa` bit(1) NOT NULL,
  `ngaySua` datetime DEFAULT NULL,
  `ngayTao` datetime DEFAULT NULL,
  `trangThai` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complete` bit(1) NOT NULL,
  `lyDoContent` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `soTien` double NOT NULL,
  `nguoiSua_id` bigint(20) DEFAULT NULL,
  `nguoiTao_id` bigint(20) DEFAULT NULL,
  `quy` bit(1) NOT NULL,
  `lyDoKeyWord` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKghkb1wl52rg8kkda7nuo38yls` (`nguoiSua_id`),
  KEY `FKke6yo7h34u8pku6wgdblctbgc` (`nguoiTao_id`)
) ENGINE=MyISAM AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lydothu`
--

LOCK TABLES `lydothu` WRITE;
/*!40000 ALTER TABLE `lydothu` DISABLE KEYS */;
INSERT INTO `lydothu` VALUES (19,_binary '\0','2018-11-18 18:38:24','2018-11-16 12:42:58','ap_dung',_binary '\0','Team java đi bia ôm về dư',250000,1,1,_binary '\0','ly-do-1542346978326'),(18,_binary '\0','2018-11-19 13:07:52','2018-11-16 12:41:55','ap_dung',_binary '','Thu tiền khác để đi xem phim',50000,1,1,_binary '','ly-do-1542346914449'),(20,_binary '\0','2018-11-19 13:07:21','2018-11-18 18:35:51','ap_dung',_binary '\0','Thu tiền chuẩn bị đi chơi cắm trại',50000,1,1,_binary '','ly-do-1542540951175'),(21,_binary '\0','2018-11-20 13:03:53','2018-11-19 08:15:27','ap_dung',_binary '','Nộp tiền quỹ tháng: \"3\" - năm: \"2018\"',50000,1,1,_binary '','ly-do-1542590126431'),(22,_binary '\0','2018-11-19 14:56:11','2018-11-19 14:56:11','ap_dung',_binary '\0','Nộp tiền quỹ tháng: \"4\" - năm: \"2018\"',50000,1,1,_binary '','ly-do-1542614171012'),(23,_binary '\0','2018-11-19 14:57:19','2018-11-19 14:56:29','ap_dung',_binary '\0','Nhậu tiếp nên dư',200000,1,1,_binary '\0','ly-do-1542614189304'),(24,_binary '\0','2018-11-21 10:38:30','2018-11-21 10:38:30','ap_dung',_binary '\0','Nộp tiền quỹ tháng: \"5\" - năm: \"2018\"',50000,1,1,_binary '','ly-do-1542771509663');
/*!40000 ALTER TABLE `lydothu` ENABLE KEYS */;
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
